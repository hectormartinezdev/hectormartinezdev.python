import subprocess


def test_tkinter():
    subprocess.check_call("python -c 'import tkinter; tkinter._test()'")
