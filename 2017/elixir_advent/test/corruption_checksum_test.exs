defmodule CorruptionChecksumTest do
  use ExUnit.Case
  alias ElixirAdvent.CorruptionChecksum

  describe "puzzle half 1" do
    test "row_checksum handles strings" do
      assert CorruptionChecksum.row_checksum("5 1 9 5\n") == 8
    end

    test "correctly calculates a row's checksum for [5, 1, 9, 5]" do
      assert CorruptionChecksum.row_checksum([5, 1, 9, 5]) == 8
    end

    test "correctly calculates a row's checksum for [7, 5, 3]" do
      assert CorruptionChecksum.row_checksum([7, 5, 3]) == 4
    end

    test "correctly calculates a row's checksum for [2, 4, 6, 8]" do
      assert CorruptionChecksum.row_checksum([2, 4, 6, 8]) == 6
    end

    test "correctly calculates whole checksum for test input" do
      test_rows = """
                  5 1 9 5
                  7 5 3
                  2 4 6 8
                  """
      assert CorruptionChecksum.checksum(test_rows) == 18
    end
  end

  describe "puzzle half 2" do

    test "row_division handles strings" do
      assert CorruptionChecksum.row_division("5 9 2 8\n") == 4
    end

    test "correctly calculates the only possible division for [5, 9, 2, 8]" do
      assert CorruptionChecksum.row_division([5, 9, 2, 8]) == 4
    end

    test "correctly calculates the only possible division for [9, 4, 7, 3]" do
      assert CorruptionChecksum.row_division([9, 4, 7, 3]) == 3
    end

    test "correctly calculates the only possible division for [3, 8, 6, 5]" do
      assert CorruptionChecksum.row_division([3, 8, 6, 5]) == 2
    end

    test "correctly calculates the divisions for test input" do
      test_rows = """
                  5 9 2 8
                  9 4 7 3
                  3 8 6 5
                  """
      assert CorruptionChecksum.division_sums(test_rows) == 9
    end
  end
end
