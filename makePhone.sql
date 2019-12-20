use FinalProject;
drop table if exists Phone;

create table Phone(
    Contact_ID int(10) not null ,
    Phone char(12),
    type varchar(10),
    FOREIGN KEY (Contact_ID) references contacts(contact_ID)
);

insert into Phone select distinct ct.contact_ID, ct.phone, 'Phone' from contacts ct;
insert into Phone select distinct ct.contact_ID, ct.fax, 'Fax' from contacts ct;

