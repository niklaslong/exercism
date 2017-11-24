defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split("", trim: true)
    |> translate_word()
    |> Enum.join("")
  end

  def translate_word(["a" | [_ | _]] = word), do: word ++ ["ay"]
  def translate_word(["e" | [_ | _]] = word), do: word ++ ["ay"]
  def translate_word(["i" | [_ | _]] = word), do: word ++ ["ay"]
  def translate_word(["o" | [_ | _]] = word), do: word ++ ["ay"]
  def translate_word(["u" | [_ | _]] = word), do: word ++ ["ay"]
  def translate_word(["y" | ["t" | [_ | _]]] = word), do: word ++ ["ay"]
  def translate_word(["x" | ["r" | [_ | _]]] = word), do: word ++ ["ay"]

end
