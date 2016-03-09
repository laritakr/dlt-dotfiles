# DLT Workstation Provisioning Runback

## Getting Started

> You will need an Apple ID. If you do not already have one please create it during the initial setup process of the new machine.

- Skip logging in with your Apple ID during the initial setup process. We will be activating specific parts of iCloud manually.
- Go to `System Preferences > iCloud` and sign in or create an Apple ID
- Uncheck “User iCloud for mail, contacts, calendars, reminders, notes, and Safari” and click Next.
- Take your mac to Mike so he can grant your account administrative privileges.
- Install [iTerm2](https://www.iterm2.com/)
- Install [Chrome](https://www.google.com/chrome/browser/desktop/)
- Install [Xcode](https://itunes.apple.com/us/app/xcode/id497799835)
- Once Xcode has finished installing (which will take a while) run the Xcode application and accept the license agreement.
- Open iTerm and run `xcode-select --install`. Accept the license agreement.
- Quit Xcode (and never return)


## Core Setup
- Install [thoughtbot/laptop](https://github.com/thoughtbot/laptop) in `~/`:

```console
cd ~/
curl --remote-name https://raw.githubusercontent.com/thoughtbot/laptop/master/mac
sh mac 2>&1 | tee ~/laptop.log
```

- Quit iTerm then reopen iTerm (so you have a fresh shell)
- Install [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)

```console
chsh -s $(which zsh)
git clone git://github.com/thoughtbot/dotfiles.git ~/dotfiles
env RCRC=$HOME/dotfiles/rcrc rcup
```

## Set up you account on Github
> Github has support documentation for [Generating an SSH key](https://help.github.com/articles/generating-an-ssh-key/) that go into more depth.
- Open iTerm (if it isn’t already open)
- Generate an ssh key:

```console
ssh-keygen
```
- Use the default filename (`~/.ssh/id_rsa`)
- WIP

## DLT Customization
- [Fork](https://help.github.com/articles/fork-a-repo/) the [dlt-dotfiles repo](https://github.com/ndlib/dlt-dotfiles/) to your github account.
- Quit iTerm then reopen iTerm (so you have a fresh shell)
- Install _your fork_ of [DLT Dotfiles](https://github.com/ndlib/dlt-dotfiles/):

```console
mkdir ~/git
git clone https://github.com/YOUR_GITHUB_USERNAME/dlt-dotfiles/ ~/git/dlt-dotfiles
./dlt-dotfiles/install.sh
```

- Follow the prompts to record your github user information.