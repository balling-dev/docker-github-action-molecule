# docker-github-action-molecule

**NOTE:** this is a fork of
[docker-github-action-molecule](https://github.com/robertdebock/docker-github-action-molecule)
updated to be based on Ubuntu instead of Fedora. All credit and sponsoring
should go to [Robert de Bock](https://github.com/robertdebock) for making this
available.

An image used for [GitHub actions
molecule](https://github.com/balling-dev/molecule-action).

The image contains:

- [ansible](https://ansible.com/) - Used to run the tests.
- [ansible-lint](https://ansible.readthedocs.io/projects/lint/usage/) - A
  command-line tool for linting playbooks, roles and collections aimed towards
  any Ansible users.
- [docker](https://www.docker.com/) - Used by molecule to start instances using
  the `docker` driver.
- [molecule](https://ansible.readthedocs.io/projects/molecule/) - Used to
orchestrate the tests.
[molecule-plugins](https://github.com/ansible-community/molecule-plugins) are
installed too.
- [tox](https://tox.readthedocs.io/en/latest/) - Used to test multiple version
  of ansible if `tox.ini` exists.
- [testinfra](https://testinfra.readthedocs.io/en/latest/) - Used to test the
  instances.
- [yamllint](https://yamllint.readthedocs.io/en/stable/) - Used to lint YAML
  files.
- rsync, required in some cases for Molecule.
- Linux tools like `docker`, `gcc`, `git` (core), `python3-*` and `rsync` are
  installed too.

The default behaviour is to:

- See if `tox.ini` exists -> Run `tox`
- Otherwise -> Run `molecule test`
- Retry either (`tox` or `molecule`) 3 times.
- Run `test` if `command` is not set.
- Test the `default` scenario if `scenario` in not set.

Read how to [test locally](TESTING.md).

## [Author Information](#author-information)

This role is adapted from
[docker-github-action-molecule](https://github.com/robertdebock/docker-github-action-molecule)
by [robertdebock](https://robertdebock.nl/). Please consider [sponsoring
robertdebock](https://github.com/sponsors/robertdebock).
