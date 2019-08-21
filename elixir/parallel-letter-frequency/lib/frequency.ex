defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency([], _workers), do: %{}

  def frequency(texts, workers) do
    master = self()

    partitioned_texts =
      texts
      |> Enum.chunk_every(
        if Enum.count(texts) > workers, do: div(Enum.count(texts), workers), else: 1
      )

    partitioned_texts
    |> Enum.each(fn group ->
      spawn(fn ->
        result =
          group
          |> Enum.reduce(%{}, fn text, acc ->
            text
            |> String.downcase()
            |> String.replace(~r/[^[:alpha:]]+/u, "")
            |> String.graphemes()
            |> Enum.reduce(acc, fn char, acc2 ->
              Map.update(acc2, char, 1, &(&1 + 1))
            end)
          end)

        send(master, result)
      end)
    end)

    Enum.reduce(1..(partitioned_texts |> Enum.count()), %{}, fn _el, acc ->
      receive do
        result ->
          Map.merge(acc, result, fn _k, v1, v2 ->
            v1 + v2
          end)
      end
    end)
  end
end
