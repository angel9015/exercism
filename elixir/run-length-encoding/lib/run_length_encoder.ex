defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> String.graphemes()
    # Split string to groups of same characters
    |> Enum.chunk_by(& &1)
    # Replace a group with a number (its length or "" if its a signle character) and the letter
    |> Enum.map(&encode_same_char_string/1)
    |> Enum.join()
  end

  # If length == 1 return only the character
  # else return length and character
  defp encode_same_char_string(s) do
    n =
      case s |> length do
        1 -> ""
        n -> n |> to_string
      end

    "#{n}#{s |> List.first()}"
  end

  # This reduces accumulates to a map having two keys: number and res
  # The res key accumulates the decoded string while the number will
  # contain the number if one has been found
  defp decoder_same_char_string(el, acc) do
    case Integer.parse(el) do
      # This char is a number just update the accumulator key
      {number, ""} ->
        acc |> Map.put(:number, number)

      # We've found a character, use the number to duplicate this to res
      # (if number is not found then it will  be put once )
      # Then clear the number
      :error ->
        acc
        |> Map.update!(:res, &(&1 <> String.duplicate(el, Map.get(acc, :number, 1))))
        |> Map.delete(:number)
    end
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    string
    |> String.graphemes()
    |> Enum.reduce(%{res: ""}, &decoder_same_char_string/2)
    |> Map.get(:res)
  end
end
