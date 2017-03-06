defmodule Foo.CustomAssertions do
  defmacro __using__(_) do
    quote do
      require Foo.CustomAssertions
      import Foo.CustomAssertions
    end
  end

  defmacro assert_map_matches_completely(value, {:%{}, _, pattern_kl} = pattern) do
    pattern_keys = Keyword.keys(pattern_kl)
    quote do
      assert unquote(pattern) = (value = unquote(value))

      assert Enum.sort(unquote(pattern_keys)) == Enum.sort(Map.keys(value))
    end
  end

  import ExUnit.Assertions

  def assert_matching_up_to_order(list1, list2, fun \\ & &1) do
    assert [list, list] =
      [list1, list2] |> Enum.map(fn list ->
        list
        |> Enum.map(fun)
        |> Enum.sort
      end)
  end
end

