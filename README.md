# router-configs

Repository containing network configurations for my routers (connected to DN42, Freifunk, RaumZeitLabor, etc.), with a bunch of useful maintenance-related scripts included.

## Target audience

This repository may be particularly useful to people interested in mesh networks. These configurations (excluding certain pieces of information regarding my network setup) are used by myself for my own, personal [dn42](https://dn42.dev) router.

This means that cerain configurations may be suboptimal or even completely invalid to people connecting from other networks. Use with caution.

## Instructions

* Review the contents of this repository before proceeding.
* Run `bash prepare-freifunk.sh` if you wish to add support for Freifunk or update your configuration files.
* Run `bash install-configs.sh`. Warning, this will replace your existing configurations!
* Congrats, you should be good to go!

## Requirements

* **virtualenv**

The `prepare-freifunk.sh` script clones Freifunk's [icvpn-scripts](https://github.com/freifunk/icvpn-scripts) and [icvpn-meta](https://github.com/freifunk/icvpn-meta) repositories, and then runs one of the scripts ([mkdns](https://github.com/freifunk/icvpn-scripts/blob/master/mkdns)) automatically. In order to do that, the script creates a [virtual environment](https://docs.python.org/3/library/venv.html) which downloads the required dependencies without affecting your system, hence the reason why `venv` is necessary.

On Debian-based/Ubuntu systems, run the following with administrative privileges;

```sh
apt-get install python3-venv
```

If an equivalent package does not exist for your system, install the package with `pip`;

```sh
python -m pip install virtualenv
```

## License

This repository may contain scripts that are written by myself. Unless if otherwise stated, they are all licensed under the [GNU General Public License v3](LICENSE).

The logic behind this licensing is the possibility of my scripts being appropriately adapted for use under different circumstances (e.g. a hackerspace or a mesh network that's connected to the aforementioned mesh networks. Of course, you're more than welcome to do that, but please be courteous towards other learners that may benefit the exact same way you may be benefiting from my own research, persistence, endless questioning of other people in IRCs and free time, the latter of which some people are not very lucky to have. Additionally, those configurations are very likely far from perfect and may or may not be suitable for use in production environments.
