# SimpleMult: Vitis Project and Run

Create a Hello World application project. Refer to [Alternative: Direct Creation of Vitis Application Project from Vivado Hardware](https://github.com/hajin-kim/FPGA_Tutorial_with_HLS/blob/main/Lab05%20Hello%20World%20with%20Vitis%20and%20Vivado%20d3897032db324f5d9531e5ab0a9af6df/Alternative%20Direct%20Creation%20of%20Vitis%20Application%20P%20c3733968f81641d19b17885f5466a621.md)

Makefile problem again. You may have to fix some Makefiles of the generated platform project. Refer to [Makefile Problem](https://github.com/hajin-kim/FPGA_Tutorial_with_HLS/blob/main/Troubleshootings%20f43673650b7c4eb5b83fa2b7a80452e2/Makefile%20Problem%20b266174a19ec426eba6e8e8b3119c7d0.md) 

![SimpleMult%20Vitis%20Project%20and%20Run%2022c3306157074f189489aa023ecd3ee2/Untitled.png](SimpleMult%20Vitis%20Project%20and%20Run%2022c3306157074f189489aa023ecd3ee2/Untitled.png)

You have to edit helloworld.c source file.

- **helloworld.c** at [SimpleMult: Materials](SimpleMult%20Materials%201fe9835135b3400a9391427bc77eafb1.md)

![SimpleMult%20Vitis%20Project%20and%20Run%2022c3306157074f189489aa023ecd3ee2/Untitled%201.png](SimpleMult%20Vitis%20Project%20and%20Run%2022c3306157074f189489aa023ecd3ee2/Untitled%201.png)

Block this header and right-click.

Open Declaration.

![SimpleMult%20Vitis%20Project%20and%20Run%2022c3306157074f189489aa023ecd3ee2/Untitled%202.png](SimpleMult%20Vitis%20Project%20and%20Run%2022c3306157074f189489aa023ecd3ee2/Untitled%202.png)

Find your multiplier IP base address.

Its name will be similar to your multiplier IP name. That is, it depends on your past choice.

Copy this.

![SimpleMult%20Vitis%20Project%20and%20Run%2022c3306157074f189489aa023ecd3ee2/Untitled%203.png](SimpleMult%20Vitis%20Project%20and%20Run%2022c3306157074f189489aa023ecd3ee2/Untitled%203.png)

Come back to the helloworld.c.

Paste here.

All done. Build and then Run.

# Run and Result

![SimpleMult%20Vitis%20Project%20and%20Run%2022c3306157074f189489aa023ecd3ee2/Untitled%204.png](SimpleMult%20Vitis%20Project%20and%20Run%2022c3306157074f189489aa023ecd3ee2/Untitled%204.png)

![SimpleMult%20Vitis%20Project%20and%20Run%2022c3306157074f189489aa023ecd3ee2/Untitled%205.png](SimpleMult%20Vitis%20Project%20and%20Run%2022c3306157074f189489aa023ecd3ee2/Untitled%205.png)

![SimpleMult%20Vitis%20Project%20and%20Run%2022c3306157074f189489aa023ecd3ee2/Untitled%206.png](SimpleMult%20Vitis%20Project%20and%20Run%2022c3306157074f189489aa023ecd3ee2/Untitled%206.png)

It performs well.