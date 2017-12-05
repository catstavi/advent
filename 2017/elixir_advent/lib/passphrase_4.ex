defmodule ElixirAdvent.Passphrase do
  def valid?(passphrase) do
    String.split(passphrase)
    |> Enum.reduce_while(MapSet.new, fn word, wordset ->
      sorted_word = word
      |> String.graphemes
      |> Enum.sort
      |> to_string

      if MapSet.member?(wordset, sorted_word) do
        {:halt, false}
      else
        {:cont, MapSet.put(wordset, sorted_word)}
      end
    end) != false
  end

  def solve_puzzle do
    File.read!("inputs/day4.txt")
    |> String.trim
    |> String.split("\n")
    |> Enum.filter(&valid?(&1))
    |> length
  end
end
