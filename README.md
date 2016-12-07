# DLT Dotfiles

This repository is a companion to [thoughtbot/laptop][1] and
[thoughtbot/dotfiles][2]. Most of the enhancements would be helpful for anyone
but there are also some project-specific elements sprinkled in.

## Installation
> For detailed, step-by-step, instructions see [Runbook.md][3]

### Baseline Configuration
1. Follow the instructions for [installing thoughtbot/laptop][4]. (Leave `mac` in `~/`)
2. `git clone git://github.com/thoughtbot/dotfiles.git ~/dotfiles`
3. Follow the rest of the instructions for [installing thoughtbot/dotfiles][5]

### Local Customization
1. [Fork this repository][6] to your github account.
2. Clone your fork of this repository onto your computer into `~/git/`.
3. Run `install.sh` to symlink the configuration files in this repo to `~/`.
3. Restart your Terminal app and run `laptop` to apply the changes.

Make and commit changes as needed to your fork. Submit [pull requests][8] with
customisations you think could benefit others.

Whenever you make changes to `laptop.local` use the `laptop` alias to re-run the
`mac` script.

## [Sufia](https://github.com/projecthydra/sufia) Development
The project has several [prerequisites](https://github.com/projecthydra/sufia#prerequisites).
Once the prerequisites are installed follow the [Sufia Development Guide](https://github.com/projecthydra/sufia/wiki/Sufia-Development-Guide)

### Notes
- Installing and running Solr is managed by [solr_wrapper](https://github.com/cbeer/solr_wrapper), no manual installation is necessary.
- Installing and running Fedora is managed by [fcrepo_wrapper](https://github.com/cbeer/fcrepo_wrapper), no manual installation is necessary.
- NOTE: Solr & Fedora run on different ports for development and test. `bundle exec rake ci` runs the wrapper commands on the correct ports for the tests to pass.
- Install [LibreOffice](https://www.libreoffice.org/download/libreoffice-fresh/) manually, it has already been added to your path.
- Installation of [FITS](http://projects.iq.harvard.edu/fits/downloads) has not been automated
- Run Redis with `brew services start redis`

## MySQL
By default the setup script does not configure MySQL securely. To add a root
password use:
`mysql_secure_installation`

To connect run:
`mysql -uroot`

To have launchd start MySQL at login:
`ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents`

Then to load MySQL now:
`launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist`

You can also manually start and stop the MySQL service:

```console
mysql.server start
mysql.server stop
```

These service commands have aliases for your convenience:

```console
mysql_start
mysql_stop
```


[1]: https://github.com/thoughtbot/laptop
[2]: https://github.com/thoughtbot/dotfiles
[3]: ./Runbook.md
[4]: https://github.com/thoughtbot/laptop#install
[5]: https://github.com/thoughtbot/dotfiles#install
[6]: https://help.github.com/articles/fork-a-repo/
[7]: https://github.com/ndlib/curate_nd
[8]: https://help.github.com/articles/using-pull-requests/
