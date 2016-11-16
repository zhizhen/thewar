PROJECT = gate
PROJECT_DESCRIPTION = server gate
PROJECT_VERSION = 0.1

DEPS = lager cowboy ranch
dep_lager = git https://github.com/erlang-lager/lager.git master
dep_cowboy = git https://github.com/ninenines/cowboy.git master
dep_ranch = git https://github.com/ninenines/ranch.git master

LOCAL_DEPS = sasl

ERLC_OPTS += +'{parse_transform, lager_transform}'

include erlang.mk

