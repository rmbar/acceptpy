#!/bin/bash

rm -rf out
mkdir out

python3 ../../src/main/python/accept.py tests/bad_test_type_legacy.test          > out/bad_test_type_legacy.txt
python3 ../../src/main/python/accept.py tests/missing_shell_command_legacy.test  > out/missing_shell_command_legacy.txt
python3 ../../src/main/python/accept.py tests/echo_just_command_legacy.test      > out/echo_just_command_legacy.txt
python3 ../../src/main/python/accept.py tests/echo_exit_0_legacy.test            > out/echo_exit_0_legacy.txt
python3 ../../src/main/python/accept.py tests/echo_exit_1_legacy.test            > out/echo_exit_1_legacy.txt
python3 ../../src/main/python/accept.py tests/echo_dog_legacy.test               > out/echo_dog_legacy.txt

python3 ../../src/main/python/accept.py tests/empty_file.test             > out/empty_file.txt
python3 ../../src/main/python/accept.py tests/empty_json.test             > out/empty_json.txt
python3 ../../src/main/python/accept.py tests/bad_test_type.test          > out/bad_test_type.txt
python3 ../../src/main/python/accept.py tests/missing_shell_command.test  > out/missing_shell_command.txt
python3 ../../src/main/python/accept.py tests/echo_just_command.test      > out/echo_just_command.txt
python3 ../../src/main/python/accept.py tests/echo_exit_0.test            > out/echo_exit_0.txt
python3 ../../src/main/python/accept.py tests/echo_exit_1.test            > out/echo_exit_1.txt
python3 ../../src/main/python/accept.py tests/echo_dog.test               > out/echo_dog.txt
python3 ../../src/main/python/accept.py tests/empty.py                    > out/empty_py.txt
python3 ../../src/main/python/accept.py tests/empty.py --ignore_py        > out/empty_py_ignored.txt
python3 ../../src/main/python/accept.py tests/exit_1.py                   > out/exit_1_py.txt

diff correct/ out/
