# SSH authorized key — Dev Server

The original `authorized_keys` file was removed from this public portfolio copy.

Before running the lab, create:

`root/.ssh/authorized_keys`

and add the **public SSH key** of the client that is allowed to connect to this server (for example, the contents of `pc1/root/.ssh/id_rsa.pub` after generating a fresh key pair).

Only the public key belongs in `authorized_keys`; never copy the client's private `id_rsa` file to this server or commit it to Git.
