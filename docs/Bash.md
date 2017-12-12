# BASH tips, notes and a lot of other cool and pretty stuff #

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


-----

## Special Variables ##

[Source](https://ryanstutorials.net/bash-scripting-tutorial/bash-variables.php)

- `$0` - The name of the Bash script.
- `$1` - $9 - The first 9 arguments to the Bash script. (As mentioned above.)
- `$#` - How many arguments were passed to the Bash script.
- `$@` - All the positional parameters supplied to the Bash script - output is one COLUMN
- `$*` - All the positional parameters supplied to the Bash script - output is one LINE
- `$?` - The exit status of the most recently run process.
- `$$` - The process ID of the current script.
- `$!` - PID последнего запущенного в фоне процесса
- `$$` - PID самого скрипта

- `$FUNCNAME` - current function name inside a script
- `$USER` - The username of the user running the script.
- `$HOSTNAME` - The hostname of the machine the script is running on.
- `$HOSTTYPE` - host architecture
- `$OSTYPE` - operating system type
- `$SECONDS` - The number of seconds since the script was started.
- `$RANDOM` - different random number each time is it referred to.
- `$LINENO` - the current line number in the Bash script.
- `$HOME` - user home directory path

- `$DIRSTACK` - содержимое вершины стека каталогов
- `$EDITOR` - текстовый редактор по умолчанию
- `$EUID` - Эффективный UID. Если вы использовали программу su для выполнения команд от другого пользователя, то эта переменная содержит UID этого пользователя, в то время как...
- `$UID` - ...содержит реальный идентификатор, который устанавливается только при логине.
- `$GROUPS` - массив групп к которым принадлежит текущий пользователь
- `$LC_CTYPE` - внутренняя переменная, котороя определяет кодировку символов
- `$OLDPWD` - прежний рабочий каталог
- `$PATH` - путь поиска программ
- `$PPID` - идентификатор родительского процесса

--------

### Source Links ###

[:hash: Bash Scripting Tutorial - Ryans](https://ryanstutorials.net/bash-scripting-tutorial)

--------

### Related info ###

 - [GitHub / Basic writing and formatting syntax](https://help.github.com/articles/basic-writing-and-formatting-syntax/)
 - [BitBucket Markdown Howto](https://bitbucket.org/tutorials/markdowndemo)
 - [Creating an Automated Build](https://docs.docker.com/docker-hub/builds/)
 - [Linking containers](https://docs.docker.com/engine/userguide/networking/default_network/dockerlinks.md)
 - [Cross-host linking containers](https://docs.docker.com/engine/admin/ambassador_pattern_linking.md)

--------
