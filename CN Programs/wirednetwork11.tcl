#simulator initialization
	set ns [new Simulator]

#output files
	#packet trace  output file
	set trf [open wirednetwork11.tr w]
	$ns trace-all $trf
	
	#network animator output file
	set namf [open wirednetwork11.nam w]
	$ns namtrace-all $namf

#creation of nodes
	#$set n0 [new Node]
	set n0 [$ns node]
	set n1 [$ns node]
	set n2 [$ns node]
	set n3 [$ns node]
#connecting through links
	$ns duplex-link $n0 $n2 10Mb 10ms DropTail
	$ns duplex-link $n1 $n2 10Kb 100ms DropTail
	$ns duplex-link $n2 $n3 10Kb 100ms DropTail
#agents[TCP] creation
	set t [new Agent/TCP]
	$ns attach-agent $n0 $t

	set s [new Agent/TCPSink]
	$ns attach-agent $n3 $s
	$ns connect $t $s
#create application
	set f [new Application/FTP]
	$f attach-agent $t


#packet size and time interval
	$f set packetSize_ 200
	$f set packetSize_ 100
	$f set interval_ 0.01
	
#finish procedure
	proc finish {} {
	global ns trf namf
	$ns flush-trace
	exec nam wirednetwork11.nam &
	close $namf
	close $trf
	exit 0
	}
#allotment
	
	$ns at 0.5 "$f start"
	$ns at 7.0 "$f stop"
	$ns at 10.0 "finish"
	$ns run




