defmodule FooTest do
  use ExUnit.Case
  use Foo.CustomAssertions
  doctest Foo


  test "the truth" do
    assert_matching_up_to_order([], [])
  end
end
