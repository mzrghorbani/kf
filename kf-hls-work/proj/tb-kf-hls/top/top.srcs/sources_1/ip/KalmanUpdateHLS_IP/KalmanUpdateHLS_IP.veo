// (c) Copyright 1995-2018 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:hls:KalmanUpdateHLS:1.0
// IP Revision: 1810232203

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
KalmanUpdateHLS_IP your_instance_name (
  .ap_clk(ap_clk),                                          // input wire ap_clk
  .ap_rst(ap_rst),                                          // input wire ap_rst
  .ap_start(ap_start),                                      // input wire ap_start
  .ap_done(ap_done),                                        // output wire ap_done
  .ap_idle(ap_idle),                                        // output wire ap_idle
  .ap_ready(ap_ready),                                      // output wire ap_ready
  .stub_r_V(stub_r_V),                                      // input wire [12 : 0] stub_r_V
  .stub_z_V(stub_z_V),                                      // input wire [13 : 0] stub_z_V
  .stub_phiS_V(stub_phiS_V),                                // input wire [13 : 0] stub_phiS_V
  .stub_valid_V(stub_valid_V),                              // input wire [0 : 0] stub_valid_V
  .stateIn_cBin_V(stateIn_cBin_V),                          // input wire [5 : 0] stateIn_cBin_V
  .stateIn_mBin_V(stateIn_mBin_V),                          // input wire [5 : 0] stateIn_mBin_V
  .stateIn_inv2R_V(stateIn_inv2R_V),                        // input wire [17 : 0] stateIn_inv2R_V
  .stateIn_phi0_V(stateIn_phi0_V),                          // input wire [17 : 0] stateIn_phi0_V
  .stateIn_tanL_V(stateIn_tanL_V),                          // input wire [17 : 0] stateIn_tanL_V
  .stateIn_z0_V(stateIn_z0_V),                              // input wire [17 : 0] stateIn_z0_V
  .stateIn_cov_00_V(stateIn_cov_00_V),                      // input wire [24 : 0] stateIn_cov_00_V
  .stateIn_cov_11_V(stateIn_cov_11_V),                      // input wire [24 : 0] stateIn_cov_11_V
  .stateIn_cov_22_V(stateIn_cov_22_V),                      // input wire [24 : 0] stateIn_cov_22_V
  .stateIn_cov_33_V(stateIn_cov_33_V),                      // input wire [24 : 0] stateIn_cov_33_V
  .stateIn_cov_01_V(stateIn_cov_01_V),                      // input wire [17 : 0] stateIn_cov_01_V
  .stateIn_cov_23_V(stateIn_cov_23_V),                      // input wire [17 : 0] stateIn_cov_23_V
  .stateIn_chiSquared_V(stateIn_chiSquared_V),              // input wire [16 : 0] stateIn_chiSquared_V
  .stateIn_layerID_V(stateIn_layerID_V),                    // input wire [2 : 0] stateIn_layerID_V
  .stateIn_nSkippedLayers_V(stateIn_nSkippedLayers_V),      // input wire [1 : 0] stateIn_nSkippedLayers_V
  .stateIn_candidateID_V(stateIn_candidateID_V),            // input wire [5 : 0] stateIn_candidateID_V
  .stateIn_eventID_V(stateIn_eventID_V),                    // input wire [2 : 0] stateIn_eventID_V
  .stateIn_etaSectorID_V(stateIn_etaSectorID_V),            // input wire [3 : 0] stateIn_etaSectorID_V
  .stateIn_etaSectorZsign_V(stateIn_etaSectorZsign_V),      // input wire [0 : 0] stateIn_etaSectorZsign_V
  .stateIn_valid_V(stateIn_valid_V),                        // input wire [0 : 0] stateIn_valid_V
  .stateOut_cBin_V(stateOut_cBin_V),                        // output wire [5 : 0] stateOut_cBin_V
  .stateOut_mBin_V(stateOut_mBin_V),                        // output wire [5 : 0] stateOut_mBin_V
  .stateOut_inv2R_V(stateOut_inv2R_V),                      // output wire [17 : 0] stateOut_inv2R_V
  .stateOut_phi0_V(stateOut_phi0_V),                        // output wire [17 : 0] stateOut_phi0_V
  .stateOut_tanL_V(stateOut_tanL_V),                        // output wire [17 : 0] stateOut_tanL_V
  .stateOut_z0_V(stateOut_z0_V),                            // output wire [17 : 0] stateOut_z0_V
  .stateOut_cov_00_V(stateOut_cov_00_V),                    // output wire [24 : 0] stateOut_cov_00_V
  .stateOut_cov_11_V(stateOut_cov_11_V),                    // output wire [24 : 0] stateOut_cov_11_V
  .stateOut_cov_22_V(stateOut_cov_22_V),                    // output wire [24 : 0] stateOut_cov_22_V
  .stateOut_cov_33_V(stateOut_cov_33_V),                    // output wire [24 : 0] stateOut_cov_33_V
  .stateOut_cov_01_V(stateOut_cov_01_V),                    // output wire [17 : 0] stateOut_cov_01_V
  .stateOut_cov_23_V(stateOut_cov_23_V),                    // output wire [17 : 0] stateOut_cov_23_V
  .stateOut_chiSquared_V(stateOut_chiSquared_V),            // output wire [16 : 0] stateOut_chiSquared_V
  .stateOut_layerID_V(stateOut_layerID_V),                  // output wire [2 : 0] stateOut_layerID_V
  .stateOut_nSkippedLayers_V(stateOut_nSkippedLayers_V),    // output wire [1 : 0] stateOut_nSkippedLayers_V
  .stateOut_candidateID_V(stateOut_candidateID_V),          // output wire [5 : 0] stateOut_candidateID_V
  .stateOut_eventID_V(stateOut_eventID_V),                  // output wire [2 : 0] stateOut_eventID_V
  .stateOut_etaSectorID_V(stateOut_etaSectorID_V),          // output wire [3 : 0] stateOut_etaSectorID_V
  .stateOut_etaSectorZsign_V(stateOut_etaSectorZsign_V),    // output wire [0 : 0] stateOut_etaSectorZsign_V
  .stateOut_valid_V(stateOut_valid_V),                      // output wire [0 : 0] stateOut_valid_V
  .extraOut_z0Cut_V(extraOut_z0Cut_V),                      // output wire [0 : 0] extraOut_z0Cut_V
  .extraOut_ptCut_V(extraOut_ptCut_V),                      // output wire [0 : 0] extraOut_ptCut_V
  .extraOut_chiSquaredCut_V(extraOut_chiSquaredCut_V),      // output wire [0 : 0] extraOut_chiSquaredCut_V
  .extraOut_sufficientPScut_V(extraOut_sufficientPScut_V),  // output wire [0 : 0] extraOut_sufficientPScut_V
  .extraOut_htBinWithin1Cut_V(extraOut_htBinWithin1Cut_V),  // output wire [0 : 0] extraOut_htBinWithin1Cut_V
  .extraOut_mBinHelix_V(extraOut_mBinHelix_V),              // output wire [5 : 0] extraOut_mBinHelix_V
  .extraOut_cBinHelix_V(extraOut_cBinHelix_V),              // output wire [5 : 0] extraOut_cBinHelix_V
  .extraOut_sectorCut_V(extraOut_sectorCut_V),              // output wire [0 : 0] extraOut_sectorCut_V
  .extraOut_consistent_V(extraOut_consistent_V)            // output wire [0 : 0] extraOut_consistent_V
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file KalmanUpdateHLS_IP.v when simulating
// the core, KalmanUpdateHLS_IP. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

