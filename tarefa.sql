USE tarefa;
CREATE TABLE Order
(
	id_order int unsigned not null auto_increment,
    order_externalId int unsigned not null,
    orderDate date not null,
    createdDate date not null,
    modifiedDate date,
    created_user varchar(50) not null,
    modified_user varchar(50) not null,
    id_contact int unsigned not null,
    priority int unsigned not null,
    id_urgency int unsigned,
    id_orderKind int unsigned,
    id_orderStatus int unsigned,
    id_product int unsigned,
    id_company int unsigned,
    id_department int unsigned,
    id_project int unsigned,
    agreed_amount varchar(50),
    PRIMARY KEY (id_order)
);

INSERT INTO Orders (order_externalId, orderDate, createdDate, created_user, modified_user, id_contact, priority) VALUES (10,'2018-01-29','2018-01-29','fabio','fabio',98,'2');
INSERT INTO Orders (order_externalId, orderDate, createdDate, created_user, modified_user, id_contact, priority) VALUES (09,'2018-01-28','2018-01-28','paulo','paulo',90,'1');
INSERT INTO Orders (order_externalId, orderDate, createdDate, created_user, modified_user, id_contact, priority) VALUES (08,'2018-01-27','2018-01-27','rita','rita',8,'2');
INSERT INTO Orders (order_externalId, orderDate, createdDate, created_user, modified_user, id_contact, priority) VALUES (07,'2018-01-26','2018-01-26','caio','caio',9,'1');
INSERT INTO Orders (order_externalId, orderDate, createdDate, created_user, modified_user, id_contact, priority) VALUES (05,'2018-01-25','2018-01-25','ester','ester',18,'3');
INSERT INTO Orders (order_externalId, orderDate, createdDate, created_user, modified_user, id_contact, priority) VALUES (06,'2018-01-24','2018-01-24','marcos','marcos',10,'2');
INSERT INTO Orders (order_externalId, orderDate, createdDate, created_user, modified_user, id_contact, priority) VALUES (04,'2018-01-23','2018-01-23',,'livia','livia',6,'2');
INSERT INTO Orders (order_externalId, orderDate, createdDate, created_user, modified_user, id_contact, priority) VALUES (03,'2018-01-22','2018-01-22','gabriel','gabriel',5,'3');
INSERT INTO Orders (order_externalId, orderDate, createdDate, created_user, modified_user, id_contact, priority) VALUES (02,'2018-01-21','2018-01-21','mauro','mauro',4,'2');
INSERT INTO Orders (order_externalId, orderDate, createdDate, created_user, modified_user, id_contact, priority) VALUES (01,'2018-01-20','2018-01-20','marcio','marcio',3,'4');
INSERT INTO Orders (order_externalId, orderDate, createdDate, created_user, modified_user, id_contact, priority) VALUES (01,'2018-01-19','2018-01-19','marcio','marcio',3,'4');

SELECT * FROM Orders;

SELECT order_externalId, createdDate, created_user FROM Orders ORDER BY createdDate ASC;

CREATE TABLE orderAmount
(
	id_orderAmount int unsigned not null auto_increment,
    id_order_Orders int unsigned default null,
    uvalue double unsigned not null,
    id_unit varchar(5) not null,
    customerSpecified varchar(50),
    ts_orderAmount int unsigned not null,
    PRIMARY KEY (id_orderAmount),
    CONSTRAINT fk_id_order FOREIGN KEY (id_order_Orders) REFERENCES Orders (id_order)
);

DROP TABLE orderAmount;

INSERT INTO orderAmount (uvalue, id_unit, customerSpecified, ts_orderAmount) VALUES (20, 'KG', 'objeto1', 10);
INSERT INTO orderAmount (uvalue, id_unit, customerSpecified, ts_orderAmount) VALUES (20, 'KG', 'objeto2', 20);
INSERT INTO orderAmount (uvalue, id_unit, customerSpecified, ts_orderAmount) VALUES (1.2, 'PAL', 'objeto3', 20);
INSERT INTO orderAmount (uvalue, id_unit, customerSpecified, ts_orderAmount) VALUES (0.3, 'M3', 'objeto4', 20);
INSERT INTO orderAmount (uvalue, id_unit, customerSpecified, ts_orderAmount) VALUES (0.3, 'M3', 'objeto5', 20);

SELECT * FROM orderAmount WHERE id_unit = 'KG';
SELECT * FROM orderAmount WHERE id_unit = 'PAL';
SELECT * FROM orderAmount WHERE id_unit = 'M3';

SET SQL_SAFE_UPDATES = 0;

CREATE VIEW view_KG AS SELECT * FROM orderAmount WHERE id_unit = 'KG';
CREATE VIEW view_PAL AS SELECT * FROM orderAmount WHERE id_unit = 'PAL';

SELECT * FROM view_KG FULL JOIN view_PAL;

