fastfetch --color 4
eval "$(starship init zsh)"
# --- alias ---
alias 'update-grub'='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias 'poweroff'='sudo poweroff'
alias 'reboot'='sudo reboot'
#end ...
# --- yazi wrapper ---
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
#end ...
# --- zsh default ---
zstyle :compinstall filename '/home/noxjp/.zshrc'
autoload -Uz compinit
compinit
#end ...
# --- fortune teller ---

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
