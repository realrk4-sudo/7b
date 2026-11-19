-- Ku dheji Supabase > SQL Editor > Run
create table products (
  id serial primary key,
  category text not null check (category in ('app','buug','coins')),
  title text not null,
  description text,
  price numeric(10,2) not null,
  active boolean default true
);
create table orders (
  id uuid primary key default gen_random_uuid(),
  product_id int references products(id),
  customer_name text not null,
  phone text not null,
  game_id text,          -- eFootball ID (coins ahaan)
  pay_ref text,          -- tirada/lambarka lacag bixinta
  status text default 'cusub',
  created_at timestamptz default now()
);
alter table products enable row level security;
alter table orders enable row level security;
create policy "dhammaan arki karaan" on products for select using (active);
create policy "dhammaan dalbi karaan" on orders for insert with check (true);

insert into products (category,title,description,price) values
('app','App-kayga','Soo dejiso app-ka',5),
('buug','Buug 1','Faahfaahin gaaban',2),('buug','Buug 2','Faahfaahin gaaban',2),
('buug','Buug 3','Faahfaahin gaaban',2),('buug','Buug 4','Faahfaahin gaaban',2),
('buug','Buug 5','Faahfaahin gaaban',2),('buug','Buug 6','Faahfaahin gaaban',2),
('buug','Buug 7','Faahfaahin gaaban',2),
('coins','eFootball 100 Coins','Waxaa loo gudbiyaa ID-gaaga',1),
('coins','eFootball 300 Coins','Waxaa loo gudbiyaa ID-gaaga',3),
('coins','eFootball 1000 Coins','Waxaa loo gudbiyaa ID-gaaga',9);
