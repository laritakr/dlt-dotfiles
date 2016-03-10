# DLT Workstation Provisioning Runbook

_This guide is for provisioning newly formatted macs to work on DLT projects._ 

## Getting Started
> You will need an Apple ID. If you do not already have one please create it after the initial setup process of the new mac.

- Skip logging in with your Apple ID during the initial setup process. We will be activating specific parts of iCloud manually.
- Go to `System Preferences > iCloud` and sign in or create an Apple ID
- Uncheck “User iCloud for mail, contacts, calendars, reminders, notes, and Safari” and click Next.
- Take your mac to Mike so he can grant your account administrative privileges.
- Install [Xcode](https://itunes.apple.com/us/app/xcode/id497799835) (this will take a while). While you wait:
  - Install [iTerm2](https://www.iterm2.com/).
  - Install [Chrome](https://www.google.com/chrome/browser/desktop/).
  - [Set up your github account](#github-account-setup).
- Once Xcode has finished installing open the Xcode application and accept the license agreement.
- Open iTerm and run `xcode-select --install`. Accept the license agreement.
- Quit Xcode (and never return).

## Github Account Setup
> Github has support documentation for [Generating an SSH key](https://help.github.com/articles/generating-an-ssh-key/) that go into more depth.

- Open iTerm (if it isn’t already open)
- Generate an ssh key:

```console
ssh-keygen
```
- Use the default filename (`~/.ssh/id_rsa`)
- WIP

## Core Setup
- Install [thoughtbot/laptop](https://github.com/thoughtbot/laptop) in `~/`:

```console
cd ~/
curl --remote-name https://raw.githubusercontent.com/thoughtbot/laptop/master/mac
sh mac 2>&1 | tee ~/laptop.log
```

- Quit then reopen iTerm (to ensure that your shell environment is properly loaded).
- Install [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles):

```console
chsh -s $(which zsh)
git clone git://github.com/thoughtbot/dotfiles.git ~/dotfiles
env RCRC=$HOME/dotfiles/rcrc rcup
```

## DLT Customization
- `dlt-dotfiles/laptop.local` will install additional software packages if the [CurateND codebase](https://github.com/ndlib/curate_nd) is present on your computer:

```console
git clone git@github.com:ndlib/curate_nd.git ~/git/curate_nd
```

- [Fork](https://help.github.com/articles/fork-a-repo/) the [dlt-dotfiles repo](https://github.com/ndlib/dlt-dotfiles/) to your github account.
- Install _your fork_ of [DLT Dotfiles](https://github.com/ndlib/dlt-dotfiles/):

```console
mkdir ~/git
git clone https://github.com/YOUR_GITHUB_USERNAME/dlt-dotfiles/ ~/git/dlt-dotfiles
~/git/dlt-dotfiles/install.sh
```

- Follow the prompts to record your github user information.
- Quit then reopen iTerm (to ensure that your shell environment is properly loaded).
- Re-run laptop to apply DLT-specific software and configuration:

```console
laptop
```

:sparkles:You’re Done!:sparkles: