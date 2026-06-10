# AWS EC2 Connector

This PowerShell script allows you to connect to an AWS EC2 instance using SSH with a single command or double-click. It requires a configuration file named `config.ini` in the same directory as the script.

## Prerequisites

- Windows 10/11 (with OpenSSH client enabled) or PowerShell 5.1/7+
- The `ssh` command-line tool installed and in the system's PATH
- A valid `config.ini` file in the same directory as the script

## Installation & Setup

1. Download the .zip file from Gumroad [(Get it for $0+ here)](https://pablosoft.gumroad.com/l/vxvxs)
2. Extract the downloaded `.zip` file to any folder on your local machine.
3. Open the `config.ini` file and configure your credentials (see the Configuration section below).
4. Ensure your private key file (`.pem` / `.key`) is accessible.

## Configuration

The `config.ini` file must contain the following variables:

```ini
user = your_ec2_username
hostName = your_instance_ip_or_dns
keyPath = C:\path\to\your\private_key.pem
```

Note: Make sure there are spaces around the = sign so the script parses the data correctly.

## Usage

You can launch the connector in two different ways:

### Option 1: The Quick Double-Click (Recommended)

Simply double-click the Conectar.bat file included in the folder. It will bypass execution policies and launch the SSH session instantly.

### Option 2: Via Terminal

Open PowerShell.

Navigate to the directory where the script is located.

Run the following command:

```powershell
    .\aws.ps1
```

Developed with ♥️♥️♥️ by Felpondo Computers.
