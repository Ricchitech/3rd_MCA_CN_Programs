set ns [new Simulator]
set trf [open "starnetwork.tr" w]
$ns trace-all $trf
set namf [open "starnetwork.nam" w]
$ns namtrace-all $namf

#Setting up a nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]

#change the shape of the central node
$n0 shape square

#Connecting throuhg links
$ns duplex-link $n0 $n1 1Mb 10ms DropTail
$ns duplex-link $n0 $n2 1Mb 10ms DropTail
$ns duplex-link $n0 $n3 1Mb 10ms DropTail
$ns duplex-link $n0 $n4 1Mb 10ms DropTail
$ns duplex-link $n0 $n5 1Mb 10ms DropTail
set t [new Agent/TCP]
$ns attach-agent $n0 $t
set s [new Agent/TCPSink]
$ns attach-agent $n3 $s
$ns connect $t $s
set cbr [new Application/Traffic/CBR]
$cbr set packetSize_ 500
$cbr set interval_ 0.01
$cbr attach-agent $t
proc finish { } {
global ns trf namf
$ns flush-trace
exec nam starnetwork.nam &
close $namf
close $trf
exit 0
}
$ns at 0.5 "$cbr start"
$ns at 4.5 "$cbr stop"
$ns at 5.0 "finish"
$ns run