-- Generated from Simulink block Data_Inspector_Module/Data Inspector Module/Data Inspector Core/Master AXI-Stream Interface/Rising Edge Detector
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity data_inspector_module_rising_edge_detector is
  port (
    input : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    output : out std_logic_vector( 1-1 downto 0 )
  );
end data_inspector_module_rising_edge_detector;
architecture structural of data_inspector_module_rising_edge_detector is 
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal enable_dim_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
begin
  output <= logical1_y_net;
  enable_dim_net <= input;
  clk_net <= clk_1;
  ce_net <= ce_1;
  inverter : entity xil_defaultlib.sysgen_inverter_5b035135c4 
  port map (
    clr => '0',
    ip => register2_q_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_0ffe428f65 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => enable_dim_net,
    y => logical1_y_net
  );
  register2 : entity xil_defaultlib.data_inspector_module_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => enable_dim_net,
    clk => clk_net,
    ce => ce_net,
    q => register2_q_net
  );
end structural;
-- Generated from Simulink block Data_Inspector_Module/Data Inspector Module/Data Inspector Core/Master AXI-Stream Interface/TLAST Generation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity data_inspector_module_tlast_generation is
  port (
    packet_size : in std_logic_vector( 32-1 downto 0 );
    tvalid_in : in std_logic_vector( 1-1 downto 0 );
    reset : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tlast_out : out std_logic_vector( 1-1 downto 0 )
  );
end data_inspector_module_tlast_generation;
architecture structural of data_inspector_module_tlast_generation is 
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal packetsize_dim_net : std_logic_vector( 32-1 downto 0 );
  signal logical2_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal reset_dim_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
begin
  tlast_out <= relational_op_net;
  packetsize_dim_net <= packet_size;
  logical2_y_net_x0 <= tvalid_in;
  reset_dim_net <= reset;
  clk_net <= clk_1;
  ce_net <= ce_1;
  counter : entity xil_defaultlib.data_inspector_module_xlcounter_free 
  generic map (
    core_name0 => "data_inspector_module_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 32
  )
  port map (
    clr => '0',
    rst => logical2_y_net,
    en => logical2_y_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  logical2 : entity xil_defaultlib.sysgen_logical_a913f35202 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => relational_op_net,
    d1 => reset_dim_net,
    y => logical2_y_net
  );
  relational : entity xil_defaultlib.sysgen_relational_3da482ee4c 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => counter_op_net,
    b => packetsize_dim_net,
    op => relational_op_net
  );
end structural;
-- Generated from Simulink block Data_Inspector_Module/Data Inspector Module/Data Inspector Core/Master AXI-Stream Interface/TUSER Sync
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity data_inspector_module_tuser_sync is
  port (
    reset : in std_logic_vector( 1-1 downto 0 );
    enable : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    latch : out std_logic_vector( 1-1 downto 0 )
  );
end data_inspector_module_tuser_sync;
architecture structural of data_inspector_module_tuser_sync is 
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal expression_dout_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
begin
  latch <= expression_dout_net;
  relational_op_net <= reset;
  logical1_y_net <= enable;
  clk_net <= clk_1;
  ce_net <= ce_1;
  expression : entity xil_defaultlib.sysgen_expr_c07d99dbf1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    e => logical1_y_net,
    q => register2_q_net,
    r => relational_op_net,
    dout => expression_dout_net
  );
  register2 : entity xil_defaultlib.data_inspector_module_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => expression_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => register2_q_net
  );
end structural;
-- Generated from Simulink block Data_Inspector_Module/Data Inspector Module/Data Inspector Core/Master AXI-Stream Interface
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity data_inspector_module_master_axi_stream_interface is
  port (
    tvalid_in : in std_logic_vector( 1-1 downto 0 );
    tdata_in : in std_logic_vector( 32-1 downto 0 );
    enable : in std_logic_vector( 1-1 downto 0 );
    reset : in std_logic_vector( 1-1 downto 0 );
    packetsize : in std_logic_vector( 32-1 downto 0 );
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    m_axis_tdata : out std_logic_vector( 32-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 )
  );
end data_inspector_module_master_axi_stream_interface;
architecture structural of data_inspector_module_master_axi_stream_interface is 
  signal logical1_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal fifo_dcount_net : std_logic_vector( 10-1 downto 0 );
  signal logical_y_net : std_logic;
  signal enable_dim_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 32-1 downto 0 );
  signal m_axis_tready_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal packetsize_dim_net : std_logic_vector( 32-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal reset_dim_net : std_logic_vector( 1-1 downto 0 );
  signal fifo_dout_net : std_logic_vector( 32-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal expression_dout_net : std_logic_vector( 1-1 downto 0 );
  signal fifo_empty_net : std_logic;
  signal fifo_full_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
begin
  register3_q_net <= tvalid_in;
  register1_q_net <= tdata_in;
  enable_dim_net <= enable;
  reset_dim_net <= reset;
  packetsize_dim_net <= packetsize;
  m_axis_tdata <= fifo_dout_net;
  m_axis_tlast <= relational_op_net;
  m_axis_tready_net <= m_axis_tready;
  m_axis_tvalid <= register_q_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  rising_edge_detector : entity xil_defaultlib.data_inspector_module_rising_edge_detector 
  port map (
    input => enable_dim_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    output => logical1_y_net
  );
  tlast_generation : entity xil_defaultlib.data_inspector_module_tlast_generation 
  port map (
    packet_size => packetsize_dim_net,
    tvalid_in => logical2_y_net,
    reset => reset_dim_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tlast_out => relational_op_net
  );
  tuser_sync : entity xil_defaultlib.data_inspector_module_tuser_sync 
  port map (
    reset => relational_op_net,
    enable => logical1_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    latch => expression_dout_net
  );
  fifo : entity xil_defaultlib.data_inspector_module_xlfifogen_u 
  generic map (
    core_name0 => "data_inspector_module_fifo_generator_i0",
    data_count_width => 10,
    data_width => 32,
    extra_registers => 1,
    has_ae => 0,
    has_af => 0,
    has_rst => true,
    percent_full_width => 1
  )
  port map (
    en => '1',
    din => register1_q_net,
    we => register3_q_net(0),
    re => logical_y_net,
    rst => reset_dim_net(0),
    clk => clk_net,
    ce => ce_net,
    we_ce => ce_net,
    re_ce => ce_net,
    dout => fifo_dout_net,
    empty => fifo_empty_net,
    full => fifo_full_net,
    dcount => fifo_dcount_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_5b035135c4 
  port map (
    clr => '0',
    ip(0) => fifo_empty_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_a913f35202 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => logical2_y_net,
    d1(0) => fifo_full_net,
    y(0) => logical_y_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_da99bf5396 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => m_axis_tready_net,
    d1 => inverter_op_net,
    y => logical1_y_net_x0
  );
  logical2 : entity xil_defaultlib.sysgen_logical_da99bf5396 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => expression_dout_net,
    d1 => logical1_y_net_x0,
    y => logical2_y_net
  );
  register_x0 : entity xil_defaultlib.data_inspector_module_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => logical2_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
end structural;
-- Generated from Simulink block Data_Inspector_Module/Data Inspector Module/Data Inspector Core/Simple Slave AXI-Stream Interface
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity data_inspector_module_simple_slave_axi_stream_interface is
  port (
    s_axis_tdata : in std_logic_vector( 32-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvalid_out : out std_logic_vector( 1-1 downto 0 );
    tdata_out : out std_logic_vector( 32-1 downto 0 )
  );
end data_inspector_module_simple_slave_axi_stream_interface;
architecture structural of data_inspector_module_simple_slave_axi_stream_interface is 
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 32-1 downto 0 );
  signal ce_net : std_logic;
  signal s_axis_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal s_axis_tdata_net : std_logic_vector( 32-1 downto 0 );
begin
  tvalid_out <= register3_q_net;
  tdata_out <= register1_q_net;
  s_axis_tdata_net <= s_axis_tdata;
  s_axis_tvalid_net <= s_axis_tvalid;
  clk_net <= clk_1;
  ce_net <= ce_1;
  register1 : entity xil_defaultlib.data_inspector_module_xlregister 
  generic map (
    d_width => 32,
    init_value => b"00000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => s_axis_tdata_net,
    clk => clk_net,
    ce => ce_net,
    q => register1_q_net
  );
  register3 : entity xil_defaultlib.data_inspector_module_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => s_axis_tvalid_net,
    clk => clk_net,
    ce => ce_net,
    q => register3_q_net
  );
end structural;
-- Generated from Simulink block Data_Inspector_Module/Data Inspector Module/Data Inspector Core
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity data_inspector_module_data_inspector_core is
  port (
    packet_size : in std_logic_vector( 32-1 downto 0 );
    enable : in std_logic_vector( 1-1 downto 0 );
    reset : in std_logic_vector( 1-1 downto 0 );
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 32-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    m_axis_tdata : out std_logic_vector( 32-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 )
  );
end data_inspector_module_data_inspector_core;
architecture structural of data_inspector_module_data_inspector_core is 
  signal enable_dim_net : std_logic_vector( 1-1 downto 0 );
  signal packetsize_dim_net : std_logic_vector( 32-1 downto 0 );
  signal m_axis_tready_net : std_logic_vector( 1-1 downto 0 );
  signal reset_dim_net : std_logic_vector( 1-1 downto 0 );
  signal fifo_dout_net : std_logic_vector( 32-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal s_axis_tdata_net : std_logic_vector( 32-1 downto 0 );
  signal s_axis_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 32-1 downto 0 );
begin
  packetsize_dim_net <= packet_size;
  enable_dim_net <= enable;
  reset_dim_net <= reset;
  m_axis_tdata <= fifo_dout_net;
  m_axis_tlast <= relational_op_net;
  m_axis_tready_net <= m_axis_tready;
  m_axis_tvalid <= register_q_net;
  s_axis_tdata_net <= s_axis_tdata;
  s_axis_tvalid_net <= s_axis_tvalid;
  clk_net <= clk_1;
  ce_net <= ce_1;
  master_axi_stream_interface : entity xil_defaultlib.data_inspector_module_master_axi_stream_interface 
  port map (
    tvalid_in => register3_q_net,
    tdata_in => register1_q_net,
    enable => enable_dim_net,
    reset => reset_dim_net,
    packetsize => packetsize_dim_net,
    m_axis_tready => m_axis_tready_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    m_axis_tdata => fifo_dout_net,
    m_axis_tlast => relational_op_net,
    m_axis_tvalid => register_q_net
  );
  simple_slave_axi_stream_interface : entity xil_defaultlib.data_inspector_module_simple_slave_axi_stream_interface 
  port map (
    s_axis_tdata => s_axis_tdata_net,
    s_axis_tvalid => s_axis_tvalid_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvalid_out => register3_q_net,
    tdata_out => register1_q_net
  );
end structural;
-- Generated from Simulink block Data_Inspector_Module/Data Inspector Module
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity data_inspector_module_data_inspector_module is
  port (
    enable_dim : in std_logic_vector( 1-1 downto 0 );
    packetsize_dim : in std_logic_vector( 32-1 downto 0 );
    reset_dim : in std_logic_vector( 1-1 downto 0 );
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 32-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    m_axis_tdata : out std_logic_vector( 32-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 )
  );
end data_inspector_module_data_inspector_module;
architecture structural of data_inspector_module_data_inspector_module is 
  signal clk_net : std_logic;
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal reset_dim_net : std_logic_vector( 1-1 downto 0 );
  signal packetsize_dim_net : std_logic_vector( 32-1 downto 0 );
  signal fifo_dout_net : std_logic_vector( 32-1 downto 0 );
  signal m_axis_tready_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tdata_net : std_logic_vector( 32-1 downto 0 );
  signal enable_dim_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
begin
  enable_dim_net <= enable_dim;
  packetsize_dim_net <= packetsize_dim;
  reset_dim_net <= reset_dim;
  m_axis_tdata <= fifo_dout_net;
  m_axis_tlast <= relational_op_net;
  m_axis_tready_net <= m_axis_tready;
  m_axis_tvalid <= register_q_net;
  s_axis_tdata_net <= s_axis_tdata;
  s_axis_tvalid_net <= s_axis_tvalid;
  clk_net <= clk_1;
  ce_net <= ce_1;
  data_inspector_core : entity xil_defaultlib.data_inspector_module_data_inspector_core 
  port map (
    packet_size => packetsize_dim_net,
    enable => enable_dim_net,
    reset => reset_dim_net,
    m_axis_tready => m_axis_tready_net,
    s_axis_tdata => s_axis_tdata_net,
    s_axis_tvalid => s_axis_tvalid_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    m_axis_tdata => fifo_dout_net,
    m_axis_tlast => relational_op_net,
    m_axis_tvalid => register_q_net
  );
end structural;
-- Generated from Simulink block Data_Inspector_Module_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity data_inspector_module_struct is
  port (
    enable_dim : in std_logic_vector( 1-1 downto 0 );
    packetsize_dim : in std_logic_vector( 32-1 downto 0 );
    reset_dim : in std_logic_vector( 1-1 downto 0 );
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 32-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    m_axis_tdata : out std_logic_vector( 32-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 )
  );
end data_inspector_module_struct;
architecture structural of data_inspector_module_struct is 
  signal fifo_dout_net : std_logic_vector( 32-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tdata_net : std_logic_vector( 32-1 downto 0 );
  signal enable_dim_net : std_logic_vector( 1-1 downto 0 );
  signal m_axis_tready_net : std_logic_vector( 1-1 downto 0 );
  signal reset_dim_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_net : std_logic;
  signal s_axis_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal packetsize_dim_net : std_logic_vector( 32-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
begin
  enable_dim_net <= enable_dim;
  packetsize_dim_net <= packetsize_dim;
  reset_dim_net <= reset_dim;
  m_axis_tdata <= fifo_dout_net;
  m_axis_tlast <= relational_op_net;
  m_axis_tready_net <= m_axis_tready;
  m_axis_tvalid <= register_q_net;
  s_axis_tdata_net <= s_axis_tdata;
  s_axis_tvalid_net <= s_axis_tvalid;
  clk_net <= clk_1;
  ce_net <= ce_1;
  data_inspector_module_x0 : entity xil_defaultlib.data_inspector_module_data_inspector_module 
  port map (
    enable_dim => enable_dim_net,
    packetsize_dim => packetsize_dim_net,
    reset_dim => reset_dim_net,
    m_axis_tready => m_axis_tready_net,
    s_axis_tdata => s_axis_tdata_net,
    s_axis_tvalid => s_axis_tvalid_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    m_axis_tdata => fifo_dout_net,
    m_axis_tlast => relational_op_net,
    m_axis_tvalid => register_q_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity data_inspector_module_default_clock_driver is
  port (
    data_inspector_module_sysclk : in std_logic;
    data_inspector_module_sysce : in std_logic;
    data_inspector_module_sysclr : in std_logic;
    data_inspector_module_clk1 : out std_logic;
    data_inspector_module_ce1 : out std_logic
  );
end data_inspector_module_default_clock_driver;
architecture structural of data_inspector_module_default_clock_driver is 
begin
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => data_inspector_module_sysclk,
    sysce => data_inspector_module_sysce,
    sysclr => data_inspector_module_sysclr,
    clk => data_inspector_module_clk1,
    ce => data_inspector_module_ce1
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity data_inspector_module is
  port (
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 32-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    data_inspector_module_aresetn : in std_logic;
    data_inspector_module_s_axi_awaddr : in std_logic_vector( 4-1 downto 0 );
    data_inspector_module_s_axi_awvalid : in std_logic;
    data_inspector_module_s_axi_wdata : in std_logic_vector( 32-1 downto 0 );
    data_inspector_module_s_axi_wstrb : in std_logic_vector( 4-1 downto 0 );
    data_inspector_module_s_axi_wvalid : in std_logic;
    data_inspector_module_s_axi_bready : in std_logic;
    data_inspector_module_s_axi_araddr : in std_logic_vector( 4-1 downto 0 );
    data_inspector_module_s_axi_arvalid : in std_logic;
    data_inspector_module_s_axi_rready : in std_logic;
    m_axis_tdata : out std_logic_vector( 32-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    data_inspector_module_s_axi_awready : out std_logic;
    data_inspector_module_s_axi_wready : out std_logic;
    data_inspector_module_s_axi_bresp : out std_logic_vector( 2-1 downto 0 );
    data_inspector_module_s_axi_bvalid : out std_logic;
    data_inspector_module_s_axi_arready : out std_logic;
    data_inspector_module_s_axi_rdata : out std_logic_vector( 32-1 downto 0 );
    data_inspector_module_s_axi_rresp : out std_logic_vector( 2-1 downto 0 );
    data_inspector_module_s_axi_rvalid : out std_logic
  );
end data_inspector_module;
architecture structural of data_inspector_module is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "data_inspector_module,sysgen_core_2019_1,{,compilation=IP Catalog,block_icon_display=Default,family=zynquplusRFSOC,part=xczu28dr,speed=-2-e,package=ffvg1517,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=0,ce_clr=0,clock_period=7.8125,system_simulink_period=7.8125e-09,waveform_viewer=0,axilite_interface=1,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=inf,counter=1,expr=1,fifo=1,inv=2,logical=5,register=5,relational=1,}";
  signal ce_1_net : std_logic;
  signal enable_dim : std_logic_vector( 1-1 downto 0 );
  signal clk_1_net : std_logic;
  signal reset_dim : std_logic_vector( 1-1 downto 0 );
  signal packetsize_dim : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
begin
  data_inspector_module_axi_lite_interface : entity xil_defaultlib.data_inspector_module_axi_lite_interface 
  port map (
    data_inspector_module_s_axi_awaddr => data_inspector_module_s_axi_awaddr,
    data_inspector_module_s_axi_awvalid => data_inspector_module_s_axi_awvalid,
    data_inspector_module_s_axi_wdata => data_inspector_module_s_axi_wdata,
    data_inspector_module_s_axi_wstrb => data_inspector_module_s_axi_wstrb,
    data_inspector_module_s_axi_wvalid => data_inspector_module_s_axi_wvalid,
    data_inspector_module_s_axi_bready => data_inspector_module_s_axi_bready,
    data_inspector_module_s_axi_araddr => data_inspector_module_s_axi_araddr,
    data_inspector_module_s_axi_arvalid => data_inspector_module_s_axi_arvalid,
    data_inspector_module_s_axi_rready => data_inspector_module_s_axi_rready,
    data_inspector_module_aresetn => data_inspector_module_aresetn,
    data_inspector_module_aclk => clk,
    reset_dim => reset_dim,
    packetsize_dim => packetsize_dim,
    enable_dim => enable_dim,
    data_inspector_module_s_axi_awready => data_inspector_module_s_axi_awready,
    data_inspector_module_s_axi_wready => data_inspector_module_s_axi_wready,
    data_inspector_module_s_axi_bresp => data_inspector_module_s_axi_bresp,
    data_inspector_module_s_axi_bvalid => data_inspector_module_s_axi_bvalid,
    data_inspector_module_s_axi_arready => data_inspector_module_s_axi_arready,
    data_inspector_module_s_axi_rdata => data_inspector_module_s_axi_rdata,
    data_inspector_module_s_axi_rresp => data_inspector_module_s_axi_rresp,
    data_inspector_module_s_axi_rvalid => data_inspector_module_s_axi_rvalid,
    clk => clk_net
  );
  data_inspector_module_default_clock_driver : entity xil_defaultlib.data_inspector_module_default_clock_driver 
  port map (
    data_inspector_module_sysclk => clk_net,
    data_inspector_module_sysce => '1',
    data_inspector_module_sysclr => '0',
    data_inspector_module_clk1 => clk_1_net,
    data_inspector_module_ce1 => ce_1_net
  );
  data_inspector_module_struct : entity xil_defaultlib.data_inspector_module_struct 
  port map (
    enable_dim => enable_dim,
    packetsize_dim => packetsize_dim,
    reset_dim => reset_dim,
    m_axis_tready => m_axis_tready,
    s_axis_tdata => s_axis_tdata,
    s_axis_tvalid => s_axis_tvalid,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    m_axis_tdata => m_axis_tdata,
    m_axis_tlast => m_axis_tlast,
    m_axis_tvalid => m_axis_tvalid
  );
end structural;
