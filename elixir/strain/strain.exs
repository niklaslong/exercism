defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep([], _, out), do: out

  def keep(list, fun) do
    out = []
    keep(list, fun, out)
  end
  
  def keep([head | tail], fun, out) do
    if fun.(head), do: out = out ++ [head]
    keep(tail, fun, out)
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
