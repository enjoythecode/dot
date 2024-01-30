# Quick Start (Reproducible environments using Vagrant)

(this is work-in-progress)

(only on Windows;)
Admin-priviledged PowerShell, then;
`Get-Service -Name ssh-agent | Set-Service -StartupType Manual`
`Start-Service ssh-agent`

Any PowerShell;
`ssh-add c:/Users/Sinan/.ssh/id_rsa`


Then;
```
vagrant up
vagrant ssh
# hack away...
# iterate on vagrant scripts with:
vagrant destroy
```

# Required Software for the Thin-client to Vagrant

Needed software:

## Virtualbox
https://www.virtualbox.org/wiki/Linux_Downloads

## Vagrant

https://developer.hashicorp.com/vagrant/downloads

## Syncthing

https://apt.syncthing.net/

## Nerd Fonts

https://github.com/ryanoasis/nerd-fonts

(use shallow clone from step 5, and then install script from step 3)

## OS X only
`brew install coreutils` is required for gdate replacement to date

# Resources

see `bash/aliases_and_functions.bashrc` for a list of aliases.

# Words

My setup. Efficiency of keystrokes (less friction) and portability (low
long-tail friction) are priorities.
