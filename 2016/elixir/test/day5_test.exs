# you'll need to run these with mix test --trace because they take quite a while
defmodule AdventTest.Day5 do
  use ExUnit.Case, async: true
  import Day5

  # test "can find the first index that makes 00000 hash" do
  #   door_id = "abc"
  #   {code_number , index } = Day5.find_relevant_hash(door_id, 0)
  #   assert index == 3231929
  #   assert code_number == "1"
  # end
  #
  # test "gets the correct code for door_id abc" do
  #   code = get_code("abc")
  #   assert code == "18f47a30"
  # end
  #
  # test "find the answer" do
  #   code = get_code("abbhdwsy")
  #   assert code == "801b56a7"
  # end

  # test "get unfilled indexes" do
  #   example_code = ["a", "", "", "", "", "", "", ""]
  #   indexes = Enum.sort(unfilled_indexes(example_code))
  #   assert indexes == [1,2,3,4,5,6,7]
  #   example_code = ["a", "b", "c", "", "", "", "", "d"]
  #   indexes = Enum.sort(unfilled_indexes(example_code))
  #   assert indexes == [3,4,5,6]
  # end
  #
  # test "get_code v2 gets the correct code for door_id abc" do
  #   code = get_code_v2("abc")
  #   assert code == "05ace8e3"
  # end

  test "gets answer" do
    code = get_code_v2("abbhdwsy")
  end

end
