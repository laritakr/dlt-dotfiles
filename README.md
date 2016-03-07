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
