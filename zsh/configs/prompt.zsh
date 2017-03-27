# modify the prompt to contain git branch name if applicable
git_prompt_info() {
  current_branch=$(git current-branch 2> /dev/null)
  if [[ -n $current_branch ]]; then
    echo "%{$bg[magenta]%}%{$fg[cyan]%}%{$fg[black]%} $current_branch %{$bg[black]%}%{$fg[magenta]%}%{$reset_color%}"
  else
    echo "%{$bg[black]%}%{$fg[cyan]%}%{$reset_color%}"
  fi
}

pwd_compact() {
  echo ${PWD/#$HOME/\~} | sed -e '
  h
  s:.*/::
  x
  s:[^/]*$::
  s:/\(.\)[^/]*:/\1:g
  G
  s/\n//
  '
}

setopt promptsubst
PS1='%{$fg[cyan]%}%n%{$fg[red]%}@%{$fg[green]%}%m%{$fg[black]%}%{$bg[cyan]%} $(pwd_compact) $(git_prompt_info)%{$fg[blue]%}
❯ %{$reset_color%}'


