$pattern1="^\+{3}"
$pattern2="^\+{3} "

$InputFileName="test.diff"
$OutputFileName="FileList.txt"

# 取得したファイルを改行区切りで string[] でパイプに流す（改行コードは含まれない）
Get-Content $InputFileName | Out-String -Stream | `
# 正規表現で「+++ ファイル名」の行を取得する 
Select-String $pattern1 | `
# 各行をforeachで置換処理をする
ForEach-Object { $_ -replace $pattern2 , "RootFolderName/" } | `
# コンソール表示幅の80文字（初期値）で改行されないようにして、ファイルに出力をする。
Out-String -Width 10000 | Out-File $OutputFileName
