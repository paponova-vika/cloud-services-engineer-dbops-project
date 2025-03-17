alter table product add column     price      double precision;
drop table product_info;
alter table orders add column     date_created date default current_date;
drop table orders_date;

alter table product add primary key (id);
alter table orders add primary key (id);

alter table order_product add foreign key (product_id) references product(id),
add foreign key (order_id) references orders(id);