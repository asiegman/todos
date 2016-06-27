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
            if [ $# -eq 0 ] ; then
                display_todos
            else
                add_todo $*
            fi
            ;;
    esac
}

remove_todo () {
    sed -i.bak ${1}d ${TODO_FILE} && rm -f ${TODO_FILE}.bak
    display_todos
}

display_todos () {
    local lines=0
    if [ -f ${TODO_FILE} ] ; then
        lines=$(cat ${TODO_FILE} | wc -l | tr -d '[[:space:]'])
        if [ $lines -gt 0 ] ; then
            echo "$lines TODO(s):"
            cat -n ${TODO_FILE}
        else
            echo "No TODOs!"
        fi
    fi
}
