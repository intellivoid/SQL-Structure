create table if not exists message
(
    chat_id                 bigint               not null comment 'Unique chat identifier',
    id                      bigint unsigned      not null comment 'Unique message identifier',
    user_id                 bigint               null comment 'Unique user identifier',
    date                    timestamp            null comment 'Date the message was sent in timestamp format',
    forward_from            bigint               null comment 'Unique user identifier, sender of the original message',
    forward_from_chat       bigint               null comment 'Unique chat identifier, chat the original message belongs to',
    forward_from_message_id bigint               null comment 'Unique chat identifier of the original message in the channel',
    forward_signature       text                 null comment 'For messages forwarded from channels, signature of the post author if present',
    forward_sender_name     text                 null comment 'Sender''s name for messages forwarded from users who disallow adding a link to their account in forwarded messages',
    forward_date            timestamp            null comment 'date the original message was sent in timestamp format',
    reply_to_chat           bigint               null comment 'Unique chat identifier',
    reply_to_message        bigint unsigned      null comment 'Message that this message is reply to',
    via_bot                 bigint               null comment 'Optional. Bot through which the message was sent',
    edit_date               bigint unsigned      null comment 'Date the message was last edited in Unix time',
    media_group_id          text                 null comment 'The unique identifier of a media message group this message belongs to',
    author_signature        text                 null comment 'Signature of the post author for messages in channels',
    text                    text                 null comment 'For text messages, the actual UTF-8 text of the message max message length 4096 char utf8mb4',
    entities                text                 null comment 'For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text',
    caption_entities        text                 null comment 'For messages with a caption, special entities like usernames, URLs, bot commands, etc. that appear in the caption',
    audio                   text                 null comment 'Audio object. Message is an audio file, information about the file',
    document                text                 null comment 'Document object. Message is a general file, information about the file',
    animation               text                 null comment 'Message is an animation, information about the animation',
    game                    text                 null comment 'Game object. Message is a game, information about the game',
    photo                   text                 null comment 'Array of PhotoSize objects. Message is a photo, available sizes of the photo',
    sticker                 text                 null comment 'Sticker object. Message is a sticker, information about the sticker',
    video                   text                 null comment 'Video object. Message is a video, information about the video',
    voice                   text                 null comment 'Voice Object. Message is a Voice, information about the Voice',
    video_note              text                 null comment 'VoiceNote Object. Message is a Video Note, information about the Video Note',
    caption                 text                 null comment 'For message with caption, the actual UTF-8 text of the caption',
    contact                 text                 null comment 'Contact object. Message is a shared contact, information about the contact',
    location                text                 null comment 'Location object. Message is a shared location, information about the location',
    venue                   text                 null comment 'Venue object. Message is a Venue, information about the Venue',
    poll                    text                 null comment 'Poll object. Message is a native poll, information about the poll',
    dice                    text                 null comment 'Message is a dice with random value from 1 to 6',
    new_chat_members        text                 null comment 'List of unique user identifiers, new member(s) were added to the group, information about them (one of these members may be the bot itself)',
    left_chat_member        bigint               null comment 'Unique user identifier, a member was removed from the group, information about them (this member may be the bot itself)',
    new_chat_title          char(255)            null comment 'A chat title was changed to this value',
    new_chat_photo          text                 null comment 'Array of PhotoSize objects. A chat photo was change to this value',
    delete_chat_photo       tinyint(1) default 0 null comment 'Informs that the chat photo was deleted',
    group_chat_created      tinyint(1) default 0 null comment 'Informs that the group has been created',
    supergroup_chat_created tinyint(1) default 0 null comment 'Informs that the supergroup has been created',
    channel_chat_created    tinyint(1) default 0 null comment 'Informs that the channel chat has been created',
    migrate_to_chat_id      bigint               null comment 'Migrate to chat identifier. The group has been migrated to a supergroup with the specified identifier',
    migrate_from_chat_id    bigint               null comment 'Migrate from chat identifier. The supergroup has been migrated from a group with the specified identifier',
    pinned_message          text                 null comment 'Message object. Specified message was pinned',
    invoice                 text                 null comment 'Message is an invoice for a payment, information about the invoice',
    successful_payment      text                 null comment 'Message is a service message about a successful payment, information about the payment',
    connected_website       text                 null comment 'The domain name of the website on which the user has logged in.',
    passport_data           text                 null comment 'Telegram Passport data',
    reply_markup            text                 null comment 'Inline keyboard attached to the message',
    primary key (chat_id, id),
    constraint message_ibfk_1
        foreign key (user_id) references user (id),
    constraint message_ibfk_2
        foreign key (chat_id) references chat (id),
    constraint message_ibfk_3
        foreign key (forward_from) references user (id),
    constraint message_ibfk_4
        foreign key (forward_from_chat) references chat (id),
    constraint message_ibfk_5
        foreign key (reply_to_chat, reply_to_message) references message (chat_id, id),
    constraint message_ibfk_6
        foreign key (via_bot) references user (id),
    constraint message_ibfk_7
        foreign key (left_chat_member) references user (id)
)
    collate = utf8mb4_unicode_520_ci;

create index forward_from
    on message (forward_from);

create index forward_from_chat
    on message (forward_from_chat);

create index left_chat_member
    on message (left_chat_member);

create index migrate_from_chat_id
    on message (migrate_from_chat_id);

create index migrate_to_chat_id
    on message (migrate_to_chat_id);

create index reply_to_chat
    on message (reply_to_chat);

create index reply_to_chat_2
    on message (reply_to_chat, reply_to_message);

create index reply_to_message
    on message (reply_to_message);

create index user_id
    on message (user_id);

create index via_bot
    on message (via_bot);

