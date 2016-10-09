#!/bin/bash
echo "compiling $1"
if [[ $1 == *.c ]]
then
    gcc -ggdb `pkg-config --cflags opencv` -o `basename $1 .c` $1 `pkg-config --libs opencv`;
elif [[ $1 == *.cpp ]]
then
    g++ -ggdb `pkg-config --cflags opencv` -o `basename $1 .cpp` $1 `pkg-config --libs opencv`;
else
    echo "Please compile only .c or .cpp files"
fi
echo "Output file => ${1%.*}"

#############################################
# Add an alias in .bashrc or .bash_aliases
# (https://help.ubuntu.com/community/OpenCV)
#############################################
#
# alias opencv="~/.compile_opencv.sh"
#
#############################################
# Note that the .bashrc is a hidden file in the $HOME directory 
# (cd ~ to access the home directory).
# The alias will work after you log out and back.
# You can type the alias opencv... command at the prompt to 
# set the alias for the current session.
