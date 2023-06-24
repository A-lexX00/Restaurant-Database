/* 
	Employee table contains information about each individual employees working at Miming's.
	Each employee is uniquely identified by their idNum. 
*/
CREATE TABLE Employee 
(
	eName VARCHAR(255) NOT NULL,
	PhoneNo VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    idNum VARCHAR(255) NOT NULL,
    jobDescription VARCHAR(255) NOT NULL,
	CONSTRAINT Employee_PK PRIMARY KEY(idNum) 
);

/* 
	PartTimeEmployee table inherits from Employee. Each part-time employee
	is uniquely identified by their idNum. 
*/
CREATE TABLE PartTimeEmployee
(
	idNum VARCHAR(255) NOT NULL,
    hoursWorked INT(255) NOT NULL,
    hourlyRate decimal(10,2) NOT NULL,
    CONSTRAINT PartTimeEmployee_PK PRIMARY KEY(idNum),
    CONSTRAINT Employee_PartTimeEmployee_FK
	FOREIGN KEY(idNum) REFERENCES Employee(idNum)
);

/* 
	FullTimeEmployee table inherits from Employee. Each full-time employee
	is uniquely identified by their idNum. 
*/
CREATE TABLE FullTimeEmployee
(
	idNum VARCHAR(255) NOT NULL,
    weeklySetRate INT(255) NOT NULL,
    salary decimal(10,2) NOT NULL,
	CONSTRAINT FullTimeEmployee_PK PRIMARY KEY(idNum),
    CONSTRAINT Employee_FullTimeEmployee_FK FOREIGN KEY(idNum) REFERENCES Employee(idNum)
);

/*
	Manager table inherits from FullTimeEmployee. Each manager is a full-time employee that	
    is uniquely identified by their idNum.
*/
CREATE TABLE Manager
(
	idNum VARCHAR(255) NOT NULL,
    CONSTRAINT Manager_PK Primary Key(idNum),
    CONSTRAINT FullTimeEmployee_Manager_FK FOREIGN KEY(idNum) REFERENCES FullTimeEmployee(idNum)
);

/*
	Chef table inherits from FullTimeEmployee. Each chef is a full-time employee	
    is uniquely identified by their idNum.
*/
CREATE TABLE Chef
(
	idNum VARCHAR(255) NOT NULL,
    CONSTRAINT Chef_PK Primary Key(idNum),
    CONSTRAINT FullTimeEmployee_Chef_FK FOREIGN KEY(idNum) REFERENCES FullTimeEmployee(idNum)
);
	
/*
	Dishwasher table inherits from PartTimeEmployee. Each dishwasher is a part-time employee that
    is uniquely identified by their idNum.
*/
CREATE TABLE Dishwasher
(
	idNum VARCHAR(255) NOT NULL,
    CONSTRAINT Dishwasher_PK Primary Key(idNum),
    CONSTRAINT PartTimeEmployee_Dishwasher_FK FOREIGN KEY(idNum) REFERENCES PartTimeEmployee(idNum)
);

/*
	Maitre d' table inherits from PartTimeEmployee. Each maitre d' is a part-time employee that
    is uniquely identified by their idNum.
*/
CREATE TABLE Maitre_d
(
	idNum VARCHAR(255) NOT NULL,
    CONSTRAINT Maitre_d_PK Primary Key(idNum),
    CONSTRAINT PartTimeEmployee_Maitre_d_FK FOREIGN KEY(idNum) REFERENCES PartTimeEmployee(idNum)
);

/*
	WaitStaff table inherits from PartTimeEmployee. Each wait staff is a part-time employee that
    is uniquely identified by their idNum.
*/
CREATE TABLE WaitStaff
(
	idNum VARCHAR(255) NOT NULL,
    CONSTRAINT WaitStaff_PK Primary Key(idNum),
    CONSTRAINT PartTimeEmployee_WaitStaff_FK FOREIGN KEY(idNum) REFERENCES PartTimeEmployee(idNum)
);

/*
	LineCook table inherits from Chef. A line cook is a chef that is uniquely identified by their idNum.
*/
CREATE TABLE LineCook
(
	idNum VARCHAR(255) NOT NULL,
    CONSTRAINT LineCook_PK Primary Key(idNum),
    CONSTRAINT Chef_LineCook_FK FOREIGN KEY(idNum) REFERENCES Chef(idNum)
);

/*
	Souschef table inherits from Chef. A sous chef is a chef that is uniquely identified by their idNum.
*/
CREATE TABLE SousChef
(
	idNum VARCHAR(255) NOT NULL,
    CONSTRAINT SousChef_PK Primary Key(idNum),
    CONSTRAINT Chef_SousChef_FK FOREIGN KEY(idNum) REFERENCES Chef(idNum) 
);

/*
	HeadChef table inherits from Chef. A head chef is a chef that is uniquely identified by their idNum.
*/
CREATE TABLE HeadChef
(
	idNum VARCHAR(255) NOT NULL,
    CONSTRAINT HeadChef_PK Primary Key(idNum),
    CONSTRAINT Chef_HeadChef_FK FOREIGN KEY(idNum) REFERENCES Chef(idNum)
);

/*
	Station table contains the station number which uniquely identifies each station
*/
CREATE TABLE Station
(
	stationNumber INT(255) NOT NULL,
    CONSTRAINT Station_PK PRIMARY KEY(stationNumber)
);
/*
	ShiftType table contains information about the type of shift. Uniquely identified by shiftType.
*/
CREATE TABLE ShiftType
(
	shiftType VARCHAR(255) NOT NULL,
    CONSTRAINT ShiftType_PK PRIMARY KEY(shiftType)
);

/*
	Shift table contains information about a shift such as the date,type, shift ID, and employee assigned.
    Each shift is uniquely identified by the shiftID.
*/
CREATE TABLE Shift
( 
	headChefID VARCHAR(255) NOT NULL,
    managerID VARCHAR(255) NOT NULL,
	shiftDate VARCHAR(255) NOT NULL,
    shiftID VARCHAR(255) NOT NULL,
    shiftType VARCHAR(255) NOT NULL,
    CONSTRAINT Shift_PK PRIMARY KEY(ShiftID),
    CONSTRAINT ShiftType_Shift_FK FOREIGN KEY(shiftType) REFERENCES ShiftType(shiftType),
    CONSTRAINT HeadChef_Shift_FK FOREIGN KEY(headChefID) REFERENCES HeadChef(idNum),
    CONSTRAINT Manager_Shift_FK FOREIGN KEY(managerID) REFERENCES Manager(idNum),
    CONSTRAINT EmployeeFunctionHeadChef_Shift_FK FOREIGN KEY(headChefID,shiftID) REFERENCES EmployeeFunction(idNum,shiftID),
    CONSTRAINT EmployeeFunctionManagedBy_Shift_FK FOREIGN KEY(managerID,shiftID) REFERENCES EmployeeFunction(idNum,shiftID)
);

/*
	StationAssignment is a junction table associating LineCook and Station. 
    StationAssignment is uniquely identified by idNum and stationNumber.
*/
CREATE TABLE StationAssignment
(
	shiftID VARCHAR(255) NOT NULL,
	idNum VARCHAR(255) NOT NULL,
    stationNumber INT(255) NOT NULL,
    CONSTRAINT StationAssignment_PK PRIMARY KEY(shiftID,stationNumber),
    CONSTRAINT LineCook_StationAssignment_FK FOREIGN KEY(idNum) REFERENCES LineCook(idNum),
    CONSTRAINT Station_StationAssignment_FK FOREIGN KEY(stationNumber) REFERENCES Station(stationNumber),
	CONSTRAINT Shift_StationAssignment_FK FOREIGN KEY(shiftID) REFERENCES Shift(shiftID)
);
    
/*
	EmployeeFunction is a junction table associating Employee and Shift. EmployeeFunction is
    uniquely identified by the shiftID and idNum.
*/
CREATE TABLE EmployeeFunction
(
	idNum VARCHAR(255) NOT NULL,
    shiftID VARCHAR(255) NOT NULL,
    CONSTRAINT EmployeeFunction_PK PRIMARY KEY(idNum,shiftID),
    CONSTRAINT Shift_EmployeeFunction_FK FOREIGN KEY(shiftID) REFERENCES Shift(shiftID),
    CONSTRAINT Employee_EmployeeFunction_FK FOREIGN KEY(idNum) REFERENCES Employee(idNum)
);
/*
	Mentorship table contains the mentee and the mentor and the item the mentor specializes in. Each
	mentorship has a start and end date and are uniquely identified by the mentee,mentor, and item of specialty.
*/
CREATE TABLE Mentorship
(
	idNumMentee VARCHAR(255) NOT NULL,
    idNumMentor VARCHAR(255) NOT NULL,
    itemName VARCHAR(255) NOT NULL,
    startDate VARCHAR(255) NOT NULL,
    endDate VARCHAR(255) NOT NULL,
    CONSTRAINT Mentorship_PK PRIMARY KEY(idNumMentee,idNumMentor,itemName),
    CONSTRAINT SousChef_Mentorship_FK FOREIGN KEY(idNumMentee) REFERENCES SousChef(idNum),
    CONSTRAINT Expertise_Mentorship_FK FOREIGN KEY(idNumMentor,itemName) REFERENCES Expertise(idNum,itemName)
);

/*
	Expertise table contains the idNum of the expert, their skill level, and the item they specialize in.
    Expertise is uniquely identified by the idNum and itemName.
*/
CREATE TABLE Expertise
(
	idNum VARCHAR(255) NOT NULL,
    itemName VARCHAR(255) NOT NULL,
    CONSTRAINT Expertise_PK PRIMARY KEY(idNum,itemName),
    CONSTRAINT SousChef_Expertise_FK FOREIGN KEY(idNum) REFERENCES SousChef(idNum),
    CONSTRAINT MenuItem_Expertise_FK FOREIGN KEY(itemName) REFERENCES MenuItem(itemName)
);

/* 
	Recipe table contains recipe name and the head chef who designed that recipe.
	Each recipe is uniquely identified by the recipeName.
*/
CREATE TABLE Recipe
(
	recipeName VARCHAR(255) NOT NULL,
    idNum VARCHAR(255) NOT NULL,
    CONSTRAINT Recipe_PK PRIMARY KEY(recipeName),
    CONSTRAINT HeadChef_Recipe_FK FOREIGN KEY(idNum) REFERENCES HeadChef(idNum)
);

/*
	Table MimingTable contains the table number and capacity. Each table is uniquely identified by its tableNumber.
*/
CREATE TABLE MimingTable
(
	tableNumber INT(255) NOT NULL,
    capacity INT(255) NOT NULL,
    CONSTRAINT MimingTable_PK Primary Key(tableNumber)
);

/*
	WaiteredTable table contains idNum of assigned wait staff, shiftID, and table number it's associated with.
    Each WaiteredTable is uniquely identified by the idNum, shiftID, and tableNumber.
*/
CREATE TABLE WaiteredTable
(
	idNum VARCHAR(255) NOT NULL,
    shiftID VARCHAR(255) NOT NULL,
    tableNumber INT(255) NOT NULL,
    CONSTRAINT Table_PK Primary Key(idNum,shiftID,tableNumber),
    CONSTRAINT WaitStaff_WaiteredTable_FK FOREIGN KEY(idNum) REFERENCES WaitStaff(idNum),
    CONSTRAINT MimingTable_WaiteredTable_FK FOREIGN KEY(tableNumber) REFERENCES MimingTable(tableNumber),
    CONSTRAINT EmployeeFunction_WaiteredTable_FK FOREIGN KEY(idNum,shiftID) REFERENCES EmployeeFunction(idNum,shiftID)
);

/*
	Seat table contains table number and seat number. Each seat is uniquely identified by the tableNumber 
    and seatNumber.
*/
CREATE TABLE Seat
(
	tableNumber INT(255) NOT NULL,
    seatNumber INT(255) NOT NULL,
    CONSTRAINT Seat_PK PRIMARY KEY(tableNumber,seatNumber),
    CONSTRAINT Table_Seat_FK FOREIGN KEY(tableNumber) REFERENCES MimingTable(tableNumber)
);

/*
	Corporate table contains information regarding a coporate such as corporation name, organization, orderer, address, and email
    and is uniquely identified by corpEmail.
*/
CREATE TABLE Corporate(
	corporation varchar(50) NOT NULL,
	organization varchar(50) NOT NULL,
	ordererName varchar (50) NOT NULL,
	corpAddress varchar(50) NOT NULL,
	special varchar(50) NOT NULL,
	corpEmail varchar(50) NOT NULL,
	CONSTRAINT corporate_pk PRIMARY KEY (corpEmail),
	CONSTRAINT corporate_fk FOREIGN KEY (corpEmail) REFERENCES Customer (email)

);

/*
	Customer table contains basic information about a customer at Mimings such as snail mail, name,address, phone,stored money, 
    spicy challenge, and email. Each customer is uniquely identified by their email.
*/
CREATE TABLE Customer(
	snailmail varchar(50) NOT NULL,
	cName varchar(50) NOT NULL,
	cAddress varchar (50) NOT NULL,
	cPhone varchar(50) NOT NULL,
	mimiStoredMoney int NOT NULL,
	spicyChallenge bool NOT NULL,
	email varchar(50) NOT NULL,
	CONSTRAINT customer_pk PRIMARY KEY (email)
);

/*
	KnownCustomer table contains information about customers that are public and not anonymous. Each known customer 
    is uniquely identified by their email and orderID.
*/
CREATE TABLE KnownCustomer(
	email varchar(255) NOT NULL,
	orderID VARCHAR(255) NOT NULL,
	CONSTRAINT known_customer_pk PRIMARY KEY (email, orderID),
	CONSTRAINT known_customer_fk1 FOREIGN KEY (email) REFERENCES Customer (email),
	CONSTRAINT known_customer_fk2 FOREIGN KEY (orderID) REFERENCES Orders (orderID)
);

/*
	AnonymousCustomer table contains customers that choose to not display their information. Each anonymous customer
    is uniquely identified by their orderID.
*/
CREATE TABLE AnonymousCustomer(
	orderID VARCHAR(255) NOT NULL,
	CONSTRAINT anon_customer_pk PRIMARY KEY (orderId),
	CONSTRAINT anon_customer_fk2 FOREIGN KEY (orderId) REFERENCES Orders (orderId)
);

/*
	Orders table contains information about an order such as the orderID, payment type and amount.
    Each order is uniquely identified by the orderID.
*/
CREATE TABLE Orders(
	shiftID VARCHAR(255) NOT NULL,
	orderID VARCHAR(255) NOT NULL,
	paymentType varchar(50) NOT NULL,
	paymentAmount int NOT NULL,
    billtotal int NOT NULL,
	CONSTRAINT orders_pk PRIMARY KEY (orderID),
	CONSTRAINT orders_fk1 FOREIGN KEY (shiftID) REFERENCES Shift (shiftID),
	CONSTRAINT orders_fk2 FOREIGN KEY (paymentType) REFERENCES GeneralPaymentTypes (paymentType)
);

/*
	PartyOrder table inherits from Orders and contains information about a partyOrder consisting of size, table information, seat information,
    and order ID. Each PartyOrder is uniquely identified by the orderID.
*/
CREATE TABLE PartyOrder
(
	size INT(255) NOT NULL,
    tableNumber INT(255) NOT NULL,
    seatNumber INT(255) NOT NULL,
    orderID VARCHAR(255) NOT NULL,
    CONSTRAINT PartyOrder_PK PRIMARY KEY(orderID),
    CONSTRAINT Seat_PartyOrder_FK FOREIGN KEY(tableNumber,seatNumber) REFERENCES Seat(tableNumber,seatNumber),
    CONSTRAINT Order_PartyOrder_FK FOREIGN KEY(orderID) REFERENCES Orders(orderID)
);

/*
	GeneralPaymentTypes table contains information about payment type and is uniquely identified by paymentType.
*/
CREATE TABLE GeneralPaymentTypes(
	paymentType varchar(50) NOT NULL,
	CONSTRAINT GPT_pk PRIMARY KEY (paymentType)
);

/*
	WebOrder table inherits from Orders and contains information about orders regarding the web such as orderID,
    readyBy,pickupTime, and paymentType and is uniquely identified by orderID.
*/
CREATE TABLE WebOrder(
	orderID VARCHAR(255) NOT NULL,
	readyBy VARCHAR(255),
	pickUpTime VARCHAR(255),
	paymentType VARCHAR(50) NOT NULL,
	CONSTRAINT weborder_pk PRIMARY KEY (orderID),
	CONSTRAINT weborder_fk1 FOREIGN KEY (paymentType) REFERENCES WebPaymentTypes (paymentType),
	CONSTRAINT weborder_fk2 FOREIGN KEY (orderID) REFERENCES Orders (orderID)

);

/*
	Enumeration table for web order.
*/
CREATE TABLE WebPaymentTypes(
	paymentType VARCHAR(50) NOT NULL,
	CONSTRAINT WPT_pk PRIMARY KEY (paymentType)
);

/*
	PhoneOrder inherits from Orders containing information about orders over the phone such as orderID, readyBy, and pickupTime.
    Each phone order is uniquely identified by orderID.
*/
CREATE TABLE PhoneOrder(
	orderID VARCHAR(255) NOT NULL,
	readyBy VARCHAR(255),
	pickUpTime VARCHAR(255),
	CONSTRAINT phoneorder_pk PRIMARY KEY (orderID),
	CONSTRAINT phoneorder_fk FOREIGN KEY (orderID) REFERENCES Orders (orderID)
);

/*
	OrderedItems is a junction table associating Orders and MenuItem.
    Uniquely identified by orderID,itemName,price.
*/
CREATE TABLE OrderedItems(
	orderID VARCHAR(255) NOT NULL,
	itemName VARCHAR (50) NOT NULL,
	price INT NOT NULL,
	quantity INT NOT NULL,
	CONSTRAINT ordereditems_pk PRIMARY KEY (orderID,itemName, price),
	CONSTRAINT ordereditems_fk1 FOREIGN KEY (orderID) REFERENCES Orders (orderID),
	CONSTRAINT ordereditems_fk2 FOREIGN KEY (itemName, price) REFERENCES MenuItem (itemName, price)
);

/*
	Menu type is an enumeration table containing spiciness and type of menu and is uniquely identified by spciness and menuType.
*/
CREATE TABLE MenuType
(	spiciness VARCHAR(50) NOT NULL,
	menuType VARCHAR(50) NOT NULL,
    CONSTRAINT MenuType_PK PRIMARY KEY(menuType,spiciness)
);
	
/*
	MenuItem table contains basic information regarding menu such as menu item, recipeBy, spiciness, etc..
    Each MenuItem is uniquely identified by itemName and price.
*/
CREATE TABLE MenuItem(
	itemName VARCHAR (50) NOT NULL,
	price INT  NOT NULL,
	portionSize INT(255) NOT NULL,
	category VARCHAR (50) NOT NULL,
	menuType VARCHAR (50) NOT NULL, 
	spiciness VARCHAR (50) NOT NULL,
	CONSTRAINT menuitem_pk PRIMARY KEY (itemName, price),
	CONSTRAINT menuitem_fk1 FOREIGN KEY (portionSize, category) REFERENCES FoodItem (portionSize, category),
	CONSTRAINT menuitem_fk2 FOREIGN KEY (menuType, spiciness) REFERENCES MenuType (menuType, spiciness)
);

/*
	FoodItem table contains info about a food such as its portion and category. 
    Each FoodItem is uniquely identified by its category and portionSize.
*/
CREATE TABLE FoodItem(
	portionSize INT(255) NOT NULL,
	category VARCHAR (50) NOT NULL,
	idNum VARCHAR(255) NOT NULL,
	recipeName VARCHAR(50) NOT NULL,
	CONSTRAINT fooditem_pk PRIMARY KEY (portionSize,category),
	CONSTRAINT fooditem_fk1 FOREIGN KEY (idNum) REFERENCES SousChef (idNum),
	CONSTRAINT fooditem_fk2 FOREIGN KEY (recipeName) REFERENCES Recipe (recipeName)
);

/*
	ItemBySeat table contains information about an order and seats associated with it.
    Each itemBySeat is uniquely identified by its orderID, tableNumber,seatNumber, and orderedItem.
*/
CREATE TABLE ItemBySeat
(
	orderID VARCHAR(255) NOT NULL,
    tableNumber INT(255) NOT NULL,
    seatNumber INT(255) NOT NULL,
    orderedItem VARCHAR(255) NOT NULL,
    quantity INT(255) NOT NULL,
    CONSTRAINT ItemBySeat_PK PRIMARY KEY(orderID,tableNumber,seatNumber,orderedItem),
    CONSTRAINT OrderedItems_ItemBySeat_FK FOREIGN KEY (orderID,orderedItem) REFERENCES OrderedItems(orderID,itemName)
);

