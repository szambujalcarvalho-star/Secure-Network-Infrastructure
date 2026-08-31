# OpenVPN client credentials — Ana

The existing `client.conf` expects the cryptographic files below **in this directory**. The original generated credentials were removed from this public portfolio copy.

| File | Purpose | Commit to Git? |
|---|---|---|
| `ca.crt` | Public CA certificate used to validate the VPN server certificate | Optional; public |
| `ana.crt` | Public certificate identifying this VPN client | Optional; public |
| `ana.key` | **Private key** corresponding to `ana.crt` | **No** |
| `ta.key` | Shared TLS-auth key; must match the server's `ta.key` | **No** |

To restore the lab, create a fresh client certificate/key pair for **Ana**, signed by the same CA as the OpenVPN server. Copy the CA certificate and the server-generated TLS-auth key into this directory, preserving these filenames.

`ana.key` must remain private and should not be committed to Git.
