clean:
	rm -rf build

all:
	make all_intellivoid all_socialvoid all_tdlib
	rm -f build/all.sql
	touch build/all.sql
	cat build/intellivoid.sql >> build/all.sql
	cat build/socialvoid.sql >> build/all.sql
	cat build/tdlib.sql >> build/all.sql

all_intellivoid:
	make coffeehouse intellivoid intellivoid_api intellivoid_suite khm openblu spam_protection
	rm -f build/intellivoid.sql
	touch build/intellivoid.sql
	cat build/intellivoid/coffeehouse.sql >> build/intellivoid.sql
	cat build/intellivoid/intellivoid.sql >> build/intellivoid.sql
	cat build/intellivoid/intellivoid_api.sql >> build/intellivoid.sql
	cat build/intellivoid/intellivoid_suite.sql >> build/intellivoid.sql
	cat build/intellivoid/khm.sql >> build/intellivoid.sql
	cat build/intellivoid/openblu.sql >> build/intellivoid.sql
	cat build/intellivoid/spam_protection.sql >> build/intellivoid.sql

all_socialvoid:
	make socialvoid_master socialvoid_slave
	rm -f build/socialvoid.sql
	touch build/socialvoid.sql
	cat build/socialvoid/socialvoid_master.sql >> build/socialvoid.sql
	cat build/socialvoid/socialvoid_slave.sql >> build/socialvoid.sql

all_tdlib:
	make tdlib tdlib_spamprotectionbot tdlib_intellivoidbot
	rm -f build/tdlib.sql
	touch build/tdlib.sql
	cat build/tdlib/spamprotectionbot.sql >> build/tdlib.sql
	cat build/tdlib/intellivoidbot.sql >> build/tdlib.sql

coffeehouse:
	@mkdir -p build
	@mkdir -p build/intellivoid
	rm -f build/intellivoid/coffeehouse.sql
	touch build/intellivoid/coffeehouse.sql
	cat database_src/intellivoid/coffeehouse/database.sql >> build/intellivoid/coffeehouse.sql
	cat database_src/intellivoid/coffeehouse/chat_dialogs.sql >> build/intellivoid/coffeehouse.sql
	cat database_src/intellivoid/coffeehouse/cookies.sql >> build/intellivoid/coffeehouse.sql
	cat database_src/intellivoid/coffeehouse/foreign_sessions.sql >> build/intellivoid/coffeehouse.sql
	cat database_src/intellivoid/coffeehouse/generalized_classification.sql >> build/intellivoid/coffeehouse.sql
	cat database_src/intellivoid/coffeehouse/language_prediction_cache.sql >> build/intellivoid/coffeehouse.sql
	cat database_src/intellivoid/coffeehouse/large_generalization.sql >> build/intellivoid/coffeehouse.sql
	cat database_src/intellivoid/coffeehouse/spam_prediction_cache.sql >> build/intellivoid/coffeehouse.sql
	cat database_src/intellivoid/coffeehouse/translate_cache.sql >> build/intellivoid/coffeehouse.sql
	cat database_src/intellivoid/coffeehouse/user_subscriptions.sql >> build/intellivoid/coffeehouse.sql

intellivoid:
	@mkdir -p build
	@mkdir -p build/intellivoid
	rm -f build/intellivoid/intellivoid.sql
	touch build/intellivoid/intellivoid.sql
	cat database_src/intellivoid/intellivoid/database.sql >> build/intellivoid/intellivoid.sql
	cat database_src/intellivoid/intellivoid/application_access.sql >> build/intellivoid/intellivoid.sql
	cat database_src/intellivoid/intellivoid/application_settings.sql >> build/intellivoid/intellivoid.sql
	cat database_src/intellivoid/intellivoid/applications.sql >> build/intellivoid/intellivoid.sql
	cat database_src/intellivoid/intellivoid/authentication_access.sql >> build/intellivoid/intellivoid.sql
	cat database_src/intellivoid/intellivoid/authentication_requests.sql >> build/intellivoid/intellivoid.sql
	cat database_src/intellivoid/intellivoid/cookies.sql >> build/intellivoid/intellivoid.sql
	cat database_src/intellivoid/intellivoid/otl_codes.sql >> build/intellivoid/intellivoid.sql
	cat database_src/intellivoid/intellivoid/pwc.sql >> build/intellivoid/intellivoid.sql
	cat database_src/intellivoid/intellivoid/subscription_plans.sql >> build/intellivoid/intellivoid.sql
	cat database_src/intellivoid/intellivoid/subscriptions.sql >> build/intellivoid/intellivoid.sql
	cat database_src/intellivoid/intellivoid/support_tickets.sql >> build/intellivoid/intellivoid.sql
	cat database_src/intellivoid/intellivoid/telegram_clients.sql >> build/intellivoid/intellivoid.sql
	cat database_src/intellivoid/intellivoid/telegram_verification_codes.sql >> build/intellivoid/intellivoid.sql
	cat database_src/intellivoid/intellivoid/tracking_user_agents.sql >> build/intellivoid/intellivoid.sql
	cat database_src/intellivoid/intellivoid/transaction_records.sql >> build/intellivoid/intellivoid.sql
	cat database_src/intellivoid/intellivoid/user_logins.sql >> build/intellivoid/intellivoid.sql
	cat database_src/intellivoid/intellivoid/users.sql >> build/intellivoid/intellivoid.sql
	cat database_src/intellivoid/intellivoid/users_audit.sql >> build/intellivoid/intellivoid.sql
	cat database_src/intellivoid/intellivoid/users_known_hosts.sql >> build/intellivoid/intellivoid.sql

intellivoid_api:
	@mkdir -p build
	@mkdir -p build/intellivoid
	rm -f build/intellivoid/intellivoid_api.sql
	touch build/intellivoid/intellivoid_api.sql
	cat database_src/intellivoid/intellivoid_api/database.sql >> build/intellivoid/intellivoid_api.sql
	cat database_src/intellivoid/intellivoid_api/access_records.sql >> build/intellivoid/intellivoid_api.sql
	cat database_src/intellivoid/intellivoid_api/exception_records.sql >> build/intellivoid/intellivoid_api.sql
	cat database_src/intellivoid/intellivoid_api/access_key_changes.sql >> build/intellivoid/intellivoid_api.sql
	cat database_src/intellivoid/intellivoid_api/request_records.sql >> build/intellivoid/intellivoid_api.sql

intellivoid_suite:
	@mkdir -p build
	@mkdir -p build/intellivoid
	rm -f build/intellivoid/intellivoid_suite.sql
	touch build/intellivoid/intellivoid_suite.sql
	cat database_src/intellivoid/intellivoid_suite/database.sql >> build/intellivoid/intellivoid_suite.sql
	cat database_src/intellivoid/intellivoid_suite/todo_tasks.sql >> build/intellivoid/intellivoid_suite.sql
	cat database_src/intellivoid/intellivoid_suite/todo_groups.sql >> build/intellivoid/intellivoid_suite.sql

khm:
	@mkdir -p build
	@mkdir -p build/intellivoid
	rm -f build/intellivoid/khm.sql
	touch build/intellivoid/khm.sql
	cat database_src/intellivoid/khm/database.sql >> build/intellivoid/khm.sql
	cat database_src/intellivoid/khm/abuse.sql >> build/intellivoid/khm.sql
	cat database_src/intellivoid/khm/devices.sql >> build/intellivoid/khm.sql
	cat database_src/intellivoid/khm/geo.sql >> build/intellivoid/khm.sql
	cat database_src/intellivoid/khm/onion.sql >> build/intellivoid/khm.sql
	cat database_src/intellivoid/khm/known_hosts.sql >> build/intellivoid/khm.sql
	cat database_src/intellivoid/khm/known_devices.sql >> build/intellivoid/khm.sql

openblu:
	@mkdir -p build
	@mkdir -p build/intellivoid
	rm -f build/intellivoid/openblu.sql
	touch build/intellivoid/openblu.sql
	cat database_src/intellivoid/openblu/database.sql >> build/intellivoid/openblu.sql
	cat database_src/intellivoid/openblu/cookies.sql >> build/intellivoid/openblu.sql
	cat database_src/intellivoid/openblu/vpns.sql >> build/intellivoid/openblu.sql
	cat database_src/intellivoid/openblu/update_records.sql >> build/intellivoid/openblu.sql
	cat database_src/intellivoid/openblu/user_subscriptions.sql >> build/intellivoid/openblu.sql

spam_protection:
	@mkdir -p build
	@mkdir -p build/intellivoid
	rm -f build/intellivoid/spam_protection.sql
	touch build/intellivoid/spam_protection.sql
	cat database_src/intellivoid/spam_protection/database.sql >> build/intellivoid/spam_protection.sql
	cat database_src/intellivoid/spam_protection/message_logs.sql >> build/intellivoid/spam_protection.sql
	cat database_src/intellivoid/spam_protection/prediction_votes.sql >> build/intellivoid/spam_protection.sql
	cat database_src/intellivoid/spam_protection/votes_due.sql >> build/intellivoid/spam_protection.sql

socialvoid_master:
	@mkdir -p build
	@mkdir -p build/socialvoid
	rm -f build/socialvoid/socialvoid_master.sql
	touch build/socialvoid/socialvoid_master.sql
	cat database_src/socialvoid_master/database.sql >> build/socialvoid/socialvoid_master.sql
	cat database_src/socialvoid_master/peers.sql >> build/socialvoid/socialvoid_master.sql
	cat database_src/socialvoid_master/peer_relations.sql >> build/socialvoid/socialvoid_master.sql
	cat database_src/socialvoid_master/telegram_cdn.sql >> build/socialvoid/socialvoid_master.sql

socialvoid_slave:
	@mkdir -p build
	@mkdir -p build/socialvoid
	rm -f build/socialvoid/socialvoid_slave.sql
	touch build/socialvoid/socialvoid_slave.sql
	cat database_src/socialvoid_slave/database.sql >> build/socialvoid/socialvoid_slave.sql
	cat database_src/socialvoid_slave/sessions.sql >> build/socialvoid/socialvoid_slave.sql
	cat database_src/socialvoid_slave/documents.sql >> build/socialvoid/socialvoid_slave.sql
	cat database_src/socialvoid_slave/captcha.sql >> build/socialvoid/socialvoid_slave.sql
	cat database_src/socialvoid_slave/peer_timelines.sql >> build/socialvoid/socialvoid_slave.sql
	cat database_src/socialvoid_slave/posts.sql >> build/socialvoid/socialvoid_slave.sql
	cat database_src/socialvoid_slave/posts_likes.sql >> build/socialvoid/socialvoid_slave.sql
	cat database_src/socialvoid_slave/posts_quotes.sql >> build/socialvoid/socialvoid_slave.sql
	cat database_src/socialvoid_slave/posts_replies.sql >> build/socialvoid/socialvoid_slave.sql
	cat database_src/socialvoid_slave/posts_reposts.sql >> build/socialvoid/socialvoid_slave.sql

tdlib:
	@mkdir -p build
	@mkdir -p build/tdlib
	rm -f build/tdlib/tdlib.sql
	touch build/tdlib/tdlib.sql
	cat database_src/tdlib/user.sql >> build/tdlib/tdlib.sql
	cat database_src/tdlib/chat.sql >> build/tdlib/tdlib.sql
	cat database_src/tdlib/user_chat.sql >> build/tdlib/tdlib.sql
	cat database_src/tdlib/inline_query.sql >> build/tdlib/tdlib.sql
	cat database_src/tdlib/chosen_inline_result.sql >> build/tdlib/tdlib.sql
	cat database_src/tdlib/message.sql >> build/tdlib/tdlib.sql
	cat database_src/tdlib/edited_message.sql >> build/tdlib/tdlib.sql
	cat database_src/tdlib/callback_query.sql >> build/tdlib/tdlib.sql
	cat database_src/tdlib/shipping_query.sql >> build/tdlib/tdlib.sql
	cat database_src/tdlib/pre_checkout_query.sql >> build/tdlib/tdlib.sql
	cat database_src/tdlib/poll.sql >> build/tdlib/tdlib.sql
	cat database_src/tdlib/poll_answer.sql >> build/tdlib/tdlib.sql
	cat database_src/tdlib/chat_member_updated.sql >> build/tdlib/tdlib.sql
	cat database_src/tdlib/chat_join_request.sql >> build/tdlib/tdlib.sql
	cat database_src/tdlib/telegram_update.sql >> build/tdlib/tdlib.sql
	cat database_src/tdlib/conversation.sql >> build/tdlib/tdlib.sql
	cat database_src/tdlib/request_limiter.sql >> build/tdlib/tdlib.sql

tdlib_spamprotectionbot:
	@mkdir -p build
	@mkdir -p build/tdlib
	rm -f build/tdlib/spamprotectionbot.sql
	touch build/tdlib/spamprotectionbot.sql
	cat database_src/tdlib/spamprotectionbot_database.sql >> build/tdlib/spamprotectionbot.sql
	cat build/tdlib/tdlib.sql >> build/tdlib/spamprotectionbot.sql

tdlib_intellivoidbot:
	@mkdir -p build
	@mkdir -p build/tdlib
	rm -f build/tdlib/intellivoidbot.sql
	touch build/tdlib/intellivoidbot.sql
	cat database_src/tdlib/intellivoidbot_database.sql >> build/tdlib/intellivoidbot.sql
	cat build/tdlib/tdlib.sql >> build/tdlib/intellivoidbot.sql