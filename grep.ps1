$pattern1="^\+"
$pattern2="^\+{3}"
$pattern3="^\+.\s*//"

$InputFileName="test1.diff"
$OutputFileName="out.txt"

# 取得したファイルを改行区切りで string[] にしてパイプに流す（改行コードは含まれない）
Get-Content $InputFileName | Out-String -Stream | `
# 正規表現で「+ 追加行」のを取得する 
Select-String $pattern1 | `
# 正規表現で「+++ ファイル名」以外の行を取得する 
Select-String $pattern2 -NotMatch | `
# 正規表現で「+ //コメント行」以外の行を取得する 
Select-String $pattern3 -NotMatch | `
# コンソール表示幅の80文字（初期値）で改行されないようにして、ファイルに出力をする。
Out-String -Width 10000 | Out-File $OutputFileName
