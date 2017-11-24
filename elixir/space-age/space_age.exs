defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / 31557600
    |> adjust(planet)
  end

  def adjust(years, :earth), do: years
  def adjust(years, :mercury), do: years / 0.2408467
  def adjust(years, :venus), do: years / 0.61519726
  def adjust(years, :mars), do: years / 1.8808158
  def adjust(years, :jupiter), do: years / 11.862615
  def adjust(years, :saturn), do: years / 29.447498
  def adjust(years, :uranus), do: years / 84.016846
  def adjust(years, :neptune), do: years / 164.79132
end
