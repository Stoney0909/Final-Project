USE FinalProject;
drop table  if exists Product;

create table Product(
    Product_ID int(10) not null auto_increment,
    PartNumber char(15),
    ProductName varchar(40),
    ProductDescription varchar(40),
    Price float,
    Taxable char(1),
    ProductWeight int(11),
    PRIMARY KEY (Product_ID)
);
insert into Product(PartNumber, ProductName, ProductDescription, Price, Taxable, ProductWeight)
select distinct PartNumber, SUBSTRING_INDEX(ProductName, '-', 1), SUBSTRING(ProductName, length( SUBSTRING_INDEX(ProductName, '-', 1))+2, length(ProductName) -( length( SUBSTRING_INDEX(ProductName, '-', 1))+2)),Price, taxable, ProductWeight
from invoiceitems;
update Product
set ProductDescription = null
where ProductDescription = '';


alter table invoiceitems add column Product_ID int(10);
alter table invoiceitems add foreign key (Product_ID)references Product(Product_ID);

UPDATE invoiceitems
	INNER JOIN Product
	ON Product.ProductName = invoiceitems.ProductName
    and Product.PartNumber = invoiceitems.PartNumber
    and Product.ProductWeight = invoiceitems.ProductWeight
    and Product.Taxable = invoiceitems.taxable
	SET invoiceitems.Product_ID = Product.Product_ID
	WHERE Product.ProductName IS NOT NULL;
