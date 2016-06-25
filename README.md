This is a simple terminal-based bash script you can source in to your environment
and use to have a simple todo list.

# Installation
Clone the repo into `~/.todos` then add the following to your bash profile:
```
[[ -d ~/.todos ]] && source ~/.todos/todos.sh
```

# Usage

## Showing todos
The following are all valid ways to list current todos
```
todo list
todo ls
todo
```

Output will be a numbered list of TODO items

## Adding todos
You can add a todo by using `todo add` followed by a one-line todo
```
todo add Write the README.md for my TODO tool
# You can shorten add to just a if you'd like also
todo a This will add another TODO
```
You will then be shown your new todo list.  You can also not include the word `add`
but you also can't use any other word that is command as the first word of your todo.
```
todo This is also going to add a TODO
```

## Removing or Deleting todos
Using the numbered list when shown the TODOs, delete todos as shown.
```
# Delete a single todo
todo rm 1
# You can also use the keywords 'del' and 'delete'
todo del 1
todo delete 1

# You can delete a range of todos with a comma
todo rm 1,3 # This would delete todos one through three
```
Any valid GNU SED search will work with rm.  See the source for how it's put together.

