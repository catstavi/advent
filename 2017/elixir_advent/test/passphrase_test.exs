defmodule ElxirAdvent.PassphraseTest do
  use ExUnit.Case
  alias ElixirAdvent.Passphrase

  describe "day 4 part 1" do
    test "validates `aa bb cc dd ee`" do
      assert Passphrase.valid?("aa bb cc dd ee")
    end

    test "validates `aa bb cc dd aa`" do
      assert !Passphrase.valid?("aa bb cc dd aa")
    end

    test "validates `aa bb cc dd aaa`" do
      assert Passphrase.valid?("aa bb cc dd aaa")
    end
  end

  describe "day 4 part 2" do
    test "validates `abcde fghij`" do
      assert Passphrase.valid?("abcde fghij")
    end

    test "validates `abcde xyz ecdab`" do
      assert !Passphrase.valid?("abcde xyz ecdab")
    end

    test "validates `a ab abc abd abf abj`" do
      assert Passphrase.valid?("a ab abc abd abf abj")
    end

    test "validates `iiii oiii ooii oooi oooo`" do
      assert Passphrase.valid?("iiii oiii ooii oooi oooo")
    end

    test "validates `oiii ioii iioi iiio`" do
      assert !Passphrase.valid?("oiii ioii iioi iiio")
    end
  end
end
