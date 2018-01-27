defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    charlist = text |> String.to_char_list
    Enum.map(charlist, fn(x) -> doWork(x, shift) end) |> List.to_string   
  end

  def doWork(charint, shiftval) do
    if ((charint >= 65 and charint <= 90) or (charint >= 97 and charint <= 122)) and shiftval != 0 and shiftval != 26 do
      cond do
	(charint + shiftval) > 90 and (charint >= 65 and charint <= 90) ->  charint + shiftval - 90 + 65 - 1

	(charint + shiftval) > 122 and (charint >= 97 and charint <= 122) ->  charint + shiftval - 122 + 97 - 1

	true -> charint + shiftval
      end
    else charint
    end
  end

end


