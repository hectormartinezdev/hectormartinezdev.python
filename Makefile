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

help:  ## Show this message and exit
	@echo Make usage:
	@echo
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

lint: ## Run yamllint, ansible-lint and ansible-playbook --syntax
	yamllint . --strict
	ansible-lint . -v
	ansible-playbook tests/playbook.yml --syntax-check

install: ## Install the role locally
	ansible-playbook tests/playbook.yml

test: lint## Adapt the tests if GITLAB_CI is true
ifeq ($(GITLAB_CI),true)
	ansible-playbook tests/playbook.yml
else
	@echo This rule only applies to GITLAB_CI environment. Use \"make install\" to run the role.
endif
