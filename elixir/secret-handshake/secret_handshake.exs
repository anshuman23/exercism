defmodule SecretHandshake do
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
    digits = Integer.digits(code,2) |> Enum.reverse
    output = commandsHelper(digits, 0)
    if List.last(output) == "reverse" do
      List.delete(output, "reverse") |> Enum.reverse
    else
      unless output == [nil] do
	output
      else []
      end
    end
  end

  def commandsHelper([head | tail], idx) do
    commands_list_all = ["wink", "double blink", "close your eyes", "jump", "reverse"]
    if head == 1 do
      [Enum.at(commands_list_all, idx)] ++ commandsHelper(tail, idx+1)
    else
      commandsHelper(tail, idx+1)
    end
  end
  
  def commandsHelper([], _), do: []
  
end

