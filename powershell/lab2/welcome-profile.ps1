function welcome{
"Welcome to Jialiang's ownspace"
write-output "Welcome to planet $env:computername Overlord $env:username"
$now = get-date -format 'HH:MM tt on dddd'
write-output "It is $now."
}
ls function:| out-null
ls function:welcome | out-null
get-content function:welcome | out-null
welcome
