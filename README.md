# UART   

UART represents Universal Asynchronous Receiver Transmitter. It is dedicated to hardware related to serial communication. UART is one of the most generally used serial communication techniques. UART is being used in several applications like GPS Receivers, Bluetooth Modules, GSM and GPRS Modems, Wireless Communication Systems, RFID-based applications etc.    


## FUNCTIONS OF UART   

There are various functions of UART which are as follows −

* It can change parallel data into serial data for outbound communications

* It can change serial data into parallel data for inbound communications

* It can add a parity checking bit on outbound transmissions and tests the parity bit for inbound transmissions

* It can handle interrupt requests and device administration, which can need the computer and the device to organize the speed of operation.      


## UART COMMUNICATION     

In this communication, there are two types of UARTs such as transmitting UART and receiving UART, and the communication between these two can be done explicitly by each other. The data transmission of a UART can be completed by using a data bus in the form of parallel by other devices such as a microcontroller, memory, CPU, etc. After receiving the parallel data from the bus, it forms a data packet by inserting three bits like start, stops, and parity. It reads the data packet bit by bit and converts the received data into the parallel form to remove the three bits of the data packet.

## START BIT     

Start-bit is also referred to as a synchronization bit that is located before the actual data. Usually, an inactive data transmission line is reserved at a high-voltage level. To start the data transmission, the UART transmission burden the data line from a high voltage level (1) to a low voltage level (0).
## STOP BIT     

The Stop Bit is located at the ending of the data packet. Generally, this bit is 2-bits lengthy but commonly on bit only used. It can stop the broadcast, the UART maintains the data-line on high voltage.     


## PARITY BIT     

Parity bit allows the receiver to provide whether the collected record is right or not. It is a low-level fault checking system & parity bit is accessible in two ranges including Even Parity and Odd Parity.    


## Data Bits & Data Frame     

The data bits involve the real data being a transfer from the sender to the receiver. The data frame length can be between 5 & 8. If the parity bit is not used when the data frame length could be 9-bit long. Usually, the LSB of the data to be sent first then it is very beneficial for transmitting.


## DESIGN FLOW of UART PROTOCAL     

1.Baud Clock Generation    
2.Transmitter    
3.Receiver   
4.UART protocal(top module)   
5.Testbench of UART protocal     
