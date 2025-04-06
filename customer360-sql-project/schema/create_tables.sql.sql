
CREATE OR REPLACE TABLE customers (
  customer_id NUMBER PRIMARY KEY,
  name VARCHAR,
  email VARCHAR UNIQUE,
  signup_date DATE,
  is_active BOOLEAN
);

CREATE OR REPLACE TABLE orders (
  order_id NUMBER PRIMARY KEY,
  customer_id NUMBER,
  order_date DATE,
  amount NUMBER(10,2),
  status VARCHAR,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE OR REPLACE TABLE logins (
  login_id NUMBER PRIMARY KEY AUTOINCREMENT,
  customer_id NUMBER,
  login_time TIMESTAMP,
  device VARCHAR,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE OR REPLACE TABLE support_tickets (
  ticket_id NUMBER PRIMARY KEY AUTOINCREMENT,
  customer_id NUMBER,
  issue_summary VARCHAR,
  ticket_date TIMESTAMP,
  status VARCHAR,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);