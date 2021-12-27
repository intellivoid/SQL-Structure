create table if not exists poll
(
    id                      bigint unsigned      not null comment 'Unique poll identifier'
        primary key,
    question                text                 not null comment 'Poll question',
    options                 text                 not null comment 'List of poll options',
    total_voter_count       int unsigned         null comment 'Total number of users that voted in the poll',
    is_closed               tinyint(1) default 0 null comment 'True, if the poll is closed',
    is_anonymous            tinyint(1) default 1 null comment 'True, if the poll is anonymous',
    type                    char(255)            null comment 'Poll type, currently can be “regular” or “quiz”',
    allows_multiple_answers tinyint(1) default 0 null comment 'True, if the poll allows multiple answers',
    correct_option_id       int unsigned         null comment '0-based identifier of the correct answer option. Available only for polls in the quiz mode, which are closed, or was sent (not forwarded) by the bot or to the private chat with the bot.',
    explanation             varchar(255)         null comment 'Text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, 0-200 characters',
    explanation_entities    text                 null comment 'Special entities like usernames, URLs, bot commands, etc. that appear in the explanation',
    open_period             int unsigned         null comment 'Amount of time in seconds the poll will be active after creation',
    close_date              timestamp            null comment 'Point in time (Unix timestamp) when the poll will be automatically closed',
    created_at              timestamp            null comment 'Entry date creation'
)
    collate = utf8mb4_unicode_520_ci;

