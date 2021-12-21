create table if not exists chat
(
    id                             bigint                                             not null comment 'Unique identifier for this chat'
        primary key,
    type                           enum ('private', 'group', 'supergroup', 'channel') not null comment 'Type of chat, can be either private, group, supergroup or channel',
    title                          char(255)  default ''                              null comment 'Title, for supergroups, channels and group chats',
    username                       char(255)                                          null comment 'Username, for private chats, supergroups and channels if available',
    first_name                     char(255)                                          null comment 'First name of the other party in a private chat',
    last_name                      char(255)                                          null comment 'Last name of the other party in a private chat',
    all_members_are_administrators tinyint(1) default 0                               null comment 'True if a all members of this group are admins',
    created_at                     timestamp                                          null comment 'Entry date creation',
    updated_at                     timestamp                                          null comment 'Entry date update',
    old_id                         bigint                                             null comment 'Unique chat identifier, this is filled when a group is converted to a supergroup'
)
    collate = utf8mb4_unicode_520_ci;

create index old_id
    on chat (old_id);

