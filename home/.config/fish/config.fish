if status --is-interactive

	set -gx OS (uname)

	# Plugins
	set fish_function_path $HOME/.config/fish/functions/pure $fish_function_path
	set fish_function_path $HOME/.config/fish/functions/bass $fish_function_path

	# Homesick
	if test -d $HOME/.homesick
		source "$HOME/.homesick/repos/homeshick/homeshick.fish"
	end

	# Global paths
	set -gx PATH /usr/bin /bin /usr/sbin /sbin /usr/local/bin $HOME/bin $PATH
	set -gx MANPATH /usr/share/man $MANPATH

	# Terminal colors
	set -gx TERM xterm-256color

	# OS specific paths
	switch $OS
		case Darwin
			set -gx PATH /opt/local/bin /opt/local/sbin /opt/homebrew/bin /opt/X11/bin /opt/X11/bin /usr/local/MacGPG2/bin $HOME/.pear/bin $PATH
			set -gx MANPATH /opt/homebrew/share/man /usr/local/man /usr/share/man /usr/local/share/man $MANPATH
		case FreeBSD
			# null
		case '*'
			# null
	end

	# Set language environment
	set -gx LANG en_US.UTF-8
	set -gx LANGUAGE en_US.UTF-8
	set -gx LC_ALL en_US.UTF-8
	set -gx LC_CTYPE en_US.UTF-8

	# Composer
	if test -d $HOME/.composer/vendor/bin
		set -gx PATH $PATH $HOME/.composer/vendor/bin
	end

	# yarn
	if test -d $HOME/.yarn/bin
		set -gx PATH $PATH $HOME/.yarn/bin
	end

	# Set preferred editors and pagers
	set -gx EDITOR nvim
	set -gx VISUAL nvim
	set -gx PAGER less
	set -gx MANPAGER 'less -X'

	# Neovim
	# set -gx NVIM_TUI_ENABLE_CURSOR_SHAPE 1

	# rvm
	if test -d /usr/local/rvm/bin
		set -gx PATH $PATH /usr/local/rvm/bin
		rvm default
	end

	if test -d $HOME/.rvm/bin
		set -gx PATH $PATH $HOME/.rvm/bin
		rvm default
	end

	# pyenv
	if test -d $HOME/.pyenv
		set -gx PYENV_ROOT $HOME/.pyenv
		set -gx PATH $PYENV_ROOT/bin $PATH
		source (pyenv init -|psub)
	end

	# Source command abbreviations
	source $HOME/.config/fish/abbreviations.fish

end
