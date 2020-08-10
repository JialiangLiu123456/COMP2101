function get-cpuinfo{ get-ciminstance cim_processor | format-list "Name","Model","Speed","NumberofCores"}
ls function:| out-null
ls function:get-cpuinfo | out-null
get-content function:get-cpuinfo | out-null
get-cpuinfo 
