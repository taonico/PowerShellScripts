$path="C:\Users\Public\Documents\test"
$outpath="C:\Users\Public\Documents\出力\test"
$files=dir $path -Recurse

foreach ($file in $files){
  $output = $file.FullName.Replace( $path,$outpath )
  
  if ($file.GetType() -eq [System.IO.DirectoryInfo]){
      mkdir $output
  }
  else {
      Get-Content $file.FullName | 
      foreach { 
        $_.replace( "abcd","efgh" )
      } |         
      foreach {
        $_.replace( "xyz","svw" )
      } |
      Out-File $output -Encoding UTF8
      }
   }
}
