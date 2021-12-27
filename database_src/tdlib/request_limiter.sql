create table if not exists request_limiter
(
    id                bigint unsigned auto_increment comment 'Unique identifier for this entry'
        primary key,
    chat_id           char(255) null comment 'Unique chat identifier',
    inline_message_id char(255) null comment 'Identifier of the sent inline message',
    method            char(255) null comment 'Request method',
    created_at        timestamp null comment 'Entry date creation'
)
    collate = utf8mb4_unicode_520_ci;

