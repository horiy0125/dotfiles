.PHONY: setup-wsl2
setup-wsl2:
	sh scripts/setup-wsl2.sh

.PHONY: setup-macos
setup-macos:
	sh scripts/setup-macos.sh

.PHONY: setup-pip3
setup-pip3:
	sh pip3/setup.sh
