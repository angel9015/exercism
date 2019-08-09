defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    # Split on everything except hypens and alphanumeric; drop empty strings
    |> String.split(~r/[^[:alnum:]-]+/u, trim: true)
    # Reduce list of words on empty Map; set val to 1 if word 
    # is not found or increase the val if it is found
    |> Enum.reduce(%{}, fn z, acc ->
      acc |> Map.update(z, 1, &(&1 + 1))
    end)
  end
end
