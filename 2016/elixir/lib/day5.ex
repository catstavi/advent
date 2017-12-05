defmodule Day5 do
  require Logger

  def find_relevant_hash(door_id, starting_index) do
    hash = make_hash(door_id, starting_index)
    if rem(starting_index, 1000000) == 0 do
      Logger.info("on index #{starting_index}")
    end
    if String.slice(hash, 0..4) == "00000" do
      { hash, starting_index }
    else
      find_relevant_hash(door_id, starting_index + 1)
    end
  end

  def get_code(door_id, starting_index \\ 0, code \\ []) do
    if length(code) == 8 do
      final_code = code
      |> Enum.reverse
      |> Enum.join("")

      IO.puts(final_code)
      final_code
    else
      { hash, new_index } = find_relevant_hash(door_id, starting_index)
      code_number = String.at(hash, 5)
      # Logger.info("found code_number: #{code_number}")
      # Logger.info("found new_index: #{new_index}")
      # Logger.info("passing new code as: #{[code_number | code]}")
      get_code(door_id, new_index + 1, [code_number | code] )
    end
  end

  def get_code_v2(
    door_id,
    starting_index \\ 0,
    code \\ ["", "", "", "", "", "", "", ""]
  ) do
    if not Enum.member?(code, "") do
      final_code = Enum.join(code, "")
      IO.puts(final_code)
      final_code
    else
      { hash, new_index } = find_relevant_hash(door_id, starting_index)
      case Integer.parse(String.at(hash, 5)) do
        {placement_index, "" } ->
          if Enum.member?(unfilled_indexes(code), placement_index) do
            code_element = String.at(hash, 6)
            new_code = List.insert_at(
              List.delete_at(code, placement_index),
              placement_index,
              code_element
            )
            get_code_v2(door_id, new_index + 1, new_code)
          else
            get_code_v2(door_id, new_index + 1, code)
          end
        :error -> get_code_v2(door_id, new_index + 1, code)
      end
    end
  end

# in retrospect, this is kind of a silly way of doing this
# if I did it again I would probably just:
  # check that the number is less than the len -1
  # get the the value at the index, proceeding only if it's empty


  # returns an array of all indexes that still need to be filled
  def unfilled_indexes(code_array) do
    indexed_codes = Enum.with_index(code_array)
    { _, indexes } = Enum.map_reduce(indexed_codes, [], fn(element, indexes) ->
      case element do
        {"", idx} -> {element, [idx | indexes]}
        _ -> {element, indexes}
      end
    end)
    indexes
  end

  defp make_hash(door_id, index) do
    :crypto.hash_init(:md5)
    |> :crypto.hash_update("#{door_id}#{index}")
    |> :crypto.hash_final
    |> Base.encode16
    |> String.downcase
  end
end


# :crypto.hash_init(:md5) |> :crypto.hash_update("abc3231929") |> :crypto.hash_final |> Base.encode16 |> String.downcase
