CREATE TABLE backers
(
  backer_id  varchar(10)  NOT NULL,
  cf_id      int          NOT NULL,
  first_name varchar(50)  NOT NULL,
  last_name  varchar(50)  NOT NULL,
  email      varchar(100) NOT NULL,
  PRIMARY KEY (backer_id)
);

CREATE TABLE campaign
(
  cf_id          int           NOT NULL,
  contact_id     int           NOT NULL,
  company_name   varchar(100)  NOT NULL,
  description    text          NOT NULL,
  goal           numeric(10,2) NOT NULL,
  pledged        numeric(10,2) NOT NULL,
  outcome        varchar(50)   NOT NULL,
  backers_count  int           NOT NULL,
  country        varchar(10)   NOT NULL,
  currency       varchar(10)   NOT NULL,
  launched_date  date          NOT NULL,
  end_date       date          NOT NULL,
  category_id    varchar(10)   NOT NULL,
  subcategory_id varchar(10)   NOT NULL,
  PRIMARY KEY (cf_id)
);

CREATE TABLE category
(
  category_id varchar(10) NOT NULL,
  category    varchar(50) NOT NULL,
  PRIMARY KEY (category_id)
);

CREATE TABLE contacts
(
  contact_id int          NOT NULL,
  first_name varchar(50)  NOT NULL,
  last_name  varchar(50)  NOT NULL,
  email      varchar(100) NOT NULL,
  PRIMARY KEY (contact_id)
);

CREATE TABLE subcategory
(
  subcategory_id varchar(10) NOT NULL,
  subcategory    varchar(50) NOT NULL,
  PRIMARY KEY (subcategory_id)
);

ALTER TABLE campaign
  ADD CONSTRAINT FK_contacts_TO_campaign
    FOREIGN KEY (contact_id)
    REFERENCES contacts (contact_id);

ALTER TABLE campaign
  ADD CONSTRAINT FK_category_TO_campaign
    FOREIGN KEY (category_id)
    REFERENCES category (category_id);

ALTER TABLE campaign
  ADD CONSTRAINT FK_subcategory_TO_campaign
    FOREIGN KEY (subcategory_id)
    REFERENCES subcategory (subcategory_id);

ALTER TABLE backers
  ADD CONSTRAINT FK_campaign_TO_backers
    FOREIGN KEY (cf_id)
    REFERENCES campaign (cf_id);
