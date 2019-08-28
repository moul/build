VERSION ?= `git describe --tags --abbrev=0 | sed s/^v//`

.PHONY: validate
validate:
	circleci orb validate .circleci/config.yml
	circleci config validate

.PHONY: publish
publish: validate
	set -xe; circleci orb publish .circleci/config.yml moul/build@${VERSION}
