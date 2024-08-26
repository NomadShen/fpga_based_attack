set f [open pt.txt w]

set num  20000
set n_all [expr $num * 4]

for {set x 0} {$x<$n_all} {incr x} {
    set pt [GenKey]
    puts $f $pt
}

close $f