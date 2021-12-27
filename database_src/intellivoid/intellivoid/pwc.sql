create table if not exists pwc
(
    id          int auto_increment comment 'The Unique Internal Database ID'
        primary key,
    hash        varchar(256) null comment 'The hash of the record (sha1)',
    plain_text  varchar(255) null comment 'The plain text version of the password',
    compromised tinyint(1)   null comment 'Indicates if this password is compromised or not',
    timestamp   int          null comment 'The Unix Timestamp of when this record was registered',
    constraint pwc_hash_plain_text_uindex
        unique (hash, plain_text),
    constraint pwc_hash_uindex
        unique (hash),
    constraint pwc_id_uindex
        unique (id),
    constraint pwc_plain_text_uindex
        unique (plain_text)
)
    comment 'Table for hosting the cache of comprised passwords';

