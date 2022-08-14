defmodule StringCompression.Day07Test do
  use ExUnit.Case, async: true

  alias StringCompression.Day07, as: StringCompression

  test "compress empty string", do:
    assert StringCompression.compress("") == ""

  test "compress single char string", do:
    assert StringCompression.compress("a") == "1a"

  test "compress string of unique characters", do:
    assert StringCompression.compress("abc") == "1a1b1c"

  test "compress string of doubled characters" do
    assert StringCompression.compress("aabbcc") == "2a2b2c"
  end
end
