# Project Scenario 

Mint Classics Company, a retailer of classic model cars and other vehicles, is looking at closing one of their storage facilities. 

To support a data-based business decision, they are looking for suggestions and recommendations for reorganizing or reducing inventory, while still maintaining timely service to their customers. For example, they would like to be able to ship a product to a customer within 24 hours of the order being placed.

## Project Objectives

1. Explore products currently in inventory.

2. Determine important factors that may influence inventory reorganization/reduction.

3. Provide analytic insights and data-driven recommendations.

## Goal

The goal is find answers to the following question in order to address the needs for inventory reduction and closing up of warehouses

1) Where are items stored and if they were rearranged, could a warehouse be eliminated?

2) How are inventory numbers related to sales figures? Do the inventory counts seem appropriate for each item?

3) Are we storing items that are not moving? Are any items candidates for being dropped from the product line?

-------------------------------------------------------------

## The following data are produced using SQL queries:

Total quantity of items in each warehouse

|warehouseCode	|	totalQuantity |
| ------------- |:------------- :|
|a		|	131688 |
|b		|	219183 |
|c		|	124880 |
|d		|	79380  |

According to the table above, Warehouses A and C have similar quantity level of 131,688 and 124,880 respectively. 
While Warehouse B have the most quantity at 219,183, Warehouse D has the least quantity at 79,380.

**Solution for eliminating one warehouse** is to remove warehouse D and distribute its warehouse item across the other three warehouses

Total quantity sold and current quantity in stock for each product.

productCode	|	productName				                    |	quantityInStock	|	totalQuantOrder
| ------------- |:-------------:| -----:|
S10_1678    |	1969 Harley Davidson Ultimate Chopper	|	7933		|	1057
S10_1949	  |	1952 Alpine Renault 1300		          |	7305		|	961
S10_2016	  |	1996 Moto Guzzi 1100i			            |	6625		|	999
S10_4698	  |	2003 Harley-Davidson Eagle Drag Bike	|	5582		|	985
S10_4757	  |	1972 Alfa Romeo GTA			              |	3252		|	1030
S10_4962	  |	1962 LanciaA Delta 16V			          |	6791		|	932
S12_1099	  |	1968 Ford Mustang			                |	68		  |	933
S12_1108	  |	2001 Ferrari Enzo			                |	3619		|	1019
S12_1666	  |	1958 Setra Bus				                |	1579		|	972
S12_2823	  |	2002 Suzuki XREO			                |	9997		|	1028
S12_3148	  |	1969 Corvair Monza			              |	6906		|	963
S12_3380	  |	1968 Dodge Charger			              |	9123		|	925
S12_3891	  |	1969 Ford Falcon			                |	1049		|	965
S12_3990	  |	1970 Plymouth Hemi Cuda			          |	5663		|	900
S12_4473	  |	1957 Chevy Pickup			                |	6125		|	1056
S12_4675	  |	1969 Dodge Charger			              |	7323		|	992
..... 

