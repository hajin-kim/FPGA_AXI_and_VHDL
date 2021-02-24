# DoGain Analysis

![DoGain%20Analysis%20f74a64428f724195afa8e4d36aa56138/Untitled.png](DoGain%20Analysis%20f74a64428f724195afa8e4d36aa56138/Untitled.png)

## InStream

AXI slave stream. This receives and stores single input data. The stored data will be propagated to DoGain Multiplier, and then InStream will receive new data if the propagation is enabled.

For each n-th clock,

1. Receives TVALID ON from ZYNQ DMA.
2. If InStream is ready and propagation is enabled:
    - responses to DMA by TREADY ON.

    Else:

    - keeps the current state. TREADY is OFF.
3. Stores data and control values in temporary registers. DoGain Multiplier will access the stored data directly. And REQUEST ON. This never gets OFF.
    - It ***may be a naive assumption that DMA sends all data properly without any lag.***
    - But if REQUEST can get OFF, it requires more pipeline II value.

## DoGain Multiplier

This receives single input data and control values, and multiply the data. These will be stored in temporary registers only if the propagation is enabled.

## OutStream

AXI master stream. This receives gained data and sends it to DMA. Also, this controls the propagation. Propagation is enabled if data wasn't received or data will be sent to DMA.

For each n-th clock,

1. Receives REQUEST ON from the previous component(DoGain Multiplier).
2. If OutStream is valid:
    - Sends TVALID ON to DMA.

    Else:

    - Keeps the current state until OutStream gets valid. TVALID is OFF.
3. Receives DMA TREADY.
If DMA is ready:
    - Write data. PROPAGATION ENABLE.

    Else:

    - Keeps the current state. PROPAGATION OFF.

## Control Bus

AXI slave lite. Provides registers to store gain and DoGain status.

- Gain is written by ZYNQ directly.
- Status is 0x1 if the TLAST of OutStream is ON. ZYNQ accesses this to identify whether DoGain is done or not.