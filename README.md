# servant-crud

This is an example CRUD web service and client written using Haskell's
`servant` library.  This provides the code for:

* a server that creates, reads, updates, and deletes files via a REST API, and:
* an example client program that uses the API.

To install this:

* [download stack](https://github.com/commercialhaskell/stack/blob/master/doc/install_and_upgrade.md)
* clone this repository
* Run `stack install`

This will create two executables named `crud-client` and `crud-server` under
`~/.local/bin`.  You can then launch the server by running:

```bash
$ ~/.local/bin/crud-server
```

... and then you can launch the client in a separate session by running:

```bash
$ ~/.local/bin/crud-client
Hello, world!
```

This project code is organized into three files:

* `src/Servant/Crud.hs` - The definition of the REST API
* `exec/Server.hs` - Server-specific logic
* `exec/Client.hs` - Client-specific logic
