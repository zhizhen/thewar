rm -rf  ./csharp/*

script/build_csharp.py excel csharp/

rm -rf ../client/Assets/Scripts/data/Vo/*.cs
rm -rf ../client/Assets/Resources/GameAssets/Configs/*.bytes

mv csharp/*.cs ../client/Assets/Scripts/data/Vo/
mv csharp/*.bytes ../client/Assets/Resources/GameAssets/Configs/
