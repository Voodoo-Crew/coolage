# BASH tips, notes and a lot of other cool and pretty stuff #

[![Standard Version](https://img.shields.io/badge/release-standard%20version-brightgreen.svg?style=plastic)](https://github.com/conventional-changelog/standard-version)
[![Contributors](https://img.shields.io/github/contributors/Voodoo-Crew/coolage.svg)](https://github.com/Voodoo-Crew/coolage/graphs/contributors)

<p align="center">
  <img src="../assets/img/bash-logo-web.png" alt="Bash Logo" />
</p>

`bash` `tips` `gists`

---

## How to determine function name from inside a function  ##

### `$FUNCNAME` ###

<details>
<summary>:information_source: Description</summary>

  An array variable containing the names of all shell functions currently in the execution call stack.
The element with index 0 is the name of any currently-executing shell function.
The bottom-most element (the one with the highest index) is "main".
This variable exists only when a shell function is executing.
Assignments to `FUNCNAME` have no effect and return an error status.
If `FUNCNAME` is unset, it loses its special properties, even if it is subsequently reset.

  This variable can be used with `BASH_LINENO` and `BASH_SOURCE`.
Each element of `FUNCNAME` has corresponding elements in `BASH_LINENO` and `BASH_SOURCE`
to describe the call stack. For instance, `${FUNCNAME[$i]}` was called from
file `${BASH_SOURCE[$i+1]}` at line number `${BASH_LINENO[$i]}`.
The caller builtin displays the current call stack using this information.
</details>

---

## Special Variables ##

[Source](https://ryanstutorials.net/bash-scripting-tutorial/bash-variables.php)

- `$0` - The name of the Bash script.
- `$1 - $9` - The first 9 arguments to the Bash script. (As mentioned above.)
- `$#` - How many arguments were passed to the Bash script.
- `$@` - All the positional parameters supplied to the Bash script - output is one COLUMN
- `$*` - All the positional parameters supplied to the Bash script - output is one LINE
- `$?` - The exit status of the most recently run process.
- `$!` - PID of the last background process started
- `$$` - The process ID of the current script.

- `$FUNCNAME` - current function name inside a script
- `$USER` - The username of the user running the script.
- `$HOSTNAME` - The hostname of the machine the script is running on.
- `$HOSTTYPE` - host architecture
- `$OSTYPE` - operating system type
- `$SECONDS` - The number of seconds since the script was started.
- `$RANDOM` - different random number each time is it referred to.
- `$LINENO` - the current line number in the Bash script.
- `$HOME` - user home directory path

- `$EDITOR` - text editor to edit files with
- `$EUID` - effective UID
- `$UID` - logged in user ID
- `$PPID` - PID of parent process
- `$GROUPS` - list of groups where current user is a member
- `$LC_CTYPE` - system variable that is responsible for terminal output codepage
- `$PWD` - current working directory
- `$OLDPWD` - previous working directory
- `$PATH` - list of directories to search for executables
- `$LD_PRELOAD` - list of specific libraries (files) to be loaded before any other libraries, whether the program wants it or not
- `$LD_LIBRARY_PATH` - list of dirs to search for libs
- `$DIRSTACK` - list of all `$PWD` for each cd call
- `$DIRSTACK[-1]` - equal to `$PWD`

---

### Source Links ###

:hash: [Bash Scripting Tutorial - Ryans](https://ryanstutorials.net/bash-scripting-tutorial)

---

### :clap: Contributors ###

- [Eugene Taranov](https://github.com/eugenetaranov)
- [Dima Leonenko](https://github.com/dmytroleonenko)

---

### Related info ###

 - [GitHub / Basic writing and formatting syntax](https://help.github.com/articles/basic-writing-and-formatting-syntax/)
 - [BitBucket Markdown Howto](https://bitbucket.org/tutorials/markdowndemo)
 - [Creating an Automated Build](https://docs.docker.com/docker-hub/builds/)
 - [Linking containers](https://docs.docker.com/engine/userguide/networking/default_network/dockerlinks.md)
 - [Cross-host linking containers](https://docs.docker.com/engine/admin/ambassador_pattern_linking.md)

---

:scorpius:
