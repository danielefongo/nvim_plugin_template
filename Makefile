.PHONY: init
init:
	bash ./scripts/init

.PHONY: test
test: plenary
	bash ./scripts/test $(test)

.PHONY: lint
lint:
	luacheck lua/my_plugin

.PHONY: stylua
stylua:
	stylua --color always --check lua

.PHONY: stylua-fix
stylua-fix:
	stylua lua

.PHONY: plenary
plenary:
	if [ -d plenary.nvim ]; then cd plenary.nvim && git pull; \
		else git clone https://github.com/nvim-lua/plenary.nvim; fi

.PHONY: testcov
testcov:
	touch luacov.stats.out
	SEQUENTIAL=1 TEST_COV=1 $(MAKE) --no-print-directory test
	@luacov-console lua/my_plugin
	@luacov-console -s
	@luacov

.PHONY: testcov-html
testcov-html:
	NOCLEAN=1 $(MAKE) --no-print-directory testcov
	luacov -r html
	xdg-open luacov-html/index.html
