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

