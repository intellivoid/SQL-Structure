create table if not exists large_generalization
(
    id                     int(255) auto_increment comment 'Unique Internal Database ID',
    public_id              varchar(256) null comment 'Unique public Large Generalization ID',
    max_probabilities      int(255)     null comment 'The max amount of probabilites are allowed for each probability object',
    probabilities          mediumblob   null comment 'ZiProto encoded array blob of the probabilities and each of their respective pointers',
    top_label              varchar(255) null comment 'The label of the top results',
    top_probability        float        null comment 'The probability of the top result',
    created_timestamp      int(255)     null comment 'The Unix Timestamp of when this row was created',
    last_updated_timestamp int(255)     null comment 'The Unix Timestamp of when this record was last updated',
    constraint large_generalization_id_uindex
        unique (id),
    constraint large_generalization_public_id_uindex
        unique (public_id)
)
    comment 'Table for storing and predicting large generalization results';

alter table large_generalization
    add primary key (id);


