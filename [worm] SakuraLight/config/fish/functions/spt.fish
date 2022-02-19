function spt --description "Kill spotifyd before running Spotify TUI."
  pkill spotifyd
  spotifyd
  command spt
end
