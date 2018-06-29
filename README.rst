hmarlo.python
=============

.. image:: https://gitlab.com/hectormartinez/ansible-role-python/badges/master/pipeline.svg
   :target: https://gitlab.com/hectormartinez/ansible-role-python/commits/master
   :alt: Pipeline Status

.. image:: https://img.shields.io/badge/galaxy-hmarlo.python-blue.svg
   :target: https://galaxy.ansible.com/hmarlo/python/
   :alt: hmarlo.python at Ansible Galaxy

Installs Python from sources with dependencies such as ssl, tk, readline, zlib, etc.
It downloads the sources at ``/opt/sources/python/{{ py_version }}``  and it installs
at ``/opt/software/python/{{ py_version}}``.

Variables
---------

.. include:: defaults/main.yml

Usage
-----

Add ``hmarlo.python`` to your dependencies and your playbooks.

.. code-block:: yml

  - hosts: all

    vars:
      py_version: 3.7.0

    roles:
      - ansible-role-python

License
-------

BSD

Author Information
------------------

Hector Martinez-Lopez
