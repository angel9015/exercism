defmodule RobotSimulator do
  @valid_directions [:north, :east, :south, :west]
  @valid_instructions ["A", "L", "R"]

  defguard is_valid_robot(direction, x, y)
           when direction in @valid_directions and is_number(x) and is_number(y)

  defguard is_valid_instruction(instruction)
           when instruction in @valid_instructions

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, pos \\ {0, 0})

  def create(direction, {x, y})
      when is_valid_robot(direction, x, y) do
    %{dir: direction, pos: {x, y}}
  end

  def create(direction, _) when direction in @valid_directions, do: {:error, "invalid position"}
  def create(_, _), do: {:error, "invalid direction"}

  defp move_robot(_, {:error, error}), do: {:error, error}

  defp move_robot(instruction, robot) when is_valid_instruction(instruction) do
    case instruction do
      "A" -> advance(robot)
      "L" -> turn_left(robot)
      "R" -> turn_right(robot)
    end
  end

  defp move_robot(_, _), do: {:error, "invalid instruction"}

  defp advance(%{dir: dir, pos: {x, y}} = robot) do
    case dir do
      :north -> %{robot | pos: {x, y + 1}}
      :south -> %{robot | pos: {x, y - 1}}
      :east -> %{robot | pos: {x + 1, y}}
      :west -> %{robot | pos: {x - 1, y}}
    end
  end

  defp turn_left(%{dir: dir, pos: _pos} = robot) do
    case dir do
      :north -> %{robot | dir: :west}
      :south -> %{robot | dir: :east}
      :east -> %{robot | dir: :north}
      :west -> %{robot | dir: :south}
    end
  end

  defp turn_right(%{dir: dir, pos: _pos} = robot) do
    case dir do
      :north -> %{robot | dir: :east}
      :south -> %{robot | dir: :west}
      :east -> %{robot | dir: :south}
      :west -> %{robot | dir: :north}
    end
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    instructions |> String.graphemes() |> Enum.reduce(robot, &move_robot/2)
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(%{dir: dir}), do: dir

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(%{pos: pos}), do: pos
end
