# SimpleMult: Vivado Top-Level Project

![SimpleMult%20Vivado%20Top-Level%20Project%20aa85d661900648cda15ae0eae231c8a3/Untitled.png](SimpleMult%20Vivado%20Top-Level%20Project%20aa85d661900648cda15ae0eae231c8a3/Untitled.png)

If you closed the IP project, then you will see the Vivado top-level project window.

Create a block design

![SimpleMult%20Vivado%20Top-Level%20Project%20aa85d661900648cda15ae0eae231c8a3/Untitled%201.png](SimpleMult%20Vivado%20Top-Level%20Project%20aa85d661900648cda15ae0eae231c8a3/Untitled%201.png)

Add ZYNQ and apply the preset.

I had to set several features to make it work well. It may good to compare this with the default and the lab05 preset.

- **simple_multiplier.tcl** at [SimpleMult: Materials](SimpleMult%20Materials%201fe9835135b3400a9391427bc77eafb1.md)

Run Block Automation.

![SimpleMult%20Vivado%20Top-Level%20Project%20aa85d661900648cda15ae0eae231c8a3/Untitled%202.png](SimpleMult%20Vivado%20Top-Level%20Project%20aa85d661900648cda15ae0eae231c8a3/Untitled%202.png)

Add your custom IP.

Run Connection Automation

![SimpleMult%20Vivado%20Top-Level%20Project%20aa85d661900648cda15ae0eae231c8a3/Untitled%203.png](SimpleMult%20Vivado%20Top-Level%20Project%20aa85d661900648cda15ae0eae231c8a3/Untitled%203.png)

Done.

Create a wrapper.

Generate Bitstream.

After a while, export hardware.