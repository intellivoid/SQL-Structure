create table if not exists intellivoid_api.access_key_changes
(
    id               int auto_increment comment 'Internal unique database ID for this record',
    access_record_id int          null comment 'The ID of the access record that this change is associated with',
    old_access_key   varchar(255) null comment 'The old access key that was used before the change',
    new_access_key   varchar(255) null comment 'The new access key that was generated',
    timestamp        int          null comment 'The Unix Timestamp for when this changed occurred',
    constraint access_key_changes_id_uindex
        unique (id)
)
    comment 'Events for when a access key was changed';

alter table intellivoid_api.access_key_changes
    add primary key (id);


