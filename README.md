# My NFT on SUI

These code will help you create NFTs and publish on SUI for development and testing purposes.

See deployment for notes on how to deploy the project on a live system.

## Getting Started

### Installing

1. Install Rust

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

2. Set Environment Variable

```
source "$HOME/.cargo/env"
```

3. Update to Stable Edition

```
rustup update stable
```

4. Download brew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

6. Install curl

```
brew install curl
```

7. Install cmake

```
brew install cmake
```

8. Install git

```
brew install git 
```

9. Install SUI-binary Document

```
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui
```

10. Open VScode and Install sui-move-analyzer

```
cargo install --git https://github.com/move-language/move move-analyzer --branch sui-move --features "address32"
```

11. Modify Extension Settings path to 

```
/Users/{user_name}/.cargo/bin/move-analyzer
```

## Setting SUI Client

```
sui client
```
If starting for the first time, the console would display the message

```
Config file ["<PATH-TO-FILE>/client.yaml"] doesn't exist, do you want to connect to a Sui Full node server [y/N]?
```

please type 'y' and click enter

Then will display the message

```
Sui Full node server URL (Defaults to Sui Devnet if not specified) :
```

Default is Sui Devnet, you can also type in Sui Testnet or Sui Mainnet

Sui Mainnet URL: https://fullnode.mainnet.sui.io:443

Sui Testnet URL: https://fullnode.testnet.sui.io:443

Sui Devnet URL: https://fullnode.devnet.sui.io:443

Then will create a new wallet address, please type 0 as ed25519

```
Select key scheme to generate keypair (0 for ed25519, 1 for secp256k1, 2 for secp256r1):
```

Console log will display your address and 12 recovert phrases, and please memorize those mnemonic phrases

## Built With

In VScode console

```
sui move build
```

* [SUI Move](https://github.com/MystenLabs/sui)
* [SUI discord](https://discord.com/invite/sui) - get SUI test coin
* [sui](https://github.com/MystenLabs/sui/tree/main/crates/sui-framework/packages/sui-framework/sources) - SUI framework used
* [std](https://github.com/MystenLabs/sui/tree/main/crates/sui-framework/packages/move-stdlib/sources) - Move-stdlib framework
## Publish

In VScode console

```
sui client publish --gas-budget 100000000
```

In the output log, you can found a package id, and copy it to the [sui explorer](https://suiexplorer.com/) to find the contract.

![NFT_onSUIscan](https://github.com/Rita94105/NFT_SUI/blob/master/img/NFT-basic.png)
![NFT_field](https://github.com/Rita94105/NFT_SUI/blob/master/img/NFT-field.png)
![NFT_transaction](https://github.com/Rita94105/NFT_SUI/blob/master/img/NFT-transaction.png)

