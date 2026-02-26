# Dotfiles

install everything
```bash
cd ~
git clone --depth 1 https://github.com/51616/kickstart.git $HOME/.kickstart
cd .kickstart/installers
./install0.sh
```

dotfiles
```bash
cd ~
git clone --single-branch --branch main --bare https://github.com/51616/dotfiles.git $HOME/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no

mkdir -p .dotfiles-backup
dotfiles checkout 2>&1 | egrep "^\s+" | awk {'print $1'} | \
while read -r file; do
  if [ ! -e "$file" ]; then
    echo "Warning: File '$file' not found. Skipping." >&2
    continue
  fi

  # Create the destination directory if it doesn't exist
  dest_dir=".dotfiles-backup/$(dirname "$file")"
  mkdir -p "$dest_dir"

  # Move the file
  mv "$file" ".dotfiles-backup/$file"
done

dotfiles checkout
```

Install oh my posh
```
curl -s https://ohmyposh.dev/install.sh | bash -s
```

making zsh default (test), adding this to `~/.bash_profile`
```bash
[ -f $HOME/bin/zsh ] && {
    echo "Type Y to run zsh: \c"
    read line
    [ "$line" = Y ] && exec $HOME/.local/bin/zsh -l
}
```

actually make it a default, adding this to `~/.bash_profile`
```bash
export SHELL=~/bin/zsh
exec ~/bin/zsh -l
```

xfce4 terminal $TERM

- https://bbs.archlinux.org/viewtopic.php?pid=1376408#p1376408

see also

- https://www.warp.dev/
- https://github.com/catppuccin/warp
- https://github.com/catppuccin/cursors
- https://github.com/catppuccin/firefox
- https://github.com/catppuccin/userstyles (e.g., github, google) 
- https://github.com/catppuccin/grub
- https://github.com/catppuccin/xed
- https://github.com/catppuccin/gedit

gtk themes + icons

- https://github.com/M7S/dockbarx
- https://snapcraft.io/install/gtk-common-themes/ubuntu
- https://github.com/ljmill/catppuccin-icons/releases/
- https://www.xfce-look.org/p/1715554/

system font

- droid sans fallback

mouse icon

- breeze


based on

- https://www.atlassian.com/git/tutorials/dotfiles
- https://mitxela.com/projects/dotfiles_management

