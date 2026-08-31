# OpenVPN server cryptographic material

The original academic submission contained generated OpenVPN/PKI files in this directory. They are intentionally excluded from this public portfolio copy because some of them are private cryptographic material.

The existing `server.conf` expects the following files **in this directory**:

| File | Purpose | Commit to Git? |
|---|---|---|
| `ca.crt` | Public certificate of the Certificate Authority used to validate certificates issued for this VPN | Optional; public |
| `server.crt` | Public certificate identifying the OpenVPN server | Optional; public |
| `server.key` | **Private key** corresponding to `server.crt` | **No** |
| `dh.pem` | Diffie-Hellman parameters used by the server | Usually generated locally |
| `ta.key` | Shared TLS-auth key used by the server and clients | **No** |

Before running the lab, generate a fresh CA/server certificate and key, DH parameters, and TLS-auth key, then place them here using exactly the filenames above.

The client certificates must be signed by the same CA. The same `ca.crt` must therefore be available to the clients, and the same `ta.key` must be securely copied to each client configuration directory.

Do **not** reuse the original submission's private keys for a real system. Generate fresh lab-only credentials.
