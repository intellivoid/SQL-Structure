create table if not exists shipping_query
(
    id               bigint unsigned      not null comment 'Unique query identifier'
        primary key,
    user_id          bigint               null comment 'User who sent the query',
    invoice_payload  char(255) default '' not null comment 'Bot specified invoice payload',
    shipping_address char(255) default '' not null comment 'User specified shipping address',
    created_at       timestamp            null comment 'Entry date creation',
    constraint shipping_query_ibfk_1
        foreign key (user_id) references user (id)
)
    collate = utf8mb4_unicode_520_ci;

create index user_id
    on shipping_query (user_id);

