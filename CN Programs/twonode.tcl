#simulator initialization
	set ns [new Simulator]

#output files
		
	#network animator output file
	set namf [open twonode.nam w]
	$ns namtrace-all $namf

#creation of nodes
	#$set n0 [new Node]
	set n0 [$ns node]
	set n1 [$ns node]
	
#connecting through links
	$ns duplex-link $n0 $n1 10Mb 10ms DropTail
	

#run
	
	$ns run




