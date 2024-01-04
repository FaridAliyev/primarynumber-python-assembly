# PrimeNumbers Python & Assembly

## PrimeNumbers.py

### Project Creators
- Huru Algayeva
- Farid Aliyev

### Description
This Python script generates prime numbers within a specified range using the Sieve of Eratosthenes algorithm.

### Usage
1. Make sure you have Python installed on your system.
2. Open a terminal or command prompt.
3. Navigate to the directory containing PrimeNumbers.py.
4. Run the script by executing the following command:
   bash
   python PrimeNumbers.py
   
5. Follow the on-screen instructions to input the range for prime number generation.

### Example
bash
python PrimeNumbers.py


## PrimeNumbers.asm

### Description
This assembly program finds prime numbers using a simple algorithm.

### Prerequisites
1. NASM assembler: Make sure NASM is installed on your system. You can download it [here](https://www.nasm.us/).

2. GoLink linker: Download GoLink from [here](https://www.godevtool.com/). Ensure it's available in your system's PATH.

### Assembling and Linking
To assemble and link the assembly code on a Windows system, follow these steps:

1. Open a command prompt.
2. Navigate to the directory containing PrimeNumbers.asm.
3. Run the following commands:
   ```bash
   nasm -f win32 PrimeNumbers.asm -o PrimeNumbers.obj
   golink /entry:start PrimeNumbers.obj user32.dll kernel32.dll
   

### Example
bash
nasm -f win32 PrimeNumbers.asm -o PrimeNumbers.obj
golink /entry:start PrimeNumbers.obj user32.dll kernel32.dll


### Running the Executable
After successful assembling and linking, run the generated executable:
bash
PrimeNumbers.exe

### Note
Ensure the correct paths are set for NASM and GoLink in your system's PATH variable.

Feel free to reach out if you encounter any issues or have questions!
