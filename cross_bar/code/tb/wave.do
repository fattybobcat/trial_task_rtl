onerror {resume}
quietly virtual function -install /top_tb/master_i1 -env /top_tb/master_ifc_4 { &{/top_tb/master_i1/master_addr[31], /top_tb/master_i1/master_addr[30] }} adr_31_30
quietly virtual function -install /top_tb/master_i2 -env /top_tb/master_ifc_4 { &{/top_tb/master_i2/master_addr[31], /top_tb/master_i2/master_addr[30] }} adr_31_30
quietly virtual function -install /top_tb/master_i3 -env /top_tb/master_ifc_4 { &{/top_tb/master_i3/master_addr[31], /top_tb/master_i3/master_addr[30] }} adr_31_30
quietly virtual function -install /top_tb/master_i4 -env /top_tb/master_ifc_4 { &{/top_tb/master_i4/master_addr[31], /top_tb/master_i4/master_addr[30] }} adr_31_30
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/clk
add wave -noupdate /top_tb/reset_n
add wave -noupdate -expand -group MASTER_0 -color Cyan /top_tb/master_i1/master_req
add wave -noupdate -expand -group MASTER_0 /top_tb/master_i1/adr_31_30
add wave -noupdate -expand -group MASTER_0 /top_tb/master_i1/master_addr
add wave -noupdate -expand -group MASTER_0 /top_tb/master_i1/master_cmd
add wave -noupdate -expand -group MASTER_0 /top_tb/master_i1/master_wdata
add wave -noupdate -expand -group MASTER_0 -color Magenta /top_tb/master_i1/master_ack
add wave -noupdate -expand -group MASTER_0 /top_tb/master_i1/master_rdata
add wave -noupdate -expand -group MASTER_0 /top_tb/master_i1/master_resp
add wave -noupdate -expand -group MASTER_0 /top_tb/master_i1/delay_cnt
add wave -noupdate -expand -group MASTER_0 /top_tb/master_i1/i
add wave -noupdate -expand -group MASTER_1 -color Cyan /top_tb/master_i2/master_req
add wave -noupdate -expand -group MASTER_1 /top_tb/master_i2/adr_31_30
add wave -noupdate -expand -group MASTER_1 /top_tb/master_i2/master_addr
add wave -noupdate -expand -group MASTER_1 /top_tb/master_i2/master_cmd
add wave -noupdate -expand -group MASTER_1 /top_tb/master_i2/master_wdata
add wave -noupdate -expand -group MASTER_1 -color Magenta /top_tb/master_i2/master_ack
add wave -noupdate -expand -group MASTER_1 /top_tb/master_i2/master_rdata
add wave -noupdate -expand -group MASTER_1 /top_tb/master_i2/master_resp
add wave -noupdate -expand -group MASTER_1 /top_tb/master_i2/delay_cnt
add wave -noupdate -expand -group MASTER_1 /top_tb/master_i2/i
add wave -noupdate -expand -group MASTER_2 -color Cyan /top_tb/master_i3/master_req
add wave -noupdate -expand -group MASTER_2 /top_tb/master_i3/adr_31_30
add wave -noupdate -expand -group MASTER_2 /top_tb/master_i3/master_addr
add wave -noupdate -expand -group MASTER_2 /top_tb/master_i3/master_cmd
add wave -noupdate -expand -group MASTER_2 /top_tb/master_i3/master_wdata
add wave -noupdate -expand -group MASTER_2 -color Magenta /top_tb/master_i3/master_ack
add wave -noupdate -expand -group MASTER_2 /top_tb/master_i3/master_rdata
add wave -noupdate -expand -group MASTER_2 /top_tb/master_i3/master_resp
add wave -noupdate -expand -group MASTER_2 /top_tb/master_i3/delay_cnt
add wave -noupdate -expand -group MASTER_2 /top_tb/master_i3/i
add wave -noupdate -expand -group MASTER_3 -color Cyan /top_tb/master_i4/master_req
add wave -noupdate -expand -group MASTER_3 /top_tb/master_i4/adr_31_30
add wave -noupdate -expand -group MASTER_3 /top_tb/master_i4/master_addr
add wave -noupdate -expand -group MASTER_3 /top_tb/master_i4/master_cmd
add wave -noupdate -expand -group MASTER_3 /top_tb/master_i4/master_wdata
add wave -noupdate -expand -group MASTER_3 -color Magenta /top_tb/master_i4/master_ack
add wave -noupdate -expand -group MASTER_3 /top_tb/master_i4/master_rdata
add wave -noupdate -expand -group MASTER_3 /top_tb/master_i4/master_resp
add wave -noupdate -expand -group MASTER_3 /top_tb/master_i4/delay_cnt
add wave -noupdate -expand -group MASTER_3 /top_tb/master_i4/i
add wave -noupdate -expand -group SLAVE_0 -color Cyan /top_tb/slave_i1/slave_req
add wave -noupdate -expand -group SLAVE_0 /top_tb/slave_i1/slave_addr
add wave -noupdate -expand -group SLAVE_0 /top_tb/slave_i1/slave_cmd
add wave -noupdate -expand -group SLAVE_0 /top_tb/slave_i1/slave_wdata
add wave -noupdate -expand -group SLAVE_0 -color Magenta /top_tb/slave_i1/slave_ack
add wave -noupdate -expand -group SLAVE_0 /top_tb/slave_i1/slave_rdata
add wave -noupdate -expand -group SLAVE_0 /top_tb/slave_i1/slave_resp
add wave -noupdate -expand -group SLAVE_0 /top_tb/slave_i1/req
add wave -noupdate -expand -group SLAVE_0 /top_tb/slave_i1/addr
add wave -noupdate -expand -group SLAVE_0 /top_tb/slave_i1/cmd
add wave -noupdate -expand -group SLAVE_0 /top_tb/slave_i1/wdata
add wave -noupdate -expand -group SLAVE_0 /top_tb/slave_i1/rdata
add wave -noupdate -expand -group SLAVE_0 /top_tb/slave_i1/resp
add wave -noupdate -expand -group SLAVE_1 -color Cyan /top_tb/slave_i2/slave_req
add wave -noupdate -expand -group SLAVE_1 /top_tb/slave_i2/slave_addr
add wave -noupdate -expand -group SLAVE_1 /top_tb/slave_i2/slave_cmd
add wave -noupdate -expand -group SLAVE_1 /top_tb/slave_i2/slave_wdata
add wave -noupdate -expand -group SLAVE_1 -color Magenta /top_tb/slave_i2/slave_ack
add wave -noupdate -expand -group SLAVE_1 /top_tb/slave_i2/slave_rdata
add wave -noupdate -expand -group SLAVE_1 /top_tb/slave_i2/slave_resp
add wave -noupdate -expand -group SLAVE_1 /top_tb/slave_i2/req
add wave -noupdate -expand -group SLAVE_1 /top_tb/slave_i2/addr
add wave -noupdate -expand -group SLAVE_1 /top_tb/slave_i2/cmd
add wave -noupdate -expand -group SLAVE_1 /top_tb/slave_i2/wdata
add wave -noupdate -expand -group SLAVE_1 /top_tb/slave_i2/rdata
add wave -noupdate -expand -group SLAVE_1 /top_tb/slave_i2/resp
add wave -noupdate -expand -group SLAVE_2 -color Cyan /top_tb/slave_i3/slave_req
add wave -noupdate -expand -group SLAVE_2 /top_tb/slave_i3/slave_addr
add wave -noupdate -expand -group SLAVE_2 /top_tb/slave_i3/slave_cmd
add wave -noupdate -expand -group SLAVE_2 /top_tb/slave_i3/slave_wdata
add wave -noupdate -expand -group SLAVE_2 -color Magenta /top_tb/slave_i3/slave_ack
add wave -noupdate -expand -group SLAVE_2 /top_tb/slave_i3/slave_rdata
add wave -noupdate -expand -group SLAVE_2 /top_tb/slave_i3/slave_resp
add wave -noupdate -expand -group SLAVE_2 /top_tb/slave_i3/req
add wave -noupdate -expand -group SLAVE_2 /top_tb/slave_i3/addr
add wave -noupdate -expand -group SLAVE_2 /top_tb/slave_i3/cmd
add wave -noupdate -expand -group SLAVE_2 /top_tb/slave_i3/wdata
add wave -noupdate -expand -group SLAVE_2 /top_tb/slave_i3/rdata
add wave -noupdate -expand -group SLAVE_2 /top_tb/slave_i3/resp
add wave -noupdate -expand -group SLAVE_3 -color Cyan /top_tb/slave_i4/slave_req
add wave -noupdate -expand -group SLAVE_3 /top_tb/slave_i4/slave_addr
add wave -noupdate -expand -group SLAVE_3 /top_tb/slave_i4/slave_cmd
add wave -noupdate -expand -group SLAVE_3 /top_tb/slave_i4/slave_wdata
add wave -noupdate -expand -group SLAVE_3 -color Magenta /top_tb/slave_i4/slave_ack
add wave -noupdate -expand -group SLAVE_3 /top_tb/slave_i4/slave_rdata
add wave -noupdate -expand -group SLAVE_3 /top_tb/slave_i4/slave_resp
add wave -noupdate -expand -group SLAVE_3 /top_tb/slave_i4/req
add wave -noupdate -expand -group SLAVE_3 /top_tb/slave_i4/addr
add wave -noupdate -expand -group SLAVE_3 /top_tb/slave_i4/cmd
add wave -noupdate -expand -group SLAVE_3 /top_tb/slave_i4/wdata
add wave -noupdate -expand -group SLAVE_3 /top_tb/slave_i4/rdata
add wave -noupdate -expand -group SLAVE_3 /top_tb/slave_i4/resp
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/clk
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/reset_n
add wave -noupdate -expand -group cross_bar -color Cyan /top_tb/cross_bar_i1/master_1_req
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/master_1_addr
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/master_1_cmd
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/master_1_wdata
add wave -noupdate -expand -group cross_bar -color Magenta /top_tb/cross_bar_i1/master_1_ack
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/master_1_rdata
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/master_1_resp
add wave -noupdate -expand -group cross_bar -color Cyan /top_tb/cross_bar_i1/master_2_req
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/master_2_addr
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/master_2_cmd
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/master_2_wdata
add wave -noupdate -expand -group cross_bar -color Magenta /top_tb/cross_bar_i1/master_2_ack
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/master_2_rdata
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/master_2_resp
add wave -noupdate -expand -group cross_bar -color Cyan /top_tb/cross_bar_i1/master_3_req
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/master_3_addr
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/master_3_cmd
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/master_3_wdata
add wave -noupdate -expand -group cross_bar -color Magenta /top_tb/cross_bar_i1/master_3_ack
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/master_3_rdata
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/master_3_resp
add wave -noupdate -expand -group cross_bar -color Cyan /top_tb/cross_bar_i1/master_4_req
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/master_4_addr
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/master_4_cmd
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/master_4_wdata
add wave -noupdate -expand -group cross_bar -color Magenta /top_tb/cross_bar_i1/master_4_ack
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/master_4_rdata
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/master_4_resp
add wave -noupdate -expand -group cross_bar -color Cyan /top_tb/cross_bar_i1/slave_1_req
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/slave_1_addr
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/slave_1_cmd
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/slave_1_wdata
add wave -noupdate -expand -group cross_bar -color Magenta /top_tb/cross_bar_i1/slave_1_ack
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/slave_1_rdata
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/slave_1_resp
add wave -noupdate -expand -group cross_bar -color Cyan /top_tb/cross_bar_i1/slave_2_req
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/slave_2_addr
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/slave_2_cmd
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/slave_2_wdata
add wave -noupdate -expand -group cross_bar -color Magenta /top_tb/cross_bar_i1/slave_2_ack
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/slave_2_rdata
add wave -noupdate -expand -group cross_bar -color Cyan /top_tb/cross_bar_i1/slave_req_1
add wave -noupdate -expand -group cross_bar -color Cyan /top_tb/cross_bar_i1/slave_req_2
add wave -noupdate -expand -group cross_bar -color Cyan /top_tb/cross_bar_i1/slave_req_3
add wave -noupdate -expand -group cross_bar -color Cyan /top_tb/cross_bar_i1/slave_req_4
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/number_master1
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/number_master2
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/number_master3
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/number_master4
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/slave_2_resp
add wave -noupdate -expand -group cross_bar -color Cyan /top_tb/cross_bar_i1/slave_3_req
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/slave_3_addr
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/slave_3_cmd
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/slave_3_wdata
add wave -noupdate -expand -group cross_bar -color Magenta /top_tb/cross_bar_i1/slave_3_ack
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/slave_3_rdata
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/slave_3_resp
add wave -noupdate -expand -group cross_bar -color Cyan /top_tb/cross_bar_i1/slave_4_req
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/slave_4_addr
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/slave_4_cmd
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/slave_4_wdata
add wave -noupdate -expand -group cross_bar -color Magenta /top_tb/cross_bar_i1/slave_4_ack
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/slave_4_rdata
add wave -noupdate -expand -group cross_bar /top_tb/cross_bar_i1/slave_4_resp
add wave -noupdate -group RR_0 /top_tb/cross_bar_i1/round_robin_4_i1/master_1_req
add wave -noupdate -group RR_0 /top_tb/cross_bar_i1/round_robin_4_i1/master_2_req
add wave -noupdate -group RR_0 /top_tb/cross_bar_i1/round_robin_4_i1/master_3_req
add wave -noupdate -group RR_0 /top_tb/cross_bar_i1/round_robin_4_i1/master_4_req
add wave -noupdate -group RR_0 /top_tb/cross_bar_i1/round_robin_4_i1/master_1_addr
add wave -noupdate -group RR_0 /top_tb/cross_bar_i1/round_robin_4_i1/master_2_addr
add wave -noupdate -group RR_0 /top_tb/cross_bar_i1/round_robin_4_i1/master_3_addr
add wave -noupdate -group RR_0 /top_tb/cross_bar_i1/round_robin_4_i1/master_4_addr
add wave -noupdate -group RR_0 -color Cyan /top_tb/cross_bar_i1/round_robin_4_i1/slave_req
add wave -noupdate -group RR_0 -color Magenta /top_tb/cross_bar_i1/round_robin_4_i1/slave_ack
add wave -noupdate -group RR_0 /top_tb/cross_bar_i1/round_robin_4_i1/number_master_en
add wave -noupdate -group RR_0 -expand -subitemconfig {{/top_tb/cross_bar_i1/round_robin_4_i1/enable[1]} {-color Orange -height 15} {/top_tb/cross_bar_i1/round_robin_4_i1/enable[0]} {-color Coral -height 15}} /top_tb/cross_bar_i1/round_robin_4_i1/enable
add wave -noupdate -group RR_0 -color Cyan /top_tb/cross_bar_i1/round_robin_4_i1/master_1_en_req
add wave -noupdate -group RR_0 -color Cyan /top_tb/cross_bar_i1/round_robin_4_i1/master_2_en_req
add wave -noupdate -group RR_0 -color Cyan /top_tb/cross_bar_i1/round_robin_4_i1/master_3_en_req
add wave -noupdate -group RR_0 -color Cyan /top_tb/cross_bar_i1/round_robin_4_i1/master_4_en_req
add wave -noupdate -group RR_0 -expand /top_tb/cross_bar_i1/round_robin_4_i1/mask_en
add wave -noupdate -group RR_0 /top_tb/cross_bar_i1/round_robin_4_i1/req_now
add wave -noupdate -group RR_0 /top_tb/cross_bar_i1/round_robin_4_i1/SLAVE
add wave -noupdate -group RR_0 /top_tb/cross_bar_i1/round_robin_4_i1/State
add wave -noupdate -group RR_0 /top_tb/cross_bar_i1/round_robin_4_i1/NextState
add wave -noupdate -group RR_1 /top_tb/cross_bar_i1/round_robin_4_i2/master_1_req
add wave -noupdate -group RR_1 /top_tb/cross_bar_i1/round_robin_4_i2/master_2_req
add wave -noupdate -group RR_1 /top_tb/cross_bar_i1/round_robin_4_i2/master_3_req
add wave -noupdate -group RR_1 /top_tb/cross_bar_i1/round_robin_4_i2/master_4_req
add wave -noupdate -group RR_1 /top_tb/cross_bar_i1/round_robin_4_i2/master_1_addr
add wave -noupdate -group RR_1 /top_tb/cross_bar_i1/round_robin_4_i2/master_2_addr
add wave -noupdate -group RR_1 /top_tb/cross_bar_i1/round_robin_4_i2/master_3_addr
add wave -noupdate -group RR_1 /top_tb/cross_bar_i1/round_robin_4_i2/master_4_addr
add wave -noupdate -group RR_1 -color Magenta /top_tb/cross_bar_i1/round_robin_4_i2/slave_ack
add wave -noupdate -group RR_1 -color Cyan /top_tb/cross_bar_i1/round_robin_4_i2/slave_req
add wave -noupdate -group RR_1 /top_tb/cross_bar_i1/round_robin_4_i2/enable
add wave -noupdate -group RR_1 -color Cyan /top_tb/cross_bar_i1/round_robin_4_i2/master_1_en_req
add wave -noupdate -group RR_1 -color Cyan /top_tb/cross_bar_i1/round_robin_4_i2/master_2_en_req
add wave -noupdate -group RR_1 -color Cyan /top_tb/cross_bar_i1/round_robin_4_i2/master_3_en_req
add wave -noupdate -group RR_1 -color Cyan /top_tb/cross_bar_i1/round_robin_4_i2/master_4_en_req
add wave -noupdate -group RR_1 /top_tb/cross_bar_i1/round_robin_4_i2/mask_en
add wave -noupdate -group RR_1 /top_tb/cross_bar_i1/round_robin_4_i2/req_now
add wave -noupdate -group RR_1 /top_tb/cross_bar_i1/round_robin_4_i2/State
add wave -noupdate -group RR_1 /top_tb/cross_bar_i1/round_robin_4_i2/NextState
add wave -noupdate -group RR_1 /top_tb/cross_bar_i1/round_robin_4_i2/SLAVE
add wave -noupdate -group RR_1 /top_tb/cross_bar_i1/round_robin_4_i2/number_master_en
add wave -noupdate -group RR_2 /top_tb/cross_bar_i1/round_robin_4_i3/master_1_req
add wave -noupdate -group RR_2 /top_tb/cross_bar_i1/round_robin_4_i3/master_2_req
add wave -noupdate -group RR_2 /top_tb/cross_bar_i1/round_robin_4_i3/master_3_req
add wave -noupdate -group RR_2 /top_tb/cross_bar_i1/round_robin_4_i3/master_4_req
add wave -noupdate -group RR_2 /top_tb/cross_bar_i1/round_robin_4_i3/master_1_addr
add wave -noupdate -group RR_2 /top_tb/cross_bar_i1/round_robin_4_i3/master_2_addr
add wave -noupdate -group RR_2 /top_tb/cross_bar_i1/round_robin_4_i3/master_3_addr
add wave -noupdate -group RR_2 /top_tb/cross_bar_i1/round_robin_4_i3/master_4_addr
add wave -noupdate -group RR_2 -color Magenta /top_tb/cross_bar_i1/round_robin_4_i3/slave_ack
add wave -noupdate -group RR_2 -color Cyan /top_tb/cross_bar_i1/round_robin_4_i3/slave_req
add wave -noupdate -group RR_2 /top_tb/cross_bar_i1/round_robin_4_i3/enable
add wave -noupdate -group RR_2 -color Cyan /top_tb/cross_bar_i1/round_robin_4_i3/master_1_en_req
add wave -noupdate -group RR_2 -color Cyan /top_tb/cross_bar_i1/round_robin_4_i3/master_2_en_req
add wave -noupdate -group RR_2 -color Cyan /top_tb/cross_bar_i1/round_robin_4_i3/master_3_en_req
add wave -noupdate -group RR_2 -color Cyan /top_tb/cross_bar_i1/round_robin_4_i3/master_4_en_req
add wave -noupdate -group RR_2 /top_tb/cross_bar_i1/round_robin_4_i3/mask_en
add wave -noupdate -group RR_2 /top_tb/cross_bar_i1/round_robin_4_i3/req_now
add wave -noupdate -group RR_2 /top_tb/cross_bar_i1/round_robin_4_i3/State
add wave -noupdate -group RR_2 /top_tb/cross_bar_i1/round_robin_4_i3/NextState
add wave -noupdate -group RR_2 /top_tb/cross_bar_i1/round_robin_4_i3/SLAVE
add wave -noupdate -group RR_2 /top_tb/cross_bar_i1/round_robin_4_i3/number_master_en
add wave -noupdate -expand -group RR_3 /top_tb/cross_bar_i1/round_robin_4_i4/master_1_req
add wave -noupdate -expand -group RR_3 /top_tb/cross_bar_i1/round_robin_4_i4/master_2_req
add wave -noupdate -expand -group RR_3 /top_tb/cross_bar_i1/round_robin_4_i4/master_3_req
add wave -noupdate -expand -group RR_3 /top_tb/cross_bar_i1/round_robin_4_i4/master_4_req
add wave -noupdate -expand -group RR_3 /top_tb/cross_bar_i1/round_robin_4_i4/master_1_addr
add wave -noupdate -expand -group RR_3 /top_tb/cross_bar_i1/round_robin_4_i4/master_2_addr
add wave -noupdate -expand -group RR_3 /top_tb/cross_bar_i1/round_robin_4_i4/master_3_addr
add wave -noupdate -expand -group RR_3 /top_tb/cross_bar_i1/round_robin_4_i4/master_4_addr
add wave -noupdate -expand -group RR_3 -color Magenta /top_tb/cross_bar_i1/round_robin_4_i4/slave_ack
add wave -noupdate -expand -group RR_3 -color Cyan /top_tb/cross_bar_i1/round_robin_4_i4/slave_req
add wave -noupdate -expand -group RR_3 /top_tb/cross_bar_i1/round_robin_4_i4/enable
add wave -noupdate -expand -group RR_3 -color Cyan /top_tb/cross_bar_i1/round_robin_4_i4/master_1_en_req
add wave -noupdate -expand -group RR_3 -color Cyan /top_tb/cross_bar_i1/round_robin_4_i4/master_2_en_req
add wave -noupdate -expand -group RR_3 -color Cyan /top_tb/cross_bar_i1/round_robin_4_i4/master_3_en_req
add wave -noupdate -expand -group RR_3 -color Cyan /top_tb/cross_bar_i1/round_robin_4_i4/master_4_en_req
add wave -noupdate -expand -group RR_3 /top_tb/cross_bar_i1/round_robin_4_i4/mask_en
add wave -noupdate -expand -group RR_3 /top_tb/cross_bar_i1/round_robin_4_i4/req_now
add wave -noupdate -expand -group RR_3 /top_tb/cross_bar_i1/round_robin_4_i4/State
add wave -noupdate -expand -group RR_3 /top_tb/cross_bar_i1/round_robin_4_i4/NextState
add wave -noupdate -expand -group RR_3 /top_tb/cross_bar_i1/round_robin_4_i4/SLAVE
add wave -noupdate -expand -group RR_3 /top_tb/cross_bar_i1/round_robin_4_i4/number_master_en
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {109745 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 386
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {691394 ps}
