# 2 Head Chefs, 4 Line Cooks, 2 Waiting Staff, 4 Sous Chef,2 Maitre D', 2 Dishwashers, 2 Managers
# (Employee Name,PhoneNumber,Address,ID Number, Job Description)
INSERT INTO Employee
VALUES	
('Corey Austin','202-555-0163','453 Old Piper St. Los Angeles, CA 90022','E01','Head Chef: Manages food preparation'),
('Elaine Matthews','202-555-0164','7729 S. Galvin Drive San Pedro, CA 90731','E02','Head Chef: Manages food preparation'),
('Terry Gill','202-555-0165','500 Annadale Drive Davis, CA 95616','E03','Line Cook: In charge of one or a few stations'),
('Eric Dixon','202-555-0166','43 Buttonwood Ave. San Jose, CA 95111','E04','Line Cook: In charge of one or a few stations'),
('Alexandra Mccoy','202-555-0167','284 Purple Finch Lane Baldwin Park, CA 91706','E05','Line Cook: In charge of one or a few stations'),
('Candice Frazier','202-555-0168','76 Fairground St. South Gate, CA 90280','E06','Line Cook: In charge of one or a few stations'),
('Cecil Cain','202-555-0169','893 Shirley Lane Van Nuys, CA 91405','E07','Wait Staff: Takes orders and brings food & drinks'),
('Lionel Becker','202-555-0170','619 Talbot St. San Francisco, CA 94109','E08','Wait Staff: Takes orders and brings food & drinks'),
('Kenny Franzeo','202-555-0171','392 Hilldale Street San Francisco, CA 94112','E09','Sous Chef: Expert in a set of menu items and in charge of mentoring other sous chefs'),
('Damion Gauger','202-555-0172','9723 3rd Road San Diego, CA 92126','E10','Sous Chef: Expert in a set of menu items and in charge of mentoring other sous chefs'),
('Mercedes Mason','202-555-0173','440 Windsor St. San Diego, CA 92126','E11','Sous Chef: Expert in a set of menu items and in charge of mentoring other sous chefs'),
('Stacy Luna','202-555-0174','3 Marconi Drive San Diego, CA 92154','E12','Sous Chef: Expert in a set of menu items and in charge of mentoring other sous chefs'),
('Drew Klein','202-555-0175','8040 Silver Spear Rd. Santa Ana, CA 92707','E13','Maitre D: Welcome guests and get them seated'),
('Clarence Aguilar','202-555-0176','921 Mayflower Dr. San Francisco, CA 94112','E14','Maitre D: Welcome guests and get them seated'),
('Anna Anita','202-555-0177','90 Howard Rd. El Cajon, CA 92021','E15','Dishwasher: Washes the dishes'),
('Felicia Willis','202-555-0178','9515 Marconi Ave. Tustin, CA 92780','E16','Dishwasher: Washes the dishes'),
('Bobby Steel','202-555-0179','62 Applegate Drive Colton, CA 92324','E17','Manager: Manages the restaurant (Staff Scheduling,Inventory)'),
('Kevin Tran','202-555-0180','130 Summerhouse Road Fontana, CA 92336','E18','Manager: Manages the restaurant (Staff Scheduling,Inventory');

# Dishwashers,Wait Staffs,Maitre D'
# (ID Number, Hours Worked, Hourly Rate)
INSERT INTO PartTimeEmployee
VALUES	
('E07',28,13.00),
('E08',28,13.00),
('E13',28,13.00),
('E14',28,13.00),
('E15',28,13.00),
('E16',28,13.00);

# Managers,Line Cooks, Sous Chefs, Head Chefs
# (ID Number, Weekly Rate, Salary)
INSERT INTO FullTimeEmployee
VALUES 
('E17',4500.00,234000.00),	#Manager
('E18',4500.00,234000.00),
('E01',3500.00,234000.00),	#Head Chef
('E02',3500.00,234000.00),
('E09',2500.00,130000.00),	#Sous Chef
('E10',2500.00,130000.00),
('E11',2500.00,130000.00),
('E12',2500.00,130000.00),
('E03',2000.00,104000.00),	#Line Cook
('E04',2000.00,104000.00),
('E05',2000.00,104000.00),
('E06',2000.00,104000.00);

# (ID Number)
INSERT INTO Manager
VALUES 
('E17'), 
('E18');

# (ID Number)
INSERT INTO Chef
VALUES
('E01'),
('E02'),
('E03'),
('E04'),
('E05'),
('E06'),
('E09'),
('E10'),
('E11'),
('E12');

# (ID Number)
INSERT INTO Dishwasher
VALUES
('E15'),
('E16');

# (ID Number)
INSERT INTO Maitre_d
VALUES
('E13'),
('E14');

# (ID Number)
INSERT INTO WaitStaff
VALUES
('E07'),
('E08');

# (ID Number)
INSERT INTO LineCook
VALUES
('E03'),
('E04'),
('E05'),
('E06');

# (ID Number)
INSERT INTO SousChef
VALUES
('E09'),
('E10'),
('E11'),
('E12');

# (ID Number)
INSERT INTO HeadChef
VALUES
('E01'),
('E02');

# (ID Number)
INSERT INTO Station
VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8);

# (Shift Type)
INSERT INTO ShiftType
VALUES
('Morning'),
('Evening');

# (Head Chef ID, Manager ID, Date (year-month-day),Shift Type
INSERT INTO Shift
VALUES 
('E01','E17','2018-06-07','S01','Morning'), 
('E02','E18','2018-06-07','S02','Evening'),
('E01','E17','2020-03-01','S03','Morning'),  
('E02','E18','2020-03-01','S04','Evening'),
('E01','E17','2020-05-01','S05','Morning'), 
('E02','E18','2020-05-01','S06','Evening');

#  (Shift ID, ID Number, Station Number)
INSERT INTO StationAssignment
VALUES
('S01','E03',1),	#Morning Shift
('S01','E03',2),
('S01','E03',3),
('S01','E03',4),
('S01','E04',5),
('S01','E04',6),
('S01','E04',7),
('S01','E04',8),
('S02','E05',1),	# Evening
('S02','E05',2),
('S02','E05',3),
('S02','E05',4),
('S02','E06',5),
('S02','E06',6),
('S02','E06',7),
('S02','E06',8),
('S03','E03',1),	#Morning Shift
('S03','E03',2),
('S03','E03',3),
('S03','E03',4),
('S03','E04',5),
('S03','E04',6),
('S03','E04',7),
('S03','E04',8),
('S04','E05',1),	# Evening
('S04','E05',2),
('S04','E05',3),
('S04','E05',4),
('S04','E06',5),
('S04','E06',6),
('S04','E06',7),
('S04','E06',8),
('S05','E03',1),	#Morning Shift
('S05','E03',2),
('S05','E03',3),
('S05','E03',4),
('S05','E04',5),
('S05','E04',6),
('S05','E04',7),
('S05','E04',8),
('S06','E05',1),	# Evening
('S06','E05',2),
('S06','E05',3),
('S06','E05',4),
('S06','E06',5),
('S06','E06',6),
('S06','E06',7),
('S06','E06',8);

# (ID Number, Shift ID)
INSERT INTO EmployeeFunction
VALUES
('E01','S01'),		#Head Chef
('E02','S02'),
('E03','S01'),		#Line Cook
('E04','S01'),
('E05','S02'),
('E06','S02'),
('E07','S01'),		#Wait Staff
('E08','S02'),
('E09','S01'),		#Sous Chef
('E10','S01'),
('E11','S02'),
('E12','S02'),	
('E13','S01'),	    #Maitre d'
('E14','S02'),	
('E15','S01'),		#Dishwasher
('E16','S02'),
('E17','S01'),	    #Manager
('E18','S02'),
('E01','S03'),		#Head Chef
('E02','S04'),
('E03','S03'),		#Line Cook
('E04','S03'),
('E05','S04'),
('E06','S04'),
('E07','S03'),		#Wait Staff
('E08','S04'),
('E09','S03'),		#Sous Chef
('E10','S03'),
('E11','S04'),
('E12','S04'),	
('E13','S03'),	    #Maitre d'
('E14','S04'),	
('E15','S03'),		#Dishwasher
('E16','S04'),
('E17','S03'),	    #Manager
('E18','S04'),	
('E01','S05'),		#Head Chef
('E02','S06'),
('E03','S05'),		#Line Cook
('E04','S05'),
('E05','S06'),
('E06','S06'),
('E07','S05'),		#Wait Staff
('E08','S06'),
('E09','S05'),		#Sous Chef
('E10','S05'),
('E11','S06'),
('E12','S06'),	
('E13','S05'),	    #Maitre d'
('E14','S06'),	
('E15','S05'),		#Dishwasher
('E16','S06'),
('E17','S05'),	    #Manager
('E18','S06');	

#  (Mentee ID, Mentor ID, Item Name, Start Date, End Date)
INSERT INTO Mentorship
VALUES
('E09','E10','Egg Foo Young','2020-04-01','2020-04-8'),
('E09','E10','Beef Stew','2020-04-01','2020-04-8'),
('E10','E09','Chow Mein','2020-04-09','2020-04-16'),
('E10','E09','Chef Special','2020-04-09','2020-04-16'),
('E11','E12','Chop Suey','2020-04-01','2020-04-8'),
('E11','E12','Szechwan Shrimp','2020-04-01','2020-04-8'),
('E12','E11','Orange Chicken','2020-04-09','2020-04-16'),
('E12','E11','Szechwan Shrimp','2020-04-09','2020-04-16');

# (ID Number, Item Name)
INSERT INTO Expertise
VALUES
('E09','Chow Mein'),			#Overlap
('E09','Chef Special'),
('E09','Orange Chicken'), 		
('E09','Chop Suey'),			# Overlap
('E09','Szechwan Shrimp'),		# Overlap
('E10','Egg Foo Young'),
('E10', 'Beef Stew'),
('E11','Orange Chicken'),		# Overlap
('E11','Chop Suey'),			# Overlap
('E11','Chow Mein'),			# Overlap
('E12', 'Crispy Sesame Chicken'),
('E12', 'Szechwan Shrimp'),
('E12', 'Beef Stew');

# (Recipe Name, ID Number) Head Chef
INSERT INTO Recipe
VALUES
('Chow Mein','E01'),
('Chef Special','E01'),
('Egg Foo Young','E01'),
('Beef Stew','E01'),
('Orange Chicken','E02'),
('Chop Suey','E02'),
('Crispy Sesame Chicken','E02'),
('Szechwan Shrimp','E02');

# (Table Number, Capacity)
INSERT INTO MimingTable
VALUES
(1,16);

# (ID Number, Shift ID, Table Number)
INSERT INTO WaiteredTable
VALUES
('E07','S01',1),
('E08','S02',1),
('E07','S03',1),
('E08','S04',1),
('E07','S05',1),
('E08','S06',1);

# (Table Number, Seat Number)
INSERT INTO Seat
VALUES
(1,1),(1,2),(1,3),(1,4),
(1,5),(1,6),(1,7),(1,8),
(1,9),(1,10),(1,11),(1,12),
(1,13),(1,14),(1,15),(1,16);

#  (Corporation, Organization, orderer name, corporate address, special, corporate email)
INSERT INTO Corporate
VALUES
('Dalton Corporation', 'Vacaville Engineering', 'Josh Dalton','850 Newcastle Lane Vacaville, CA 95687','714-420-0180','DaltonCorp@gmail.com'),
('Norman Coporation', 'Hayward Engineering', 'Alva Norman','94 San Carlos Road Hayward, CA 94541','714-420-0181','NormanCorp@gmail.com'),
('Schein Corporation', 'Salinas Engineering', 'Xela Schein','174 Pawnee Drive Salinas, CA 93905','714-420-0182','ScheinCorp@gmail.com' ),
('Berkman Corporation', 'Hesperia Engineering', 'Larry Berkman','76 3rd St. Hesperia, CA 92345','714-420-0183', 'BerkmanCorp@gmail.com'); 

# (Snail Mail, Customer Name, Customer Address, Customer Phone, Mimi Stored Money, Spicy Challenge, Email)
INSERT INTO Customer
VALUES
('8463 Gainsway Rd. Van Nuys, CA 91406','Josh Dalton','725 High Noon Dr. Bakersfield, CA 93307','714-420-0180',100,FALSE,'DaltonCorp@gmail.com'),
('7647 South Hill Lane San Diego, CA 92117','Alva Norman','705 Myers St. Los Angeles, CA 90019','714-420-0181',120,FALSE,'AlvaNorman@gmail.com'),
('65 South Parker St. Chino Hills, CA 91709','Xela Schein', '9151 Meadowbrook Street Folsom, CA 95630','714-420-0182',130,TRUE,'XelaSchein@gmail.com'),
('148 W. Brewery Street Hayward, CA 94544','Ron Sharp','590 SE. Piper Street San Marcos, CA 92069','714-123-0183',230,TRUE,'RonSharp@gmail.com'),
('7320 Main Drive South Gate, CA 90280','Allison Mosley','542 SW. Corona Road Garden Grove, CA 92840','714-123-0184',250,FALSE,'AllisonMosley@gmail.com'),
('50 Jockey Hollow Lane Alameda, CA 94501','Karter Wilks','7936 North Ryan Court Santa Ana, CA 92701','714-123-0185',230,TRUE,'KarterWilks@gmail.com'),
('579 Arcadia Dr. North Hollywood, CA 91605','Malia Simmons','63 Adams St.Long Beach, CA 90813','714-123-0186',250,FALSE,'MaliaSimmons@gmail.com'),
('7698 Newcastle Rd. Oxnard, CA 93030','Larry Berkman','8737 Vine Ave. Riverside, CA 92503','714-420-0183',10,TRUE,'LarryBerkman@gmail.com');

# (Payment Type)
INSERT INTO GeneralPaymentTypes
VALUES
('Cash'),
('Debit'),
('Credit');

# (ShiftID, Order ID, payment Type, payment amount, billTotal)
INSERT INTO Orders
VALUES
('S01','O0001','Cash',8,12),		#Anon
('S01','O0002','Cash',12,16),
('S01','O0003','Cash',24,28),
('S01','O0004','Credit',24,NULL),	#Anon
('S02','O0005','Credit',30,NULL),	#Anon
('S02','O0006','Credit',60,NULL),
('S02','O0007','Debit',40,NULL),		
('S02','O0008','Cash',64,72),		#Anon
('S03','O0009','Cash',24,28),	
('S03','O0010','Cash',30,34),	
('S04','O0011','Cash',24,28),	
('S04','O0012','Cash',30,35),	
('S05','O0013','Cash',24,28),	#Anon
('S05','O0014','Cash',30,35),	#Anon
('S06','O0015','Cash',24,32),	#Anon
('S06','O0016','Cash',30,35);	#Anon

# (Email, Order ID)
INSERT INTO KnownCustomer
VALUES
('DaltonCorp@gmail.com','O0002'),
('AlvaNorman@gmail.com','O0003'),
('XelaSchein@gmail.com','O0006'),
('RonSharp@gmail.com','O0007'),
('DaltonCorp@gmail.com','O0009'),
('AlvaNorman@gmail.com','O0010'),
('XelaSchein@gmail.com','O0011'),
('RonSharp@gmail.com','O0012');

# (orderID)
INSERT INTO AnonymousCustomer
VALUES
('O0001'),
('O0004'),
('O0005'),
('O0008'),
('O0013'),
('O0014'),
('O0015'),
('O0016');

#(Size,tableNumber,seatNumber,orderID)
INSERT INTO PartyOrder
VALUES
(1,1,1,'O0001'),
(1,1,2,'O0002'),
(1,1,3,'O0003'),
(1,1,4,'O0008'),
(4,1,5,'O0009'),	#morning
(6,1,10,'O0010'),
(4,1,3,'O0011'),	#evening
(1,1,9,'O0012'),
(1,1,1,'O0013'),	 #ANON 
(1,1,2,'O0014'),
(1,1,1,'O0015'),
(1,1,2,'O0016');

#(payment type)
INSERT INTO WebPaymentTypes
VALUES
('Debit'),
('Credit');

#(Order ID, ready By, pickup Time, payment Type)
INSERT INTO WebOrder
VALUES
('O0004','09:00:00','9:15:00', 'Credit'),
('O0005','13:15:00','13:30:00', 'Credit');

#(Order ID, Ready By, Pick Up Time)
INSERT INTO PhoneOrder
VALUES
('O0006','14:20:00','10:40:00'),
('O0007','15:50:00','15:05:00');

#(Spiciness,Menu Type)
INSERT INTO menuType
VALUES
('Tangy', 'Evening'),
('Oh My God', 'Lunch'),
('Hot', 'Sunday Brunch Buffet'),
('Mild','Childrens');

#(Item Name, Price, Portion,Category, Menu Type, Spiciness)
INSERT INTO MenuItem
VALUES
('Chow Mein',8,12,'Meat Entree','Lunch','Oh My God'),
('Chef Special',6,14,'Meat Entree','Lunch','Oh My God'),
('Egg Foo Young',8,16,'Meat Entree','Childrens','Mild'),
('Beef Stew',6,8,'Soup','Childrens','Mild'),
('Orange Chicken',8,7,'Appetizer','Childrens','Mild'),
('Chop Suey',12,11,'Meat Entree','Sunday Brunch Buffet','Hot'),
('Crispy Sesame Chicken',9,10,'Appetizer','Evening','Tangy'),
('Szechwan Shrimp',6,6,'Appetizer','Childrens','Mild');

# (Order ID, Item Name, Price, Quantity)
INSERT INTO OrderedItems
VALUES	
('O0001','Chow Mein',8,1),					
('O0002','Chef Special',6,2),				
('O0003','Egg Foo Young',8,3),				
('O0004','Beef Stew',6,4),					
('O0005','Orange Chicken',6,5),			     
('O0006', 'Chop Suey',10,6),				
('O0007', 'Crispy Sesame Chicken',10,4), 		
('O0008','Szechwan Shrimp',8,8), 			
('O0009','Chow Mein',8,2),					
('O0010','Chef Special',6,4),				
('O0011','Egg Foo Young',8,6),				
('O0012','Beef Stew',6,8),					
('O0013','Orange Chicken',6, 10),			
('O0014', 'Chop Suey',10,12),				
('O0015', 'Crispy Sesame Chicken',10,8), 	
('O0016','Szechwan Shrimp',8,16); 		

# (Portion Size, Category, ID Number, Recipe Name)
INSERT INTO FoodItem
VALUES
(12,'Meat Entree','E09','Chow Mein'),
(14,'Meat Entree','E09','Chef Special'),
(16,'Meat Entree','E10','Egg Foo Young'),
(8,'Soup','E10','Beef Stew'),
(7,'Appetizer','E11','Orange Chicken'),
(11,'Meat Entree','E11','Chop Suey'),
(10,'Appetizer','E12','Crispy Sesame Chicken'),
(6,'Appetizer','E12','Szechwan Shrimp');
                
# (Order ID, Table Number, Seat Number, Ordered Item, Quantity)
INSERT INTO ItemBySeat
VALUES
('O0001',1,1,'Fried Rice',1),
('O0002',1,2,'Honey Shrimp',2),
('O0003',1,3,'Orange Chicken',3),
('O0008',1,4,'Beef Stew',4),
('O0009',1,3,'Chow Mein',2),					
('O0010',1,10,'Chef Special',4),				
('O0011',1,3,'Egg Foo Young',6),				
('O0012',1,9,'Beef Stew',8),					
('O0013',1,1,'Orange Chicken',10),			
('O0014',1,2, 'Chop Suey',12),				
('O0015',1,1, 'Crispy Sesame Chicken',8), 	
('O0016',1,2,'Szechwan Shrimp',16); 			


 
 