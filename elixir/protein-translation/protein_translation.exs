defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """

  #IDEA: use recursion to exit when STOP is found

  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    codons = for <<x::binary-3 <- rna>>, do: x
    tuples = for codon <- codons, do: of_codon(codon)
    case tuples |> Enum.member?({:error, "invalid codon"}) do
      true -> {:error, "invalid RNA"}
      false -> {:ok, (for {state, protein} <- tuples, do: protein)}
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
  @list %{
    UGU: "Cysteine",
    UGC: "Cysteine",
    UUA: "Leucine",
    UUG: "Leucine",
    AUG: "Methionine",
    UUU: "Phenylalanine",
    UUC: "Phenylalanine",
    UCU: "Serine",
    UCC: "Serine",
    UCA: "Serine",
    UCG: "Serine",
    UGG: "Tryptophan",
    UAU: "Tyrosine",
    UAC: "Tyrosine",
    UAA: "STOP",
    UAG: "STOP",
    UGA: "STOP"
  }

  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
    case @list |> Map.get(String.to_atom(codon)) do
      nil -> {:error, "invalid codon"}
      "STOP" -> {:ok, "STOP"}
      protein -> {:ok, protein}
    end
  end
end
