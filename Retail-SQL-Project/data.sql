INSERT INTO customers VALUES
(1, 'Tunde', 'Lagos', '2024-01-10'),
(2, 'Ada', 'Abuja', '2024-02-05'),
(3, 'John', 'Lagos', '2024-02-20'),
(4, 'Kemi', 'Ibadan', '2024-03-01'),
(5, 'Bola', 'Lagos', '2024-03-15');

INSERT INTO products VALUES
(101, 'Ofada Rice 5kg', 'Food', 19000),
(102, 'Ofada Rice 2kg', 'Food', 9000),
(103, 'Palm Oil 1L', 'Food', 5000),
(104, 'Beans 3kg', 'Food', 7000);

INSERT INTO orders VALUES
(1001, 1, '2024-01-15', 'Completed'),
(1002, 2, '2024-02-10', 'Completed'),
(1003, 1, '2024-02-18', 'Cancelled'),
(1004, 3, '2024-02-25', 'Completed'),
(1005, 4, '2024-03-05', 'Pending'),
(1006, 1, '2024-03-10', 'Completed');

INSERT INTO orders VALUES
(1001, 1, '2024-01-15', 'Completed'),
(1002, 2, '2024-02-10', 'Completed'),
(1003, 1, '2024-02-18', 'Cancelled'),
(1004, 3, '2024-02-25', 'Completed'),
(1005, 4, '2024-03-05', 'Pending'),
(1006, 1, '2024-03-10', 'Completed');

INSERT INTO order_items VALUES
(1, 1001, 101, 2),
(2, 1002, 102, 1),
(3, 1003, 101, 1),
(4, 1004, 103, 3),
(5, 1005, 104, 2),
(6, 1006, 101, 1);