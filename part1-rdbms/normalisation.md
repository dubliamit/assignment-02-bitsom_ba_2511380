## Anomaly Analysis

**An Insert anamoly** - Orders_flat.csv stores both orders and customer details together. A new customer cannot be added unless an order is created.
For e.g. - If I try to add new customer in row number 188 in Orders_flat.csv but if I dont have any orders against that customer then I can not keep the cells empty.

**An Update anamoly** - An update anamoly occurs when the same information appears in multiple rows and updating it requires changing many rows.
For e.g. - In Orders_flat.csv we have a customer "Neha Gupta", if she for some reason shifted from Delhi to Hyderabad then we have to update this information all the 22 times in the sheet which is managable for small data but if this continues to lakhs of data then this is not at all feasible.

**An delete anamoly** - A delete anamoly happens when deleting one record accidentally removes important information.
For e.g. - If I delete order number ORD1132 i.e. row no. 7 from Orders_flat.csv then it will also delete the customer name, city etc. 


## Normalization Justification

Keeping everything in a single table may seem simpler initially, but it introduces significant issues as the system grows.

In our dataset, customer, product, and sales representative details would be repeated across multiple rows. This leads to data redundancy, which increases storage and makes maintenance harder.

It also creates update anomalies — for example, if a customer’s city changes, we would need to update it in multiple rows, and any missed update would result in inconsistent data.

Similarly, delete anomalies can occur. Deleting an order could unintentionally remove important information about customers or products if everything is stored together.

Normalization addresses these problems by separating data into logical tables. This:
Ensures data integrity
Reduces redundancy
Makes updates more efficient and reliable
Improves scalability as data grows

So, for most of the datasets a denormalized structure can be the more practical approach.
