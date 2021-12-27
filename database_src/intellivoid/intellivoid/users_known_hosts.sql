create table if not exists users_known_hosts
(
    id            int auto_increment comment 'The unique ID for this entry'
        primary key,
    public_id     varchar(255) null comment 'The Public ID for this entry',
    ip_address    varchar(255) null comment 'The IP Address associated with the account',
    blocked       tinyint(1)   null comment 'Indicates if this host is blocked from accessing this account',
    properties    blob         null comment 'Properties associated with this KnownHost encoded using ZiProto',
    location_data blob         null comment 'ZiProto encoded data which contains the location data for this host',
    last_used     int          null comment 'The Unix Timestamp of when this host was last used to login successfully',
    created       int          null comment 'The Unix Timestamp of when this entry was first created',
    constraint users_known_hosts_id_uindex
        unique (id),
    constraint users_known_hosts_ip_address_uindex
        unique (ip_address),
    constraint users_known_hosts_public_id_uindex
        unique (public_id)
)
    comment 'Table of known hosts associated with user accounts' charset = utf8mb4;

