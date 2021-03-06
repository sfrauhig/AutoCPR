EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L UI-Schematic-rescue:R_US-Device-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue R1
U 1 1 61672815
P 5950 2500
F 0 "R1" H 5745 2500 50  0000 C CNN
F 1 "10K" V 5836 2500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5990 2490 50  0001 C CNN
F 3 "~" H 5950 2500 50  0001 C CNN
	1    5950 2500
	-1   0    0    1   
$EndComp
$Comp
L UI-Schematic-rescue:R_US-Device-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue R2
U 1 1 61673843
P 5150 3250
F 0 "R2" V 4945 3250 50  0000 C CNN
F 1 "220" V 5036 3250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5190 3240 50  0001 C CNN
F 3 "~" H 5150 3250 50  0001 C CNN
	1    5150 3250
	0    1    1    0   
$EndComp
$Comp
L UI-Schematic-rescue:R_US-Device-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue R3
U 1 1 61673EAC
P 5150 3600
F 0 "R3" V 4945 3600 50  0000 C CNN
F 1 "220" V 5036 3600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5190 3590 50  0001 C CNN
F 3 "~" H 5150 3600 50  0001 C CNN
	1    5150 3600
	0    1    1    0   
$EndComp
$Comp
L UI-Schematic-rescue:R_US-Device-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue R5
U 1 1 61674C9C
P 5900 4500
F 0 "R5" V 5695 4500 50  0000 C CNN
F 1 "10K" V 5786 4500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5940 4490 50  0001 C CNN
F 3 "~" H 5900 4500 50  0001 C CNN
	1    5900 4500
	1    0    0    -1  
$EndComp
$Comp
L UI-Schematic-rescue:SW_Push-Switch-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue SW1
U 1 1 61675372
P 6200 2900
F 0 "SW1" H 6200 3185 50  0000 C CNN
F 1 "SW_ON" H 6200 3094 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_1P1T_NO_CK_KSC6xxJ" H 6200 3100 50  0001 C CNN
F 3 "~" H 6200 3100 50  0001 C CNN
	1    6200 2900
	1    0    0    -1  
$EndComp
$Comp
L UI-Schematic-rescue:SW_Push-Switch-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue SW2
U 1 1 616757FA
P 6150 4350
F 0 "SW2" H 6150 4635 50  0000 C CNN
F 1 "SW_OFF" H 6150 4544 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_1P1T_NO_CK_KSC6xxJ" H 6150 4550 50  0001 C CNN
F 3 "~" H 6150 4550 50  0001 C CNN
	1    6150 4350
	1    0    0    -1  
$EndComp
$Comp
L UI-Schematic-rescue:LED_RAGB-Device-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue D1
U 1 1 61675A2D
P 6150 3600
F 0 "D1" H 6150 4097 50  0000 C CNN
F 1 "LED_RAGB" H 6150 4006 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm-4_RGB" H 6150 3550 50  0001 C CNN
F 3 "~" H 6150 3550 50  0001 C CNN
	1    6150 3600
	1    0    0    -1  
$EndComp
$Comp
L UI-Schematic-rescue:GND-power-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue #PWR0101
U 1 1 61677504
P 5900 4650
F 0 "#PWR0101" H 5900 4400 50  0001 C CNN
F 1 "GND" H 5905 4477 50  0000 C CNN
F 2 "" H 5900 4650 50  0001 C CNN
F 3 "" H 5900 4650 50  0001 C CNN
	1    5900 4650
	1    0    0    -1  
$EndComp
$Comp
L UI-Schematic-rescue:+5V-power-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue #PWR0104
U 1 1 61678223
P 6950 2900
F 0 "#PWR0104" H 6950 2750 50  0001 C CNN
F 1 "+5V" V 6965 3028 50  0000 L CNN
F 2 "" H 6950 2900 50  0001 C CNN
F 3 "" H 6950 2900 50  0001 C CNN
	1    6950 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 2900 6950 2900
Wire Wire Line
	5300 3600 5950 3600
Wire Wire Line
	5300 3250 5950 3250
Wire Wire Line
	5950 3250 5950 3400
Wire Wire Line
	5950 4000 5950 3800
Wire Wire Line
	5300 4000 5950 4000
$Comp
L UI-Schematic-rescue:R_US-Device-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue R4
U 1 1 6167461C
P 5150 4000
F 0 "R4" V 4945 4000 50  0000 C CNN
F 1 "220" V 5036 4000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5190 3990 50  0001 C CNN
F 3 "~" H 5150 4000 50  0001 C CNN
	1    5150 4000
	0    1    1    0   
$EndComp
Wire Wire Line
	6350 3600 6950 3600
Wire Wire Line
	6950 3600 6950 2900
Wire Wire Line
	6350 4350 6950 4350
Wire Wire Line
	6950 4350 6950 3600
Connection ~ 6950 3600
Wire Wire Line
	3950 3650 3350 3650
Wire Wire Line
	3950 3250 5000 3250
Wire Wire Line
	4050 3600 4050 3750
Wire Wire Line
	4050 3750 3350 3750
Wire Wire Line
	4050 3600 5000 3600
Wire Wire Line
	4050 4000 4050 3850
Wire Wire Line
	4050 3850 3350 3850
Wire Wire Line
	4050 4000 5000 4000
Wire Wire Line
	3950 4350 3950 3950
Wire Wire Line
	3950 3950 3350 3950
Wire Wire Line
	3850 2900 3850 3550
Wire Wire Line
	3850 3550 3350 3550
Wire Wire Line
	3950 3250 3950 3650
Wire Wire Line
	3350 3450 3750 3450
Wire Wire Line
	3750 3450 3750 2800
Wire Wire Line
	3350 3350 3650 3350
$Comp
L power:GND #PWR0106
U 1 1 6182526F
P 3750 2800
F 0 "#PWR0106" H 3750 2550 50  0001 C CNN
F 1 "GND" H 3755 2627 50  0000 C CNN
F 2 "" H 3750 2800 50  0001 C CNN
F 3 "" H 3750 2800 50  0001 C CNN
	1    3750 2800
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0107
U 1 1 6182A926
P 3650 2550
F 0 "#PWR0107" H 3650 2400 50  0001 C CNN
F 1 "+5V" H 3665 2723 50  0000 C CNN
F 2 "" H 3650 2550 50  0001 C CNN
F 3 "" H 3650 2550 50  0001 C CNN
	1    3650 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 2550 3650 3350
$Comp
L Connector:Conn_01x08_Female J1
U 1 1 6182EEF5
P 3150 3650
F 0 "J1" H 3042 4135 50  0000 C CNN
F 1 "Conn_01x08_Female" H 3042 4044 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 3150 3650 50  0001 C CNN
F 3 "~" H 3150 3650 50  0001 C CNN
F 4 "5V" H 3200 3950 50  0000 L CNN "Field4"
F 5 "GND" H 3250 3850 50  0000 C CNN "Field5"
F 6 "ARD23" H 3300 3750 50  0000 C CNN "Field6"
F 7 "ARD25" H 3300 3650 50  0000 C CNN "Field7"
F 8 "ARD27" H 3300 3550 50  0000 C CNN "Field8"
F 9 "ARD29" H 3300 3450 50  0000 C CNN "Field9"
F 10 "ARD52" H 3300 3350 50  0000 C CNN "Field10"
	1    3150 3650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5950 2050 5950 2350
$Comp
L UI-Schematic-rescue:GND-power-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue-UI-Schematic-rescue #PWR0102
U 1 1 6167760F
P 5950 2050
F 0 "#PWR0102" H 5950 1800 50  0001 C CNN
F 1 "GND" H 5955 1877 50  0000 C CNN
F 2 "" H 5950 2050 50  0001 C CNN
F 3 "" H 5950 2050 50  0001 C CNN
	1    5950 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	5950 2650 5950 2900
Connection ~ 5950 2900
Wire Wire Line
	5950 2900 6000 2900
Wire Wire Line
	3850 2900 5950 2900
Connection ~ 5900 4350
Wire Wire Line
	5900 4350 5950 4350
Wire Wire Line
	3950 4350 5900 4350
Connection ~ 6950 2900
$EndSCHEMATC
