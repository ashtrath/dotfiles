function ex --description 'Extract compressed files easily with one command.'
  if test -f $argv[1]
    switch $argv[1]
      case *.asar
        asar extract $argv[1] $argv[1].unpacked
      case *.tar.bz2 *.tbz2
        tar xjf $argv[1]
      case *.tar.gz *.tgz
        tar xzf $argv[1]
      case *.tar *.tar.xz *.tar.zst
        tar xf $argv[1]
      case *.rar
        unrar x $argv[1]
      case *.zip
        unzip $argv[1]
      case *.7z
        7z x $argv[1]
      case '*'
        echo "'$argv[1]' cannot be extracted via ex()!"
    end
  else
    echo "'$argv[1]' is not a valid file!"
  end
end
