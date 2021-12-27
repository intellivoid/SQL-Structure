create table if not exists pre_checkout_query
(
    id                 bigint unsigned      not null comment 'Unique query identifier'
        primary key,
    user_id            bigint               null comment 'User who sent the query',
    currency           char(3)              null comment 'Three-letter ISO 4217 currency code',
    total_amount       bigint               null comment 'Total price in the smallest units of the currency',
    invoice_payload    char(255) default '' not null comment 'Bot specified invoice payload',
    shipping_option_id char(255)            null comment 'Identifier of the shipping option chosen by the user',
    order_info         text                 null comment 'Order info provided by the user',
    created_at         timestamp            null comment 'Entry date creation',
    constraint pre_checkout_query_ibfk_1
        foreign key (user_id) references user (id)
)
    collate = utf8mb4_unicode_520_ci;

create index user_id
    on pre_checkout_query (user_id);

