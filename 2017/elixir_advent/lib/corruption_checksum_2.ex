defmodule ElixirAdvent.CorruptionChecksum do

  def row_checksum(row) when is_binary(row) do
    row
    |> make_int_list
    |> row_checksum
  end
  def row_checksum([]), do: 0
  def row_checksum(row), do: Enum.max(row) - Enum.min(row)

  def checksum(rows) do
    rows
    |> String.split("\n")
    |> Enum.map(&row_checksum(&1))
    |> Enum.sum
  end

  def solve_puzzle1 do
    File.read!("inputs/day2.txt")
    |> checksum
  end

  def solve_puzzle2 do
    File.read!("inputs/day2.txt")
    |> division_sums
  end

  defp make_int_list(num_string) do
    num_string
    |> String.trim
    |> String.split
    |> Enum.map(&String.to_integer(&1))
  end

  def division_sums(rows) do
    rows
    |> String.split("\n")
    |> Enum.map(&row_division(&1))
    |> Enum.sum
  end

  def row_division(row) when is_binary(row) do
    row
    |> make_int_list
    |> row_division
  end
  def row_division([]), do: 0
  def row_division(row) when length(row) == 1, do: :no_match
  # a "match" here is a number that can divide evenly (either as dividend or divisor)
  def row_division([num1 | possible_matches]) do
    case Enum.reduce_while(possible_matches, :no_match, fn (num2, _) ->
      result1 = num1/num2
      result2 = num2/num1
      case {round(result1) == result1, round(result2) == result2} do
        {true, _} -> {:halt, round(result1)}
        {_, true} -> {:halt, round(result2)}
        {false, false} -> {:cont, :no_match}
      end
    end) do
      :no_match -> row_division(possible_matches)
      result -> result
    end
  end

end
