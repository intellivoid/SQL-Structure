create table if not exists prediction_votes
(
    id                     int auto_increment comment 'The internal unique database ID for this record'
        primary key,
    message_hash           varchar(255) null comment 'The message hash for this record',
    content                text         null comment 'The message content, URL Encoded',
    prediction_spam        float        null comment 'The spam prediction for this content',
    prediction_ham         float        null comment 'The ham prediction for this content',
    votes                  blob         null comment 'ZiProto Data of the vote data',
    status                 int          null comment 'The status of this record',
    created_timestamp      int          null comment 'The Unix Timestamp for when this record was created',
    last_updated_timestamp int          null comment 'The Unix Timestamp for when this record was last updated',
    due_timestamp          int          null comment 'The Unix Timestamp for when this record is due',
    constraint prediction_votes_id_uindex
        unique (id),
    constraint prediction_votes_message_hash_uindex
        unique (message_hash)
)
    comment 'Table for housing prediction votes for each spam prediction' charset = utf8mb4;

