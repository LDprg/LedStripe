onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/inst_uart_top/inst_LedStripe/data_i
add wave -noupdate -format Literal -radix symbolic /tb/inst_uart_top/inst_LedStripe/inst_LedSequence/state_s
add wave -noupdate /tb/inst_uart_top/inst_LedStripe/ready_s
add wave -noupdate -format Literal /tb/inst_uart_top/inst_LedStripe/data_s
add wave -noupdate /tb/inst_uart_top/inst_LedStripe/inst_LedSequence/timer_en_s
add wave -noupdate /tb/inst_uart_top/inst_LedStripe/count_led_s
add wave -noupdate /tb/inst_uart_top/inst_LedStripe/count_s
add wave -noupdate /tb/inst_uart_top/led_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {947165 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 106
configure wave -valuecolwidth 212
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {0 ns} {105 ms}
