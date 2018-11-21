-- (c) Copyright 1995-2018 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:hls:KalmanUpdateHLS:1.0
-- IP Revision: 1810232203

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY KalmanUpdateHLS_IP IS
  PORT (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    stub_r_V : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
    stub_z_V : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    stub_phiS_V : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    stub_valid_V : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    stateIn_cBin_V : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    stateIn_mBin_V : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    stateIn_inv2R_V : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    stateIn_phi0_V : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    stateIn_tanL_V : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    stateIn_z0_V : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    stateIn_cov_00_V : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
    stateIn_cov_11_V : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
    stateIn_cov_22_V : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
    stateIn_cov_33_V : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
    stateIn_cov_01_V : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    stateIn_cov_23_V : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    stateIn_chiSquared_V : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
    stateIn_layerID_V : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    stateIn_nSkippedLayers_V : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    stateIn_candidateID_V : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    stateIn_eventID_V : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    stateIn_etaSectorID_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    stateIn_etaSectorZsign_V : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    stateIn_valid_V : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    stateOut_cBin_V : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    stateOut_mBin_V : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    stateOut_inv2R_V : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    stateOut_phi0_V : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    stateOut_tanL_V : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    stateOut_z0_V : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    stateOut_cov_00_V : OUT STD_LOGIC_VECTOR(24 DOWNTO 0);
    stateOut_cov_11_V : OUT STD_LOGIC_VECTOR(24 DOWNTO 0);
    stateOut_cov_22_V : OUT STD_LOGIC_VECTOR(24 DOWNTO 0);
    stateOut_cov_33_V : OUT STD_LOGIC_VECTOR(24 DOWNTO 0);
    stateOut_cov_01_V : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    stateOut_cov_23_V : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    stateOut_chiSquared_V : OUT STD_LOGIC_VECTOR(16 DOWNTO 0);
    stateOut_layerID_V : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    stateOut_nSkippedLayers_V : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    stateOut_candidateID_V : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    stateOut_eventID_V : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    stateOut_etaSectorID_V : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    stateOut_etaSectorZsign_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    stateOut_valid_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    extraOut_z0Cut_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    extraOut_ptCut_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    extraOut_chiSquaredCut_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    extraOut_sufficientPScut_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    extraOut_htBinWithin1Cut_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    extraOut_mBinHelix_V : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    extraOut_cBinHelix_V : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    extraOut_sectorCut_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    extraOut_consistent_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END KalmanUpdateHLS_IP;

ARCHITECTURE KalmanUpdateHLS_IP_arch OF KalmanUpdateHLS_IP IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF KalmanUpdateHLS_IP_arch: ARCHITECTURE IS "yes";
  COMPONENT KalmanUpdateHLS IS
    PORT (
      ap_clk : IN STD_LOGIC;
      ap_rst : IN STD_LOGIC;
      ap_start : IN STD_LOGIC;
      ap_done : OUT STD_LOGIC;
      ap_idle : OUT STD_LOGIC;
      ap_ready : OUT STD_LOGIC;
      stub_r_V : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
      stub_z_V : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
      stub_phiS_V : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
      stub_valid_V : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      stateIn_cBin_V : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      stateIn_mBin_V : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      stateIn_inv2R_V : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      stateIn_phi0_V : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      stateIn_tanL_V : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      stateIn_z0_V : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      stateIn_cov_00_V : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
      stateIn_cov_11_V : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
      stateIn_cov_22_V : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
      stateIn_cov_33_V : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
      stateIn_cov_01_V : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      stateIn_cov_23_V : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      stateIn_chiSquared_V : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
      stateIn_layerID_V : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      stateIn_nSkippedLayers_V : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      stateIn_candidateID_V : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      stateIn_eventID_V : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      stateIn_etaSectorID_V : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      stateIn_etaSectorZsign_V : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      stateIn_valid_V : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      stateOut_cBin_V : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      stateOut_mBin_V : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      stateOut_inv2R_V : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      stateOut_phi0_V : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      stateOut_tanL_V : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      stateOut_z0_V : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      stateOut_cov_00_V : OUT STD_LOGIC_VECTOR(24 DOWNTO 0);
      stateOut_cov_11_V : OUT STD_LOGIC_VECTOR(24 DOWNTO 0);
      stateOut_cov_22_V : OUT STD_LOGIC_VECTOR(24 DOWNTO 0);
      stateOut_cov_33_V : OUT STD_LOGIC_VECTOR(24 DOWNTO 0);
      stateOut_cov_01_V : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      stateOut_cov_23_V : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      stateOut_chiSquared_V : OUT STD_LOGIC_VECTOR(16 DOWNTO 0);
      stateOut_layerID_V : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      stateOut_nSkippedLayers_V : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stateOut_candidateID_V : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      stateOut_eventID_V : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      stateOut_etaSectorID_V : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      stateOut_etaSectorZsign_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      stateOut_valid_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      extraOut_z0Cut_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      extraOut_ptCut_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      extraOut_chiSquaredCut_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      extraOut_sufficientPScut_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      extraOut_htBinWithin1Cut_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      extraOut_mBinHelix_V : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      extraOut_cBinHelix_V : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      extraOut_sectorCut_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      extraOut_consistent_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
    );
  END COMPONENT KalmanUpdateHLS;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF KalmanUpdateHLS_IP_arch: ARCHITECTURE IS "HLS";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF extraOut_consistent_V: SIGNAL IS "XIL_INTERFACENAME extraOut_consistent_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxi" & 
"mum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF extraOut_consistent_V: SIGNAL IS "xilinx.com:signal:data:1.0 extraOut_consistent_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF extraOut_sectorCut_V: SIGNAL IS "XIL_INTERFACENAME extraOut_sectorCut_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF extraOut_sectorCut_V: SIGNAL IS "xilinx.com:signal:data:1.0 extraOut_sectorCut_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF extraOut_cBinHelix_V: SIGNAL IS "XIL_INTERFACENAME extraOut_cBinHelix_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 6} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value true}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF extraOut_cBinHelix_V: SIGNAL IS "xilinx.com:signal:data:1.0 extraOut_cBinHelix_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF extraOut_mBinHelix_V: SIGNAL IS "XIL_INTERFACENAME extraOut_mBinHelix_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 6} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value true}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF extraOut_mBinHelix_V: SIGNAL IS "xilinx.com:signal:data:1.0 extraOut_mBinHelix_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF extraOut_htBinWithin1Cut_V: SIGNAL IS "XIL_INTERFACENAME extraOut_htBinWithin1Cut_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {}" & 
" maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF extraOut_htBinWithin1Cut_V: SIGNAL IS "xilinx.com:signal:data:1.0 extraOut_htBinWithin1Cut_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF extraOut_sufficientPScut_V: SIGNAL IS "XIL_INTERFACENAME extraOut_sufficientPScut_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {}" & 
" maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF extraOut_sufficientPScut_V: SIGNAL IS "xilinx.com:signal:data:1.0 extraOut_sufficientPScut_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF extraOut_chiSquaredCut_V: SIGNAL IS "XIL_INTERFACENAME extraOut_chiSquaredCut_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} m" & 
"aximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF extraOut_chiSquaredCut_V: SIGNAL IS "xilinx.com:signal:data:1.0 extraOut_chiSquaredCut_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF extraOut_ptCut_V: SIGNAL IS "XIL_INTERFACENAME extraOut_ptCut_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {" & 
"}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF extraOut_ptCut_V: SIGNAL IS "xilinx.com:signal:data:1.0 extraOut_ptCut_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF extraOut_z0Cut_V: SIGNAL IS "XIL_INTERFACENAME extraOut_z0Cut_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {" & 
"}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF extraOut_z0Cut_V: SIGNAL IS "xilinx.com:signal:data:1.0 extraOut_z0Cut_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateOut_valid_V: SIGNAL IS "XIL_INTERFACENAME stateOut_valid_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {" & 
"}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateOut_valid_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateOut_valid_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateOut_etaSectorZsign_V: SIGNAL IS "XIL_INTERFACENAME stateOut_etaSectorZsign_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateOut_etaSectorZsign_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateOut_etaSectorZsign_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateOut_etaSectorID_V: SIGNAL IS "XIL_INTERFACENAME stateOut_etaSectorID_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 4} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} max" & 
"imum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateOut_etaSectorID_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateOut_etaSectorID_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateOut_eventID_V: SIGNAL IS "XIL_INTERFACENAME stateOut_eventID_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 3} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum" & 
" {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateOut_eventID_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateOut_eventID_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateOut_candidateID_V: SIGNAL IS "XIL_INTERFACENAME stateOut_candidateID_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 6} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} max" & 
"imum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateOut_candidateID_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateOut_candidateID_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateOut_nSkippedLayers_V: SIGNAL IS "XIL_INTERFACENAME stateOut_nSkippedLayers_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 2} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateOut_nSkippedLayers_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateOut_nSkippedLayers_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateOut_layerID_V: SIGNAL IS "XIL_INTERFACENAME stateOut_layerID_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 3} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum" & 
" {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateOut_layerID_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateOut_layerID_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateOut_chiSquared_V: SIGNAL IS "XIL_INTERFACENAME stateOut_chiSquared_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 17} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimu" & 
"m {} maximum {}} value 7} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateOut_chiSquared_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateOut_chiSquared_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateOut_cov_23_V: SIGNAL IS "XIL_INTERFACENAME stateOut_cov_23_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 18} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {}" & 
" maximum {}} value 10} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateOut_cov_23_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateOut_cov_23_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateOut_cov_01_V: SIGNAL IS "XIL_INTERFACENAME stateOut_cov_01_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 18} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {}" & 
" maximum {}} value 12} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateOut_cov_01_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateOut_cov_01_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateOut_cov_33_V: SIGNAL IS "XIL_INTERFACENAME stateOut_cov_33_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 25} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {}" & 
" maximum {}} value 8} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateOut_cov_33_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateOut_cov_33_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateOut_cov_22_V: SIGNAL IS "XIL_INTERFACENAME stateOut_cov_22_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 25} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {}" & 
" maximum {}} value 25} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateOut_cov_22_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateOut_cov_22_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateOut_cov_11_V: SIGNAL IS "XIL_INTERFACENAME stateOut_cov_11_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 25} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {}" & 
" maximum {}} value 8} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateOut_cov_11_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateOut_cov_11_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateOut_cov_00_V: SIGNAL IS "XIL_INTERFACENAME stateOut_cov_00_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 25} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {}" & 
" maximum {}} value -4294967266} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateOut_cov_00_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateOut_cov_00_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateOut_z0_V: SIGNAL IS "XIL_INTERFACENAME stateOut_z0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 18} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} max" & 
"imum {}} value 7} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateOut_z0_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateOut_z0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateOut_tanL_V: SIGNAL IS "XIL_INTERFACENAME stateOut_tanL_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 18} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} m" & 
"aximum {}} value 13} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateOut_tanL_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateOut_tanL_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateOut_phi0_V: SIGNAL IS "XIL_INTERFACENAME stateOut_phi0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 18} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} m" & 
"aximum {}} value 3} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateOut_phi0_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateOut_phi0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateOut_inv2R_V: SIGNAL IS "XIL_INTERFACENAME stateOut_inv2R_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 18} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} " & 
"maximum {}} value 15} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateOut_inv2R_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateOut_inv2R_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateOut_mBin_V: SIGNAL IS "XIL_INTERFACENAME stateOut_mBin_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 6} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}" & 
"} value true}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateOut_mBin_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateOut_mBin_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateOut_cBin_V: SIGNAL IS "XIL_INTERFACENAME stateOut_cBin_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 6} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}" & 
"} value true}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateOut_cBin_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateOut_cBin_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateIn_valid_V: SIGNAL IS "XIL_INTERFACENAME stateIn_valid_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}" & 
"} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateIn_valid_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateIn_valid_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateIn_etaSectorZsign_V: SIGNAL IS "XIL_INTERFACENAME stateIn_etaSectorZsign_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} m" & 
"aximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateIn_etaSectorZsign_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateIn_etaSectorZsign_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateIn_etaSectorID_V: SIGNAL IS "XIL_INTERFACENAME stateIn_etaSectorID_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 4} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxi" & 
"mum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateIn_etaSectorID_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateIn_etaSectorID_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateIn_eventID_V: SIGNAL IS "XIL_INTERFACENAME stateIn_eventID_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 3} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum " & 
"{}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateIn_eventID_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateIn_eventID_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateIn_candidateID_V: SIGNAL IS "XIL_INTERFACENAME stateIn_candidateID_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 6} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxi" & 
"mum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateIn_candidateID_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateIn_candidateID_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateIn_nSkippedLayers_V: SIGNAL IS "XIL_INTERFACENAME stateIn_nSkippedLayers_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 2} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} m" & 
"aximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateIn_nSkippedLayers_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateIn_nSkippedLayers_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateIn_layerID_V: SIGNAL IS "XIL_INTERFACENAME stateIn_layerID_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 3} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum " & 
"{}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateIn_layerID_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateIn_layerID_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateIn_chiSquared_V: SIGNAL IS "XIL_INTERFACENAME stateIn_chiSquared_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 17} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum" & 
" {} maximum {}} value 7} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateIn_chiSquared_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateIn_chiSquared_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateIn_cov_23_V: SIGNAL IS "XIL_INTERFACENAME stateIn_cov_23_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 18} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} " & 
"maximum {}} value 10} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateIn_cov_23_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateIn_cov_23_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateIn_cov_01_V: SIGNAL IS "XIL_INTERFACENAME stateIn_cov_01_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 18} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} " & 
"maximum {}} value 12} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateIn_cov_01_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateIn_cov_01_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateIn_cov_33_V: SIGNAL IS "XIL_INTERFACENAME stateIn_cov_33_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 25} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} " & 
"maximum {}} value 8} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateIn_cov_33_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateIn_cov_33_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateIn_cov_22_V: SIGNAL IS "XIL_INTERFACENAME stateIn_cov_22_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 25} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} " & 
"maximum {}} value 25} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateIn_cov_22_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateIn_cov_22_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateIn_cov_11_V: SIGNAL IS "XIL_INTERFACENAME stateIn_cov_11_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 25} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} " & 
"maximum {}} value 8} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateIn_cov_11_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateIn_cov_11_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateIn_cov_00_V: SIGNAL IS "XIL_INTERFACENAME stateIn_cov_00_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 25} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} " & 
"maximum {}} value -4294967266} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateIn_cov_00_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateIn_cov_00_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateIn_z0_V: SIGNAL IS "XIL_INTERFACENAME stateIn_z0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 18} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} maxi" & 
"mum {}} value 7} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateIn_z0_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateIn_z0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateIn_tanL_V: SIGNAL IS "XIL_INTERFACENAME stateIn_tanL_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 18} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} ma" & 
"ximum {}} value 13} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateIn_tanL_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateIn_tanL_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateIn_phi0_V: SIGNAL IS "XIL_INTERFACENAME stateIn_phi0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 18} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} ma" & 
"ximum {}} value 3} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateIn_phi0_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateIn_phi0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateIn_inv2R_V: SIGNAL IS "XIL_INTERFACENAME stateIn_inv2R_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 18} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} m" & 
"aximum {}} value 15} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateIn_inv2R_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateIn_inv2R_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateIn_mBin_V: SIGNAL IS "XIL_INTERFACENAME stateIn_mBin_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 6} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}}" & 
" value true}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateIn_mBin_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateIn_mBin_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stateIn_cBin_V: SIGNAL IS "XIL_INTERFACENAME stateIn_cBin_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 6} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}}" & 
" value true}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stateIn_cBin_V: SIGNAL IS "xilinx.com:signal:data:1.0 stateIn_cBin_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stub_valid_V: SIGNAL IS "XIL_INTERFACENAME stub_valid_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} v" & 
"alue false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stub_valid_V: SIGNAL IS "xilinx.com:signal:data:1.0 stub_valid_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stub_phiS_V: SIGNAL IS "XIL_INTERFACENAME stub_phiS_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 14} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} maxim" & 
"um {}} value 0} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stub_phiS_V: SIGNAL IS "xilinx.com:signal:data:1.0 stub_phiS_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stub_z_V: SIGNAL IS "XIL_INTERFACENAME stub_z_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 14} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum " & 
"{}} value -1} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stub_z_V: SIGNAL IS "xilinx.com:signal:data:1.0 stub_z_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stub_r_V: SIGNAL IS "XIL_INTERFACENAME stub_r_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 13} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum " & 
"{}} value 0} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF stub_r_V: SIGNAL IS "xilinx.com:signal:data:1.0 stub_r_V DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ap_ready: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready";
  ATTRIBUTE X_INTERFACE_INFO OF ap_idle: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle";
  ATTRIBUTE X_INTERFACE_INFO OF ap_done: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_start: SIGNAL IS "XIL_INTERFACENAME ap_ctrl, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {start {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} done {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum " & 
"{}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} idle {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long" & 
" minimum {} maximum {}} value 0}}} ready {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF ap_start: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_rst: SIGNAL IS "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_clk: SIGNAL IS "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 100000000, PHASE 0.000";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
BEGIN
  U0 : KalmanUpdateHLS
    PORT MAP (
      ap_clk => ap_clk,
      ap_rst => ap_rst,
      ap_start => ap_start,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      stub_r_V => stub_r_V,
      stub_z_V => stub_z_V,
      stub_phiS_V => stub_phiS_V,
      stub_valid_V => stub_valid_V,
      stateIn_cBin_V => stateIn_cBin_V,
      stateIn_mBin_V => stateIn_mBin_V,
      stateIn_inv2R_V => stateIn_inv2R_V,
      stateIn_phi0_V => stateIn_phi0_V,
      stateIn_tanL_V => stateIn_tanL_V,
      stateIn_z0_V => stateIn_z0_V,
      stateIn_cov_00_V => stateIn_cov_00_V,
      stateIn_cov_11_V => stateIn_cov_11_V,
      stateIn_cov_22_V => stateIn_cov_22_V,
      stateIn_cov_33_V => stateIn_cov_33_V,
      stateIn_cov_01_V => stateIn_cov_01_V,
      stateIn_cov_23_V => stateIn_cov_23_V,
      stateIn_chiSquared_V => stateIn_chiSquared_V,
      stateIn_layerID_V => stateIn_layerID_V,
      stateIn_nSkippedLayers_V => stateIn_nSkippedLayers_V,
      stateIn_candidateID_V => stateIn_candidateID_V,
      stateIn_eventID_V => stateIn_eventID_V,
      stateIn_etaSectorID_V => stateIn_etaSectorID_V,
      stateIn_etaSectorZsign_V => stateIn_etaSectorZsign_V,
      stateIn_valid_V => stateIn_valid_V,
      stateOut_cBin_V => stateOut_cBin_V,
      stateOut_mBin_V => stateOut_mBin_V,
      stateOut_inv2R_V => stateOut_inv2R_V,
      stateOut_phi0_V => stateOut_phi0_V,
      stateOut_tanL_V => stateOut_tanL_V,
      stateOut_z0_V => stateOut_z0_V,
      stateOut_cov_00_V => stateOut_cov_00_V,
      stateOut_cov_11_V => stateOut_cov_11_V,
      stateOut_cov_22_V => stateOut_cov_22_V,
      stateOut_cov_33_V => stateOut_cov_33_V,
      stateOut_cov_01_V => stateOut_cov_01_V,
      stateOut_cov_23_V => stateOut_cov_23_V,
      stateOut_chiSquared_V => stateOut_chiSquared_V,
      stateOut_layerID_V => stateOut_layerID_V,
      stateOut_nSkippedLayers_V => stateOut_nSkippedLayers_V,
      stateOut_candidateID_V => stateOut_candidateID_V,
      stateOut_eventID_V => stateOut_eventID_V,
      stateOut_etaSectorID_V => stateOut_etaSectorID_V,
      stateOut_etaSectorZsign_V => stateOut_etaSectorZsign_V,
      stateOut_valid_V => stateOut_valid_V,
      extraOut_z0Cut_V => extraOut_z0Cut_V,
      extraOut_ptCut_V => extraOut_ptCut_V,
      extraOut_chiSquaredCut_V => extraOut_chiSquaredCut_V,
      extraOut_sufficientPScut_V => extraOut_sufficientPScut_V,
      extraOut_htBinWithin1Cut_V => extraOut_htBinWithin1Cut_V,
      extraOut_mBinHelix_V => extraOut_mBinHelix_V,
      extraOut_cBinHelix_V => extraOut_cBinHelix_V,
      extraOut_sectorCut_V => extraOut_sectorCut_V,
      extraOut_consistent_V => extraOut_consistent_V
    );
END KalmanUpdateHLS_IP_arch;
