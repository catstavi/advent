defmodule ElixirAdvent.SpiralMemory do

  defmodule RingError do
    defexception message: "something went wrong"
  end

  def value_for_square(1), do: 1
  def value_for_square(square) do
    get_coords(square)
    |> box_around
    |> Enum.map(fn coords -> sq_at(coords) end)
    |> Enum.filter(fn surrounding_sq -> surrounding_sq < square end)
    |> Enum.map(fn sq -> value_for_square(sq) end)
    |> Enum.sum
  end

  def sq_at({0, 0}), do: 1
  def sq_at({x, y}) do
    ring_num = get_ring_num({x, y})
    ring_size = get_size_for_ring_num(ring_num)
    steps_in_ring = Enum.find(1..ring_size, nil, fn step ->
      walk_the_ring(ring_num, step) == {x, y}
    end)
    ring_finishes_at(ring_num - 1) + steps_in_ring
  end

  def box_around({x, y}) do
    possible_x = [x - 1, x, x + 1]
    possible_y = [y - 1, y, y + 1]
    Enum.flat_map(possible_x, fn x ->
      Enum.map(possible_y, fn y -> {x, y} end)
    end)
  end

  def get_steps_to_center(square) do
    {x, y} = get_coords(square)
    abs(x) + abs(y)
  end

  def get_coords(1), do: {0, 0}
  def get_coords(square) do
    ring_num = get_ring_num(square)
    step_0_sq = ring_finishes_at(ring_num - 1)
    walk_the_ring(ring_num, square - step_0_sq)
  end

  def get_ring_num({x, y}), do: max(abs(x), abs(y))
  def get_ring_num(sq) do
    Enum.find(0..sq, nil, fn ring_num ->
      sq <= ring_finishes_at(ring_num)
    end)
  end

  def width_for_ring_num(0), do: 1
  def width_for_ring_num(ring_num) do
    width_for_ring_num(ring_num - 1) + 2
  end

  def get_size_for_ring_num(0), do: 1
  def get_size_for_ring_num(ring_num) do
    width_for_ring_num(ring_num) * 4 - 4
  end

  def ring_finishes_at(0), do: 1
  def ring_finishes_at(ring_num) do
    ring_finishes_at(ring_num - 1) + get_size_for_ring_num(ring_num)
  end

  def final_ring_coord(ring_num), do: {ring_num, -ring_num}

  def walk_the_ring(0, 0), do: {0, 0}
  def walk_the_ring(ring_num, 0), do: final_ring_coord(ring_num-1)
  def walk_the_ring(ring_num, steps_around) do
    {start_x, start_y} = final_ring_coord(ring_num - 1)
    ring_width = width_for_ring_num(ring_num)
    Enum.reduce(
    1..steps_around,
    {start_x, start_y},
    fn (current_step, {x, y}) ->
      if current_step == 1 do
        {x + 1, y}
      else
        case current_step do
          step when step <= (ring_width - 1) -> {x, y + 1}
          step when step <= (ring_width - 1) * 2 -> {x - 1, y}
          step when step <= (ring_width - 1) * 3 -> {x, y - 1}
          step when step <= (ring_width - 1) * 4 -> {x + 1, y}
          _ -> raise RingError, message: "step was outside ring"
        end
      end
    end)
  end
end
