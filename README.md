# Vending Machine Controller
controls a simple vending machine by managing coin insertion, handle cancel requests and dispense items when sufficient coins have been inserted with Gray Encoding.

# Inputs:
|Signal|Width|Description|
| ------------- | ------------- | ------------- |
|clk| 1 bit| Clock signal (positive edge triggered)|
|rst |1 bit |Active-high reset signal|
|coin_in| 1 bit | High for one cycle when a coin is inserted|
|cancel| 1 bit |High to cancel the current transaction|
|dispense| 1 bit| High to request item dispensing|

# Output:
|Signal|Width|Description|
| ------------- | ------------- | ------------- |
|Item_out| 1 bit |Goes high for 1 cycle when an item is dispensed|

# States:
|State| Description|
| ------------- | ------------- |
IDLE |Ideal state & waiting for coins (coins <5)
READY |Enough coins received (After 5 coins), waiting for dispense signal
DISPENSE| Dispense item, then return to IDLE
