defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @spec parse(String.t()) :: String.t()
  def parse(text) do
    # Split to paragraphs using \n
    # Process each paragraph
    # Join them
    # And then pass them to patch
    # Use pipe operators
    text |> String.split("\n") |> Enum.map(&process/1) |> Enum.join() |> patch_lists()
  end

  # Procecss headers
  defp process("#" <> rest), do: create_header_md(rest, 1)
  # Procecss lists
  defp process("* " <> rest), do: rest |> String.split() |> create_list_md()
  # Process other paragraphs
  defp process(text), do: text |> String.split() |> create_paragraph_md()

  # create_header recursively
  defp create_header_md("#" <> rest, header_level), do: create_header_md(rest, header_level + 1)
  defp create_header_md(" " <> header_text, header_level),
    do: "<h#{header_level}>#{header_text}</h#{header_level}>"

  defp create_list_md(words), do: "<li>#{join_words_with_tags(words)}</li>"
  defp create_paragraph_md(words), do: "<p>#{join_words_with_tags(words)}</p>"

  defp join_words_with_tags(words) do
    words |> Enum.map(&replace_md_with_tag/1) |> Enum.join(" ")
  end

  defp replace_md_with_tag("__" <> word), do: "<strong>#{word |> replace_md_with_tag()}"
  defp replace_md_with_tag("_" <> word), do: "<em>#{word |> replace_suffix_md()}"
  defp replace_md_with_tag(word), do: word |> replace_suffix_md()

  # I don't know how can I replace this :(
  # Guards nor matching are available to strings
  defp replace_suffix_md(w) do
    cond do
      w =~ ~r/#{"__"}{1}$/ -> String.replace(w, ~r/#{"__"}{1}$/, "</strong>")
      w =~ ~r/[^#{"_"}{1}]/ -> String.replace(w, ~r/_/, "</em>")
      true -> w
    end
  end

  defp patch_lists(text) do
    # Replace <li> with <ul><li> and </li> with </li></ul> for each list
    # Use pipe operators
    text
    |> String.replace("<li>", "<ul><li>", global: false)
    |> String.replace_suffix("</li>", "</li></ul>")
  end
end
