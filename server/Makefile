REBAR = rebar
DIALYZER = dialyzer

DIALYZER_WARNINGS = -Wunmatched_returns -Werror_handling \
					-Wrace_conditions -Wunderspecs

.PHONY: all compile test clean get-deps build-plt dialyze

all: compile

compile:
	@$(REBAR) compile

clean:
	@$(REBAR) clean

get-deps:
	@$(REBAR) get-deps
