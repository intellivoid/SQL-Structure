create table if not exists callback_query
(
    id                bigint unsigned      not null comment 'Unique identifier for this query'
        primary key,
    user_id           bigint               null comment 'Unique user identifier',
    chat_id           bigint               null comment 'Unique chat identifier',
    message_id        bigint unsigned      null comment 'Unique message identifier',
    inline_message_id char(255)            null comment 'Identifier of the message sent via the bot in inline mode, that originated the query',
    chat_instance     char(255) default '' not null comment 'Global identifier, uniquely corresponding to the chat to which the message with the callback button was sent',
    data              char(255) default '' not null comment 'Data associated with the callback button',
    game_short_name   char(255) default '' not null comment 'Short name of a Game to be returned, serves as the unique identifier for the game',
    created_at        timestamp            null comment 'Entry date creation',
    constraint callback_query_ibfk_1
        foreign key (user_id) references user (id),
    constraint callback_query_ibfk_2
        foreign key (chat_id, message_id) references message (chat_id, id)
)
    collate = utf8mb4_unicode_520_ci;

create index chat_id
    on callback_query (chat_id);

create index chat_id_2
    on callback_query (chat_id, message_id);

create index message_id
    on callback_query (message_id);

create index user_id
    on callback_query (user_id);

