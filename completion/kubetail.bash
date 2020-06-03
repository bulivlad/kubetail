#/usr/bin/env bash

_kubetail(){
    local curr_arg;
    curr_arg=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}
    command=${COMP_WORDS[1]}

    for (( idx=${#COMP_WORDS[@]}-1 ; idx>=0 ; idx-- )) ; do
        if [[ ${COMP_WORDS[idx]} == --* ]]; then
            last_param=${COMP_WORDS[idx]}
            break
        fi
    done

    if [[ "${last_param}" == "--pods" ]]; then
        arg=$(kubectl get pods | awk '{print $1}')
        arg="$(kubectl get pods | grep -v "NAME" | awk '{print $1}')"
        COMPREPLY=( $(compgen -W "$arg" -- $curr_arg ) );
    else
        COMPREPLY=( $(compgen -W "--pods --tail --grep" -- $curr_arg ) );
    fi

    # case $prev in
    #     -p*| --pods*)
    #         COMPREPLY=( $(compgen -W "$(kubectl get pods | awk '{print $1}')" -- $curr_arg ) );
    #     ;;
    #     *)
    #         COMPREPLY=( $(compgen -W "--pods --tail --grep" -- $curr_arg ) );
    #     ;;
    # esac
}

complete -F _kubetail kubetail kt
