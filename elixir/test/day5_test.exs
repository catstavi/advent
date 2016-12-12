# you'll need to run these with mix test --trace because they take quite a while
defmodule AdventTest.Day5 do
  use ExUnit.Case, async: true
  import Day5

  test "can find the first index that makes 00000 hash" do
    door_id = "abc"
    {code_number , index } = Day5.find_relevant_hash(door_id, 0)
    assert index == 3231929
    assert code_number == "1"
  end

  test "gets the correct code for door_id abc" do
    code = get_code("abc", 0, [])
    assert code == "18f47a30"
  end

  test "find the answer" do
    code = get_code("abbhdwsy", 0, [])
    assert code == "801b56a7"
  end

end
