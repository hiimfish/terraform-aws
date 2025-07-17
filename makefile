export TENV_AUTO_INSTALL=true

.PHONY: hello
hello:
	echo "Hello, World!"

BREW_PACKAGES := cosign tenv terraform-docs tflint checkov trivy
CHOCOLATEY_PACKAGES := cosign tenv terraform-docs tflint trivy
 
INSTALLER_PATH := $(shell { command -v brew || command -v choco; } 2>/dev/null)
INSTALLER := $(shell { basename $(INSTALLER_PATH) ; } 2>/dev/null)
 
.PHONY: install
install: install_$(INSTALLER)
 
.PHONY: install_brew
install_brew:
	brew tap tofuutils/tap
	brew install $(BREW_PACKAGES)
 
.PHONY: install_choco
install_choco:
	choco install $(CHOCOLATEY_PACKAGES)
 
.PHONY: install_
install_:
	echo "No package manager found."

TF_ENGINE:=terraform
 
ifeq ($(TF_ENGINE), terraform)
	TF_BINARY:=terraform
else ifeq ($(TF_ENGINE), opentofu)
	TF_BINARY:=tofu
endif
 
.PHONY: precommit_install
precommit_install:
	pre-commit install

.terraform:
	$(TF_BINARY) init -backend=false
 
.PHONY: test_validation
test_validation: .terraform
	$(TF_BINARY) validate

.PHONY: terratest
terratest:
	@echo "Not yet implemented."
 
.PHONY: terraform_test
terraform_test:
	@echo "Not yet implemented."

.PHONY: test_tflint
test_tflint:
	tflint --init
	tflint

.PHONY: security
security: test_checkov test_trivy
 
.PHONY: test_checkov
test_checkov:
	checkov --directory .
 
.PHONY: test_trivy
test_trivy:
	trivy config .

.PHONY: chores
chores: documentation format

.PHONY: documentation
documentation:
	terraform-docs -c .terraform-docs.yml .
 
.PHONY: test_documentation
test_documentation:
	terraform-docs -c .terraform-docs.yml --output-check .

.PHONY: format
format:
	$(TF_BINARY) fmt -recursive .
 
.PHONY: test_format
test_format:
	$(TF_BINARY) fmt -check -recursive .

.PHONY: tflint_fix
tflint_fix:
	tflint --init
	tflint --fix
 
.PHONY: test_tflint
test_tflint:
	tflint --init
	tflint