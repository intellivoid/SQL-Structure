create table if not exists user_chat
(
    user_id bigint not null comment 'Unique user identifier',
    chat_id bigint not null comment 'Unique user or chat identifier',
    primary key (user_id, chat_id),
    constraint user_chat_ibfk_1
        foreign key (user_id) references user (id)
            on update cascade on delete cascade,
    constraint user_chat_ibfk_2
        foreign key (chat_id) references chat (id)
            on update cascade on delete cascade
)
    collate = utf8mb4_unicode_520_ci;

create index chat_id
    on user_chat (chat_id);

