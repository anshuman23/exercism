defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    codon_list = Regex.scan(~r/.../, rna) |> List.flatten

    output = List.to_string doWork(codon_list)

    unless output == [""] or "ERROR" in String.split(output) do 
      {:ok, Enum.at(String.split(output, "STOP"), 0) |> String.split }
     else {:error, "invalid RNA"}
    end

  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
     cond do
      codon in ["UGU", "UGC"] -> { :ok, "Cysteine" }
      codon in ["UUA", "UUG"] -> { :ok, "Leucine" } 
      codon in ["AUG"] -> { :ok, "Methionine" } 
      codon in ["UUU", "UUC"] -> { :ok, "Phenylalanine" }
      codon in ["UCU","UCC","UCA","UCG"] -> { :ok, "Serine" } 
      codon in ["UGG"] -> { :ok, "Tryptophan" }
      codon in ["UAU", "UAC"] -> { :ok, "Tyrosine" } 
      codon in ["UAA", "UAG", "UGA"] -> { :ok, "STOP" }
      true -> {:error, "invalid codon" }
    end
    
  end

    def doWork([codon | tail]) do
      cond do
	codon in ["UGU", "UGC"] -> ["Cysteine "] ++ doWork(tail)
	codon in ["UUA", "UUG"] -> ["Leucine "] ++ doWork(tail)
	codon in ["AUG"] -> ["Methionine "] ++ doWork(tail)
	codon in ["UUU", "UUC"] -> ["Phenylalanine "] ++ doWork(tail)
	codon in ["UCU","UCC","UCA","UCG"] -> ["Serine "] ++ doWork(tail)
	codon in ["UGG"] -> ["Tryptophan "] ++ doWork(tail)
	codon in ["UAU", "UAC"] -> ["Tyrosine "] ++ doWork(tail)
	codon in ["UAA", "UAG", "UGA"] -> ["STOP "] ++ doWork(tail)
	true -> ["ERROR "] ++ doWork(tail)
      end
  end

    def doWork([]), do: []
    
end

