onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider CLK
add wave -noupdate /tb/clk_100M_s
add wave -noupdate /tb/baud_s
add wave -noupdate /tb/inst_uart_top/inst_uart_tx/clk_s
add wave -noupdate /tb/inst_uart_top/inst_uart_tx/en_clk_s
add wave -noupdate -divider RX
add wave -noupdate /tb/inst_uart_top/ready_s
add wave -noupdate /tb/uart_rx_s
add wave -noupdate /tb/inst_uart_top/data_rx_s
add wave -noupdate -divider TX
add wave -noupdate /tb/inst_uart_top/send_s
add wave -noupdate /tb/uart_tx_s
add wave -noupdate /tb/inst_uart_top/data_tx_s
add wave -noupdate -divider STATE
add wave -noupdate /tb/inst_uart_top/inst_uart_tx/state_s
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 6} {226154 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 153
configure wave -valuecolwidth 100
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1050 us}
