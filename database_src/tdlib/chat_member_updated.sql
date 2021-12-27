create table if not exists chat_member_updated
(
    id              bigint unsigned auto_increment comment 'Unique identifier for this entry'
        primary key,
    chat_id         bigint    not null comment 'Chat the user belongs to',
    user_id         bigint    not null comment 'Performer of the action, which resulted in the change',
    date            timestamp not null comment 'Date the change was done in Unix time',
    old_chat_member text      not null comment 'Previous information about the chat member',
    new_chat_member text      not null comment 'New information about the chat member',
    invite_link     text      null comment 'Chat invite link, which was used by the user to join the chat; for joining by invite link events only',
    created_at      timestamp null comment 'Entry date creation',
    constraint chat_member_updated_ibfk_1
        foreign key (chat_id) references chat (id),
    constraint chat_member_updated_ibfk_2
        foreign key (user_id) references user (id)
)
    collate = utf8mb4_unicode_520_ci;

create index chat_id
    on chat_member_updated (chat_id);

create index user_id
    on chat_member_updated (user_id);

