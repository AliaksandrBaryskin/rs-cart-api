create extension if not exists "uuid-ossp";

create type cartstatus as enum ('OPEN', 'ORDERED');

create table carts (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid not null,
  created_at date not null,
  updated_at date not null,
  status cartstatus not null
);

create table cart_items (
  id uuid primary key default uuid_generate_v4(),
  cart_id uuid references carts(id) not null,
  product_id uuid not null,
  count integer not null,
  price integer not null
);

create table orders (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid,
  cart_id uuid references carts(id) not null,
  payment json not null,
  delivery json not null,
  comments text not null,
  status cartstatus not null,
  total integer not null
);

insert into carts (id, user_id, created_at, updated_at, status) values 
('a58409a4-3d08-4a9e-b5a3-69c9a2aefc00', '68280373-622a-4f24-8752-97905658958c', '2023-05-21', '2023-05-21', 'OPEN'),
('6f5d7302-0334-40ef-8b9d-92ff361e9742', '68280373-622a-4f24-8752-97905658958c', '2023-05-19', '2023-05-21', 'ORDERED');

insert into cart_items (cart_id, product_id, count, price) values 
('a58409a4-3d08-4a9e-b5a3-69c9a2aefc00', 'c582d9ea-eea7-4f4e-977f-6209f7cfcf68', 5, 5),
('6f5d7302-0334-40ef-8b9d-92ff361e9742', 'c582d9ea-eea7-4f4e-977f-6209f7cfcf68', 10, 4),
('6f5d7302-0334-40ef-8b9d-92ff361e9742', 'd6426806-cec0-48c5-9985-b06967a0cf8b', 2, 3),
('a58409a4-3d08-4a9e-b5a3-69c9a2aefc00', 'd6426806-cec0-48c5-9985-b06967a0cf8b', 14, 2)