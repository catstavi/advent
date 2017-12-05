defmodule SpiralMemoryTest do
  use ExUnit.Case
  alias ElixirAdvent.SpiralMemory

  describe "day 3 part one" do
    test "correctly calculates steps for square 1" do
      assert SpiralMemory.get_steps_to_center(1) == 0
    end

    test "correctly calculates steps for square 12" do
      assert SpiralMemory.get_steps_to_center(12) == 3
    end

    test "correctly calculates steps for square 23" do
      assert SpiralMemory.get_steps_to_center(23) == 2
    end

    test "correctly calculates steps for square 1024" do
      assert SpiralMemory.get_steps_to_center(1024) == 31
    end
  end

  describe "day 3 part two" do

    test "correctly calculates value for square 1" do
      assert SpiralMemory.value_for_square(1) == 1
    end

    test "correctly calculates value for square 2" do
      assert SpiralMemory.value_for_square(2) == 1
    end

    test "correctly calculates value for square 3" do
      assert SpiralMemory.value_for_square(3) == 2
    end

    test "correctly calculates value for square 4" do
      assert SpiralMemory.value_for_square(4) == 4
    end

    test "correctly calculates value for square 5" do
      assert SpiralMemory.value_for_square(5) == 5
    end

    test "correctly calculates value for square 8" do
      assert SpiralMemory.value_for_square(8) == 23
    end

    test "correctly calculates value for square 325489" do
      assert SpiralMemory.value_for_square(325489) == nil
    end
  end
end
