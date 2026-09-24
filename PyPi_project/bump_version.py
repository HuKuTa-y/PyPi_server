import re

# Путь к файлу
file_path = "my_package/pyproject.toml"

with open(file_path, "r", encoding="utf-8") as f:
    content = f.read()


# Находим версию и увеличиваем последнюю цифру
def bump(match):
    major, minor, patch = match.groups()
    return f'version = "{major}.{minor}.{int(patch)+1}"'


new_content = re.sub(r'version = "(\d+)\.(\d+)\.(\d+)"', bump, content)

with open(file_path, "w", encoding="utf-8") as f:
    f.write(new_content)

print("Версия успешно повышена!")
