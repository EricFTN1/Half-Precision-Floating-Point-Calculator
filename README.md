# FPGA Half-Precision Floating Point Calculator

An IEEE-754 half-precision floating-point calculator implemented in Verilog and developed using Intel Quartus Prime. This project demonstrates digital design principles, floating-point arithmetic, FPGA development, and hardware implementation of mathematical operations.

## Overview

The goal of this project was to design and implement a half-precision floating-point calculator capable of performing arithmetic operations using custom digital logic on FPGA hardware.

Unlike traditional calculators that display values in decimal form, this calculator displays values directly in their binary representation. For example:

```
421 → 0100 0010 0001
```

This approach allows users to directly observe how data is represented at the hardware level and better understand binary arithmetic and digital system design.

## Features

- FPGA implementation using Verilog
- IEEE-754 half-precision floating-point arithmetic
- Binary input and output display
- Hardware-based computation
- Quartus Prime synthesis and development
- Demonstration of digital logic design concepts

## Technologies Used

- Verilog HDL
- Intel Quartus Prime
- FPGA Development Board
- Digital Logic Design
- IEEE-754 Floating Point Representation

## Design Objectives

The project was designed to:

- Implement floating-point arithmetic using hardware logic
- Explore FPGA design and synthesis workflows
- Understand IEEE-754 number representation
- Develop experience with Verilog hardware description language
- Demonstrate the differences between decimal and binary representations

## Example Representation

Rather than displaying values in decimal format, numbers are represented directly as binary values.

| Decimal Value | Binary Representation |
|--------------|----------------------|
| 421 | 0100 0010 0001 |
| 15 | 0000 1111 |
| 255 | 1111 1111 |

This allows users to view the underlying binary data being processed by the FPGA.

## Project Structure

- Verilog source files
- Arithmetic logic modules
- Floating-point processing components
- Quartus Prime project files
- Test and verification files

## What I Learned

Through this project I gained experience with:

- Verilog hardware design
- FPGA development workflows
- Quartus Prime toolchain
- IEEE-754 floating-point representation
- Digital arithmetic implementation
- Hardware debugging and verification
- Binary number systems and data representation

## Future Improvements

Potential enhancements include:

- Seven-segment decimal output display
- Support for additional arithmetic operations
- Improved user interface
- Expanded floating-point precision options
- Performance and resource utilization optimizations

## Academic Project

This project was completed as part of a Computer Engineering FPGA and digital design curriculum and demonstrates practical implementation of floating-point arithmetic using FPGA hardware.
