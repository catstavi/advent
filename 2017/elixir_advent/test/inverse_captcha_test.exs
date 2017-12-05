defmodule InverseCaptchaTest do
  use ExUnit.Case
  alias ElixirAdvent.InverseCaptcha

  describe "the first puzzle half" do
    test "correctly solves for 1122" do
      assert InverseCaptcha.solve_captcha1("1122") == 3
    end

    test "correctly solves for 1111" do
      assert InverseCaptcha.solve_captcha1("1111") == 4
    end

    test "correctly solves for 1234" do
      assert InverseCaptcha.solve_captcha1("1234") == 0
    end

    test "correctly solves for 91212129" do
      assert InverseCaptcha.solve_captcha1("91212129") == 9
    end
  end

  describe "the second puzzle half" do
    test "correctly solves for 1212" do
      assert InverseCaptcha.solve_captcha2("1212") == 6
    end

    test "correctly solves for 1221" do
      assert InverseCaptcha.solve_captcha2("1221") == 0
    end

    test "correctly solves for 123425" do
      assert InverseCaptcha.solve_captcha2("123425") == 4
    end

    test "correctly solves for 123123" do
      assert InverseCaptcha.solve_captcha2("123123") == 12
    end

    test "correctly solves for 12131415" do
      assert InverseCaptcha.solve_captcha2("12131415") == 4
    end
  end



end
