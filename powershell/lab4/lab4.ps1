get-wmiobject -class win32_computersystem | 
Format-list  @{Label="System Hardware Description"; Expression={$_.description}}

get-wmiobject -class win32_operatingsystem |
Format-list   @{Label="Operating System Name "; Expression={$_.name}},
@{Label="Version"; Expression={$_.version}}


get-wmiobject -class win32_processor |Where-Object MaxClockSpeed -ne $null |
foreach {
 new-object -TypeName psobject -Property @{
 "Speed" = $_.MaxClockSpeed
 "Number of Cores" = $_.NumberOfCores
 "L1 CacheSize(MB)" = $_.L1CacheSize/1kb
 "L2 CacheSize(MB)" = $_.L2CacheSize/1kb
 "L3 CacheSize(MB)" = $_.L3CacheSize/1kb
 }
} |
Format-list  "Speed","Number of Core","L1 CacheSize(MB)","L2 CacheSize(MB)","L3 CacheSize(MB)"

$totalram = 0
get-wmiobject -class win32_physicalmemory |
foreach {
 new-object -TypeName psobject -Property @{
 "Vendor" = $_.manufacturer
 "Description" = $_.Description
 "Speed(MHz)" = $_.ConfiguredClockSpeed
 "Size(MB)" = $_.capacity/1mb
 "Bank" = $_.banklabel
 "Slot" = $_.devicelocator
 }
 $totalram += $_.capacity/1mb
} |
Format-Table -AutoSize "Vendor","Description", "Size(MB)", "Speed(MHz)", "Bank", "Slot"
"Total memory of RAM: ${totalram}MB "


$disks=Get-WmiObject -class  win32_logicaldisk |  where-object size -gt 0 


$diskConfig=foreach ($disk in $disks) {
$diskpartition = $disk.GetRelated('win32_diskpartition')
$drive = $diskpartition.GetRelated('win32_diskdrive')
    
     new-object -TypeName psobject -Property @{
     "Vendor" = $drive.manufacturer
     "model" = $drive.model
     "Size(GB)"=$drive.size/1gb -as [int]
     "Free space(GB)"=$disk.freespace/1gb -as [int] 
     "Free disk space in %"=100*$disk.freespace/$drive.size  -as [int]

}
} 
$diskConfig|Format-Table -AutoSize "Vendor","model","Size(GB)","Free space(GB)","Free disk space in %"


get-wmiobject -class win32_videocontroller |
Format-list   @{Label="Vendor"; Expression={$_.AdapterCompatibility}},
@{Label="Description"; Expression={$_.Description}},
@{Label="Current Resolution of Screen)"; Expression={$_.CurrentHorizontalResolution*$_.CurrentVerticalResolution }}
