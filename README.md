# Vagrant Multi Machines
Vagrant environment for supporting multiple machines with Hostmanager and external config in JSON

## Dependencies
* [Virtual Box](https://www.virtualbox.org/)
* [Ruby](https://www.ruby-lang.org/pt/downloads/)
* [librarian-chef](https://github.com/applicationsonline/librarian-chef)
* [Vagrant](http://http://www.vagrantup.com/)
* Vagrant Plugins
   	* [vagrant-aws](https://github.com/mitchellh/vagrant-aws)
    * [vagrant-cachier](https://github.com/fgrehm/vagrant-cachier)
    * [vagrant omnibus](https://github.com/schisamo/vagrant-omnibus)
    * [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest)

## Instructions:

1. Clone this project:
```
git clone https://github.com/llaraujo/vagrant-multi-machines.git
```
2. Install Ruby
3. Type in terminal:
```
gem update --system
```
4. Install librarian-chef
5. Install Vagrant
6. Install Vagrant Plugins:
	* in terminal: ```vagrant plugin install vagrant-aws```
	* in terminal: ```vagrant plugin install vagrant-cachier```
	* in terminal: ```vagrant plugin install vagrant-omnibus```
	* in terminal: ```vagrant plugin install vagrant-vbguest```
7. Install Virtual Box
8. Install cookbooks with librarian-chef, in folder project:
	* in terminal: ```librarian-chef install```
9. To running local machine:
	* in terminal: ```vagrant up```

## Contributing

If you want to help, please read the [Contributing](https://github.com/eduardolundgren/dotfiles/blob/master/CONTRIBUTING.md) guide first.

## License

[MIT License](http://llaraujo.mit-license.org/) © Leonardo Lima Araujo
