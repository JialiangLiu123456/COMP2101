function get-powerschart {

foreach ($c in (1..10)) {	new-object -typename psobject -property @{

PlaceCount=$c;

MaxValueInBinary=[math]::pow(2,$c);

MaxValueInOctal=[math]::pow(8,$c);

MaxValueInHex=[math]::pow(16,$c)

 }

}

}
ls function: | out-null
ls function:get-powerschart | out-null
get-content function:get-powerschart | out-null
get-powerschart
