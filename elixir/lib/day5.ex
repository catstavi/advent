defmodule Day5 do
  require Logger

  def find_relevant_hash(door_id, starting_index) do
    hash = make_hash(door_id, starting_index)
    # if rem(starting_index, 1000000) == 0 do
    #   Logger.info("on index #{starting_index}")
    # end
    if String.slice(hash, 0..4) == "00000" do
      { String.at(hash, 5), starting_index }
    else
      find_relevant_hash(door_id, starting_index + 1)
    end
  end

  def get_code(door_id, starting_index, code) do
    if length(code) == 8 do
      final_code = code
      |> Enum.reverse
      |> Enum.join("")

      IO.puts(final_code)
      final_code
    else
      { code_number, new_index } = find_relevant_hash(door_id, starting_index)
      # Logger.info("found code_number: #{code_number}")
      # Logger.info("found new_index: #{new_index}")
      # Logger.info("passing new code as: #{[code_number | code]}")
      get_code(door_id, new_index + 1, [code_number | code] )
    end
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
