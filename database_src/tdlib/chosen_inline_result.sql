create table if not exists chosen_inline_result
(
    id                bigint unsigned auto_increment comment 'Unique identifier for this entry'
        primary key,
    result_id         char(255) default '' not null comment 'The unique identifier for the result that was chosen',
    user_id           bigint               null comment 'The user that chose the result',
    location          char(255)            null comment 'Sender location, only for bots that require user location',
    inline_message_id char(255)            null comment 'Identifier of the sent inline message',
    query             text                 not null comment 'The query that was used to obtain the result',
    created_at        timestamp            null comment 'Entry date creation',
    constraint chosen_inline_result_ibfk_1
        foreign key (user_id) references user (id)
)
    collate = utf8mb4_unicode_520_ci;

create index user_id
    on chosen_inline_result (user_id);

