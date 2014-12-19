This is the github repository for the Latrine Logger.

This work has been done by James Fowkes, Nicola Greene and Matt Little from Renewable Energy Innovation.

Contact:
www.re-innovation.co.uk
matt@re-innovation.co.uk

Overview:

This is a prototype unit developed for Water For People to monitor the use of pit latrines in various locations in Uganda.
This is based upon the DataDuino datalogging platform, but with some changes.
A 555 timer based capacitance to frequency unit is used to detect a 'flush'
The duration of the flush is measured and written, along with a date and time-stamp, to an SD card.
This is all based upon an ATmega328 programmed with the Arduino bootloader.
Code has been written for the Arudino IDE.

see www.re-innovation.co.uk for more details

The Arduino files are include a library and a full sketch.
The files are:
libaries/LatrineSensor which needs to go in your Arduino libraries folder. This includes an example.
LatrineLogger is the full sketch for data logging. 

Previous commits in this repository include the Arduino code as a ZIP file.

Files in the repository:
	
	Readme
	PCB files for KiCAD
	Instructions
	Arduino code


Modified:



To Do:

Upload the PCB files