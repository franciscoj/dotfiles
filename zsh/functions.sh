function dot_files_load() {
    # Platform depending exports and sources
    if [[ $dot_files_platform == 'Linux' ]]; then
        source $dot_files_base/$1.linux
    elif [[ $dot_files_platform == 'Darwin' ]]; then
        source $dot_files_base/$1.mac
    fi
}
