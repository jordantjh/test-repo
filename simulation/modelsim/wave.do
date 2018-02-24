onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_bench/S
add wave -noupdate /test_bench/Clk
add wave -noupdate /test_bench/Aval
add wave -noupdate /test_bench/Bval
add wave -noupdate /test_bench/X
add wave -noupdate /test_bench/Correct_Reset
add wave -noupdate /test_bench/Correct_ClearA_LoadB
add wave -noupdate /test_bench/Correct_Run
add wave -noupdate /test_bench/mult/control_unit/curr_state
add wave -noupdate /test_bench/mult/adder/BB
add wave -noupdate /test_bench/mult/control_unit/M1
add wave -noupdate /test_bench/mult/control_unit/M0
add wave -noupdate /test_bench/mult/control_unit/Subtract
add wave -noupdate /test_bench/mult/adder/S
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {430000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {875313 ps} {1006563 ps}
