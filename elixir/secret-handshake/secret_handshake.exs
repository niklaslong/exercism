defmodule SecretHandshake do
use Bitwise
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    []
    |> append_if_true(code, 1, ["wink"])
    |> append_if_true(code, 2, ["double blink"])
    |> append_if_true(code, 4, ["close your eyes"])
    |> append_if_true(code, 8, ["jump"])
    |> reverse_if_true(code, 16)
  end

  defp append_if_true(list, code, n, str) do
    if (code &&& n) === n, do: list ++ str, else: list
  end

  defp reverse_if_true(list, code, n) do
    if (code &&& n) === n, do: list |> Enum.reverse(), else: list
  end
end
