# Pixel Worlds Account Switcher

This repository contains a PowerShell script to manage and switch accounts in the Pixel Worlds game. Follow the steps below to set up and use the script.

## Table of Contents
1. [Installation](#installation)
2. [Configuration](#configuration)
3. [Usage](#usage)

## Installation

1. **Extract the `pwas.pw1` File**

   Extract the `pwas.pw1` file to a desired location on your system. For example, you can extract it to `C:\Program Files\pwas\`.

2. **Set Up PowerShell Profile**

   Add the following line to your PowerShell profile to create an alias for the script. This allows you to run the script easily from any PowerShell session.

   Open your PowerShell profile file by running the following command in PowerShell:
   ```powershell
   notepad $PROFILE
   ```

   Add the following line to the PowerShell profile file:
   ```powershell
   Set-Alias -Name pwas -Value "C:\Your\Path\To\pwas.ps1"
   ```

   Save and close the file.

## Configuration

1. **Define Accounts Folder Destination**

   You need to specify the accounts folder destination inside the `pwas.ps1` script. This folder will store account information and configurations.

   Open the `pwas.ps1` file in a text editor:
   ```powershell
   notepad "C:\Your\Path\To\pwas.ps1"
   ```

   Locate the section where the accounts folder destination is defined. It should look something like this:
   ```powershell
   # Define the accounts folder destination
   $accountsFolder = "C:\Path\To\Accounts\Folder"
   ```

   Modify the path to point to your desired accounts folder location. For example:
   ```powershell
   $accountsFolder = "C:\Users\YourUsername\Documents\PixelWorldsAccounts"
   ```

   Save and close the file.

## Usage

1. **Switching Accounts**

   To switch accounts, simply open a PowerShell session and run the following command:
   ```powershell
   pwas
   ```

   Follow the on-screen prompts to select and switch to the desired account.

2. **Adding New Accounts**

   To add a new account, you can modify the accounts folder directly by adding new `.account` files. Ensure each account has its own `.account` file within the accounts folder specified in the `pwas.ps1` script.

   For example:
   ```
   C:\Users\YourUsername\Documents\PixelWorldsAccounts
   ├── Account1.account
   ├── Account2.account
   └── Account3.account
   ```

   Each `.account` file should contain the necessary account information in binary values. The structure of each file should include:

   ```
   CognitoIdentity:20 30 3B 8B 50
   LastLoginKey:30 40 90 7B 2B 7B 9A 12
   ```

   This format includes binary values representing the account details.