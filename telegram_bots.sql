create table if not exists telegram.chat
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
    on telegram.chat (old_id);

create table if not exists telegram.poll
(
    id                      bigint unsigned      not null comment 'Unique poll identifier'
        primary key,
    question                char(255)            not null comment 'Poll question',
    options                 text                 not null comment 'List of poll options',
    total_voter_count       int unsigned         null comment 'Total number of users that voted in the poll',
    is_closed               tinyint(1) default 0 null comment 'True, if the poll is closed',
    is_anonymous            tinyint(1) default 1 null comment 'True, if the poll is anonymous',
    type                    char(255)            null comment 'Poll type, currently can be “regular” or “quiz”',
    allows_multiple_answers tinyint(1) default 0 null comment 'True, if the poll allows multiple answers',
    correct_option_id       int unsigned         null comment '0-based identifier of the correct answer option. Available only for polls in the quiz mode, which are closed, or was sent (not forwarded) by the bot or to the private chat with the bot.',
    explanation             varchar(255)         null comment 'Text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, 0-200 characters',
    explanation_entities    text                 null comment 'Special entities like usernames, URLs, bot commands, etc. that appear in the explanation',
    open_period             int unsigned         null comment 'Amount of time in seconds the poll will be active after creation',
    close_date              timestamp            null comment 'Point in time (Unix timestamp) when the poll will be automatically closed',
    created_at              timestamp            null comment 'Entry date creation'
)
    collate = utf8mb4_unicode_520_ci;

create table if not exists telegram.poll_answer
(
    poll_id    bigint unsigned not null comment 'Unique poll identifier',
    user_id    bigint          not null comment 'The user, who changed the answer to the poll',
    option_ids text            not null comment '0-based identifiers of answer options, chosen by the user. May be empty if the user retracted their vote.',
    created_at timestamp       null comment 'Entry date creation',
    primary key (poll_id, user_id),
    constraint poll_answer_ibfk_1
        foreign key (poll_id) references telegram.poll (id)
)
    collate = utf8mb4_unicode_520_ci;

create table if not exists telegram.user
(
    id            bigint                not null comment 'Unique identifier for this user or bot'
        primary key,
    is_bot        tinyint(1) default 0  null comment 'True, if this user is a bot',
    first_name    char(255)  default '' not null comment 'User''s or bot''s first name',
    last_name     char(255)             null comment 'User''s or bot''s last name',
    username      char(191)             null comment 'User''s or bot''s username',
    language_code char(10)              null comment 'IETF language tag of the user''s language',
    created_at    timestamp             null comment 'Entry date creation',
    updated_at    timestamp             null comment 'Entry date update'
)
    collate = utf8mb4_unicode_520_ci;

create table if not exists telegram.chosen_inline_result
(
    id                bigint unsigned auto_increment comment 'Unique identifier for this entry'
        primary key,
    result_id         char(255) default '' not null comment 'The unique identifier for the result that was chosen',
    user_id           bigint               null comment 'The user that chose the result',
    location          char(255)            null comment 'Sender location, only for bots that require user location',
    inline_message_id char(255)            null comment 'Identifier of the sent inline message',
    query             text                 not null comment 'The query that was used to obtain the result',
    created_at        timestamp            null comment 'Entry date creation',
    constraint chosen_inline_result_ibfk_1
        foreign key (user_id) references telegram.user (id)
)
    collate = utf8mb4_unicode_520_ci;

create index user_id
    on telegram.chosen_inline_result (user_id);

create table if not exists telegram.conversation
(
    id         bigint unsigned auto_increment comment 'Unique identifier for this entry'
        primary key,
    user_id    bigint                                                   null comment 'Unique user identifier',
    chat_id    bigint                                                   null comment 'Unique user or chat identifier',
    status     enum ('active', 'cancelled', 'stopped') default 'active' not null comment 'Conversation state',
    command    varchar(160)                            default ''       null comment 'Default command to execute',
    notes      text                                                     null comment 'Data stored from command',
    created_at timestamp                                                null comment 'Entry date creation',
    updated_at timestamp                                                null comment 'Entry date update',
    constraint conversation_ibfk_1
        foreign key (user_id) references telegram.user (id),
    constraint conversation_ibfk_2
        foreign key (chat_id) references telegram.chat (id)
)
    collate = utf8mb4_unicode_520_ci;

create index chat_id
    on telegram.conversation (chat_id);

create index status
    on telegram.conversation (status);

create index user_id
    on telegram.conversation (user_id);

create table if not exists telegram.inline_query
(
    id         bigint unsigned not null comment 'Unique identifier for this query'
        primary key,
    user_id    bigint          null comment 'Unique user identifier',
    location   char(255)       null comment 'Location of the user',
    query      text            not null comment 'Text of the query',
    offset     char(255)       null comment 'Offset of the result',
    created_at timestamp       null comment 'Entry date creation',
    constraint inline_query_ibfk_1
        foreign key (user_id) references telegram.user (id)
)
    collate = utf8mb4_unicode_520_ci;

create index user_id
    on telegram.inline_query (user_id);

create table if not exists telegram.message
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
        foreign key (user_id) references telegram.user (id),
    constraint message_ibfk_2
        foreign key (chat_id) references telegram.chat (id),
    constraint message_ibfk_3
        foreign key (forward_from) references telegram.user (id),
    constraint message_ibfk_4
        foreign key (forward_from_chat) references telegram.chat (id),
    constraint message_ibfk_5
        foreign key (reply_to_chat, reply_to_message) references telegram.message (chat_id, id),
    constraint message_ibfk_6
        foreign key (via_bot) references telegram.user (id),
    constraint message_ibfk_7
        foreign key (left_chat_member) references telegram.user (id)
)
    collate = utf8mb4_unicode_520_ci;

create table if not exists telegram.callback_query
(
    id                bigint unsigned      not null comment 'Unique identifier for this query'
        primary key,
    user_id           bigint               null comment 'Unique user identifier',
    chat_id           bigint               null comment 'Unique chat identifier',
    message_id        bigint unsigned      null comment 'Unique message identifier',
    inline_message_id char(255)            null comment 'Identifier of the message sent via the bot in inline mode, that originated the query',
    chat_instance     char(255) default '' not null comment 'Global identifier, uniquely corresponding to the chat to which the message with the callback button was sent',
    data              char(255) default '' not null comment 'Data associated with the callback button',
    game_short_name   char(255) default '' not null comment 'Short name of a Game to be returned, serves as the unique identifier for the game',
    created_at        timestamp            null comment 'Entry date creation',
    constraint callback_query_ibfk_1
        foreign key (user_id) references telegram.user (id),
    constraint callback_query_ibfk_2
        foreign key (chat_id, message_id) references telegram.message (chat_id, id)
)
    collate = utf8mb4_unicode_520_ci;

create index chat_id
    on telegram.callback_query (chat_id);

create index chat_id_2
    on telegram.callback_query (chat_id, message_id);

create index message_id
    on telegram.callback_query (message_id);

create index user_id
    on telegram.callback_query (user_id);

create table if not exists telegram.edited_message
(
    id         bigint unsigned auto_increment comment 'Unique identifier for this entry'
        primary key,
    chat_id    bigint          null comment 'Unique chat identifier',
    message_id bigint unsigned null comment 'Unique message identifier',
    user_id    bigint          null comment 'Unique user identifier',
    edit_date  timestamp       null comment 'Date the message was edited in timestamp format',
    text       text            null comment 'For text messages, the actual UTF-8 text of the message max message length 4096 char utf8',
    entities   text            null comment 'For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text',
    caption    text            null comment 'For message with caption, the actual UTF-8 text of the caption',
    constraint edited_message_ibfk_1
        foreign key (chat_id) references telegram.chat (id),
    constraint edited_message_ibfk_2
        foreign key (chat_id, message_id) references telegram.message (chat_id, id),
    constraint edited_message_ibfk_3
        foreign key (user_id) references telegram.user (id)
)
    collate = utf8mb4_unicode_520_ci;

create index chat_id
    on telegram.edited_message (chat_id);

create index chat_id_2
    on telegram.edited_message (chat_id, message_id);

create index message_id
    on telegram.edited_message (message_id);

create index user_id
    on telegram.edited_message (user_id);

create index forward_from
    on telegram.message (forward_from);

create index forward_from_chat
    on telegram.message (forward_from_chat);

create index left_chat_member
    on telegram.message (left_chat_member);

create index migrate_from_chat_id
    on telegram.message (migrate_from_chat_id);

create index migrate_to_chat_id
    on telegram.message (migrate_to_chat_id);

create index reply_to_chat
    on telegram.message (reply_to_chat);

create index reply_to_chat_2
    on telegram.message (reply_to_chat, reply_to_message);

create index reply_to_message
    on telegram.message (reply_to_message);

create index user_id
    on telegram.message (user_id);

create index via_bot
    on telegram.message (via_bot);

create table if not exists telegram.pre_checkout_query
(
    id                 bigint unsigned      not null comment 'Unique query identifier'
        primary key,
    user_id            bigint               null comment 'User who sent the query',
    currency           char(3)              null comment 'Three-letter ISO 4217 currency code',
    total_amount       bigint               null comment 'Total price in the smallest units of the currency',
    invoice_payload    char(255) default '' not null comment 'Bot specified invoice payload',
    shipping_option_id char(255)            null comment 'Identifier of the shipping option chosen by the user',
    order_info         text                 null comment 'Order info provided by the user',
    created_at         timestamp            null comment 'Entry date creation',
    constraint pre_checkout_query_ibfk_1
        foreign key (user_id) references telegram.user (id)
)
    collate = utf8mb4_unicode_520_ci;

create index user_id
    on telegram.pre_checkout_query (user_id);

create table if not exists telegram.shipping_query
(
    id               bigint unsigned      not null comment 'Unique query identifier'
        primary key,
    user_id          bigint               null comment 'User who sent the query',
    invoice_payload  char(255) default '' not null comment 'Bot specified invoice payload',
    shipping_address char(255) default '' not null comment 'User specified shipping address',
    created_at       timestamp            null comment 'Entry date creation',
    constraint shipping_query_ibfk_1
        foreign key (user_id) references telegram.user (id)
)
    collate = utf8mb4_unicode_520_ci;

create index user_id
    on telegram.shipping_query (user_id);

create table if not exists telegram.telegram_update
(
    id                      bigint unsigned not null comment 'Update''s unique identifier'
        primary key,
    chat_id                 bigint          null comment 'Unique chat identifier',
    message_id              bigint unsigned null comment 'New incoming message of any kind - text, photo, sticker, etc.',
    edited_message_id       bigint unsigned null comment 'New version of a message that is known to the bot and was edited',
    channel_post_id         bigint unsigned null comment 'New incoming channel post of any kind - text, photo, sticker, etc.',
    edited_channel_post_id  bigint unsigned null comment 'New version of a channel post that is known to the bot and was edited',
    inline_query_id         bigint unsigned null comment 'New incoming inline query',
    chosen_inline_result_id bigint unsigned null comment 'The result of an inline query that was chosen by a user and sent to their chat partner',
    callback_query_id       bigint unsigned null comment 'New incoming callback query',
    shipping_query_id       bigint unsigned null comment 'New incoming shipping query. Only for invoices with flexible price',
    pre_checkout_query_id   bigint unsigned null comment 'New incoming pre-checkout query. Contains full information about checkout',
    poll_id                 bigint unsigned null comment 'New poll state. Bots receive only updates about polls, which are sent or stopped by the bot',
    poll_answer_poll_id     bigint unsigned null comment 'A user changed their answer in a non-anonymous poll. Bots receive new votes only in polls that were sent by the bot itself.',
    constraint telegram_update_ibfk_1
        foreign key (chat_id, message_id) references telegram.message (chat_id, id),
    constraint telegram_update_ibfk_10
        foreign key (poll_id) references telegram.poll (id),
    constraint telegram_update_ibfk_11
        foreign key (poll_answer_poll_id) references telegram.poll_answer (poll_id),
    constraint telegram_update_ibfk_2
        foreign key (edited_message_id) references telegram.edited_message (id),
    constraint telegram_update_ibfk_3
        foreign key (chat_id, channel_post_id) references telegram.message (chat_id, id),
    constraint telegram_update_ibfk_4
        foreign key (edited_channel_post_id) references telegram.edited_message (id),
    constraint telegram_update_ibfk_5
        foreign key (inline_query_id) references telegram.inline_query (id),
    constraint telegram_update_ibfk_6
        foreign key (chosen_inline_result_id) references telegram.chosen_inline_result (id),
    constraint telegram_update_ibfk_7
        foreign key (callback_query_id) references telegram.callback_query (id),
    constraint telegram_update_ibfk_8
        foreign key (shipping_query_id) references telegram.shipping_query (id),
    constraint telegram_update_ibfk_9
        foreign key (pre_checkout_query_id) references telegram.pre_checkout_query (id)
)
    collate = utf8mb4_unicode_520_ci;

create index callback_query_id
    on telegram.telegram_update (callback_query_id);

create index channel_post_id
    on telegram.telegram_update (channel_post_id);

create index chat_id
    on telegram.telegram_update (chat_id, channel_post_id);

create index chat_message_id
    on telegram.telegram_update (chat_id, message_id);

create index chosen_inline_result_id
    on telegram.telegram_update (chosen_inline_result_id);

create index edited_channel_post_id
    on telegram.telegram_update (edited_channel_post_id);

create index edited_message_id
    on telegram.telegram_update (edited_message_id);

create index inline_query_id
    on telegram.telegram_update (inline_query_id);

create index message_id
    on telegram.telegram_update (message_id);

create index poll_answer_poll_id
    on telegram.telegram_update (poll_answer_poll_id);

create index poll_id
    on telegram.telegram_update (poll_id);

create index pre_checkout_query_id
    on telegram.telegram_update (pre_checkout_query_id);

create index shipping_query_id
    on telegram.telegram_update (shipping_query_id);

create index username
    on telegram.user (username);

create table if not exists telegram.user_chat
(
    user_id bigint not null comment 'Unique user identifier',
    chat_id bigint not null comment 'Unique user or chat identifier',
    primary key (user_id, chat_id),
    constraint user_chat_ibfk_1
        foreign key (user_id) references telegram.user (id)
            on update cascade on delete cascade,
    constraint user_chat_ibfk_2
        foreign key (chat_id) references telegram.chat (id)
            on update cascade on delete cascade
)
    collate = utf8mb4_unicode_520_ci;

create index chat_id
    on telegram.user_chat (chat_id);


