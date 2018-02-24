transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/mohit/Google\ Drive/UIUC\ Coursework/SP18/ECE\ 385/labs/lab5/multiplier_8_2 {C:/Users/mohit/Google Drive/UIUC Coursework/SP18/ECE 385/labs/lab5/multiplier_8_2/Xreg.sv}
vlog -sv -work work +incdir+C:/Users/mohit/Google\ Drive/UIUC\ Coursework/SP18/ECE\ 385/labs/lab5/multiplier_8_2 {C:/Users/mohit/Google Drive/UIUC Coursework/SP18/ECE 385/labs/lab5/multiplier_8_2/reg_4.sv}
vlog -sv -work work +incdir+C:/Users/mohit/Google\ Drive/UIUC\ Coursework/SP18/ECE\ 385/labs/lab5/multiplier_8_2 {C:/Users/mohit/Google Drive/UIUC Coursework/SP18/ECE 385/labs/lab5/multiplier_8_2/multiplier_8_2.sv}
vlog -sv -work work +incdir+C:/Users/mohit/Google\ Drive/UIUC\ Coursework/SP18/ECE\ 385/labs/lab5/multiplier_8_2 {C:/Users/mohit/Google Drive/UIUC Coursework/SP18/ECE 385/labs/lab5/multiplier_8_2/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/mohit/Google\ Drive/UIUC\ Coursework/SP18/ECE\ 385/labs/lab5/multiplier_8_2 {C:/Users/mohit/Google Drive/UIUC Coursework/SP18/ECE 385/labs/lab5/multiplier_8_2/full_adder.sv}
vlog -sv -work work +incdir+C:/Users/mohit/Google\ Drive/UIUC\ Coursework/SP18/ECE\ 385/labs/lab5/multiplier_8_2 {C:/Users/mohit/Google Drive/UIUC Coursework/SP18/ECE 385/labs/lab5/multiplier_8_2/Control.sv}
vlog -sv -work work +incdir+C:/Users/mohit/Google\ Drive/UIUC\ Coursework/SP18/ECE\ 385/labs/lab5/multiplier_8_2 {C:/Users/mohit/Google Drive/UIUC Coursework/SP18/ECE 385/labs/lab5/multiplier_8_2/ADD_SUB9.sv}
vlog -sv -work work +incdir+C:/Users/mohit/Google\ Drive/UIUC\ Coursework/SP18/ECE\ 385/labs/lab5/multiplier_8_2 {C:/Users/mohit/Google Drive/UIUC Coursework/SP18/ECE 385/labs/lab5/multiplier_8_2/reg_8.sv}
vlog -sv -work work +incdir+C:/Users/mohit/Google\ Drive/UIUC\ Coursework/SP18/ECE\ 385/labs/lab5/multiplier_8_2 {C:/Users/mohit/Google Drive/UIUC Coursework/SP18/ECE 385/labs/lab5/multiplier_8_2/reg_16.sv}

vlog -sv -work work +incdir+C:/Users/mohit/Google\ Drive/UIUC\ Coursework/SP18/ECE\ 385/labs/lab5/multiplier_8_2 {C:/Users/mohit/Google Drive/UIUC Coursework/SP18/ECE 385/labs/lab5/multiplier_8_2/test_bench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  test_bench

add wave *
view structure
view signals
run 1000 ns
