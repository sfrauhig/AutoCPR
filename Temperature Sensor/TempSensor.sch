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
L Device:R_US R1
U 1 1 61872B23
P 6850 3600
F 0 "R1" H 6782 3554 50  0000 R CNN
F 1 "2k" H 6782 3645 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6890 3590 50  0001 C CNN
F 3 "~" H 6850 3600 50  0001 C CNN
	1    6850 3600
	-1   0    0    1   
$EndComp
Wire Wire Line
	6450 3750 6850 3750
Wire Wire Line
	6450 4150 6850 4150
Wire Wire Line
	6850 4150 6850 4200
$Comp
L power:GND #PWR0101
U 1 1 61872B2C
P 6850 4200
F 0 "#PWR0101" H 6850 3950 50  0001 C CNN
F 1 "GND" H 6855 4027 50  0000 C CNN
F 2 "" H 6850 4200 50  0001 C CNN
F 3 "" H 6850 4200 50  0001 C CNN
	1    6850 4200
	1    0    0    -1  
$EndComp
$Comp
L eec:LM335Z U1
U 1 1 61872F45
P 5250 3950
F 0 "U1" H 5900 4415 50  0000 C CNN
F 1 "LM335Z" H 5900 4324 50  0000 C CNN
F 2 "eec:STMicroelectronics-LM335Z-0" H 5250 4550 50  0001 L CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/04/fa/9d/16/39/87/44/8d/CD00000459.pdf/files/CD00000459.pdf/jcr:content/translations/en.CD00000459.pdf" H 5250 4650 50  0001 L CNN
F 4 "IC" H 5250 4750 50  0001 L CNN "category"
F 5 "SENSOR TEMP ANLG VOLT TO-92-3" H 5250 4850 50  0001 L CNN "digikey description"
F 6 "497-1584-ND" H 5250 4950 50  0001 L CNN "digikey part number"
F 7 "TO-92" H 5250 5050 50  0001 L CNN "ipc land pattern name"
F 8 "yes" H 5250 5150 50  0001 L CNN "lead free"
F 9 "a581065476713e77" H 5250 5250 50  0001 L CNN "library id"
F 10 "STMicroelectronics" H 5250 5350 50  0001 L CNN "manufacturer"
F 11 "511-LM335Z" H 5250 5450 50  0001 L CNN "mouser part number"
F 12 "TO-92-3" H 5250 5550 50  0001 L CNN "package"
F 13 "yes" H 5250 5650 50  0001 L CNN "rohs"
F 14 "+100°C" H 5250 5750 50  0001 L CNN "temperature range high"
F 15 "-40°C" H 5250 5850 50  0001 L CNN "temperature range low"
	1    5250 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3000 5900 3000
Wire Wire Line
	5900 3000 5900 3150
$Comp
L power:GND #PWR0103
U 1 1 6187A885
P 5900 3150
F 0 "#PWR0103" H 5900 2900 50  0001 C CNN
F 1 "GND" H 5905 2977 50  0000 C CNN
F 2 "" H 5900 3150 50  0001 C CNN
F 3 "" H 5900 3150 50  0001 C CNN
	1    5900 3150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 6187CDEE
P 5600 2900
F 0 "J1" H 5518 3217 50  0000 C CNN
F 1 "Conn_01x03" H 5518 3126 50  0000 C CNN
F 2 "Connector_JST:JST_PH_B3B-PH-K_1x03_P2.00mm_Vertical" H 5600 2900 50  0001 C CNN
F 3 "~" H 5600 2900 50  0001 C CNN
F 4 "A15" H 5650 2900 50  0000 L CNN "Field4"
F 5 "5V" H 5700 3000 50  0000 L CNN "Field5"
F 6 "GND" H 5650 2800 50  0000 L CNN "Field6"
	1    5600 2900
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 61877613
P 6050 2800
F 0 "#PWR0102" H 6050 2650 50  0001 C CNN
F 1 "+5V" H 6065 2973 50  0000 C CNN
F 2 "" H 6050 2800 50  0001 C CNN
F 3 "" H 6050 2800 50  0001 C CNN
	1    6050 2800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 618B2FC0
P 6850 3450
F 0 "#PWR0104" H 6850 3300 50  0001 C CNN
F 1 "+5V" H 6865 3623 50  0000 C CNN
F 2 "" H 6850 3450 50  0001 C CNN
F 3 "" H 6850 3450 50  0001 C CNN
	1    6850 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 2900 6450 3750
Wire Wire Line
	5800 2900 6450 2900
Connection ~ 6450 3750
Wire Wire Line
	5800 2800 6050 2800
$EndSCHEMATC
