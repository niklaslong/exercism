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
    |> String.split(" ", trim: true)
    |> translate_words()
    |> List.flatten()
    |> Enum.join(" ")
  end

  def translate_words([]), do: []
  def translate_words([h | t]), do: [translate_words(h), translate_words(t)]

  def translate_words(word) do
    word
    |> String.split("", trim: true)
    |> translate_word()
    |> Enum.join("")
  end

  def translate_word(["y" | ["t" | _]] = word), do: add_ay(word)
  def translate_word(["x" | ["r" | _]] = word), do: add_ay(word)

  def translate_word(["s" | ["q" | ["u" | t]]]), do: t ++ ["squay"]
  def translate_word(["t" | ["h" | ["r" | t]]]), do: t ++ ["thray"]
  def translate_word(["s" | ["c" | ["h" | t]]]), do: t ++ ["schay"]

  def translate_word(["q" | ["u" | t]]), do: t ++ ["quay"]

  def translate_word(list) do
    consonants = Enum.reduce_while(list, [], fn(l, acc) ->
      if Regex.match?(~r/^[^aeiou]/, l), do: {:cont, acc ++ [l]}, else: {:halt, acc}
    end)

    list
    |> remove_cons(consonants)
    |> add_cons(consonants)
    |> add_ay()
  end

  def remove_cons(list, cons), do: list -- cons
  def add_cons(list, cons), do: list ++ cons
  def add_ay(list), do: list ++ ["ay"]
end
