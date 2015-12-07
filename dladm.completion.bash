_dladm ()
{
    local cur prev
    COMPREPLY=()

    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    local commands
    commands=(create-aggr delete-aggr add-aggr remove-aggr modify-aggr
              show-aggr show-dev show-link set-linkprop reset-linkprop
              show-linkprop)

    local options
    options=()

    if [[ $COMP_CWORD == 1 ]]; then
        COMPREPLY=($(compgen -W "${commands[*]}" -- ${cur}))
        return 0
    fi
    if [[ $COMP_CWORD -ge 2 ]]; then
        case ${COMP_WORDS[1]} in
            create-aggr)
                options=(-t -R -P -l -T -u -d);;
            delete-aggr)
                options=(-t -R);;
            add-aggr)
                options=(-t -R -d);;
            remove-aggr)
                options=(-t -R -d);;
            modify-aggr)
                options=(-t -R -P -l -T -u);;
            show-aggr)
                options=(-L -s -i -p);;
            show-dev)
                options=(-s -i -p);;
            show-link)
                options=(-s -i -p);;
            set-linkprop)
                options=(-t -p);;
            reset-linkprop)
                options=(-t -p);;
            show-linkprop)
                options=(-c -P -p);;
        esac
        if [[ $cur == '-' && ${#options[@]} -gt 0]]; then
            COMPREPLY=($(compgen -W '${options[*]}' -- ${cur}))
            return 0
        fi

    fi
}

complete -F _dladm dladm
