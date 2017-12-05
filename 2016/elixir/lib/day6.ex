defmodule Day6 do

 def get_message(input_file) do
  file = File.open!(input_file, [:read])
  True
  # Enum.map(IO.stream(file), count_letters)
 end

# gets a dictionary with counts of letters for that column
 def get_letter_counts(stream, col_index) do
   Enum.map_reduce(stream, %{}, fn (line, letter_counts) ->
     {_, counts} = Map.get_and_update(letter_counts, String.at(col_index), fn current_count ->
       new_count = if current_count, do: current_count + 1, else: 1
       {current_count, new_count}
     end)
     {nil, counts}
   end)
 end

 # process that is in charge of finding most common letter for a particular count_letters
  # takes the index they're in charge of and a stream of info
end
