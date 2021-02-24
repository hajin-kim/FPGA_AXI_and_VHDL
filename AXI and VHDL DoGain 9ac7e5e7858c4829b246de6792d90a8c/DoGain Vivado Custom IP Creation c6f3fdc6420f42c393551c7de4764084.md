# DoGain: Vivado Custom IP Creation

**Note**: recommended project name is ***axi_dogain*** for top level project, ***dogain*** (automatically becomes edit_dogain) for IP project. If you edit this, you should edit some names. For convenience, the below content may contain different names. I hope you to ignore those and use the recommended names.

# Top-Level Project Creation

![DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled.png](DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled.png)

Open Vivado and create a new project.
**Important**: uncheck "Do not specify sources at this time".

![DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%201.png](DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%201.png)

At the next page, change the target language to VHDL. Click Next several times and select the ZYNQ part.

# IP Customization

### Creating a Custom IP

![DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%202.png](DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%202.png)

![DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%203.png](DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%203.png)

### Dealing with Interfaces

Press the "+" button and add 2 more interfaces. We will use 3 interfaces.

![DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%204.png](DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%204.png)

![DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%205.png](DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%205.png)

- S00_AXI_CTRL_BUS
    - AXI Slave Lite
    - 4 registers. These are enough.

![DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%206.png](DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%206.png)

- InStream
    - AXI Slave Stream

![DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%207.png](DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%207.png)

- OutStream
    - AXI Master Stream

![DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%208.png](DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%208.png)

Check Edit IP. Click Finish. A new Vivado window will show up.

From now on, we will deal with the new window.

### Customizing and Composing the IP

![DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%209.png](DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%209.png)

Click "Add Sources" of the left Flow Navigator.

![DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%2010.png](DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%2010.png)

![DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%2011.png](DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%2011.png)

Create File. Indicate the file name and directory.

![DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%2012.png](DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%2012.png)

Entity name: following the file name is recommended.

![DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%2013.png](DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%2013.png)

Result.

**Copy all material codes.**

- [DoGain: Materials](DoGain%20Materials%207d2d79d0a72a463fb2a72dc1f6818a18.md)
    - Unzip it and open **ip_vhdl** folder.
    - Copy 5 files to your project sources.

Save.

![DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%2014.png](DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%2014.png)

Hierarchy is refreshed.

![DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%2015.png](DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%2015.png)

Open Edit Packaged IP

![DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%2016.png](DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%2016.png)

Enter the unchecked (having no green check sign) steps sequentially.

Click the merge wizard for each steps.

![DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%2017.png](DoGain%20Vivado%20Custom%20IP%20Creation%20c6f3fdc6420f42c393551c7de4764084/Untitled%2017.png)

Check if everything is clear. Enter Review and Package.

Click Re-Package IP.

Close the IP project.