create table if not exists intellivoid.application_settings
(
    id                     int(255) auto_increment comment 'Unique Internal Database ID',
    public_id              varchar(255) not null comment 'Public Unique ID',
    application_id         int(255)     null comment 'The ID of the Application that owns this record',
    account_id             int(255)     null comment 'The ID of the account that this record is associated to',
    data                   mediumblob   null comment 'ZiProto encoded data settings',
    last_updated_timestamp int(255)     null comment 'The Unix Timestamp of when this record was last updated',
    created_timestamp      int(255)     null comment 'The Unix Timestamp of when this record was created',
    constraint application_settings_application_id_account_id_uindex
        unique (application_id, account_id),
    constraint application_settings_id_uindex
        unique (id),
    constraint application_settings_public_id_uindex
        unique (public_id)
)
    comment 'Table for allowing Applications to sync settings to a user''s Intellivoid Account';

alter table intellivoid.application_settings
    add primary key (id);


