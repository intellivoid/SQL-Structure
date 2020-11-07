create table if not exists intellivoid_api.access_records
(
    id                       int auto_increment comment 'Internal unique database ID for this access record',
    access_key               varchar(255) null comment 'The unique access key used for API authentication',
    last_changed_access_key  int          null comment 'The Unix Timestamp of when this access key was last changed',
    application_id           int          null comment 'The Application ID that this Access Record is associated with',
    subscription_id          int          null comment 'Optional (0=None) Subscription ID that this Access Record is associated with will regulate by',
    status                   int          null comment 'The status of the Access Record',
    variables                blob         null comment 'ZiProto encoded data which indicates variables set by the application',
    rate_limit_type          varchar(255) null comment 'The rate limit type that has been configured for this access record',
    rate_limit_configuration blob         null comment 'ZiProto encoded data which contains the configuration data for the rate limit',
    last_activity            int          null comment 'Unix Timestamp for when this Access Record was last used by the client',
    created                  int          null comment 'The Unix Timestamp for when this access record was created',
    constraint access_records_access_key_uindex
        unique (access_key),
    constraint access_records_application_id_subscription_id_uindex
        unique (application_id, subscription_id),
    constraint access_records_id_uindex
        unique (id)
)
    comment 'Access records for users that can use the API';

alter table intellivoid_api.access_records
    add primary key (id);


