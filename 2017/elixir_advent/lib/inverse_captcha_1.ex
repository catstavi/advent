defmodule ElixirAdvent.InverseCaptcha do

  def solve_captcha1(captcha) do
    solve_captcha(captcha, fn _ -> 1 end)
  end

  def solve_captcha2(captcha) do
    # assumes length will always be even
    solve_captcha(captcha, fn(list) -> round(length(list)/2) end)
  end

  # assumes it won't be more than one list length ahead
  defp compare_at(current_index, steps_ahead, list_length) do
    if current_index + steps_ahead >= list_length do
      current_index + steps_ahead - list_length
    else
      current_index + steps_ahead
    end
  end

  defp solve_captcha(captcha, steps_ahead_fn) do
    digits = String.graphemes(captcha)
    steps_ahead = steps_ahead_fn.(digits)
    {_, sum} = digits
    |> Enum.reduce({0, 0},
      fn (digit, {index, sum}) ->
        compare_index = compare_at(index, steps_ahead, length(digits))
        case Enum.at(digits, compare_index) do
          ^digit -> {index + 1, sum + String.to_integer(digit)}
          _ -> {index + 1, sum}
        end
      end)
      sum
  end

  def solve_puzzle do
    File.read!("inputs/day1.txt")
    |> String.trim
    |> solve_captcha2
  end
end
