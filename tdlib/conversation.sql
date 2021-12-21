create table if not exists conversation
(
    id         bigint unsigned auto_increment comment 'Unique identifier for this entry'
        primary key,
    user_id    bigint                                                   null comment 'Unique user identifier',
    chat_id    bigint                                                   null comment 'Unique user or chat identifier',
    status     enum ('active', 'cancelled', 'stopped') default 'active' not null comment 'Conversation state',
    command    varchar(160)                            default ''       null comment 'Default command to execute',
    notes      text                                                     null comment 'Data stored from command',
    created_at timestamp                                                null comment 'Entry date creation',
    updated_at timestamp                                                null comment 'Entry date update',
    constraint conversation_ibfk_1
        foreign key (user_id) references user (id),
    constraint conversation_ibfk_2
        foreign key (chat_id) references chat (id)
)
    collate = utf8mb4_unicode_520_ci;

create index chat_id
    on conversation (chat_id);

create index status
    on conversation (status);

create index user_id
    on conversation (user_id);

