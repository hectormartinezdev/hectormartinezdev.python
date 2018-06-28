``ansible-role-python``
=======================

.. image:: https://gitlab.com/hectormartinez/ansible-role-python/badges/master/pipeline.svg
   :target: https://gitlab.com/hectormartinez/ansible-role-python/commits/master
   :alt: Pipeline Status

Installs Python from sources with dependencies such as ssl, tk, readline, zlib, etc.
It downloads the sources at ``/opt/sources/python/{{ py_version }}``  and it installs
at ``/opt/software/python/{{ py_version}}``.

Variables
---------

.. include:: defaults/main.yml

Usage
-----

.. code-block:: yml

  - hosts: servers

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
