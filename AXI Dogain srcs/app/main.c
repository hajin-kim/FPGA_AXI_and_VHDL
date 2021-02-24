/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"

#include "xbasic_types.h"
#include "xparameters.h"

#include "xaxidma.h"
#include "dogain.h"

//Dogain doGain;
//Dogain_Config *doGain_cfg;
XAxiDma axiDMA;
XAxiDma_Config *axiDMA_cfg;

#define MEM_BASE_ADDR 0x01000000
#define TX_BUFFER_BASE (MEM_BASE_ADDR + 0x00100000)
#define RX_BUFFER_BASE (MEM_BASE_ADDR + 0x00300000)

#define SIZE_ARR 1000

#define BASEADDR_P XPAR_DOGAIN_0_S00_AXI_CTRL_BUS_BASEADDR

//Xuint16 *a_addr_p = (Xuint16 *)BASEADDR_P;
//Xuint16 *b_addr_p = (Xuint16 *)BASEADDR_P + 1;
Xuint32 *gainaddr_p = (Xuint32 *)BASEADDR_P;
Xuint32 *stataddr_p = (Xuint32 *)BASEADDR_P + 1;

int Dogain_IsDone(void)
{
	return *stataddr_p == 0x1;
}

int main()
{
	xil_printf("DoGain Test\r\n");

	// Pointers to DMA TX/RX addresses
	int *m_dma_buffer_TX = (int*) TX_BUFFER_BASE;
	int *m_dma_buffer_RX = (int*) RX_BUFFER_BASE;

	//	Initialize DMA
	printf("Initializing AxiDMA\r\n");
	axiDMA_cfg = XAxiDma_LookupConfig(XPAR_AXIDMA_0_DEVICE_ID);
	if (axiDMA_cfg)
	{
		int status = XAxiDma_CfgInitialize(&axiDMA, axiDMA_cfg);
		if (status != XST_SUCCESS)
		{
			printf("Error initializing AxiDMA core\r\n");
		}
	}

	// Disable interrupts
	XAxiDma_IntrDisable(&axiDMA, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&axiDMA, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

	// Do the stream calculation
	int idx;
	for (idx = 0; idx < SIZE_ARR; idx++)
	{
		m_dma_buffer_TX[idx] = idx;
	}

	init_platform();

	// Write gain to register 0
//	*gainaddr_p = 0x0001;
	*gainaddr_p = 0x03E8;	// 0d1000
	xil_printf("Wrote: 0d%08d\r\n", *gainaddr_p);


	// Flush the cache of the buffers
	Xil_DCacheFlushRange((u32)m_dma_buffer_TX, SIZE_ARR * sizeof(int));
	Xil_DCacheFlushRange((u32)m_dma_buffer_RX, SIZE_ARR*sizeof(int));

	printf("Sending data to IP core slave\r\n");
	XAxiDma_SimpleTransfer(&axiDMA, (u32)m_dma_buffer_TX, SIZE_ARR*sizeof(int), XAXIDMA_DMA_TO_DEVICE);

	printf("Get data\r\n");
	XAxiDma_SimpleTransfer(&axiDMA, (u32)m_dma_buffer_RX, SIZE_ARR*sizeof(int), XAXIDMA_DEVICE_TO_DMA);
	while(XAxiDma_Busy(&axiDMA, XAXIDMA_DEVICE_TO_DMA));

	// Invalidate the cache to avoid reading garbage
	Xil_DCacheInvalidateRange((u32)m_dma_buffer_RX, SIZE_ARR*sizeof(int));

	while (!Dogain_IsDone());
	printf("Calculation complete\r\n");

	// Display data
	for (idx = 0 ; idx < SIZE_ARR; ++idx)
	{
		printf("Recv[%d]=%d\t", idx, m_dma_buffer_RX[idx]); ++idx;
		printf("Recv[%d]=%d\n\r", idx, m_dma_buffer_RX[idx]);
	}


	xil_printf("End of test\r\n");

	return 0;
}
