# SSH client credentials

The original SSH authentication files were removed from this public portfolio copy.

This client originally used a standard RSA SSH key pair:

| File | Purpose | Commit to Git? |
|---|---|---|
| `id_rsa` | **Private SSH key** used by this client to authenticate to the servers | **No** |
| `id_rsa.pub` | Public half of the SSH key pair | Optional; public |
| `known_hosts` | Records server host keys accepted by this client | Normally generated locally |

Before running the SSH part of the lab, generate a fresh SSH key pair for this client. Keep the private key at `root/.ssh/id_rsa`.

Copy the contents of the newly generated `id_rsa.pub` into the `authorized_keys` file of every server to which this client should authenticate.

The original project disables SSH password authentication on the relevant servers, so public-key authentication must be configured for those connections to work.
