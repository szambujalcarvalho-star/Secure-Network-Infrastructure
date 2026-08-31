# Secure Network Infrastructure

University cybersecurity project focused on designing and configuring a segmented enterprise-style network with defensive security controls.

> **Academic context:** Computer and Network Security project at Instituto Superior Técnico.  
> **Final grade:** 18/20.  
> **Repository note:** this is a sanitized portfolio copy of the final submission. Generated credentials and private cryptographic material have intentionally been removed.

## Overview

The project models a multi-segment network in **Kathará**, using containerized network nodes and Linux networking tools. The implementation combines routing and segmentation with a VPN, SSH hardening, firewall policies, anti-spoofing controls, and network intrusion detection.

The lab topology is defined in [`lab/lab.conf`](lab/lab.conf) and contains Internet/cloud-facing systems, routers, packet filtering, several internal subnets, servers, clients, and a dedicated IDS node.

## Security Features

### OpenVPN

A routed OpenVPN setup provides remote access to internal networks.

The supplied configuration uses:

- UDP port `1194`
- TUN mode
- VPN subnet `10.8.0.0/24`
- routes to multiple internal networks
- `tls-auth`
- `AES-128-GCM`

Relevant configuration:

- [`lab/router1/etc/openvpn/server.conf`](lab/router1/etc/openvpn/server.conf)
- [`lab/ana/etc/openvpn/client.conf`](lab/ana/etc/openvpn/client.conf)
- [`lab/bento/etc/openvpn/client.conf`](lab/bento/etc/openvpn/client.conf)

Fresh certificates and keys must be generated locally before running the VPN.

### SSH hardening

Internal servers use OpenSSH configuration with password authentication disabled and public-key-based access.

Relevant files include the SSH daemon configurations under the server directories and the shared configuration template in [`lab/shared/sshd_config_dev`](lab/shared/sshd_config_dev).

The original SSH key pair and `authorized_keys` files are not included in this portfolio copy.

### Firewalling and anti-spoofing

Linux `iptables` rules are configured in the startup scripts, with restrictive forwarding policies and explicitly allowed flows between network segments.

Examples:

- [`lab/packetfilter.startup`](lab/packetfilter.startup)
- [`lab/router2.startup`](lab/router2.startup)

The rule sets implement traffic filtering between internal/external networks and include controls intended to mitigate spoofed traffic.

### Snort IDS

A dedicated IDS node runs **Snort** in NIDS mode and monitors the corporate network.

Custom rules detect:

- connection attempts to SMB (`TCP/445`)
- connection attempts to FTP data (`TCP/20`)
- possible TCP SYN port scans using rate-based detection

See [`lab/ids/etc/snort/rules/local.rules`](lab/ids/etc/snort/rules/local.rules).

A custom Docker image is provided to install and configure Snort:

- [`lab/docker/Dockerfile.snort`](lab/docker/Dockerfile.snort)
- [`lab/docker/build-snort.sh`](lab/docker/build-snort.sh)

## Technologies

- Kathará
- Docker
- Linux networking
- OpenVPN
- OpenSSH
- iptables
- Snort
- TCP/IP routing and subnetting
- `tcpdump`, `nc`, and `hping3` for testing and validation

## Repository Structure

```text
.
├── lab/
│   ├── lab.conf
│   ├── *.startup
│   ├── router1/
│   ├── router2/
│   ├── packetfilter/
│   ├── ids/
│   ├── docker/
│   └── ...
├── docs/
├── .gitignore
└── README.md
```

## Running the Lab

This repository preserves the configuration and scripts from the academic project, but it is **not immediately runnable after cloning** because generated certificates, private keys, SSH keys, and authentication files were deliberately removed.

Before starting the lab:

1. Install Docker and Kathará.
2. Build the Snort image using the supplied Docker build script.
3. Recreate the OpenVPN PKI material manually:
   - on `router1`, provide `ca.crt`, `server.crt`, `server.key`, `dh.pem`, and `ta.key`;
   - for `ana`, provide `ca.crt`, `ana.crt`, `ana.key`, and the same `ta.key`;
   - for `bento`, provide `ca.crt`, `bento.crt`, `bento.key`, and the same `ta.key`;
   - both client certificates must be issued by the same CA used by the server.
4. Recreate SSH authentication manually:
   - generate a fresh key pair for `pc1`, keeping the private key as `pc1/root/.ssh/id_rsa`;
   - install its public key in `root/.ssh/authorized_keys` on the servers that should accept that client;
   - allow `known_hosts` to be recreated when the client first connects.
5. Set the local `admin` password interactively where required. The original submitted password hash has intentionally been removed.
6. Start the topology from the `lab` directory with the appropriate Kathará command.

Each directory from which generated authentication material was removed contains its own `README.md` documenting the exact missing filenames and their role.

## Security / Sanitization

The original final submission contained generated cryptographic and authentication material used only inside the academic lab. This portfolio copy intentionally excludes that material, together with operating-system metadata and download-zone metadata.

No license is attached to this repository; it is presented as an academic portfolio project.
