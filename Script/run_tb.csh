
#Author: HoangLM43, PhuocHVD

#!/bin/csh 
echo "test:"
set test1 =(  'test_baud_rate_no_interrupt.sv' 'test_trans.sv' 'test_trans_msb_lsb_no_interrupt.sv'  )
set cr_test = $<
# Path to the custom directory you want to navigate to
set custom_dir = "/home/DN01/Hoang/SPI/runDir"

# Path to the file to simulate
set file_path = "/home/DN01/Hoang/SPI/sim/src_cp/tb_spi.sv"  # Or your RTL or testbench file name

# Check if the directory exists
if (-d $custom_dir) then
    # Navigate to the custom directory
    cd $custom_dir
    echo "Changed to directory: $custom_dir"

    # Check if the file exists in the specified path 
    if (-e $file_path) then
        echo "Running the file with xrun..."
	sed -i "s/test_.*.sv/$test1[$cr_test]/" $file_path
        # Use xrun to simulate the file
        xrun -access rwc -linedebug -compile +incdir+../sv $file_path
        xrun -access +rwc -sv  $file_path -input run_wave.tcl
    else
        echo "File not found in $custom_dir: $file_path"
    endif
else
    echo "Directory not found: $custom_dir"
endif

