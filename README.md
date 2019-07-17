# hectormartinezdev.python

[![pipeline status](https://gitlab.com/hectormartinez/hectormartinezdev.python/badges/master/pipeline.svg?style=flat-square)](https://gitlab.com/hectormartinez/hectormartinezdev.python/commits/master)

Installs Python from sources with dependencies such as ssl, tk, readline, zlib, etc.
It downloads the sources at `/opt/sources/python/` and it installs at `/opt/software/python/`.

# Variables

```yaml
---
# Version to install
py_version: 3.7.0

# Dependencies
py_apt_deps:
  - build-essential
  - libssl-dev
  - libreadline-dev
  - libsqlite3-dev
  - libtinfo-dev
  - zlib1g-dev
  - tcl-dev
  - tk-dev
  - blt-dev
  - libffi-dev
  - libbz2-dev

```

## Usage

Add `hectormartinezdev.python` to your dependencies and your playbooks.

```yaml
---
- hosts: all
  vars:
    py_version: 3.7.0

  roles:
    - hectormartinezdev.python
```

## License

MIT

## Author Information

Hector Martinez Lopez
