## Installation
To configure your environment to use the script follow the below steps. First
clone and cd into the **sched** repository:

```
git clone https://github.com/RagingTiger/sched
cd sched/
```

Next you're going to append the shell script path to your .bashrc or .zshrc:

```
echo "# alias for sched" >> "$HOME/.`basename $SHELL`rc"
echo "alias sched=$PWD/sched.sh" >> "$HOME/.`basename $SHELL`rc"
```

To check that it worked, run the tail command:

```
tail "$HOME/.`basename $SHELL`rc"
```

You should get output like this:

```
.
.
.
# sched alias
alias sched=/path/to/your/repository/sched/sched.sh
```

## Usage
Using the utility is very straightforward. First look over the usage statement:

```
Usage:
    sched                 Simply prints out current schedule
    sched rm              Removes entire schedule file
    sched ed              Opens schedule file in nano editor
    sched add <entry>     Adds new entry to schedule
    sched read            Allows for scrollable reading of schedule
    sched help            Prints out this help doc
```

 * The first case is simply typing the **sched** command. This will just dump
the contents of your schedule file to the terminal stdout. If no file is found
you will be asked if you want to create one

* Next is the **rm** subcommand. Typing **sched rm** will completely delete your
schedule file

* To open your schedule file simply use the **ed** subcommand. Typing
**sched ed** will open your schedule file in **nano** for editing.

* The **add** subcommand will add the entire contents of ```<entry>``` to the
schedule file. Simply type **sched add <entry>** and it will be appended to
the schedule.

* To read the schedule without editing and with scrolling, just use the **read**
subcommand. Typing **sched read** will open the schedule file in an interactive
and scrollable window.

* Finally the **help** subcommand will print the usage message to stdout.

## Uninstalling
To uninstall is simple. Using your favorite editor, simply remove the alias
from the end of your shell file:

```
nano .zshrc
```

With the editor open, you can now delete the **sched** alias.
