defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep([], _), do: []
  
  def keep([head | tail], fun) do
    case fun.(head) do
      true -> [head | keep(tail, fun)]
      false -> keep(tail, fun)
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard([], _, out), do: out
  
  def discard(list, fun) do
    out = []
    discard(list, fun, out)
  end

  def discard([head | tail], fun, out) do
    unless fun.(head), do: out = out ++ [head]
    discard(tail, fun, out)
  end
end
