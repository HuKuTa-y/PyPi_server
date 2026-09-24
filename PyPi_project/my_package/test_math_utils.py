from math_utils import add_numbers, say_hello


def test_add_numbers():
    assert add_numbers(5, 10) == 15
    assert add_numbers(-1, 1) == 0


def test_say_hello():
    assert "Привет" in say_hello()
