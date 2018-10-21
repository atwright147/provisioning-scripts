# Enable Copy/Paste for VMs

This describes how to enable copy and paste functionality between the guest operating system and remote consoles.  This feature is disabled by default on esxi 4.1 and later.

## Step-by-step guide

These steps were tested on ESXi 6.0

1. Backup `/etc/vmware/settings`.
    - `cp /etc/vmware/settings /etc/vmware/<DATE>.settings`
1. `nano /etc/vmware/settings`
1. Add these lines:
    ```
    isolation.tools.copy.disable = "false"
    isolation.tools.paste.disable = "false"
    ```
1. If you chose to use vi, type :wq! to close the file
1. Restart your VM.

_From: https://wikileaks.org/ciav7p1/cms/page_24674311.html_
