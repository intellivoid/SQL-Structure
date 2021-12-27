create table if not exists users_audit
(
    id         int auto_increment
        primary key,
    account_id int null comment 'The ID of the Account associated with this event',
    event_type int null comment 'The type of event',
    timestamp  int null comment 'The timestamp of when this record was created',
    constraint users_audit_id_uindex
        unique (id)
)
    comment 'Security log for account changes' charset = utf8mb4;

