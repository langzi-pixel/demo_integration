#!/bin/bash

stedgeai generate --model mobilenet_v2_0.35_128_fft_int8.tflite --target stm32n6 --st-neural-art default@user_neuralart_STM32N6570-DK.json --input-data-type uint8 --output-data-type float32 --inputs-ch-position chlast --name mobilenet_v2
cp st_ai_output/mobilenet_v2.c STM32N6570-DK/
cp st_ai_output/mobilenet_v2_ecblobs.h STM32N6570-DK/
cp st_ai_output/mobilenet_v2_atonbuf.xSPI2.raw STM32N6570-DK/mobilenet_v2_data.xSPI2.bin
arm-none-eabi-objcopy -I binary STM32N6570-DK/mobilenet_v2_data.xSPI2.bin --change-addresses 0x70380000 -O ihex STM32N6570-DK/mobilenet_v2_data.hex
