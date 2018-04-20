------------------------------------------------------------------------------
HSP : Hot Soup Processor  
copyright 1997-2018 (c) onion software/onitama  
------------------------------------------------------------------------------

Original is here.

	http://github.com/onitama/OpenHSP


# Introduction

This folder contains files for OpenHSP / Hot Soup Processor build.
It is possible to verify HSP3 function and SDK.


# Operating environment

It works with Linux GUI environment (X Window System).
Some functions will work using the OpenGL and SDL libraries.


# Installation

Please obtain the latest repository from github and use it.

	git clone http://github.com/onitama/OpenHSP

It is also possible to expand the downloaded archive from the [Clone or download] button.

Compile the source of the acquired repository.
For compiling, you need an environment that can run gcc and make.
When compiling, you need the following libraries, please check in advance.

	OpenGLES 2.0 or later / EGL
	SDL1.2
	gtk+-2

Command Example

	sudo apt-get install libgtk2.0-dev
	sudo apt-get install libgles2-mesa-dev
	sudo apt-get install libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev

Since the archive contains only the source, you need to compile with make.
(If it does not compile properly depending on Linux version or distribution, you will need to modify it.
 It seems that it is confirmed that it can be compiled with Lubuntu 16.04 at present.)

	sudo make

Execute the make command in the directory where the contents of the archive was expanded.
The required tools are compiled and the HSP3 is ready for use.

When a mystery error appears, Let's try it once "make clean".


# Raspberry Pi installation

It works on Raspbian on Raspberry Pi. (The recommended version is September 2017 Kernel version 4.9)
hsp3dish and hsed (script editor) only work in the GUI environment.
(The drawing related functions are running using the OpenGL and SDL libraries.)
Extract the contents of the archive to an arbitrary directory and compile the source.
For compiling, you need an environment that can run gcc and make.
Additional libraries are required for compilation.
You can acquire it by executing the following command while it is connected to the network.

	sudo apt-get install libgtk2.0-dev
	sudo apt-get install libglew-dev
	sudo apt-get install libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev

Please obtain the latest repository from github and use it.

	git clone http://github.com/onitama/OpenHSP

It is also possible to expand the downloaded archive from the [Clone or download] button.

Since the hsplinux archive contains only the source, you need to compile with make.

	sudo make -f makefile.raspbian
		
Execute the make command in the directory where the contents of the archive was expanded.
The required tools are compiled and the HSP3 is ready for use.

	./hsed

By activating the above program, the script editor (simplified version) operates in the GUI.
It is a simple editor that can write and execute HSP3 script.


In Raspberry Pi version, it runs in full screen.
To interrupt the execution, press the [ctrl] + [C] or [esc] key.
Please note that interruption may not be possible, such as when it is not properly recognized as a keyboard.
In addition to the GUI editor, you can also execute from the command line in the form "./hsp3dish ****.ax".


# how to use

HSP3 is based on OpenHSP technology which is open source,
It is structured to be able to enjoy programming easily on Linux.
After installation, the following command is generated.

	hsed		Script editor (simplified version)
	hspcmp		HSP3 code compiler
	hsp3cl		HSP3 command line runtime
	hsp3dish	HSP3Dish runtime
	hsp3gp		HGIMG4 runtime

The Script Editor (Simplified Version) is a GUI application that allows you to write scripts of HSP 3 and execute them.
It has basic script editing and load / save function.
You can execute the script you are editing by selecting [F5] key or [Run] from [HSP] menu.
In the current version, hsp3dish is used as the standard runtime.
Sample code corresponding to HSP 3 Dish is included in the sample folder, please try.
The character code of the script is treated as UTF-8.
Please note that it is different from the character code (SJIS) used by Windows.

When executing a script from the command line,
it is necessary to create an HSP object file with hspcmp.

	./hspcmp -d -i -u test.hsp

In the example above, we generate the object file "test.ax" from the "test.hsp" file.
It passes the generated object file to the runtime and executes it.

	./hsp3cl test.ax

In the above example, "test.ax" is executed in HSP3 command line runtime.
Likewise, you can run scripts that match the runtime, such as "hsp3dish" "hsp3gp".
(Execution of "hsp3dish" "hsp3gp" requires GUI environment.)


# About exec and devprm instructions

Both Linux version and Raspberry Pi version can invoke shell commands by exec command.
Also, it is possible to output a character string to the device on the file system with the devprm instruction.

	devprm "/sys/class/gpio/export", "2"

In the above case, "2" is output to "/sys/class/gpio/export".
It is the same operation as executing "echo 2 > /sys/class/gpio/export" from the shell.


# Raspberry Pi's GPIO I/O

Besides the devprm instruction, the Raspberry Pi version is extended with GPIO I/O by devcontrol instruction.
When controlling GPIO output, write as follows.

	devcontrol "gpio", port number, output value

For port number, specify the GPIO port as a numerical value.
The output value is controlled by specifying 1 (ON) or 0 (OFF) as a numerical value.
When inputting, write as follows.

	devcontrol "gpioin", port number

0 or 1 is assigned to the system variable stat after execution of the instruction.
(If an error occurs, a negative value is assigned)
GPIO I/O can be used not only from hsp3dish but also from hsp3cl.


# Online manual

Information on HSP 3.5 can be viewed online manual.
http://www.onionsoft.net/hsp/v35/

The latest information and communities about HSP are provided on the HSPTV! Site.
http://hsp.tv/


# License

HSP3 Linux handles it as a derivative of OpenHSP,
and the license becomes a modified BSD license conforming to OpenHSP/HSP3.

-------------------------------------------------------------------------------
Hot Soup Processor (HSP) / OpenHSP
Copyright (c) 1997-2018, onion software/onitama
in collaboration with Sencha, Yume-Yume Yuuka, Y-JINN, chobin,
Usuaji, Kenji Yuukoku, puma, tom, sakura, fujidig, zakki, naznyark,
Lonely Wolf, Shark++, HyperPageProject, Chokuto, S.Programs, 
Yuki, K-K, USK, NGND001, yoshis, naka, JET, eller, arue, mjhd_otsuka, tds12
All rights reserved.

These softwares are provided by the copyright holders and contributors "as is" and
any express or implied warranties, including, but not limited to, the implied
warranties of merchantability and fitness for a particular purpose are disclaimed.
-------------------------------------------------------------------------------
                                                HSP users manual / end of file 
-------------------------------------------------------------------------------
