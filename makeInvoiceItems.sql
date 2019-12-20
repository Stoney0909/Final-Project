USE FinalProject;
drop table  if exists invoiceItems;

alter table invoices add PRIMARY KEY (InvoiceID);



create table invoiceItems(
    invoice_ID int(10) not null,
    Quantity int(11),
    PartNumber char(15),
    ProductName varchar(40),
    Price float,
    taxable char(1),
    ProductWeight int(11),
    UnitDimensions char(10),
    Foreign KEY (invoice_ID) references invoices(InvoiceID)
);
insert into invoiceItems
    select distinct InvoiceID, Quantity,PartNumber, ProductName, Price, Taxable, ProductWeight, UnitDimensions  from invoices;



