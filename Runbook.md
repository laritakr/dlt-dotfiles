# DLT Workstation Provisioning Runbook

_This guide is for provisioning newly formatted macs to work on DLT projects._ 

## Getting Started
> You will need an Apple ID. If you do not already have one please create it after the initial setup process of the new mac.

- Skip logging in with your Apple ID during the initial setup process. You can activate specific parts of iCloud manually at a later time.
- Go to `System Preferences > iCloud` and sign in or create an Apple ID
- Uncheck “User iCloud for mail, contacts, calendars, reminders, notes, and Safari” and click Next.
- Take your mac to Mike so he can grant your account administrative privileges.
- Install [Xcode](https://itunes.apple.com/us/app/xcode/id497799835) (this will take a while). While you wait:
  - Install [iTerm2](https://www.iterm2.com/).
  - Install [Chrome](https://www.google.com/chrome/browser/desktop/).
  - Install [ESC Menu Extra](http://esc.nd.edu/mac/menuextra.html)
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
- Give it a passphrase for better security. ([Infosec](http://oithelp.nd.edu/information-security/) recommends [Password Safe](https://pwsafe.org/) for storing credentials.)
- Copy your _public_ ssh key to the clipboard:

```console
cat ~/.ssh/id_rsa.pub | pbcopy
```

- Go to the “SSH Keys” page in your github account: https://github.com/settings/ssh
- Click the “New SSH key” button.
  - Paste in your public key into the “Key” field.
  - Type your computer name into the “Title” field (it should be the last part of the public key and look something like `LIB-1989`).
  - Submit the form by clicking on “Add SSH key”

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
mkdir ~/git
git clone git@github.com:ndlib/curate_nd.git ~/git/curate_nd
```

- If this is the first time you are checking out a project over SSH you will have two prompts:
	- The shell will prompt you to accept the `authenticity of host github.com`; do so.
	- A window will pop up prompting you for your SSH passphrase. Check the “store passphrase in keychain” box before submission.

- [Fork](https://help.github.com/articles/fork-a-repo/) the [dlt-dotfiles repo](https://github.com/ndlib/dlt-dotfiles/) to your github account.
- Install _your fork_ of [DLT Dotfiles](https://github.com/ndlib/dlt-dotfiles/):

```console
git clone git@:github.com:YOUR_GITHUB_USERNAME/dlt-dotfiles.git ~/git/dlt-dotfiles
~/git/dlt-dotfiles/install.sh
```

- Follow the prompts to record your github user information.
- Quit then reopen iTerm (to ensure that your shell environment is properly loaded).
- Re-run laptop to apply DLT-specific software and configuration:

```console
laptop
```

:sparkles:You’re Done!:sparkles: