vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/dist_mem_gen_v8_0_12
vlib modelsim_lib/msim/blk_mem_gen_v8_4_1

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm
vmap dist_mem_gen_v8_0_12 modelsim_lib/msim/dist_mem_gen_v8_0_12
vmap blk_mem_gen_v8_4_1 modelsim_lib/msim/blk_mem_gen_v8_4_1

vlog -work xil_defaultlib -64 -incr -sv \
"/home/mghorbani/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/home/mghorbani/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_calcOneOverInt_get_V.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_calcPhiExtra2_2S_get_V.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_calcPhiExtra2_PS_get_V.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_calcPitch2SoverR_2_get_V.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_calcPitchPSoverR_2_get_V.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_calcScatTerm2_get_V.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_chi2_digi_cut_V.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_etaBounds_z_V.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_inv2R_digi_cut_V.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mac_muladd_18s_14s_27ns_27_2_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mac_muladd_18s_14s_28ns_29_2_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mac_muladd_24ns_13ns_33s_39_2_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mac_muladd_24ns_14s_36ns_36_2_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mac_mulsub_18ns_9ns_28ns_28_2_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mul_12s_18s_29_2_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mul_34ns_18ns_52_5_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mul_34ns_25s_49_5_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mul_34ns_25s_59_5_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mul_34ns_34ns_68_5_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mul_34s_25ns_56_5_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mul_34s_25ns_58_5_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mul_35s_25s_51_5_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mul_35s_25s_52_5_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mul_mul_12ns_18s_30_3_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mul_mul_13ns_18s_31_3_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mul_mul_17s_17s_34_3_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mul_mul_18s_13ns_31_3_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mul_mul_18s_18s_36_3_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mul_mul_25s_13ns_38_3_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mul_mul_25s_14s_39_3_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mul_mul_25s_17s_36_3_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mul_mul_25s_17s_37_3_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mul_mul_25s_17s_42_3_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS_mul_mul_28s_9ns_37_3_1.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/hdl/vhdl/KalmanUpdateHLS.vhd" \
"../../top/top.srcs/sources_1/ip/KalmanUpdateHLS_IP/sim/KalmanUpdateHLS_IP.vhd" \

vlog -work dist_mem_gen_v8_0_12 -64 -incr \
"../../top/top.srcs/sources_1/ip/RAM_64x22/simulation/dist_mem_gen_v8_0.v" \

vlog -work xil_defaultlib -64 -incr \
"../../top/top.srcs/sources_1/ip/RAM_64x22/sim/RAM_64x22.v" \

vlog -work blk_mem_gen_v8_4_1 -64 -incr \
"../../top/top.srcs/sources_1/ip/RAM_512x72/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 -incr \
"../../top/top.srcs/sources_1/ip/RAM_512x72/sim/RAM_512x72.v" \

vlog -work blk_mem_gen_v8_4_1 -64 -incr \
"../../top/top.srcs/sources_1/ip/RAM_512x36/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 -incr \
"../../top/top.srcs/sources_1/ip/RAM_512x36/sim/RAM_512x36.v" \

vlog -work xil_defaultlib \
"glbl.v"

