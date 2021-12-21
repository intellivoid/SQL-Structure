create table if not exists user
(
    id            bigint                not null comment 'Unique identifier for this user or bot'
        primary key,
    is_bot        tinyint(1) default 0  null comment 'True, if this user is a bot',
    first_name    char(255)  default '' not null comment 'User''s or bot''s first name',
    last_name     char(255)             null comment 'User''s or bot''s last name',
    username      char(191)             null comment 'User''s or bot''s username',
    language_code char(10)              null comment 'IETF language tag of the user''s language',
    created_at    timestamp             null comment 'Entry date creation',
    updated_at    timestamp             null comment 'Entry date update'
)
    collate = utf8mb4_unicode_520_ci;

create index username
    on user (username);

