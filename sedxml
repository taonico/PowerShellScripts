$search="AAA"
$replace="BBB"

cd "C:\test"
dir -Filter *.xml -Recurse | % {
 $str = cat $_ | Out-String
 $repstr=$str.Replace($search,$replace)
 if($repstr -ne $str){
  Out-File -FilePath $_ -InputObject $repstr -Encoding utf8
 }
}
