# 2017 Comcast DevOps Day
The following repo contains the source material for a talk I gave at
Comcast in Denver, CO on Nov. 1st, 2017 titled 'Continuous Automation / Continuous Compliance' 

## Prereqs
In order to run any of the code in this repo you will need to have the following installed:

- [Chef Development Kit (ChefDK)](https://downloads.chef.io/chef-dk/)
- [Vagrant](https://vagrantup.com)
- [VirtualBox](https://www.virtualbox.org/)
- Programmer's Text editor like [Atom](http://atom.io), [Visual Studio Code](https://code.visualstudio.com/), or [Notepad++](https://notepad-plus-plus.org/)
- [Docker](http://docker.io/)
- [`kitchen-dokken`](https://github.com/someara/kitchen-dokken)

## Run the Tac_Plus demo
In this example I show how you can use InSpec to test whether a tacacs+ server is configured with an encryption key.

#### See the test fail 
```
$ cd cookbooks\tac_plus_example
$ kitchen verify
```

#### See the test pass
Edit tac_plus_example\.kitchen.yml and uncomment line 22
```
suites:
  - name: default
    run_list:
     # - recipe[2017_comcast_devops::default] <-- UNCOMMENT THIS LINE
    verifier:
      inspec_tests:
        - test/compliance/tac_plus
    attributes:
```
Then run `kitchen converge && kitchen verify`

## Run Mac OS X profile locally
In this example I show how you can run an InSpec profile locally on your laptop

### Run this if you are on an OS X Workstation
```
$ cd profiles\
$ inspec exec osx_baseline
```

### Run this if you are on a Windows workstation
```
$ cd profiles\
$ inspec exec my-windows-baseline
```

### Run this if you are on a Linux workstation
```
$ cd profiles\
$ inspec exec my-linux-baseline
```

## You can also use the InSpec CLI to execute profiles remotely

#### Run against linux hosts
`$ inspec exec linux-baseline -t ssh://ec2-user@<FQDN OR IP> -i /path/to/key --sudo`

#### Run against windows hosts
`$ inspec exec windows-baseline -t winrm://Administrator@<FQDN OR IP> --password <myssecurepassword>`
