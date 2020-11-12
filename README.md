# ft_printf_42

__*This a project from 42 school. The aim of this project is to code our own implementation of the libc function printf.*__

## Usage

This function is included in library called libft_printf. You will first need to create this library using the following command:\
`make`

You will then need to create a .c file (eg. main.c), which uses the function ft_printf. Then run the following commands:
```
gcc -I/path/to/this/folder/inc -I/path/to/this/folder/libft/inc -c main.c
gcc -L/path/to/folder -lftprintf main.o -o a.out
./a.out
```

## Instructions

The only functions allowed are:
* write
* malloc
* free
* exit

## Features from the original printf included

* Displaying signed numbers (%d %i)
* Displaying unsigned numbers (%u)
* Displaying unsigned numbers in octal format (%o) or hexadecimal format (%x %X)
* Displaying pointers addresses (%p)
* Displaying chars and strings (%c %s)
* Complete support of floats and long floats, included DBL_MIN/MAX, LDBL_MIN/MAX, NaN and inf (%f with flags l and L)
* Management of %%
* Management of minimum field-width
* Management of the precision
* Management of the following flags: #0-+* and space
* Support of the following length flags: hh, h, l and ll

## Implementation

In order to make the function as fast as the original, a buffer is used to store the characters to print.
This allows to limit the number of calls to the syscall write and to avoid having to allocate memory with malloc.

## Extra options added

* Management of color\
Example: the instruction `ft_printf("{yellow}Hello!\n{eoc}")` will output\
![img](https://user-images.githubusercontent.com/67087093/98958194-54ee5580-2502-11eb-8e8f-28881afb1b07.png)


* Displaying unsigned numbers in binary format (%b). You can modulate the output like so:
    * Use the flag " " in order to print the number in groups of bytes separated by a space
    * Use the flag 0 in order to add extra zeros to have a number of printed bits which is a multiple of 8
```
ft_printf("%b", 1234567)    >   "100101101011010000111"
ft_printf("%0b", 1234567)   >   "000100101101011010000111"
ft_printf("% b", 1234567)   >   "10010 11010110 10000111"
ft_printf("% 0b", 1234567)  >   "00010010 11010110 10000111"
```
