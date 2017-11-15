# Getting Started

First install rust:

`curl https://sh.rustup.rs -sSf | sh`

Then Install Parity:

One liner:
```
bash <(curl https://get.parity.io -kL)
```

On Mac you can use the parity command like this:
`/Applications/Parity\ Ethereum.app/Contents/MacOS/parity`

Or you can add this line to `~/.bash_profile`

`alias parity="/Applications/Parity\ Ethereum.app/Contents/MacOS/parity"`

Or build from source:

```
git clone https://github.com/paritytech/parity
cd parity
cargo build --release
./target/release/parity --help
```

Start the dev testnet with this command:

`parity --chain dev --unlock=0x00a329c0648769a73afac7f9381e08fb43dbea72 --reseal-min-period 0 --password password.txt`

Use `ctrl + c` to turn off the testnet

Install solc, then compile the contracts with this command:

`solc -o build --bin --abi contracts/*.sol`

Start the truebit client with this:
```
cd truebit_client
cargo run
```

# Notes

Here is a rust ipfs api that we can use as a dependency
https://github.com/rmnoff/rust-ipfs-api

Rust web3 rpc client
https://github.com/tomusdrw/rust-web3

Source code for calling contracts
https://github.com/tomusdrw/rust-web3/blob/8b0076756d536411f024287490a3c803b8a7aadf/src/contract/mod.rs