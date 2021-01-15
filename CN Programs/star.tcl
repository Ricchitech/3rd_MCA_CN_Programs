set ns [new Simulator]
set starf [open "star.tr" w]
$ns trace-all $starf
set namstarf [ open "star.nam" w]
$ns namtrace-all $namstarf
proc finish { } {
	global ns starf namstarf
	$ns flush-trace
	close $starf
	close $namstarf
	exec nam namstar.nam &
	exit
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]

$ns duplex-link $n1 $n0 2Mb 5ms DropTail
$ns duplex-link $n2 $n0 2Mb 5ms DropTail
$ns duplex-link $n3 $n0 2Mb 5ms DropTail
$ns duplex-link $n4 $n0 2Mb 5ms DropTail
$ns duplex-link $n5 $n0 2Mb 5ms DropTail

set tcp0 [new Agent/TCP]
$ns attach-agent $n1 $tcp0
set ftp [new Application/FTP]
$ftp attach-agent $tcp0

set sink [new Agent/TCPSink]
$ns attach-agent $n3 $sink

$ns connect $tcp0 $sink

$ns at .1 "$ftp start"
$ns at 2 "$ftp stop"
$ns at 2.1 "finish"

$ns run