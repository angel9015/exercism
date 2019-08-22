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
  defp process("* " <> rest), do: rest |> create_list_md()
  # Process other paragraphs
  defp process(text), do: text |> create_paragraph_md()

  # create_header recursively
  defp create_header_md("#" <> rest, header_level), do: create_header_md(rest, header_level + 1)

  defp create_header_md(" " <> header_text, header_level),
    do: "<h#{header_level}>#{header_text}</h#{header_level}>"

  defp create_list_md(words), do: "<li>#{fix_tags(words)}</li>"
  defp create_paragraph_md(words), do: "<p>#{fix_tags(words)}</p>"

  defp fix_tags(txt) do
    # Replace __z__ with <strong>z</strong> and the same for em _z_
    # Notice that it uses non-greedy matching.
    txt
    |> String.replace(~r/__([^_]+?)__/, "<strong>\\1</strong>")
    |> String.replace(~r/_([^_]+?)_/, "<em>\\1</em>")
  end

  defp patch_lists(text) do
    # Replace <li> with <ul><li> and </li> with </li></ul> for each list
    # Only replace for start - end of list (i.e don't replace </li><li>)
    # Use pipe operators
    text
    |> String.replace(~r/(?<!<\/li>)<li>/, "\\1<ul><li>")
    |> String.replace(~r/<\/li>(?!<li>)/, "</li></ul>\\1")
  end
end
