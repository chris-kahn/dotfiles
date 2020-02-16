
set -ug FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!**/node_modules/*"'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
function _fzf_compgen_path
  rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!**/node_modules/*"
end

# Use fd to generate the list for directory completion
function _fzf_compgen_dir
  rg --hidden --files . 2>/dev/null | awk 'function dirname(fn) { if (fn == "") return ".";  if (fn !~ "[^/]") return "/"; sub("/*$", "", fn); if (fn !~ "/") return "."; sub("/[^/]*$", "", fn); if (fn == "") fn = "/"; return fn } {$0 = dirname($0)} !a[$0]++'
end

alias vim="nvim"
alias vi="nvim"
