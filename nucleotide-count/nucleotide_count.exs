defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
	str_strand = List.to_string(strand)

	case nucleotide do
	65 -> Regex.scan(~r/A/, str_strand) |> Enum.count
        67 -> Regex.scan(~r/C/, str_strand) |> Enum.count
        71 -> Regex.scan(~r/G/, str_strand) |> Enum.count
        84 -> Regex.scan(~r/T/, str_strand) |> Enum.count
	_  -> 0
	end

  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
	%{?A => count(strand, ?A), ?T => count(strand, ?T), ?C => count(strand, ?C), ?G => count(strand, ?G)}
  end
end
