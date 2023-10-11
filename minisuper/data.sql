
-- Creación de la tabla gestion_suppliers
CREATE TABLE gestion_suppliers (
    SupplierId_id SERIAL PRIMARY KEY,
    SupplierName VARCHAR(255) NOT NULL
);

-- Creacion de la tabla gestion_categories
CREATE TABLE gestion_categories (
CategoryId_id SERIAL PRIMARY KEY,
CategoryName VARCHAR(255) NOT NULL,
Perdurable BOOLEAN DEFAULT 0
);
-- Creacion de la tabla gestion_products
CREATE TABLE gestion_products (
IdProducto SERIAL PRIMARY KEY,
ProductName VARCHAR(255) NOT NULL,
SupplierId_id INT REFERENCES gestion_suppliers(SupplierId_id),
CategoryId_id INT REFERENCES gestion_categories(CategoryId_id),
UnitPrice DECIMAL(10, 2) NOT NULL,
UnitsInStock INT NOT NULL,
UnitsOnOrder INT NOT NULL,
UnitsSoldInStore INT NOT NULL,
Suspended BOOLEAN DEFAULT 0
);

-- Ahora modificaremos la tablas para que no se repitan los valores 

ALTER TABLE gestion_suppliers ADD CONSTRAINT unique_nombre_proveedor UNIQUE (SupplierName);
ALTER TABLE gestion_categories ADD CONSTRAINT unique_nombre_categoria UNIQUE (CategoryName);

-- ahora agregamos datos de los provedores
INSERT INTO gestion_suppliers (SupplierName) VALUES ('Exotic Liquids') ON CONFLICT (SupplierName) DO NOTHING;
INSERT INTO gestion_suppliers (SupplierName) VALUES ('New Orleans Cajun Delights') ON CONFLICT (SupplierName) DO NOTHING;
INSERT INTO gestion_suppliers (SupplierName) VALUES ('Grandma Kelly''s Homestead') ON CONFLICT (SupplierName) DO NOTHING;
INSERT INTO gestion_suppliers (SupplierName) VALUES ('Tokyo Traders') ON CONFLICT (SupplierName) DO NOTHING;
INSERT INTO gestion_suppliers (SupplierName) VALUES ('Cooperativa de Quesos ''Las Cabras''') ON CONFLICT (SupplierName) DO NOTHING;
INSERT INTO gestion_suppliers (SupplierName) VALUES ('Mayumi''s') ON CONFLICT (SupplierName) DO NOTHING;
INSERT INTO gestion_suppliers (SupplierName) VALUES ('Pavlova, Ltd.') ON CONFLICT (SupplierName) DO NOTHING;
INSERT INTO gestion_suppliers (SupplierName) VALUES ('Specialty Biscuits, Ltd.') ON CONFLICT (SupplierName) DO NOTHING;

-- ahora egregamos datos de categoria
INSERT OR IGNORE INTO gestion_categories (CategoryName, Durable) VALUES ('Bebidas', 1);
INSERT OR IGNORE INTO gestion_categories (CategoryName, Durable) VALUES ('Condimentos', 1);
INSERT OR IGNORE INTO gestion_categories (CategoryName, Durable) VALUES ('Frutas/Verduras', 0);
INSERT OR IGNORE INTO gestion_categories (CategoryName, Durable) VALUES ('Carnes', 0);
INSERT OR IGNORE INTO gestion_categories (CategoryName, Durable) VALUES ('Pescado/Marisco', 0);
INSERT OR IGNORE INTO gestion_categories (CategoryName, Durable) VALUES ('Lácteos', 0);
INSERT OR IGNORE INTO gestion_categories (CategoryName, Durable) VALUES ('Repostería', 0);

INSERT INTO gestion_categories (CategoryName, Perdurable) VALUES ('Bebidas', 1) ON CONFLICT (CategoryName) DO NOTHING;
INSERT INTO gestion_categories (CategoryName, Perdurable) VALUES ('Condimentos', 1) ON CONFLICT (CategoryName) DO NOTHING;
INSERT INTO gestion_categories (CategoryName, Perdurable) VALUES ('Frutas/Verduras', 0) ON CONFLICT (CategoryName) DO NOTHING;
INSERT INTO gestion_categories (CategoryName, Perdurable) VALUES ('Carnes', 0) ON CONFLICT (CategoryName) DO NOTHING;
INSERT INTO gestion_categories (CategoryName, Perdurable) VALUES ('Pescado/Marisco', 0) ON CONFLICT (CategoryName) DO NOTHING;
INSERT INTO gestion_categories (CategoryName, Perdurable) VALUES ('Lácteos', 0) ON CONFLICT (CategoryName) DO NOTHING;
INSERT INTO gestion_categories (CategoryName, Perdurable) VALUES ('Repostería', 0) ON CONFLICT (CategoryName) DO NOTHING;
-- finalmente los de gestion_products
INSERT INTO gestion_products (ProductName, SupplierId_id, CategoryId_id, UnitPrice, UnitsInStock, UnitsOnOrder, UnitsSoldInStore, Suspended) VALUES ('Té Dharamsala', (SELECT SupplierId FROM gestion_suppliers WHERE SupplierName = 'Exotic Liquids'), (SELECT CategoryId FROM gestion_categories WHERE CategoryName = 'Bebidas'), 180, 39, 5, 10, 0);
INSERT INTO gestion_products (ProductName, SupplierId_id, CategoryId_id, UnitPrice, UnitsInStock, UnitsOnOrder, UnitsSoldInStore, Suspended) VALUES ('Cerveza tibetana Barley', (SELECT SupplierId FROM gestion_suppliers WHERE SupplierName = 'Exotic Liquids'), (SELECT CategoryId FROM gestion_categories WHERE CategoryName = 'Bebidas'), 250, 170, 40, 25, 0);
INSERT INTO gestion_products (ProductName, SupplierId_id, CategoryId_id, UnitPrice, UnitsInStock, UnitsOnOrder, UnitsSoldInStore, Suspended) VALUES ('Sirope de regaliz', (SELECT SupplierId FROM gestion_suppliers WHERE SupplierName = 'Exotic Liquids'), (SELECT CategoryId FROM gestion_categories WHERE CategoryName = 'Condimentos'), 320, 130, 70, 25, 0);
INSERT INTO gestion_products (ProductName, SupplierId_id, CategoryId_id, UnitPrice, UnitsInStock, UnitsOnOrder, UnitsSoldInStore, Suspended) VALUES ('Especias Cajun del chef Anton', (SELECT SupplierId FROM gestion_suppliers WHERE SupplierName = 'New Orleans Cajun Delights'), (SELECT CategoryId FROM gestion_categories WHERE CategoryName = 'Condimentos'), 220, 53, 35, 0, 0);
INSERT INTO gestion_products (ProductName, SupplierId_id, CategoryId_id, UnitPrice, UnitsInStock, UnitsOnOrder, UnitsSoldInStore, Suspended) VALUES ('Mezcla Gumbo del chef Anton', (SELECT SupplierId FROM gestion_suppliers WHERE SupplierName = 'New Orleans Cajun Delights'), (SELECT CategoryId FROM gestion_categories WHERE CategoryName = 'Condimentos'), 231.5, 15, 6, 0, 1);
INSERT INTO gestion_products (ProductName, SupplierId_id, CategoryId_id, UnitPrice, UnitsInStock, UnitsOnOrder, UnitsSoldInStore, Suspended) VALUES ('Mermelada de grosellas de la abuela', (SELECT SupplierId FROM gestion_suppliers WHERE SupplierName = 'Grandma Kelly''s Homestead'), (SELECT CategoryId FROM gestion_categories WHERE CategoryName = 'Condimentos'), 25, 120, 10, 25, 0);
INSERT INTO gestion_products (ProductName, SupplierId_id, CategoryId_id, UnitPrice, UnitsInStock, UnitsOnOrder, UnitsSoldInStore, Suspended) VALUES ('Peras secas orgánicas del tío Bob', (SELECT SupplierId FROM gestion_suppliers WHERE SupplierName = 'Grandma Kelly''s Homestead'), (SELECT CategoryId FROM gestion_categories WHERE CategoryName = 'Frutas/Verduras'), 300, 15, 5, 10, 0);
INSERT INTO gestion_products (ProductName, SupplierId_id, CategoryId_id, UnitPrice, UnitsInStock, UnitsOnOrder, UnitsSoldInStore, Suspended) VALUES ('Salsa de arándanos Northwoods', (SELECT SupplierId FROM gestion_suppliers WHERE SupplierName = 'Grandma Kelly''s Homestead'), (SELECT CategoryId FROM gestion_categories WHERE CategoryName = 'Condimentos'), 400, 6, 1, 0, 0);
INSERT INTO gestion_products (ProductName, SupplierId_id, CategoryId_id, UnitPrice, UnitsInStock, UnitsOnOrder, UnitsSoldInStore, Suspended) VALUES ('Buey Mishi Kobe', (SELECT SupplierId FROM gestion_suppliers WHERE SupplierName = 'Tokyo Traders'), (SELECT CategoryId FROM gestion_categories WHERE CategoryName = 'Carnes'), 970, 29, 20, 0, 1);
INSERT INTO gestion_products (ProductName, SupplierId_id, CategoryId_id, UnitPrice, UnitsInStock, UnitsOnOrder, UnitsSoldInStore, Suspended) VALUES ('Pez espada', (SELECT SupplierId FROM gestion_suppliers WHERE SupplierName = 'Tokyo Traders'), (SELECT CategoryId FROM gestion_categories WHERE CategoryName = 'Pescado/Marisco'), 310, 31, 3, 0, 0);
INSERT INTO gestion_products (ProductName, SupplierId_id, CategoryId_id, UnitPrice, UnitsInStock, UnitsOnOrder, UnitsSoldInStore, Suspended) VALUES ('Queso Cabrales', (SELECT SupplierId FROM gestion_suppliers WHERE SupplierName = 'Cooperativa de Quesos ''Las Cabras'''), (SELECT CategoryId FROM gestion_categories WHERE CategoryName = 'Lácteos'), 210, 220, 30, 30, 0);
INSERT INTO gestion_products (ProductName, SupplierId_id, CategoryId_id, UnitPrice, UnitsInStock, UnitsOnOrder, UnitsSoldInStore, Suspended) VALUES ('Queso Manchego La Pastora', (SELECT SupplierId FROM gestion_suppliers WHERE SupplierName = 'Cooperativa de Quesos ''Las Cabras'''), (SELECT CategoryId FROM gestion_categories WHERE CategoryName = 'Lácteos'), 380, 86, 20, 0, 0);
INSERT INTO gestion_products (ProductName, SupplierId_id, CategoryId_id, UnitPrice, UnitsInStock, UnitsOnOrder, UnitsSoldInStore, Suspended) VALUES ('Algas Konbu', (SELECT SupplierId FROM gestion_suppliers WHERE SupplierName = 'Mayumi''s'), (SELECT CategoryId FROM gestion_categories WHERE CategoryName = 'Pescado/Marisco'), 600, 24, 2, 5, 0);
INSERT INTO gestion_products (ProductName, SupplierId_id, CategoryId_id, UnitPrice, UnitsInStock, UnitsOnOrder, UnitsSoldInStore, Suspended) VALUES ('Cuajada de judías', (SELECT SupplierId FROM gestion_suppliers WHERE SupplierName = 'Mayumi''s'), (SELECT CategoryId FROM gestion_categories WHERE CategoryName = 'Frutas/Verduras'), 232.5, 35, 5, 0, 0);
INSERT INTO gestion_products (ProductName, SupplierId_id, CategoryId_id, UnitPrice, UnitsInStock, UnitsOnOrder, UnitsSoldInStore, Suspended) VALUES ('Salsa de soja baja en sodio', (SELECT SupplierId FROM gestion_suppliers WHERE SupplierName = 'Mayumi''s'), (SELECT CategoryId FROM gestion_categories WHERE CategoryName = 'Condimentos'), 155, 39, 7, 5, 0);
INSERT INTO gestion_products (ProductName, SupplierId_id, CategoryId_id, UnitPrice, UnitsInStock, UnitsOnOrder, UnitsSoldInStore, Suspended) VALUES ('Postre de merengue Pavlova', (SELECT SupplierId FROM gestion_suppliers WHERE SupplierName = 'Pavlova, Ltd.'), (SELECT CategoryId FROM gestion_categories WHERE CategoryName = 'Repostería'), 174.5, 29, 15, 10, 0);
INSERT INTO gestion_products (ProductName, SupplierId_id, CategoryId_id, UnitPrice, UnitsInStock, UnitsOnOrder, UnitsSoldInStore, Suspended) VALUES ('Cordero Alice Springs', (SELECT SupplierId FROM gestion_suppliers WHERE SupplierName = 'Pavlova, Ltd.'), (SELECT CategoryId FROM gestion_categories WHERE CategoryName = 'Carnes'), 390, 0, 0, 0, 1);
INSERT INTO gestion_products (ProductName, SupplierId_id, CategoryId_id, UnitPrice, UnitsInStock, UnitsOnOrder, UnitsSoldInStore, Suspended) VALUES ('Langostinos tigre Carnarvon', (SELECT SupplierId FROM gestion_suppliers WHERE SupplierName = 'Pavlova, Ltd.'), (SELECT CategoryId FROM gestion_categories WHERE CategoryName = 'Pescado/Marisco'), 625, 42, 30, 0, 0);
INSERT INTO gestion_products (ProductName, SupplierId_id, CategoryId_id, UnitPrice, UnitsInStock, UnitsOnOrder, UnitsSoldInStore, Suspended) VALUES ('Pastas de té de chocolate', (SELECT SupplierId FROM gestion_suppliers WHERE SupplierName = 'Specialty Biscuits, Ltd.'), (SELECT CategoryId FROM gestion_categories WHERE CategoryName = 'Repostería'), 92, 25, 20, 5, 0);
INSERT INTO gestion_products (ProductName, SupplierId_id, CategoryId_id, UnitPrice, UnitsInStock, UnitsOnOrder, UnitsSoldInStore, Suspended) VALUES ('Mermelada de Sir Rodney''s', (SELECT SupplierId FROM gestion_suppliers WHERE SupplierName = 'Specialty Biscuits, Ltd.'), (SELECT CategoryId FROM gestion_categories WHERE CategoryName = 'Repostería'), 810, 40, 10, 0, 0);
