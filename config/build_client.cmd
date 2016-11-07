del /a /f /s /q .\csharp\*

script\build_csharp.py excel csharp\

del /a /f /s /q ..\client-csharp\Assets\Scripts\data\Vo\*.cs
del /a /f /s /q ..\client-csharp\Assets\Resources\GameAssets\Configs\*.bytes

copy csharp\*.cs ..\client-csharp\Assets\Scripts\data\Vo\
copy csharp\*.bytes ..\client-csharp\Assets\Resources\GameAssets\Configs\

pause