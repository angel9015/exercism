defmodule RobotSimulator do
  @valid_directions [:north, :east, :south, :west]
  @valid_instructions ["A", "L", "R"]
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, pos \\ {0, 0})
  def create(direction, {x, y})
      when direction in @valid_directions and is_number(x) and is_number(y) do
    %{dir: direction, pos: {x, y}}
  end

  def create(direction, _) when direction in @valid_directions, do: {:error, "invalid position"}
  def create(_, _), do: {:error, "invalid direction"}

  defp move_robot(_, {:error, error}), do: {:error, error}
  defp move_robot(instruction, robot) when instruction in @valid_instructions do
    case instruction do
      "A" -> advance(robot)
      "L" -> turn_left(robot)
      "R" -> turn_right(robot)
    end
  end
  defp move_robot(_, _), do: {:error, "invalid instruction"}

  defp advance(%{dir: dir, pos: {x, y}}) do
    case dir do
      :north -> %{dir: dir, pos: {x, y+1}}
      :south -> %{dir: dir, pos: {x, y-1}}
      :east  -> %{dir: dir, pos: {x+1, y}}
      :west  -> %{dir: dir, pos: {x-1, y}}
    end
  end

  defp turn_left(%{dir: dir, pos: pos}) do
    case dir do
      :north -> %{dir: :west, pos: pos}
      :south -> %{dir: :east, pos: pos}
      :east  -> %{dir: :north, pos: pos}
      :west  -> %{dir: :south, pos: pos}
    end
  end

  
  defp turn_right(%{dir: dir, pos: pos}) do
    case dir do
      :north -> %{dir: :east, pos: pos}
      :south -> %{dir: :west, pos: pos}
      :east  -> %{dir: :south, pos: pos}
      :west  -> %{dir: :north, pos: pos}
    end
  end

  

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    instructions |> String.graphemes |> Enum.reduce(robot, &move_robot/2)
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot[:dir]
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot[:pos]
  end
end
