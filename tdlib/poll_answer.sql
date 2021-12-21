create table if not exists poll_answer
(
    poll_id    bigint unsigned not null comment 'Unique poll identifier',
    user_id    bigint          not null comment 'The user, who changed the answer to the poll',
    option_ids text            not null comment '0-based identifiers of answer options, chosen by the user. May be empty if the user retracted their vote.',
    created_at timestamp       null comment 'Entry date creation',
    primary key (poll_id, user_id),
    constraint poll_answer_ibfk_1
        foreign key (poll_id) references poll (id)
)
    collate = utf8mb4_unicode_520_ci;

