defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text 
    |> String.split("", trim: true) #returns list of 
    |> Enum.map(&add_shift(&1, shift))
    |> Enum.join("")
  end

  defp add_shift(char, shift) do
    <<code, _>> = char <> <<0>>
    cond do
      code in 65..90 && code + shift < 91 -> <<code + shift>>
      code in 65..90 && code + shift > 90 -> <<code + shift - 26>>
      code in 97..122 && code + shift < 123 -> <<code + shift>>
      code in 97..122 && code + shift > 122 -> <<code + shift - 26>>
      true -> <<code>>
    end
  end
end
