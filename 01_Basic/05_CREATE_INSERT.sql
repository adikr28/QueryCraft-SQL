Create Table A (
 id  INT  Primary Key ,
N Varchar(15),
Phone varchar(15),
city char);
Insert Into A(id,N,Phone,city)
Values(1,'Aditya','9899909674','delhi'),
    (2,'raju','999999999','patna'),
    (3,'niki','898889989','punjab')
    (4,'pk','555555555','rani');
    
    
 Create Table B(
 s  INT  Primary Key ,
Na Varchar(15),
mobile varchar(15),
city char);

    Insert Into B(s,na,mobile,city)
Values(5,'Adi','9899909674','delhi'),
    (6,'raj','9999999','patna'),
    (3,'niki','898889989','punjab');
    
     Create Table C(
     id INt Primary key,
     name varchar(15),
     phone varchar(15),
     city char,
     marks Int
     );
     Insert Into C(id,name,phone,city,marks)
Values(5,'Adi','9899909674','delhi',56),
    (6,'raj','9999999','patna',54),
    (3,'niki','898889989','punjab',65);
     
     
     
    select*
    
   -- c.marks
    From A left join B
    On A.id=B.s;
    
    
