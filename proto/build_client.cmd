del /a /f /s /q lua\*
del /a /f /s /q csharp\*

script\build_lua.py proto\game.proto lua
script\build_csharp.py proto\game.proto csharp

del /a /f /s /q ..\client\Assets\Scripts\net\proto\*

move csharp\* ..\client\Assets\Scripts\net\proto\

pause