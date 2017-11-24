defmodule Bob do
  def hey(input) do
    cond do
        String.split(input, ~r{\s}, trim: true) == [] -> "Fine. Be that way!"
        String.last(input) == "?" -> "Sure."
        input == String.upcase(input) -> "Whoa, chill out!"
        true -> "Whatever."
    end
  end
end