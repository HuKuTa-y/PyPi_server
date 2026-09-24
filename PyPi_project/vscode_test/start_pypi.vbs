Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "cmd /c cd C:\Users\College\Desktop\my_pypi_server && python -m pypiserver run -P . -a . -p 8080 ./packages", 0, False