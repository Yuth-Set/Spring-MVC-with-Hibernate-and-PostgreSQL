# Spring-MVC-with-Hibernate-and-PostgreSQL XML Based Configured File
#=========================================
Objectives

1) How to integrate Spring MVC with Hibernate using Maven
2) The dependencies which are required to integrate in POM file
3) How to perform CRUD operations on a Spring MVC project with Hibernate.
4) How to perform Search operation on a Spring MVC project with Hibernate.
5) How to configure SessionFactory and Spring configurations.
6) How to perform Pagination
#==========================================
PostgreSQL Database Setup:

CREATE TABLE Phone (
id bigserial NOT NULL PRIMARY KEY,
name varchar(20) NOT NULL,
review varchar(20) DEFAULT NULL
);