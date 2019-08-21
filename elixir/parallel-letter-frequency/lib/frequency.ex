defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency([], _workers), do: %{}

  def frequency(texts, workers) do
    texts
    |> partition(workers)
    |> spawn_workers()
    |> collect_results()
  end

  # Split text arrays to chunks to give one to each worker
  # If workers are more than text then assign one text to each worker (and spawn as many workers as text)
  defp partition(texts, workers) do
    texts
    |> Enum.chunk_every(
      if Enum.count(texts) > workers, do: div(Enum.count(texts), workers), else: 1
    )
  end

  # For each partion will spawn a worker using spawn_worker and passing it the parition and the master pid
  defp spawn_workers(partitions) do
    partitions
    |> Enum.each(&spawn_worker(&1, self()))

    # This is not really need it but I like to return it to allow piping in the frequency function
    partitions
  end

  # The worker will  will count the letter frequences of
  # the texts in that partition using the text_count_reducer
  # and send back the result
  defp spawn_worker(partition, pid) do
    spawn(fn ->
      send(
        pid,
        Enum.reduce(partition, %{}, &text_count_reducer/2)
      )
    end)
  end

  # This reducer will run to each text of the partition
  # For each text it will count the letters and put the
  # frequencies to the accumulator ; notice that the reducer
  # does *another* reduce to count the individual letters
  # using the initial accumulator as its initual value
  # and accumulating the remaning lettes to acc2 (which
  # will be returned)
  defp text_count_reducer(text, acc) do
    text
    |> String.downcase()
    |> String.replace(~r/[^[:alpha:]]+/u, "")
    |> String.graphemes()
    |> Enum.reduce(acc, fn char, acc2 ->
      Map.update(acc2, char, 1, &(&1 + 1))
    end)
  end

  # The collector: Run as many receive commands
  # as there are partitions and just merge the
  # maps you'll get by adding their corresponding char freqs
  defp collect_results(partitions) do
    Enum.reduce(partitions, %{}, fn _el, acc ->
      receive do
        result ->
          Map.merge(acc, result, fn _k, v1, v2 ->
            v1 + v2
          end)
      end
    end)
  end
end
