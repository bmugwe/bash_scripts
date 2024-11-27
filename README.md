# Purpose
- This script will back up a postgres database - [db_backup](./db_backup.sh)

- Send the back up to a remote server - [scp_to_back_server](./scp_to_back_server.sh)

- Systemmd to restart DHIS2- [dhis-startup](./dhis-startup.service)

## Installation

```bash
    sudo nano /etc/systemd/system/dhis-gbv-startup.service
```

```bash
    sudo systemctl daemon-reload
    sudo systemctl enable dhis-gbv-startup.service
```

```bash
    sudo systemctl start dhis-gbv-startup.service
```

```bash
    sudo systemctl status dhis-gbv-startup.service
```

- Reboot once to test the automatic 

```bash
    sudo reboot
```

There are to script files

## Install this to allow dependency


### Debian based system

```bash
    sudo apt-get install sshpass
```

### Redhat based systems


```bash
  sudo yum install sshpass
```