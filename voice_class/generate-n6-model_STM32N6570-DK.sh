#!/bin/bash

stedgeai generate --model yamnet_256_64x96_tl_int8.tflite --target stm32n6 --st-neural-art default@user_neuralart_STM32N6570-DK.json --input-data-type uint8 --output-data-type float32 --inputs-ch-position chlast --name yamnet
cp st_ai_output/yamnet.c STM32N6570-DK/
cp st_ai_output/yamnet_ecblobs.h STM32N6570-DK/
cp st_ai_output/yamnet_atonbuf.xSPI2.raw STM32N6570-DK/yamnet_data.xSPI2.bin
arm-none-eabi-objcopy -I binary STM32N6570-DK/yamnet_data.xSPI2.bin --change-addresses 0x70380000 -O ihex STM32N6570-DK/yamnet_data.hex
