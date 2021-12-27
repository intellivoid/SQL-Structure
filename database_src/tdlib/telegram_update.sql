create table if not exists telegram_update
(
    id                        bigint unsigned not null comment 'Update''s unique identifier'
        primary key,
    chat_id                   bigint          null comment 'Unique chat identifier',
    message_id                bigint unsigned null comment 'New incoming message of any kind - text, photo, sticker, etc.',
    edited_message_id         bigint unsigned null comment 'New version of a message that is known to the bot and was edited',
    channel_post_id           bigint unsigned null comment 'New incoming channel post of any kind - text, photo, sticker, etc.',
    edited_channel_post_id    bigint unsigned null comment 'New version of a channel post that is known to the bot and was edited',
    inline_query_id           bigint unsigned null comment 'New incoming inline query',
    chosen_inline_result_id   bigint unsigned null comment 'The result of an inline query that was chosen by a user and sent to their chat partner',
    callback_query_id         bigint unsigned null comment 'New incoming callback query',
    shipping_query_id         bigint unsigned null comment 'New incoming shipping query. Only for invoices with flexible price',
    pre_checkout_query_id     bigint unsigned null comment 'New incoming pre-checkout query. Contains full information about checkout',
    poll_id                   bigint unsigned null comment 'New poll state. Bots receive only updates about polls, which are sent or stopped by the bot',
    poll_answer_poll_id       bigint unsigned null comment 'A user changed their answer in a non-anonymous poll. Bots receive new votes only in polls that were sent by the bot itself.',
    my_chat_member_updated_id bigint unsigned null comment 'The bot''s chat member status was updated in a chat. For private chats, this update is received only when the bot is blocked or unblocked by the user.',
    chat_member_updated_id    bigint unsigned null comment 'A chat member''s status was updated in a chat. The bot must be an administrator in the chat and must explicitly specify “chat_member” in the list of allowed_updates to receive these updates.',
    chat_join_request_id      bigint unsigned null comment 'A request to join the chat has been sent',
    constraint telegram_update_ibfk_1
        foreign key (chat_id, message_id) references message (chat_id, id),
    constraint telegram_update_ibfk_10
        foreign key (poll_id) references poll (id),
    constraint telegram_update_ibfk_11
        foreign key (poll_answer_poll_id) references poll_answer (poll_id),
    constraint telegram_update_ibfk_12
        foreign key (my_chat_member_updated_id) references chat_member_updated (id),
    constraint telegram_update_ibfk_13
        foreign key (chat_member_updated_id) references chat_member_updated (id),
    constraint telegram_update_ibfk_14
        foreign key (chat_join_request_id) references chat_join_request (id),
    constraint telegram_update_ibfk_2
        foreign key (edited_message_id) references edited_message (id),
    constraint telegram_update_ibfk_3
        foreign key (chat_id, channel_post_id) references message (chat_id, id),
    constraint telegram_update_ibfk_4
        foreign key (edited_channel_post_id) references edited_message (id),
    constraint telegram_update_ibfk_5
        foreign key (inline_query_id) references inline_query (id),
    constraint telegram_update_ibfk_6
        foreign key (chosen_inline_result_id) references chosen_inline_result (id),
    constraint telegram_update_ibfk_7
        foreign key (callback_query_id) references callback_query (id),
    constraint telegram_update_ibfk_8
        foreign key (shipping_query_id) references shipping_query (id),
    constraint telegram_update_ibfk_9
        foreign key (pre_checkout_query_id) references pre_checkout_query (id)
)
    collate = utf8mb4_unicode_520_ci;

create index callback_query_id
    on telegram_update (callback_query_id);

create index channel_post_id
    on telegram_update (channel_post_id);

create index chat_id
    on telegram_update (chat_id, channel_post_id);

create index chat_join_request_id
    on telegram_update (chat_join_request_id);

create index chat_member_updated_id
    on telegram_update (chat_member_updated_id);

create index chat_message_id
    on telegram_update (chat_id, message_id);

create index chosen_inline_result_id
    on telegram_update (chosen_inline_result_id);

create index edited_channel_post_id
    on telegram_update (edited_channel_post_id);

create index edited_message_id
    on telegram_update (edited_message_id);

create index inline_query_id
    on telegram_update (inline_query_id);

create index message_id
    on telegram_update (message_id);

create index my_chat_member_updated_id
    on telegram_update (my_chat_member_updated_id);

create index poll_answer_poll_id
    on telegram_update (poll_answer_poll_id);

create index poll_id
    on telegram_update (poll_id);

create index pre_checkout_query_id
    on telegram_update (pre_checkout_query_id);

create index shipping_query_id
    on telegram_update (shipping_query_id);

