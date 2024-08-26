# Software environments
1. python 3.7.16
    + numpy 1.21.6
    + tqdm 4.66.2
    + csv 1.0
2. (Optional) Vivado 2023.1

# Hardware environments
1. (Optional) Nexys 4 DDR FPGA board (XC7A100T-1CSG324C)

# Experiment steps
1. (Optional) If you want to generate the bitstream by yourself, you can open the Vivado project by "fpga_based_attack.xpr". Then, you can synthesize, implment and write the bitstream file. 
Or you can use the generated bitstream ".\fpga_based_attack\fpga_based_attack.runs\impl_1\tdc.bit".

2. (Optional) To collect the traces from the FPGA, load the bitstream file to the Nexys 4 DDR board and open the ChipScope in the hardware manager. Run the TCL scripts in the "tcl" folder. First, run the gen_plaintext.tcl to generate plaintexts. Then, run the wr_command.tcl for preparation. Finally, run all the other scripts to collect traces for profiling and attacking. This step may take several hours to obtain all the traces.

Or you can use the provided traces in ".\data". You can download fpga_based_attack.zip from 
> https://drive.google.com/drive/folders/18efDK6ManaElS_Ahr0QNvv-5PAdb2wmJ?usp=drive_link

Unzip this file and put all the traces in to the "data" folder.

3. Run "python anaylze_trace.py" and "python analyze_trace_halfgate.py" in the python folder to analyze the collected traces.