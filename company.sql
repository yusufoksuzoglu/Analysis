create database Company default character set utf8mb4;
create table employee(
    Ssn integer not null auto_increment,
    Bdate date,
    Fname varchar(255),
    Minit varchar(255),
    Lname varchar(255),
    Address varchar(255),
    Sex varchar(255),
    Salary integer,
    primary key(Ssn)
)engine=innodb;
create table supervision(
    supervisor_id int,
    supervisee_id int,
    primary key(supervisor_id, supervisee_id),
    foreign key(supervisor_id) references employee(Ssn)
      on delete cascade on update cascade,
    foreign key(supervisee_id) references employee(Ssn)
      on delete cascade on update cascade  
)engine=innodb;
create table department(
    Name varchar(255) not null,
    Number integer not null,
    primary key(Name,Number)
)engine=innodb;
create table locations(
    Name varchar(255) not null,
    Number integer not null,
    primary key(Name,Number),
    constraint foreign key(Name,Number) references department(Name,Number)
      on delete cascade on update cascade
)engine=innodb;
create table project(
    Name varchar(255) not null,
    Number integer not null,
    Location varchar(255),
    primary key(Name,Number),
    constraint foreign key(Name,Number) references department(Name,Number)
      on delete cascade on update cascade
)engine=innodb;
create table manages(
    Ssn integer not null,
    Name varchar(255) not null,
    Number integer not null,
    StartDate date,
    primary key(Ssn,Name,Number),
    constraint foreign key(Ssn) references employee(Ssn)
      on delete cascade on update cascade,
    constraint foreign key(Name,Number) references department(Name,Number)
      on delete cascade on update cascade
)engine=innodb;
create table works_on(
    Ssn integer not null,
    ProjectName varchar(255) not null,
    ProjectNumber integer not null,
    Hours integer,
    primary key(Ssn, ProjectName, ProjectNumber),
    foreign key(Ssn) references employee(Ssn)
      on delete cascade on update cascade,
    foreign key(ProjectName, ProjectNumber) references project(Name, Number)
      on delete cascade on update cascade
)engine=innodb;
create table dependent(
    Ssn integer not null,
    Name varchar(255) not null,
    Sex varchar(255),
    Birthdate date,
    Relationship varchar(255),
    primary key(Ssn,Name),
    constraint foreign key(Ssn) references employee(Ssn)
      on delete cascade on update cascade
)engine=innodb;
