export TODO_FILE=~/.todo
[[ ! -f ${TODO_FILE} ]] && touch ${TODO_FILE}

add_todo () {
    echo $* >> ${TODO_FILE}
    display_todos
}

todo () { 
    case $1 in
        a|add)
            shift
            add_todo $*
            ;;
        rm|del|delete)
            remove_todo $2
            ;;
        ls|list)
            display_todos
            ;;
        *)
            [[ $# > 1 ]] && add_todo $*
            display_todos
            ;;
    esac
}

remove_todo () {
    sed -i.bak ${1}d ${TODO_FILE} && rm -f ${TODO_FILE}.bak
    display_todos
}

display_todos () {
    if [ -f ${TODO_FILE} ] ; then
        echo "TODO:"
        cat -n ${TODO_FILE}
        echo
    fi
}
