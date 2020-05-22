#/usr/bin/env bash

_findpods(){
    local next="0"
    local pods="";
    for wo in "${COMP_WORDS[@]}"
    do
        if [ "$next" = "0" ]; then
            if [ "$wo" = "-t" ] || [ "$wo" = "--pods" ]; then
                next="1"
            fi
        else
            pods="$wo"
            break
        fi
    done
    if [ "$pods" != "" ]; then
        printf "%s" " --pods $pods"
    fi
}

_kubetail()
{
    local curr_arg;
    curr_arg=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}
    command=${COMP_WORDS[1]}
    case $prev in
        -p*| --pods*)
            COMPREPLY=( $(compgen -W "$(kubectl get pods | awk '{print $1}')" -- $curr_arg ) );
        ;;
        # *)
        #     COMPREPLY=( $(compgen -W "--pods --tail --grep" -- $curr_arg ) );
        # ;;
    esac
}

complete -F _kubetail kubetail kt
