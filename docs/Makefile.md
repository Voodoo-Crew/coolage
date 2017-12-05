# Makefile documentation highlights #

-----

## Source Articles ##

[GNU Make in Detail for Beginners](http://opensourceforu.com/2012/06/gnu-make-in-detail-for-beginners/)

-----

## Dealing with assignments ##
There are different ways of assigning variables in a Makefile. They are (type of assignment, followed by the operator in parentheses):

### Simple assignment (:=) ###
We can assign values (RHS) to variables (LHS) with this operator, for example: `CC := gcc`. With simple assignment (:=), the value is expanded and stored to all occurrences in the Makefile when its first definition is found.

For example, when a `CC := ${GCC} ${FLAGS}` simple definition is first encountered, CC is set to gcc -W and wherever ${CC} occurs in actions, it is replaced with `gcc -W`.

### Recursive assignment (=) ###

Recursive assignment (the operator used is =) involves variables and values that are not evaluated immediately on encountering their definition, but are re-evaluated every time they are encountered in an action that is being executed. As an example, say we have:
```
GCC = gcc
FLAGS = -W
```

With the above lines, `CC = ${GCC} {FLAGS}` will be converted to gcc -W only when an action like ${CC} file.c is executed somewhere in the Makefile. With recursive assignation, if the GCC variable is changed later (for example, GCC = c++), then when it is next encountered in an action line that is being updated, it will be re-evaluated, and the new value will be used; ${CC} will now expand to c++ -W.

We will also have an interesting and useful application further in the article, where this feature is used to deal with varying cases of filename extensions of image files.

### Conditional assignment (?=) ###

Conditional assignment statements assign the given value to the variable only if the variable does not yet have a value.
Appending (+=)

The appending operation appends texts to an existing variable. For example:
```
CC = gcc
CC += -W
```
CC now holds the value gcc -W.

Though variable assignments can occur in any part of the Makefile, on a new line, most variable declarations are found at the beginning of the Makefile.

## Using patterns and special variables ##

The % character can be used for wildcard pattern-matching, to provide generic targets. For example:
```
%.o: %.c
[TAB] actions
```
When `%` appears in the dependency list, it is replaced with the same string that was used to perform substitution in the target.

Inside actions, we can use special variables for matching filenames. Some of them are:

-  `$@` (full target name of the current target)
-  `$?` (returns the dependencies that are newer than the current target)
-  `$*` (returns the text that corresponds to % in the target)
-  `$<` (name of the first dependency)
-  `$^` (name of all the dependencies with space as the delimiter)

-----
