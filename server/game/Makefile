PROJECT = game
PROJECT_DESCRIPTION = server game
PROJECT_VERSION = 0.1

DEPS = lager
dep_lager = git https://github.com/erlang-lager/lager.git master

LOCAL_DEPS = sasl

ERLC_OPTS += +'{parse_transform, lager_transform}'

include erlang.mk

