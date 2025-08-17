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
insert into employee(Bdate, Fname, Minit, Lname, Address, Sex, Salary) 
    values('2002-11-01', 'Yusuf', NULL, 'ÖKSÜZOĞLU', 'İstanbul', 'E', 15000);
insert into employee(Bdate, Fname, Minit, Lname, Address, Sex, Salary) values('2006-11-01', 'Ömer', 'F', 'ÖKSÜZOĞLU', 'İstanbul','E', 18000); 
insert into employee(Bdate, Fname, Minit, Lname, Address, Sex, Salary) values('1975-11-01', 'Vedat', NULL, 'ÖKSÜZOĞLU', 'İstanbul','E', 50000); 
insert into employee(Bdate, Fname, Minit, Lname, Address, Sex, Salary) values('2002-06-18', 'Erdem', NULL, 'ALTUN', 'İstanbul','E', 30000); 
insert into employee(Bdate, Fname, Minit, Lname, Address, Sex, Salary) values('2001-01-16', 'Ömer', 'F', 'AKSU', 'İstanbul','E', 5000); 
insert into department(Name, Number) values('TK', 01); 
insert into department(Name, Number) values('TGS', 02); 
insert into department(Name, Number) values('İGA', 03); 
insert into manages(Ssn, Name, Number, StartDate) values(01, 'TK', 01, '2025-09-01'); 
insert into manages(Ssn, Name, Number, StartDate) values(02, 'İGA', 03, '2029-09-01'); 
insert into manages(Ssn, Name, Number, StartDate) values(03, 'TGS', 02, '2004-09-01'); 
insert into manages(Ssn, Name, Number, StartDate) values(04, 'TK', 01, '2026-09-01')
insert into manages(Ssn, Name, Number, StartDate) values(05, 'İGA', 3, '2025-09-01');
SELECT 
    e.Bdate, 
    e.Fname, 
    e.Minit,
    e.Lname, 
    e.Address,
    e.Sex,
    e.Salary,
    d.Name AS DepartmentName,
    d.Number AS DepartmentNumber, 
    m.StartDate 
    FROM Manages m JOIN Employee e ON e.Ssn = m.Ssn 
    JOIN Department d ON d.Name = m.Name AND d.Number = m.Number;
select employee.Fname, employee.Minit, employee.Lname, 
    dense_rank() over(order by salary desc) as 'rank' from employee;
SELECT department.name, department.Number, manages.Name, manages.Number 
    from department left join manages 
    on department.Name = manages.Name and department.Number = manages.Number;

