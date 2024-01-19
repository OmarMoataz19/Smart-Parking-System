# Smart Garage Project in VHDL

## Overview

This VHDL project implements a smart garage system where cars are detected using infrared (IR) sensors. The gate is controlled by a servo motor, and the system keeps track of the total number of cars inside the garage. The gate opens automatically when a car approaches, and it closes when the car enters the garage. The system ensures that the gate won't open if the maximum capacity is reached and will only open again when a car leaves.

## Features

- **Car Detection:** Infrared sensors are used to detect the presence of cars approaching the garage.

- **Gate Control:** The gate is operated by a servo motor, allowing for automatic opening and closing.

- **Capacity Management:** The system keeps track of the total number of cars inside the garage and prevents the gate from opening when the maximum capacity is reached.

## Implementation

The project is implemented in VHDL, a hardware description language. The code for this project is organized into the following components:

- **Car Detection Module:** Manages the infrared sensors to detect the presence of cars.

- **Gate Control Module:** Controls the servo motor to open and close the gate.

- **Capacity Management Module:** Keeps track of the total number of cars inside the garage and manages the gate opening based on capacity.

## Usage

1. **Simulation:** Simulate the VHDL code in a suitable simulation environment to verify its functionality.

2. **Hardware Implementation:** Deploy the code on a compatible FPGA or hardware platform for real-world testing.

## Dependencies

- VHDL compiler/simulator (e.g., ModelSim)
- FPGA board or hardware platform

