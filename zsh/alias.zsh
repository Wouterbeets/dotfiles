# go aliases
if [[ -x `which go` ]]; then
	alias goi='go install'
	alias gob='go build'
fi

#nvim aliases
if [[ -x `which nvim` ]]; then
	alias vim=nvim
fi

alias rtfm='man'
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
