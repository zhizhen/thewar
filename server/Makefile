# See README.md for more information.

PROJECT = goddess

DIALYZER = dialyzer
REBAR = ./rebar


all: app

# Application.
release: config proto app

config:
	@echo "========================================================="
	@echo "=  config                                               ="
	@echo "========================================================="
	bash scripts/build_config.sh

proto:
	@echo "========================================================="
	@echo "=  protocol                                             ="
	@echo "========================================================="
	bash scripts/build_proto.sh

deps:
	@$(REBAR) get-deps

# app: deps
app:
	@echo "========================================================="
	@echo "=  server                                               ="
	@echo "========================================================="

	@$(REBAR) compile


clean:
	@$(REBAR) clean
	rm -f test/*.beam
	rm -f logs/*.log
	rm -f logs/erl_crash_*.dump

docs: clean-docs
	@$(REBAR) doc skip_deps=true

clean-docs:
	rm -f doc/*.css
	rm -f doc/*.html
	rm -f doc/*.png
	rm -f doc/edoc-info

# Tests.

tests: clean app eunit ct

eunit:
	@$(REBAR) -C rebar.tests.config eunit skip_deps=true

ct:
	@$(REBAR) -C rebar.tests.config ct skip_deps=true

# Dialyzer.

build-plt:
	@$(DIALYZER) --build_plt --output_plt .$(PROJECT).plt \
		--apps kernel stdlib sasl inets

dialyze:
	@$(DIALYZER) --src src --plt .$(PROJECT).plt \
		-Werror_handling -Wrace_conditions -Wunmatched_returns # -Wunderspecs

