function fish_title \
  --description "Set title to current folder and shell name" \
  --argument-names last_command

  set --local basename (string replace -r '^.*/' '' -- $PWD)
  set --local current_folder (_pure_parse_directory)

  set --local prompt "$basename: $last_command $pure_symbol_title_bar_separator"

  if test -z "$last_command"
      set prompt "$current_folder $pure_symbol_title_bar_separator"
  end

  echo $prompt
end
