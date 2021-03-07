#!/usr/local/bin/php
<?
###
# Search / Search'n'replace for text content in files
# You can specify function, search text, replacing text, excluded directories, searched directories, searched file extensions
###
# Usage: search-and-replace.php --help|--search|--replace <search-text> [<replace-text>]
###

# File extensions to search
 $searchfiles[]="*.php"
 $searchfiles[]="*.html"
 $searchfiles[]="*.htm"
 $searchfiles[]="*.xml"

# Directories to search
 $searchdirectories[]="/www"
 $searchdirectories[]="/home"
 
# Directories to exclude
 $searchexcludes[]="/home/user"
 $searchexcludes[]="/www/domain.com"

###
 $search=$replace="";
 if($argc<1){echo "ERROR: Too few parameters! Use search-and-replace.php --help\n";exit;}
 if($argv[1]=="--help"){echo "Usage: search-and-replace.php --search|--replace <search-text> [<replace-text>]\n";exit;}
 if($argc<3){echo "ERROR: Too few parameters!\n";exit;}
 if($argv[1]=="--replace" && $argc<4){echo "ERROR: Too few parameters!\n";exit;}
 if($argv[1]=="--search"){$search=$argv[2];}
 if($argv[1]=="--replace"){$search=$argv[2];$replace=$argv[3];}
 if($search==""){echo "ERROR: Uknown function! Just search or replace.\n";exit;}

### Search directory trees function
 function search($dir){
  global $searchfiles;
  $files=glob($dir."/*",GLOB_ONLYDIR);
  for($fi=0;$fi<count($files);$fi++){
   $excluded=0;
   for($sei=0;$sei<count($searchexcludes);$sei++){if($files[$fi]==$searchexcludes[$sei]){$excluded=1;}}
   if($excluded==0){
    if(filetype($files[$fi])=="dir" && filetype($files[$fi])!="link"){search($files[$fi]);}
   }
  }
  for($sfi=0;$sfi<count($searchfiles);$sfi++){
   $files=glob($dir."/".$searchfiles[$sfi]);
   for($fi=0;$fi<count($files);$fi++){
    if(filetype($files[$fi])=="file" && filetype($files[$fi])!="link"){searchfile($files[$fi]);}
   }
  }
 }

### Search content of a file function
 function searchfile($file){
  global $search,$replace;
  $found=array();
  $data=file($file);
  for($di=0;$di<count($data);$di++){
   if(strstr($data[$di],$search)){
    $found[]=$di;
    if($replace!=""){$data[$di]=str_replace($search,$replace,$data[$di]);}
   }
  }
  if(count($found)>0){
   if($replace!=""){
    if($fx=fopen($file,"w+b")){
     for($di=0;$di<count($data);$di++){fputs($fx,$data[$di]);}
     fclose($fx);
    }
   }
### Print file name and content if found
   echo "F ".$file."\n";
   for($fi=0;$fi<count($found);$fi++){
    echo "   found on line ".($found[$fi]+1)." \"".substr(trim($data[$found[$fi]]),0,100)."\"\n";
   }
  }
 }

### Main...
 for($sdi=0;$sdi<count($searchdirectories);$sdi++){search($searchdirectories[$sdi]);}
?>
