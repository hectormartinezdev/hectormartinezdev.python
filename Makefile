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
	ansible-playbook tests/playbook.yml --syntax

check: ## Run ansible-playbook --check
	ansible-playbook tests/playbook.yml --check

test: ## Adapt the tests if GITLAB_CI is true
ifeq ($(GITLAB_CI),true)
	ansible-playbook tests/playbook.yml
else
	ansible-playbook tests/playbook.yml
endif
