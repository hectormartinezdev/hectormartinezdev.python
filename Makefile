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
	ansible-playbook -i localhost, -c local tests/playbook.yml --syntax-check

install: ## Install the role locally
	ansible-playbook tests/playbook.yml

test: lint## Adapt the tests if GITLAB_CI is true
ifeq ($(GITLAB_CI),true)
	ansible-playbook tests/playbook.yml
else
ifeq (, $(shell which docker))
	$(error "'docker' in found in PATH, can not run the test in local.")
else
	docker run --rm -it -v $(PWD):/$(shell basename $(PWD)) -w /$(shell basename $(PWD)) python /bin/bash -c "pip --quiet install ansible &&  ansible-playbook -i 'localhost,' -c local tests/playbook.yml"
endif
endif
