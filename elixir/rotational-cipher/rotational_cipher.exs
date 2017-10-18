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
      code in ?A..?Z && code + shift <= ?Z -> <<code + shift>>
      code in ?A..?Z && code + shift > ?Z -> <<code + shift - 26>>
      code in ?a..?z && code + shift <= ?z -> <<code + shift>>
      code in ?a..?z && code + shift > ?z -> <<code + shift - 26>>
      true -> <<code>>
    end
  end
end
