create table if not exists edited_message
(
    id         bigint unsigned auto_increment comment 'Unique identifier for this entry'
        primary key,
    chat_id    bigint          null comment 'Unique chat identifier',
    message_id bigint unsigned null comment 'Unique message identifier',
    user_id    bigint          null comment 'Unique user identifier',
    edit_date  timestamp       null comment 'Date the message was edited in timestamp format',
    text       text            null comment 'For text messages, the actual UTF-8 text of the message max message length 4096 char utf8',
    entities   text            null comment 'For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text',
    caption    text            null comment 'For message with caption, the actual UTF-8 text of the caption',
    constraint edited_message_ibfk_1
        foreign key (chat_id) references chat (id),
    constraint edited_message_ibfk_2
        foreign key (chat_id, message_id) references message (chat_id, id),
    constraint edited_message_ibfk_3
        foreign key (user_id) references user (id)
)
    collate = utf8mb4_unicode_520_ci;

create index chat_id
    on edited_message (chat_id);

create index chat_id_2
    on edited_message (chat_id, message_id);

create index message_id
    on edited_message (message_id);

create index user_id
    on edited_message (user_id);

