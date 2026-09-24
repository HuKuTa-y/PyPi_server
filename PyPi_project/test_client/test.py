try:
    # Импортируем именно так, как называется файл с кодом (math_utils)
    import math_utils

    print("УСПЕХ! Библиотека установлена с локального сервера!")
    print(math_utils.say_hello())
    print("5 + 10 =", math_utils.add_numbers(5, 10))

except ImportError:
    print("Ошибка: модуль math_utils не найден.")
