defmodule StringCompression.Day05Test do
  use ExUnit.Case, async: true

  alias StringCompression.Day05, as: StringCompression

  test "compress empty string", do:
    assert StringCompression.compress("") == ""

  test "compress single char string", do:
    assert StringCompression.compress("a") == "1a"

  test "compress string of unique chars", do:
    assert StringCompression.compress("abc") == "1a1b1c"

  test "compress string with doubled chars" do
    assert StringCompression.compress("aabbcc") == "2a2b2c"
  end
end
