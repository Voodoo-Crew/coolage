<p align="center">
  <img src="../assets/img/Makefile-logo-001.jpg" max-width="613px" max-height="194px" alt="GNU Makefile logo" />
</p>

<p align="center">
  <h1 class="text-center">Makefile: Documentation highlights</h1>
</p>

## Dealing with assignments ##
There are different ways of assigning variables in a Makefile. They are (type of assignment, followed by the operator in parentheses):

### Simple assignment (:=) ###
We can assign values (RHS) to variables (LHS) with this operator, for example: `CC := gcc`. With simple assignment (:=), the value is expanded and stored to all occurrences in the Makefile when its first definition is found.

For example, when a `CC := ${GCC} ${FLAGS}` simple definition is first encountered, CC is set to gcc -W and wherever ${CC} occurs in actions, it is replaced with `gcc -W`.

### Recursive assignment (=) ###

Recursive assignment (the operator used is =) involves variables and values that are not evaluated immediately on encountering their definition, but are re-evaluated every time they are encountered in an action that is being executed. As an example, say we have:

```Makefile
GCC = gcc
FLAGS = -W
```

With the above lines, `CC = ${GCC} {FLAGS}` will be converted to gcc -W only when an action like ${CC} file.c is executed somewhere in the Makefile. With recursive assignation, if the GCC variable is changed later (for example, GCC = c++), then when it is next encountered in an action line that is being updated, it will be re-evaluated, and the new value will be used; ${CC} will now expand to c++ -W.

### Conditional assignment (?=) ###

Conditional assignment statements assign the given value to the variable only if the variable does not yet have a value.

### Appending (+=) ###

The appending operation appends texts to an existing variable. For example:
```Makefile
CC = gcc
CC += -W
```
CC now holds the value gcc -W.

Though variable assignments can occur in any part of the Makefile, on a new line, most variable declarations are found at the beginning of the Makefile.

## Using patterns and special variables ##

The % character can be used for wildcard pattern-matching, to provide generic targets. For example:
```Makefile
%.o: %.c
[TAB] actions
```
When `%` appears in the dependency list, it is replaced with the same string that was used to perform substitution in the target.

Inside actions, we can use special variables for matching filenames.

### Here is a table of automatic variables: ###

- `$@` full name of the current target
- `$%` The target member name, when the target is an archive member. For example, if the target is foo.a(bar.o) then `$%` is bar.o and `$@` is foo.a. `$%` is empty when the target is not an archive member.
- `$?` returns the dependencies that are newer than the current target
- `$^` name of all the dependencies with space as the delimiter
- `$^` The names of all the prerequisites, with spaces between them. For prerequisites which are archive members, only the named member is used. A target has only one prerequisite on each other file it depends on, no matter how many times each file is listed as a prerequisite. So if you list a prerequisite more than once for a target, the value of $^ contains just one copy of the name. This list does not contain any of the order-only prerequisites; for those see the `$|` variable, below.
- `$+` This is like `$^`, but prerequisites listed more than once are duplicated in the order they were listed in the makefile. This is primarily useful for use in linking commands where it is meaningful to repeat library file names in a particular order.
- `$|` The names of all the order-only prerequisites, with spaces between them.
- `$*` returns the text that corresponds to % in the target
- `$<` name of the first dependency

---

## Lists all targets defined in makefile ##

```Makefile
.PHONY: list
list:
	@$(MAKE) -pRrn : -f $(MAKEFILE_LIST) 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' | sort
```

---

## Create Symbolic Link If Not Exist ##

Create a symbolic link to directory if the symlink does not exist in Makefile.
Otherwise do nothing.

```Makefile
.PHONY: check-symlinks
check-symlinks:
	@ [ -L somedir/assets ] || (cd somedir; ln -s ../assets/ assets)
```

---

## Set/fix owners of files and dirs and their permissions ##

- ```664``` equals to *rw-rw-r--*
- ```775``` equals to *rwxrwxr-x*
- ```a+x``` add --x permission for *all* users
- ```2>/dev/null``` mute any output in *stderr*


```Makefile
.PHONY: rights
rights:
	@ find . -type f -exec chmod 664 {} 2>/dev/null \;
	@ find . -type d -exec chmod 775 {} 2>/dev/null \;
	@ find . -type f -name "*.sh" -exec chmod a+x {} 2>/dev/null \;
```

---

## Colors definition (from "Color Bash Prompt" HowTo) ##

```Makefile
##  Regular  ##
Black=[0;1;30m
Red=[0;1;31m
Green=[0;1;32m
Yellow=[0;1;33m
Blue=[0;1;34m
Purple=[0;1;35m
Cyan=[0;1;36m
White=[0;1;37m
Orange=[38;5;178m

##  Bold  ##
BBlack=[1;1;30m
BBlue=[1;1;34m
BCyan=[1;1;36m
BRed=[1;1;31m
BGreen=[1;1;32m
BYellow=[1;1;33m
BPurple=[1;1;35m
BWhite=[1;1;37m

##  Background  ##
On_Black=[40m
On_Red=[41m
On_Green=[42m
On_Yellow=[43m
On_Blue=[44m
On_Purple=[45m
On_Cyan=[46m
On_White=[47m

##  Color Reset  ##
NC=[m

##  Helpers  ##
ALERT=${BWhite}${On_Red}

```

---

## :pushpin: Resources ##

| :+1: | Article |
|:----:|:--------|
| :four: | [GNU Make in Detail for Beginners](http://opensourceforu.com/2012/06/gnu-make-in-detail-for-beginners/) |
| :five: | [GNU Make](https://www.gnu.org/software/make/manual/make.html) |

---

:scorpius:
