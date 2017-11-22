hash fish 2>/dev/null;
if [ "$?" -eq 0 ]; then
  exec fish
else
  exec zsh
fi
