base -open waves -into waves.shm -default
probe -create -shm tb_spi.i_spi.SCK tb_spi.i_spi.SS tb_spi.i_spi.clk tb_spi.i_spi.data_config tb_spi.i_spi.i_data_p tb_spi.i_spi.interupt_request tb_spi.i_spi.io_miso_s tb_spi.i_spi.io_mosi_s tb_spi.i_spi.o_data_p tb_spi.i_spi.rst tb_spi.i_spi.trans_en
run
exit
