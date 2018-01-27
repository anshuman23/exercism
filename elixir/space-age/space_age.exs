defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    earth_seconds = 365.25 * 24 * 60 * 60 
    case planet do
      :earth -> seconds/earth_seconds
      :mercury -> seconds/(0.2408467 * earth_seconds)
      :venus -> seconds/(0.61519726 * earth_seconds)
      :mars -> seconds/(1.8808158 * earth_seconds)
      :jupiter -> seconds/(11.862615 * earth_seconds)
      :saturn -> seconds/(29.447498 * earth_seconds)
      :uranus -> seconds/(84.016846 * earth_seconds)
      :neptune -> seconds/(164.79132 * earth_seconds)
    end
  end
end
