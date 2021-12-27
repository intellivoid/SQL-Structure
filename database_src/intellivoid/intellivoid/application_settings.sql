create table if not exists application_settings
(
    id                     int auto_increment comment 'Unique Internal Database ID'
        primary key,
    public_id              varchar(255) not null comment 'Public Unique ID',
    application_id         int          null comment 'The ID of the Application that owns this record',
    account_id             int          null comment 'The ID of the account that this record is associated to',
    data                   mediumblob   null comment 'ZiProto encoded data settings',
    last_updated_timestamp int          null comment 'The Unix Timestamp of when this record was last updated',
    created_timestamp      int          null comment 'The Unix Timestamp of when this record was created',
    constraint application_settings_application_id_account_id_uindex
        unique (application_id, account_id),
    constraint application_settings_id_uindex
        unique (id),
    constraint application_settings_public_id_uindex
        unique (public_id)
)
    comment 'Table for allowing Applications to sync settings to a user''s Intellivoid Account';

