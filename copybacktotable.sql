Use FinalProject;

alter table invoices add column senttoFirstname varchar(42);
alter table invoices add column senttolastname varchar(42);
alter table invoices add column senttocity_ID int(10);
alter table invoices add foreign key (senttocity_ID)
    references city(City_ID);
alter table invoices add column senttostate_ID int(10);
alter table invoices add foreign key (senttostate_ID)
    references state(State_ID);
alter table invoices add column senttostreet varchar(42);
alter table invoices add column senttopostalcode int(10);


alter table invoices add column billedtoFirstname varchar(42);
alter table invoices add column billedtolastname varchar(42);
alter table invoices add column billedtocity_ID int(10);
alter table invoices add foreign key (billedtocity_ID)
    references city(City_ID);
alter table invoices add column billedtostate_ID int(10);
alter table invoices add foreign key (billedtostate_ID)
    references state(State_ID);
alter table invoices add column billedtostreet varchar(42);
alter table invoices add column billedtopostalcode int(10);


update invoices
    join contacts
    on contacts.contact_ID = invoices.SentTo
    set invoices.senttoFirstname = contacts.firstname,
     invoices.senttolastname = contacts.lastname,
     invoices.senttocity_id = contacts.City_ID,
     invoices.senttostate_id = contacts.State_ID,
     invoices.senttostreet = contacts.street,
     invoices.senttopostalcode = contacts.PostalCode,
     invoices.billedtofirstname = contacts.firstname,
     invoices.billedtolastname = contacts.lastname,
     invoices.billedtocity_id = contacts.City_ID,
     invoices.billedtostate_id = contacts.State_ID,
     invoices.billedtostreet = contacts.street,
     invoices.billedtopostalcode = contacts.PostalCode
where   contact_ID is not null ;