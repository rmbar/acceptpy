# What is AcceptPy?

AcceptPy is a minimal acceptance test framework. It can be used to automatically and quickly check that a program operates as a developer intends.  What a unit test framework is for functions, AcceptPy is for whole programs.  

For example we can use AcceptPy to test the operation of the console `echo` command. To do so we first author a test file (in JSON) which defines a test for the echo command:

```
{
  "test type": "shell command",
  "command" : "echo have some pie.",
  "expect exit": 0,
  "expect stdout": "have some pie.\n"
}
```
This test checks than executing `echo have some pie.` prints:

```
have some pie

```

to the console and then exits with code 0.

We can run this test by invoking AcceptPy passing the directory that contains the test file:

```
python3 accept.py /home/user/echo_tests
```

which produces the following output:

```
#########################
   Welcome to AcceptPy
#########################

searching for tests...

/home/user/echo_test/echo_pie.test

found 1 tests.


#########################
   Test 1 of 1
#########################

[running: /home/user/echo_tests/echo_pie.test]
shell command: echo have some pie.
<begin stdout>have some pie.
<end stdout>
[PASSED]


#########################
   Results:
#########################


1 of 1 tests passed.
```

When running the test defined in `echo_pie.test` AcceptPy:

1. Launched a shell subprocess.
2. Ran the command `echo have some pie.` in the shell.
3. Checked that the command's exit code was 0.
4. Checked that the total of the command's printed stdout was `have some pie.\n`

# Installation

Version 1.2.0 can be downloaded directly from the command line via

```
wget https://github.com/rmbar/acceptpy/releases/download/v1.3.0/accept.py
```

or by downloading an archive from https://github.com/rmbar/acceptpy/releases/tag/v1.3.0 and copying `/src/main/python/accept.py` into a directory of your choice.

# Types of tests

## Shell command tests

A shell command test is defined in a JSON file with the `.test` extension.  It is generally of the form:

```
{
  "test type": "shell command",
  "command" : "echo have some pie.",
  "expect exit": 0,
  "expect stdout": "have some pie.\n",
  "expect stdout contains": "pie"
}
```

When a shell command test file is encountered AcceptPy will spawn a shell subprocess and execute the command string
identified by `command`.  If `expect exit` is specified AcceptPy will check that the command terminates with the given
exit code.  If not, the tool will check that the command terminated with exit code 0.  If `expect stdout` is specified
AcceptPy will check that the text sent to standard out by the command matches the given text. If `expect stdout contains` is specified
AcceptPy will check that the text sent to standard out by the command contains the given text.

## Python tests

A Python test is defined in a `.py` file. When AcceptPy encounters such a file it will execute the Python program
in a new subprocess using the command:

`python3 file.py`

and score the test as a pass if the returned exit code is 0. Any other exit code will result in a failed scoring.

# Running multiple tests

Running multiple tests is accomplished by authoring multiple test files.

For example:

```
$ echo '{ "test type": "shell command", "command" : "echo dog" }' > echo_dog.test
$ echo '{ "test type": "shell command", "command" : "echo cat" }' > echo_cat.test
$ python3 ~/accept.py ./
```

(n.b. in these minimal test files AcceptPy will only check that the echo commands terminated with exit code 0.)

... prodcues the output:

```
#########################
   Welcome to AcceptPy
#########################

searching for tests...

./echo_cat.test
./echo_dog.test

found 2 tests.


#########################
   Test 1 of 2
#########################

[running: ./echo_cat.test]
shell command: echo cat
<begin stdout>cat
<end stdout>
[PASSED]


#########################
   Test 2 of 2
#########################

[running: ./echo_dog.test]
shell command: echo dog
<begin stdout>dog
<end stdout>
[PASSED]


#########################
   Results:
#########################


2 of 2 tests passed.
```

When running AcceptPy the program will recursively search all directories under the given test directory argument
for all files ending in `.test` or `.py`.

# Remember

It is always polite to accept py.
