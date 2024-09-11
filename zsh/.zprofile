GPG_TTY=$(tty)
export GPG_TTY

anacron -t $HOME/.anacron/etc/anacrontab -S $HOME/.anacron/spool &>$HOME/.anacron/anacron.log
