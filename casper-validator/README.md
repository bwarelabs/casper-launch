# [BwareLabs] Deploy a Casper validator

## ![alt text](https://github.com/bwarelabs/casper-launch/blob/main/docs/BWARE-icon.png) IMPORTANT NOTICE
**The scripts were tested on Ubuntu 20.04 LTS machines which respect the hardware requirements imposed by CasperLabs as seen [here](https://docs.casperlabs.io/en/latest/node-operator/hardware.html).**

## ![alt text](https://github.com/bwarelabs/casper-launch/blob/main/docs/BWARE-icon.png) Contents of the main directory
- _.env_ - this contains important environment variables which are needed in order to properly deploy the node
  - **USERNAME** - in order to deploy a Casper node, you should do it with a non-root and non-casper user; this variable will ensure the creation of an user with sudo privileges that will start the deployment
  - **HOMEDIR** - home directory of the **${USERNAME}** user
  - **STARTDIR** - start directory of the scripts (basically, full path of the _casper-validator_ directory as downloaded on your machine)
  - **CASPER_VERSION** - version which should be used (please, follow the [#mainnet-announcements](https://discord.gg/Cb3Gue5V67) or [#testnet-announcements](https://discord.gg/WYsDJpSstr) channels on Discord, according to your usecase, to see the latest updates)
  - **CASPER_NETWORK** - Casper network (_casper_ for **Mainnet** and _casper-test_ for **Testnet**)
- _.stake_env_ - this contains important environment variables which are needed in order to properly start a bonding request
  - **AMOUNT** - amount of CSPR tokens to be bonded by yourself (staking amount which you provide from your own wallet)
  - **DELEGATION_RATE** - fee for delegators (percentage of rewards which you will receive when producing a new block when having tokens delegated from others)
- _start_all.sh_ - main script that starts the deployment of the Casper node
- _start_bonding.sh_ - main script that starts the bonding request
- _utils_ - directory which contains helper scripts

## ![alt text](https://github.com/bwarelabs/casper-launch/blob/main/docs/BWARE-icon.png) Contents of utils directory
- _cleanup.sh_ - stops any Casper services and purges old Casper data (this is not included in any of the main scripts - should be run manually if needed)
- _configure_firewall.sh_ - configures ufw firewall, allowing acces to important ports (22 for ssh, 35000 for gossping, 7777 for RPC calls, 8888 for metrics, 9999 for event stream, 9090 for prometheus)
- _create_user.sh_ - creates user with **${USERNAME}** name with sudo privileges (if the user with the pointed name doesn't already exist - will require your manual intervention to insert the password for the user)
- _generate_keys.sh_ - generates keypair (if they do not already exist from manual install - it is highly recommended to save your private keys somewhere safe - you will need the public key for creating your account on the blockchain explorer)
- _install_prerequisites.sh_ - installs main binaries and builds the contracts (will require your manual intervention at some point)
- _start_node.sh_ - starts the Casper node as a service

## ![alt text](https://github.com/bwarelabs/casper-launch/blob/main/docs/BWARE-icon.png) How to deploy the node
- Carefully complete _.env_ with the appropiate values, depending on your use case (mainnet/testnet, latest version, etc.)
- From the ${START_DIR}, run the following command in your terminal:
```
sudo bash start_all.sh
```
- This can be run as root, the user handling is made inside the scripts

## ![alt text](https://github.com/bwarelabs/casper-launch/blob/main/docs/BWARE-icon.png) How to start a bonding request
- Carefully complete _stake.env_ with the appropiate values, depending on your use case
- From the ${START_DIR}, run the following command in your terminal:
```
sudo bash start_bonding.sh
```
- This can be run as root, the user handling is made inside the scripts

## ![alt text](https://github.com/bwarelabs/casper-launch/blob/main/docs/BWARE-icon.png) Contact

For official inquiries, you can contact us at <info@bwarelabs.com>.

For other details, feel free to contact us on **Discord** (_Mateip | bwarelabs.com#1629_, _Silviu | bwarelabs.com#8286_, _Tibi | bwarelabs.com#4803_).

## ![alt text](https://github.com/bwarelabs/casper-launch/blob/main/docs/BWARE-icon.png) Copyright

Copyright © 2021 [BwareLabs](https://bwarelabs.com/)
- [Telegram](https://t.me/BwareLabsAnnouncements)
- [Twitter](https://twitter.com/BwareLabs)
- [Linkedin](https://www.linkedin.com/company/bwarelabs)

![alt text](https://github.com/bwarelabs/indexer-deployment/blob/main/docs/BWARE_yellow_gradient.png)
