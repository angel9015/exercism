alias BinTree

defmodule Zipper do
  @type zipper :: %Zipper{
          value: any,
          left: BinTree.t() | nil,
          right: BinTree.t() | nil,
          trail: BinTree.trail()
        }
  defstruct [:value, :left, :right, :trail]

  @doc """
  Get a zipper focused on the root node.
  """
  @spec from_tree(BinTree.t()) :: Zipper.t()
  def from_tree(%{
        value: value,
        left: left,
        right: right
      }) do
    [value: value, left: left, right: right, trail: :top]
  end

  @doc """
  Get the complete tree from a zipper.
  """
  @spec to_tree(Zipper.t()) :: BinTree.t()
  def to_tree(value: value, left: left, right: right, trail: :top) do
    %BinTree{value: value, left: left, right: right}
  end
  def to_tree(z), do: to_tree(up(z))

  @doc """
  Get the value of the focus node.
  """
  @spec value(Zipper.t()) :: any
  def value(value: value, left: _, right: _, trail: _), do: value

  @doc """
  Get the left child of the focus node, if any.
  """
  @spec left(Zipper.t()) :: Zipper.t() | nil
  def left(value: _, left: nil, right: _, trail: _), do: nil
  def left(
        value: value,
        left: %BinTree{
          value: lvalue,
          left: lleft,
          right: lright
        },
        right: right,
        trail: trail
      ) do
    [
      value: lvalue,
      left: lleft,
      right: lright,
      trail: [
        :left,
        value,
        right,
        trail
      ]
    ]
  end

  @doc """
  Get the right child of the focus node, if any.
  """
  @spec right(Zipper.t()) :: Zipper.t() | nil
  def right(value: _, left: _, right: nil, trail: _), do: nil
  def right(
        value: value,
        left: left,
        right: %BinTree{
          value: rvalue,
          left: rleft,
          right: rright
        },
        trail: trail
      ) do
    [
      value: rvalue,
      left: rleft,
      right: rright,
      trail: [
        :right,
        value,
        left,
        trail
      ]
    ]
  end

  @doc """
  Get the parent of the focus node, if any.
  """
  @spec up(Zipper.t()) :: Zipper.t() | nil
  def up(value: _, left: _, right: _, trail: :top), do: nil
  def up(value: value, left: left, right: right, trail: [
    :left, tval, tbranch, ttrail
  ]) do
    [value: tval, left: %BinTree{
      value: value, left: left, right: right
    }, right: tbranch, trail: ttrail ]
  end
  def up(value: value, left: left, right: right, trail: [
    :right, tval, tbranch, ttrail
  ]) do
    [value: tval, left: tbranch, right: %BinTree {
      value: value, left: left, right: right
    }, trail: ttrail]
  end

  @doc """
  Set the value of the focus node.
  """
  @spec set_value(Zipper.t(), any) :: Zipper.t()
  def set_value(zipper, value) do
    Keyword.replace!(zipper, :value, value)
  end

  @doc """
  Replace the left child tree of the focus node.
  """
  @spec set_left(Zipper.t(), BinTree.t() | nil) :: Zipper.t()
  def set_left(zipper, left) do
    Keyword.replace!(zipper, :left, left)
  end

  @doc """
  Replace the right child tree of the focus node.
  """
  @spec set_right(Zipper.t(), BinTree.t() | nil) :: Zipper.t()
  def set_right(zipper, right) do
    Keyword.replace!(zipper, :right, right)
  end
end
