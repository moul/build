VERSION ?= dev:latest

.PHONY: validate
validate:
	circleci orb validate .circleci/config.yml

.PHONY: publish
publish: validate
	circleci orb publish .circleci/config.yml moul/build@${VERSION}
