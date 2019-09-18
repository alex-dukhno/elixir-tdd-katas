defmodule StringCompression.Day01Test do
  use ExUnit.Case, async: true

  alias StringCompression.Day01, as: StringCompression

  test "compress empty string", do:
    assert "" == StringCompression.compress("")

  test "compress single char string", do:
    assert "1a" == StringCompression.compress("a")

  test "compress string with changing chars", do:
    assert "1a1b1c" == StringCompression.compress("abc")

  test "compress string with doubled chars", do:
    assert "2a2b2c" == StringCompression.compress("aabbcc")
end
