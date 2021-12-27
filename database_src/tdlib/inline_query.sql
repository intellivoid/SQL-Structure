create table if not exists inline_query
(
    id         bigint unsigned not null comment 'Unique identifier for this query'
        primary key,
    user_id    bigint          null comment 'Unique user identifier',
    location   char(255)       null comment 'Location of the user',
    query      text            not null comment 'Text of the query',
    offset     char(255)       null comment 'Offset of the result',
    chat_type  char(255)       null comment 'Optional. Type of the chat, from which the inline query was sent.',
    created_at timestamp       null comment 'Entry date creation',
    constraint inline_query_ibfk_1
        foreign key (user_id) references user (id)
)
    collate = utf8mb4_unicode_520_ci;

create index user_id
    on inline_query (user_id);

