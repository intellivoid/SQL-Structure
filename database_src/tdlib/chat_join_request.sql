create table if not exists chat_join_request
(
    id          bigint unsigned auto_increment comment 'Unique identifier for this entry'
        primary key,
    chat_id     bigint    not null comment 'Chat to which the request was sent',
    user_id     bigint    not null comment 'User that sent the join request',
    date        timestamp not null comment 'Date the request was sent in Unix time',
    bio         text      not null comment 'Optional. Bio of the user',
    invite_link text      null comment 'Optional. Chat invite link that was used by the user to send the join request',
    created_at  timestamp null comment 'Entry date creation',
    constraint chat_join_request_ibfk_1
        foreign key (chat_id) references chat (id),
    constraint chat_join_request_ibfk_2
        foreign key (user_id) references user (id)
)
    collate = utf8mb4_unicode_520_ci;

create index chat_id
    on chat_join_request (chat_id);

create index user_id
    on chat_join_request (user_id);

