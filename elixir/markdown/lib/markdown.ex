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
    # patch(Enum.join(Enum.map(String.split(m, "\n"), fn t -> process(t) end)))
    # patch(Enum.join(Enum.map(String.split(m, "\n"), &process/1)))
    # Split to paragraphs using \n
    # Process each paragraph
    # Join them
    # And then pass them to patch
    # Use pipe operators
    text |> String.split("\n") |> Enum.map(&process/1) |> Enum.join() |> patch
  end

  # Procecss lists
  defp process("* " <> rest), do: parse_list_md_level(rest)
  # Procecss headers
  defp process("#" <> _rest = text), do: text |> parse_header_md_level() |> enclose_with_header_tag()
  # Process other paragraphs
  defp process(text), do: text |> String.split() |> enclose_with_paragraph_tag()

  defp parse_header_md_level(hwt) do
    [h | t] = String.split(hwt)
    {to_string(String.length(h)), Enum.join(t, " ")}
  end

  defp parse_list_md_level(l) do
    t = String.split(String.trim_leading(l, "* "))
    "<li>" <> join_words_with_tags(t) <> "</li>"
  end

  defp enclose_with_header_tag({header_level, header_text}) do
    # Use string interpolation instead of concatenation
    "<h#{header_level}>#{header_text}</h#{header_level}>" 
  end

  defp enclose_with_paragraph_tag(t) do
    "<p>#{join_words_with_tags(t)}</p>"
  end

  defp join_words_with_tags(t) do
    Enum.join(Enum.map(t, fn w -> replace_md_with_tag(w) end), " ")
  end

  defp replace_md_with_tag(w) do
    replace_suffix_md(replace_prefix_md(w))
  end

  defp replace_prefix_md(w) do
    cond do
      w =~ ~r/^#{"__"}{1}/ -> String.replace(w, ~r/^#{"__"}{1}/, "<strong>", global: false)
      w =~ ~r/^[#{"_"}{1}][^#{"_"}+]/ -> String.replace(w, ~r/_/, "<em>", global: false)
      true -> w
    end
  end

  defp replace_suffix_md(w) do
    cond do
      w =~ ~r/#{"__"}{1}$/ -> String.replace(w, ~r/#{"__"}{1}$/, "</strong>")
      w =~ ~r/[^#{"_"}{1}]/ -> String.replace(w, ~r/_/, "</em>")
      true -> w
    end
  end

  defp patch(str) do
    # Replace <li> with <ul><li> and </li> with </li></ul> for each paragraph
    # Use pipe operators
    str
    |> String.replace("<li>", "<ul><li>", global: false)
    |> String.replace_suffix("</li>", "</li></ul>")
  end
end
