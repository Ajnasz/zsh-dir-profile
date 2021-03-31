_load_zsh_dir_profile() {
	local value
	value=$_zsh_dir_profiles[$1]

	if [ -e "$value" ];then
		. "$value"
		export _ZSH_DIR_PROFILE="$1"
		return 1
	else
		echo "$value not exists for dirprofile $key" >&2
		return 1
	fi
}

load_zsh_dir_profile() {
	if [[ -v _zsh_dir_profiles ]];then
		for key value in ${(kv)_zsh_dir_profiles};do
			if [ "$key" != "default" ] && [ "${PWD##$key}" != "$PWD" ];then
				if [ "$_ZSH_DIR_PROFILE" != "$key" ];then
					if ! _load_zsh_dir_profile $key;then
						return 1
					fi
				fi
				return 0
			fi
		done

		if [ "$_ZSH_DIR_PROFILE" != "default" ];then
			_load_zsh_dir_profile default
		fi
	fi
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd load_zsh_dir_profile
