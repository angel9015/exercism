defmodule BankAccount do
  use GenServer
  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank() do
    {:ok, pid} = GenServer.start_link(__MODULE__, :ok)
    pid
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(account) do
    GenServer.call(account, :close)
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    GenServer.call(account, :balance)
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount) do
    GenServer.call(account, {:update, amount})
  end

  @impl true
  def init(:ok) do
    {:ok, %{balance: 0, status: :open}}
  end

  @impl true
  def handle_call(:balance, _from, %{balance: balance, status: status}=state) when status == :open do
    {:reply, balance, state}
  end

  @impl true
  def handle_call({:update, amt}, _from, %{balance: balance, status: status}=state) when status == :open do
    {:reply, balance + amt, Map.put(state, :balance, balance + amt)}
  end

  @impl true
  def handle_call(:close, _from, %{status: status}=state) when status == :open do
    {:reply, :closed, Map.put(state, :status, :closed)}
  end

  @impl true
  def handle_call(_msg, _from, state) do
    {:reply, {:error, :account_closed}, state}
  end
end
