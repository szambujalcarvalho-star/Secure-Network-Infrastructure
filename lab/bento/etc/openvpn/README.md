# OpenVPN client credentials — Bento

The existing `client.conf` expects the cryptographic files below **in this directory**. The original generated credentials were removed from this public portfolio copy.

| File | Purpose | Commit to Git? |
|---|---|---|
| `ca.crt` | Public CA certificate used to validate the VPN server certificate | Optional; public |
| `bento.crt` | Public certificate identifying this VPN client | Optional; public |
| `bento.key` | **Private key** corresponding to `bento.crt` | **No** |
| `ta.key` | Shared TLS-auth key; must match the server's `ta.key` | **No** |

To restore the lab, create a fresh client certificate/key pair for **Bento**, signed by the same CA as the OpenVPN server. Copy the CA certificate and the server-generated TLS-auth key into this directory, preserving these filenames.

`bento.key` must remain private and should not be committed to Git.
