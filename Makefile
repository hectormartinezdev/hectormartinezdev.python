.PHONY: help syntax test
.DEFAULT_GOAL := help

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("\t%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

help:
	@echo Make usage:
	@echo
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

syntax: ## Runs ansible-playbook --syntax
	ansible-playbook tests/playbook.yml -i tests/inventory --syntax

check: ## Run ansible-playbook --check
	ansible-playbook tests/playbook.yml -i tests/inventory --check

test: ## Autodetect if we are on GitLab CI or in local and run test accordlingly
ifdef GITLAB_CI
	@echo GITLAB_CI TEST
else
	@echo LOCAL TEST
endif
