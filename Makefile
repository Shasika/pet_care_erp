.PHONY: check php-lint docs-check

check: php-lint docs-check

php-lint:
	find backend -name '*.php' -print0 | xargs -0 -n1 php -l

docs-check:
	test -f README.md
	test -f docs/architecture.md
	test -f docs/modules.md
	test -f docs/api-overview.md
	test -f docs/testing.md
	test -f docs/deployment.md
