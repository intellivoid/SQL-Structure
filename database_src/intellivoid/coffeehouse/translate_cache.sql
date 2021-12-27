create table if not exists translate_cache
(
    id                     int auto_increment comment 'The Unique Internal Database ID'
        primary key,
    public_id              varchar(255) null comment 'The Unique Public ID for this cache record',
    source                 varchar(32)  null comment 'The source language of the given input',
    target                 varchar(32)  null comment 'The target output of the translation',
    processing_engine      varchar(255) null comment 'The processing engine that was used to process this translation',
    input                  mediumtext   null comment 'The input to process',
    output                 mediumtext   null comment 'The results',
    last_updated_timestamp int          null comment 'The Unix Timestamp for when this cache record was last updated',
    created_timestamp      int          null comment 'The Unix Timestamp for when this cache record was created',
    constraint translate_cache_id_uindex
        unique (id),
    constraint translate_cache_public_id_uindex
        unique (public_id)
)
    comment 'A cache table used for storing translation results';

