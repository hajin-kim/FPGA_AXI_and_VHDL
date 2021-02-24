# DoGain: Vivado Top-Level Project

![DoGain%20Vivado%20Top-Level%20Project%203be038fcba0740c59dfa28c94a40a5d7/Untitled.png](DoGain%20Vivado%20Top-Level%20Project%203be038fcba0740c59dfa28c94a40a5d7/Untitled.png)

If you closed the IP project, then you will see the Vivado top-level project window.

Create a block design.

We have to implement the Lab06 block design. Please refer to Lab06 and [DoGain: Vivado](https://github.com/hajin-kim/FPGA_Tutorial_with_HLS/blob/main/Lab06%20Working%20with%20HLS%209b2ebc09d3614613aae2553700d082ae/DoGain%20Vivado%201d3d4c6d96114c08854ec7c709328057.md) 

![DoGain%20Vivado%20Top-Level%20Project%203be038fcba0740c59dfa28c94a40a5d7/Untitled%201.png](DoGain%20Vivado%20Top-Level%20Project%203be038fcba0740c59dfa28c94a40a5d7/Untitled%201.png)

**Differences**:

- Our custom DoGain has more clocks and resets ports. But Vivado automation wizard will connect them properly. So, we may ignore them.
- Our custom DoGain has no interrupt port. When you add Concat, set the number of the input ports to 2, instead of 3.

Done.

Create a wrapper.

Generate Bitstream.

After a while, export hardware.