CREATE DATABASE IF NOT EXISTS identity_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

CREATE DATABASE IF NOT EXISTS product_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

CREATE DATABASE IF NOT EXISTS order_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

CREATE DATABASE IF NOT EXISTS payment_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

GRANT ALL PRIVILEGES ON identity_db.* TO 'ecommerce'@'%';
GRANT ALL PRIVILEGES ON product_db.*  TO 'ecommerce'@'%';
GRANT ALL PRIVILEGES ON order_db.*    TO 'ecommerce'@'%';
GRANT ALL PRIVILEGES ON payment_db.*  TO 'ecommerce'@'%';

FLUSH PRIVILEGES;