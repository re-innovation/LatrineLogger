EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:1wire
LIBS:arduino_shieldsNCL
LIBS:atmel-1
LIBS:atmel-2005
LIBS:philips
LIBS:nxp
LIBS:matts_components
LIBS:linear2
LIBS:LatrineLoggerPCB-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 6
Title ""
Date "25 dec 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	4450 4600 4450 4350
Wire Wire Line
	4950 3400 4050 3400
Wire Wire Line
	6550 2700 6550 2800
Wire Wire Line
	6550 3950 7400 3950
Wire Wire Line
	6250 3550 7400 3550
Connection ~ 6550 3400
Wire Wire Line
	6550 3400 6250 3400
Wire Wire Line
	3900 3150 4150 3150
Wire Wire Line
	3900 2700 3900 3150
Wire Wire Line
	4150 4000 4150 4150
Wire Wire Line
	4150 4150 3550 4150
Wire Wire Line
	3550 4150 3550 4100
Wire Wire Line
	4950 3900 4950 4150
Connection ~ 4800 3400
Wire Wire Line
	4800 3400 4800 3150
Wire Wire Line
	4800 3150 4550 3150
Wire Wire Line
	3650 3400 3550 3400
Wire Wire Line
	3550 3400 3550 3500
Wire Wire Line
	4150 3600 4150 3400
Connection ~ 4150 3400
Wire Wire Line
	3850 4250 3850 4150
Connection ~ 3850 4150
Wire Wire Line
	6250 3900 6300 3900
Wire Wire Line
	6300 3900 6300 4100
Wire Wire Line
	6250 3750 6350 3750
Wire Wire Line
	6350 3750 6350 3300
Wire Wire Line
	6250 3650 6750 3650
Wire Wire Line
	6750 3650 6750 3750
Wire Wire Line
	6750 3750 7400 3750
Wire Wire Line
	6350 2800 6350 2700
Wire Wire Line
	4950 4150 4750 4150
Wire Wire Line
	4450 3950 4450 3550
Wire Wire Line
	4450 3550 4950 3550
Connection ~ 4750 3550
$Comp
L CTRIM C7
U 1 1 54624F5D
P 4450 4150
F 0 "C7" H 4580 4070 50  0000 C CNN
F 1 "CTRIM" H 4600 3990 50  0000 C CNN
F 2 "" H 4450 4150 60  0001 C CNN
F 3 "" H 4450 4150 60  0001 C CNN
	1    4450 4150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR034
U 1 1 54624F66
P 6300 4100
F 0 "#PWR034" H 6300 4100 30  0001 C CNN
F 1 "GND" H 6300 4030 30  0001 C CNN
F 2 "" H 6300 4100 60  0001 C CNN
F 3 "" H 6300 4100 60  0001 C CNN
	1    6300 4100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR035
U 1 1 54624F78
P 3850 4250
F 0 "#PWR035" H 3850 4250 30  0001 C CNN
F 1 "GND" H 3850 4180 30  0001 C CNN
F 2 "" H 3850 4250 60  0001 C CNN
F 3 "" H 3850 4250 60  0001 C CNN
	1    3850 4250
	1    0    0    -1  
$EndComp
$Comp
L BATTERY BT1
U 1 1 54624F84
P 3550 3800
F 0 "BT1" H 3550 4000 50  0000 C CNN
F 1 "CR2032 3V BATT" H 3550 3610 50  0000 C CNN
F 2 "" H 3550 3800 60  0001 C CNN
F 3 "" H 3550 3800 60  0001 C CNN
	1    3550 3800
	0    1    1    0   
$EndComp
$Comp
L DIODE D5
U 1 1 54624F8A
P 4350 3150
F 0 "D5" H 4350 3250 40  0000 C CNN
F 1 "1N4148" H 4350 3050 40  0000 C CNN
F 2 "" H 4350 3150 60  0001 C CNN
F 3 "" H 4350 3150 60  0001 C CNN
	1    4350 3150
	1    0    0    -1  
$EndComp
$Comp
L DIODE D4
U 1 1 54624F90
P 3850 3400
F 0 "D4" H 3850 3500 40  0000 C CNN
F 1 "1N4148" H 3850 3300 40  0000 C CNN
F 2 "" H 3850 3400 60  0001 C CNN
F 3 "" H 3850 3400 60  0001 C CNN
	1    3850 3400
	1    0    0    -1  
$EndComp
$Comp
L CP1 C6
U 1 1 54624F96
P 4150 3800
F 0 "C6" H 4200 3900 50  0000 L CNN
F 1 "10uF" H 4200 3700 50  0000 L CNN
F 2 "" H 4150 3800 60  0001 C CNN
F 3 "" H 4150 3800 60  0001 C CNN
	1    4150 3800
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 54624F9C
P 6350 3050
F 0 "R9" V 6430 3050 50  0000 C CNN
F 1 "10k" V 6350 3050 50  0000 C CNN
F 2 "" H 6350 3050 60  0001 C CNN
F 3 "" H 6350 3050 60  0001 C CNN
	1    6350 3050
	1    0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 54624FA2
P 6550 3050
F 0 "R10" V 6630 3050 50  0000 C CNN
F 1 "10k" V 6550 3050 50  0000 C CNN
F 2 "" H 6550 3050 60  0001 C CNN
F 3 "" H 6550 3050 60  0001 C CNN
	1    6550 3050
	1    0    0    -1  
$EndComp
$Comp
L PCF8563 U2
U 1 1 54624FAE
P 5600 3650
F 0 "U2" H 5600 3251 60  0000 C CNN
F 1 "PCF8563" H 5600 4050 60  0000 C CNN
F 2 "" H 5600 3650 60  0001 C CNN
F 3 "" H 5600 3650 60  0001 C CNN
	1    5600 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3300 6550 3950
Text HLabel 7400 3550 2    60   Output ~ 0
A5/SCL
Text HLabel 7400 3750 2    60   Input ~ 0
A4/SDA
Text HLabel 7400 3950 2    60   Input ~ 0
D2/INT
Text HLabel 3700 2700 0    60   Input ~ 0
+
Text HLabel 4150 4750 0    60   Input ~ 0
GND
$Comp
L GND #PWR036
U 1 1 54624F57
P 4450 4600
F 0 "#PWR036" H 4450 4600 30  0001 C CNN
F 1 "GND" H 4450 4530 30  0001 C CNN
F 2 "" H 4450 4600 60  0001 C CNN
F 3 "" H 4450 4600 60  0001 C CNN
	1    4450 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 4750 4300 4750
Wire Wire Line
	4300 4750 4300 4500
Wire Wire Line
	4300 4500 4450 4500
Connection ~ 4450 4500
Wire Wire Line
	3700 2700 6550 2700
Connection ~ 6350 2700
Connection ~ 3900 2700
$Comp
L QUARTZCMS4_WATCHXTAL X2
U 1 1 5469C7AB
P 4750 3850
F 0 "X2" H 4750 4000 60  0000 C CNN
F 1 "32.768kHz" V 4350 3600 60  0000 C CNN
F 2 "" H 4750 3850 60  0000 C CNN
F 3 "" H 4750 3850 60  0000 C CNN
	1    4750 3850
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR037
U 1 1 5469C7D3
P 5000 3750
F 0 "#PWR037" H 5000 3750 30  0001 C CNN
F 1 "GND" H 5000 3680 30  0001 C CNN
F 2 "" H 5000 3750 60  0000 C CNN
F 3 "" H 5000 3750 60  0000 C CNN
	1    5000 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3850 4900 3850
Wire Wire Line
	4900 3850 4900 3700
Wire Wire Line
	4900 3700 5000 3700
Wire Wire Line
	5000 3700 5000 3750
$EndSCHEMATC
