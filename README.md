``ansible-role-python``
=======================

Installs Python from sources with dependencies such as ssl, tk, readline, zlib, etc.
It downloads the sources at ``/opt/sources/python/{{ py_version }}``  and it installs
at ``/opt/software/python/{{ py_version}}``.

Role Variables
--------------

``py_version`` (``3.6.5``): the Python version to install.

``py_apt_deps`` (see ``defaults/main.yml``): the dependencies that we install before Python.

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: ansible-role-python, py_version: 2.7.14 }

License
-------

BSD

Author Information
------------------

Hector Martinez-Lopez
