
CREATE TABLE records (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NULL,
  last_name VARCHAR(255) NULL,
  email VARCHAR(255) NULL,
  encrypted_password VARCHAR(255) NULL,
  created_at DATETIME NULL,
  updated_at DATETIME NULL
);

INSERT INTO records 
(id, first_name, last_name, email, encrypted_password) 
VALUES ('1', 'Cardo', 'Dalisay', 'carodp@gamil.com', 'Bbang bang'),
(2, 'enteng', 'mabigote', 'bigote@gmail.com', 'bigotemalupet'),
(3, 'gagamba', 'wat', 'gagamba@gmail.com', 'gagamkbasakalam');

UPDATE records SET id = '4' WHERE (id = '1');

UPDATE records SET last_name = 'mabigote' WHERE (last_name = 'Choi');

UPDATE records SET created_at = '2022-07-14 16:51:59' WHERE id IN('3','5','7','12','19');

DELETE FROM records WHERE id = 1;

DELETE FROM records; 

DROP TABLE records1; 

ALTER TABLE records
RENAME COLUMN email TO email_address;

ALTER TABLE records 
CHANGE COLUMN `id` `id` BIGINT AUTO_INCREMENT NOT NULL;

ALTER TABLE records
ADD  is_active BOOLEAN NOT NULL DEFAULT 0;

