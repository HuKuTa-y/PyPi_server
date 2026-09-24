import requests
import math_utils 

print("Тестируем работу с локального PyPI сервера!")
print(math_utils.say_hello())
print("Сумма:", math_utils.add_numbers(10, 20))

# Проверим, что requests работает
response = requests.get("https://httpbin.org/get")
print("Статус код тестового запроса:", response.status_code)