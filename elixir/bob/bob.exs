defmodule Bob do
  def hey(input) do
    cond do
        String.split(input, ~r{\s}, trim: true) == [] -> "Fine. Be that way!"
        String.last(input) == "?" -> "Sure."
        input == String.upcase(input) and Regex.match?(~r/\p{L}/, input) -> "Whoa, chill out!"
        true -> "Whatever."
    end
  end
end
# Maybe refactor this at some stage, or not?
