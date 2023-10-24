# AppworksSchoolHw7-1_Test
## NONFT and Receiver
### General.sol
It's just an "ANY" ERC721 contract that can mint NFT and transfer NFT inherited openzepplin's ERC721.sol.
### NONFT.sol
It's the contract to mint the "NONFT".
### Receiver4.sol
It's a IERC721receiver contract. While received a NFT that is not from NONFT.sol, it will send the NFT back to the original owner and mint a NONFT and send it to the one who sent the NFT to this contract.
### Testing
Clone this repo and use foundry forge to test it with the command below:
```
forge test -vvv
```
You can find the foundry command below if needed.

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

