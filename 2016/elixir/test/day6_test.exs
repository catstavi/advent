# you'll need to run these with mix test --trace because they take quite a while
defmodule AdventTest.Day6 do
  use ExUnit.Case, async: true
  import Day6


  test "gets answer" do
    msg = get_message("inputs/day6.txt")
    assert msg == "easter"
  end

  test "gets letter counts" do
    file = File.open!("inputs/day6.txt", [:read])
    counts = get_letter_counts(file, 0)
    IO.inspect counts
    expected_counts = %{
      "a" => 1,
      "d" => 2,
      "e" => 3,
      "n" => 2,
      "r" => 2,
      "s" => 2,
      "t" => 2,
      "v" => 2
    }
    assert counts == expected_counts
  end




end
