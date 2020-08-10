cd .\Desktop\lab2\
new-item -path alias:np -value notepad | out-null
get-alias np  | out-null
./welcome-profile.ps1 
function get-cpuinfo{ get-ciminstance cim_processor | format-list "Name","Model","Speed","NumberofCores"}
function get-powerschart {foreach ($c in (1..10)) {	new-object -typename psobject -property @{PlaceCount=$c;MaxValueInBinary=[math]::pow(2,$c);MaxValueInOctal=[math]::pow(8,$c);MaxValueInHex=[math]::pow(16,$c)}}}
function welcome{
"Welcome to Jialiang's ownspace"
write-output "Welcome to planet $env:computername Overlord $env:username"
$now = get-date -format 'HH:MM tt on dddd'
write-output "It is $now."
}