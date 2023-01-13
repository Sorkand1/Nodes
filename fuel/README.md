# Deploy smart contract in Fuel

```
sudo apt update
```

```
sudo apt upgrade -y
```

```
apt install curl git -y
```

```
curl -s https://raw.githubusercontent.com/sorkand1/tools/main/install_rust.sh | bash
```

```
source "$HOME/.cargo/env"
```

```
curl — proto ‘=https’ — tlsv1.2 -sSf https://fuellabs.github.io/fuelup/fuelup-init.sh | sh 
```

<b> If it asks Y/n- enter N </b>

```
export PATH="${HOME}/.fuelup/bin:${PATH}"
fuelup self update
```

```
fuelup toolchain install beta-2
fuelup default beta-2 
```

```
mkdir fuel-project
cd fuel-project
```

```
forc new counter-contract
```

```
vim counter-contract/src/main.sw
```

A file with the text of the contract should open Press the <b>I</b> key, the word INSERT should appear in the terminal at the bottom Delete all the text of the contract and enter your own

```
contract;

storage {
    counter: u64 = 0,
}

abi Counter {
    #[storage(read, write)]
    fn increment();

    #[storage(read)]
    fn count() -> u64;
}

impl Counter for Contract {
    #[storage(read)]
    fn count() -> u64 {
        storage.counter
    }

    #[storage(read, write)]
    fn increment() {
        storage.counter = storage.counter + 1;
    }
}
```

Press ESC and enter <b>:w</b>, then <b>ENTER</b> <b>:q</b>and press <b>ENTER</b>, you should be thrown out of the contract!


```
fuelup toolchain new test_toolchain
fuelup component add forc@0.33.0
```

```
fuelup component add forc-wallet
cd counter-contract
forc build
forc-wallet init
```
Asked to enter a password - think up any, confirm it, <b> displays mnemonics and save mnemonics and password</b>! 

```
forc-wallet new
```

It will ask for a password - enter the password from the previous point, the address of the purse should pop up, <b>Save the address</b>

Request tokens by entering the wallet address [THERE](https://faucet-beta-2.fuel.network/)
You can check if they came [THERE](https://fuellabs.github.io/block-explorer-v2/)

ANYTHING BELOW MAY NOT WORK RIGHT THE FIRST TIME, THAT'S NORMAL! (There may be errors like Invalid Signature, try re-signing)


```
forc deploy --url node-beta-2.fuel.network/graphql --gas-price 1
```

Enter the wallet address and press ENTER The command will show the Transaction id line Copy it Press CTRL + C or Enter

```
forc wallet sign <Ваш Transaction id> 0
```

enter the password, press Enter and get Signature - Save it ! 

```
forc deploy --url node-beta-2.fuel.network/graphql --gas-price 1
```

Enter the wallet address and press ENTER Enter Signature from the previous point and press ENTER

<b>IMPORTANT</b>
Mnemonics, Address, Signature, Transaction id, Password must be saved

You can delete the contract with the following commands 

```
rm -rf fuel-project
rm -rf .fuel
rm -rf .fuelup
```
