# DLT Dotfiles

This repository is a companion to [thoughtbot/laptop][1] and
[thoughtbot/dotfiles][2]. Most of the enhancements would be helpful for anyone
but there are also some project-specific elements sprinkled in.

## Installation

### Baseline Configuration
1. Follow the instructions to [install thoughtbot/laptop][3]. (Leave `mac` in `~/`)
2. `git clone git://github.com/thoughtbot/dotfiles.git ~/dotfiles`
3. Follow the rest of the instructions for [installing thoughtbot/dotfiles][4]

### Local Customization
1. [Fork this repository][5] to your github account.
2. Clone your fork of this repository onto your computer into `~/git/`.
3. Run `install.sh` to symlink the configuration files in this repo to `~/`.
4. The local installation script expects the [CurateND repo][6] to be present in `~/git/`.
5. Run `sh ~/mac 2>&1 | tee ~/laptop.log` to apply the changes.

Make and commit changes as needed to your fork. Submit [pull requests][7] with
customisations you think could benefit others.

Whenever you make changes to `laptop.local` use the `laptop` alias to re-run the
`mac` script.

## MySQL
By default the setup script does not configure MySQL securely. To add a root
password use:
`mysql_secure_installation`

To connect run:
`mysql -uroot`

To have launchd start mysql at login:
`ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents`

Then to load mysql now:
`launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist`

Or, if you don't want/need launchctl, you can just run:
`mysql.server start`


[1]: https://github.com/thoughtbot/laptop
[2]: https://github.com/thoughtbot/dotfiles
[3]: https://github.com/thoughtbot/laptop#install
[4]: https://github.com/thoughtbot/dotfiles#install
[5]: https://help.github.com/articles/fork-a-repo/
[6]: https://github.com/ndlib/curate_nd
[7]: https://help.github.com/articles/using-pull-requests/
