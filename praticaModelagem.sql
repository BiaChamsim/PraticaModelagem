-- STATES TABLE
CREATE TABLE "states" (
	id serial PRIMARY KEY,
	name varchar(50)
);

-- CITIES TABLE
CREATE TABLE "cities" (
	id serial PRIMARY KEY,
	name text,
	"stateId" integer NOT NULL REFERENCES "states" ("id")
);

-- CUSTOMERS TABLE
CREATE TABLE "customers"(
	id serial PRIMARY KEY,
	"fullName" varchar(100) NOT NULL,
	cpf integer NOT NULL UNIQUE,
	email text NOT NULL UNIQUE,
	password integer NOT NULL
	
);

-- CUSTOMER ADRESSES TABLE
CREATE TABLE "customerAdresses"(
	id serial PRIMARY KEY,
	"customerId" integer REFERENCES "customers" ("id"),
	street text NOT NULL,
	number integer NOT NULL,
	complement text,
	"postalCode" integer,
	"cityId" integer REFERENCES "cities" ("id")
);

--CUSTOMER PHONES TABLE
CREATE TABLE "customerPhones"(
	id serial PRIMARY KEY,
	"customerId" integer REFERENCES "customers" ("id"),
	number integer,
	type text
);

-- BANK ACCOUNT TABLE
CREATE TABLE "bankAccount"(
	id serial PRIMARY KEY,
	"customerId" integer REFERENCES "customers" ("id"),
	"accountNumber" integer NOT NULL,
	agency integer NOT NULL,
	"openDate" timestamp DEFAULT NOW(),
	"closeDate" timestamp DEFAULT NOW()	
);

-- TRANSACTIONS TABLE
CREATE TABLE "transactions"(
	id serial PRIMARY KEY,
	"bankAccountId" integer REFERENCES "bankAccount" ("id"),
	amount integer NOT NULL,
	type text NOT NULL,
	"time" timestamp DEFAULT NOW (),
	description text,
	cancelled bool DEFAULT	
);

-- CREDITCARDS TABLE
CREATE TABLE "creditCards"(
	id serial PRIMARY KEY,
	"bankAccountId" integer REFERENCES "bankAccount" ("id"),
	name varchar (50) NOT NULL,
	number integer NOT NULL,
	"securityCode" integer NOT NULL,
	"expirationMonth" date NOT NULL,
	"expirationYear" date NOT NULL,
	password text NOT NULL,
	"limit" integer NOT NULL	
);