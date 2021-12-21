create table if not exists devices
(
    fingerprint         varchar(126) not null comment 'The fingerprint of the device'
        primary key,
    user_agent          varchar(255) not null comment 'The full raw user agent string of the device',
    os_family           varchar(255) null comment 'The Operating System family of the user agent',
    os_version          varchar(126) null comment 'The verison of the operating system',
    device_family       varchar(255) null comment 'The family of the device',
    device_brand        varchar(255) null comment 'The brand of the device',
    device_model        varchar(255) null comment 'The model of the device',
    browser_family      varchar(255) null comment 'The family of the web browser that''s being used',
    browser_version     varchar(255) null comment 'The verison of the browser that''s being used',
    mobile_browser      tinyint(1)   null comment 'Indicates if the browser is on a mobile platform',
    mobile_device       tinyint(1)   null comment 'Indicates if the device is a mobile device',
    properties          blob         null comment 'ZiProto encoded properties of the device',
    last_seen_timestamp int          null comment 'The Unix Timestamp for when this device was last seen',
    created_timestamp   int          null comment 'The Unix Timestamp for when this record was first registered into the database',
    constraint devices_fingerprint_uindex
        unique (fingerprint),
    constraint devices_user_agent_uindex
        unique (user_agent)
)
    comment 'Table for housing known devices and their properties';

