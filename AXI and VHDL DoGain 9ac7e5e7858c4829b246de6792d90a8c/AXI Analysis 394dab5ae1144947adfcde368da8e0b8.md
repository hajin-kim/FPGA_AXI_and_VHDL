# AXI Analysis

# Common

Clock

- Called "ACLK" (AXI global clock)
- Clock is rising edge triggered.

Reset

- Called "ARESETN" (AXI global negative reset)
- Negative reset: triggered when ARESETN is OFF.
- Reset is synchronous.

Master and Slave

- Data transfer method.
- Master controls transferring.
- For each n-th clock edge,
    1. Master sends VALID ON to Slave.
    2. Slave responses to Master by READY ON.
    3. Data is transferred. Sometimes sequentially during several clock edges.

Register

FIFO

- First in first out
- Represented by VHDL array
    - Array of standard logic vector.
    - The instance of this array will be automatically assigned to BRAM.
- Vivado provides FIFO with up to 8 bytes for AXI transfer components, especially up to 1024 bytes for AXI Slave Full protocol.

# AXI Slave Lite

Provides simple and direct read/write to several registers between ZYNQ processor and our IP.

![AXI%20Analysis%20394dab5ae1144947adfcde368da8e0b8/Untitled.png](AXI%20Analysis%20394dab5ae1144947adfcde368da8e0b8/Untitled.png)

![AXI%20Analysis%20394dab5ae1144947adfcde368da8e0b8/Untitled%201.png](AXI%20Analysis%20394dab5ae1144947adfcde368da8e0b8/Untitled%201.png)

The application project indicates the action of the ZYNQ processor.

# AXI Slave Stream

![AXI%20Analysis%20394dab5ae1144947adfcde368da8e0b8/Untitled%202.png](AXI%20Analysis%20394dab5ae1144947adfcde368da8e0b8/Untitled%202.png)

# AXI Master Stream

![AXI%20Analysis%20394dab5ae1144947adfcde368da8e0b8/Untitled%203.png](AXI%20Analysis%20394dab5ae1144947adfcde368da8e0b8/Untitled%203.png)