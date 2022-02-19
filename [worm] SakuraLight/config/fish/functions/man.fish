function man --description "Make manpages looks better with some colouring."
  LESS_TERMCAP_mb=(printf "\033[01;31m")         \
  LESS_TERMCAP_md=(printf "\e[01;38;34m")      \
  LESS_TERMCAP_me=(printf "\033[0m")             \
  LESS_TERMCAP_so=(printf "\033[01;33m")      \
  LESS_TERMCAP_se=(printf "\033[0m")             \
  LESS_TERMCAP_us=(printf "\e[04;38;5;146m")     \
  LESS_TERMCAP_ue=(printf "\e[0m")               \
  command man $argv[1]
end
