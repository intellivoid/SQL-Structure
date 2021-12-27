create table if not exists votes_due
(
    id                     int auto_increment comment 'The Unique Internal Database ID for this record'
        primary key,
    records                blob null comment 'ZiProto encoded data for all the records that are traget to be due',
    status                 int  null comment 'The status of this due record',
    due_timestamp          int  null comment 'The Unix Timestamp for when this record is due',
    created_timestamp      int  null comment 'The Unix Timestamp for when this record was created',
    last_updated_timestamp int  null comment 'The Unix Timestamp for when this record was last updated',
    constraint votes_due_id_uindex
        unique (id)
)
    comment 'Table for housing votes that are scheduled to be due' charset = utf8mb4;

