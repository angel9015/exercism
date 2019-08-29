defmodule Sieve do
  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    # Put the range of numbers until the limit to an array and pass it to sieve
    # Notice that I pass the limit to do_sieve to avoid retrieving it from the end of the list
    2..limit |> Enum.into([]) |> do_sieve([], limit)
  end

  # End condition; numbers are finished so we must have all the primes now; reverse them to
  # pass the tests
  defp do_sieve([], primes, _limit), do: primes |> Enum.reverse()

  # The sieving workhorse: Create a sequence starting with the 1st number of the numbers
  # to be sieved with that numbe as a step (so it will be 5, 10, 15 etc for 5) and remove
  # all those numbers (which are multiples) from the passed list of numbers. Then, pass
  # it again to do_sieve to sieve these numbers again and append the number to the list
  # of primes
  defp do_sieve([curr | numbers], primes, limit) do
    numbers |> remove(:lists.seq(curr, limit, curr)) |> do_sieve([curr | primes], limit)
  end

  # Remove all elements of list2 from list1
  defp remove(list1, list2), do: list1 |> Enum.filter(&(&1 not in list2))
end
