# 🔐 Vault Foundry project

This is a simple educational project built with [Foundry](https://getfoundry.sh/introduction/installation/#using-foundryup) that demonstrates how to create a secure Ethereum vault system.  
Users can **deposit** and **withdraw** ETH while applying key smart contract development concepts such as:

- Inheritance and modular architecture  
- Event emission on actions  
- Input validation using `require()`  
- External calls with low-level `.call`  
- Math safety using a helper library  

The project runs locally using Anvil (Foundry's testnet node)
Anvil is part of the Foundry toolkit, which makes it very straightforward to get started with local Ethereum development.

---

## 📁 Project structure
```
vault-foundry/
├── src/ # Smart contracts
│ ├── VaultBase.sol
│ ├── VaultManager.sol
│ └── SafeMath.sol
├── script/ # Deploy + interaction scripts
│ ├── Deploy.s.sol
│ ├── Deposit.s.sol
│ └── Withdraw.s.sol
├── test/ #Tests
│ ├── VaultManager.t.sol
├── broadcast/ # JSON traces of deployments/interactions
├── .env # Your local private key & RPC URL
├── foundry.toml # Foundry config
└── README.md
```

---

## 🚀 How to run locally

### 1. Clone the repo

```bash
git clone https://github.com/Dxmrt/vault-foundry.git
cd vault-foundry
```

### 2. Install dependencies

```bash
forge install
```

### 3. Setup Anvil

Start a local testnet node:

```bash
anvil
```

Copy one of the default private keys shown into your .env file like this:

```bash
PRIVATE_KEY=0x<your_anvil_private_key>
LOCAL_RPC_URL=http://127.0.0.1:8545
```

Also ensure .env access is allowed in foundry.toml:
```bash
dotenv = ".env"
fs_permissions = [{ access = "read", path = ".env" }]
```

## 🛠️ Commands

All these commands assume Anvil is running and your .env is configured properly.

✅ Deploy the vault contract

```bash
forge script script/Deploy.s.sol:DeployVaultManager --broadcast --rpc-url http://127.0.0.1:8545
```

This will deploy the VaultManager contract and save the address to vault_address.txt.

💰 Deposit ETH

```bash
forge script script/Deposit.s.sol:DepositScript --broadcast --rpc-url http://127.0.0.1:8545
```

This script deposits 1 ETH into the deployed vault contract from the sender.

💸 Withdraw ETH

```bash
forge script script/Withdraw.s.sol:WithdrawScript --broadcast --rpc-url http://127.0.0.1:8545
```

This script withdraws 1 ETH from the vault to the sender’s wallet.

✅ Example output

```bash
VaultManager deployed at: 0x1234...

== ONCHAIN EXECUTION COMPLETE & SUCCESSFUL ==
Transactions saved to: ./broadcast/Withdraw.s.sol/31337/run-latest.json
```

## 📚 Educational notes

This project was made for learning purposes. It’s safe to push to GitHub as long as:

    Your .env file is excluded via .gitignore

    You’re using Anvil testnet (not a real private key)
    

## 🤝 Contributing

Wanna improve this project or fix something? You’re more than welcome! 😊

Whether it’s:

- Cleaning up the code
- Adding more scripts (multi-user deposit? UI ideas?)
- Writing tests
- Explaining something better for beginners

...every little contribution counts 💜

### How to contribute

1. **Fork** this repo
2. Create a new branch: `git checkout -b your-cool-feature`
3. Make your changes and **commit**: `git commit -m "add feature: your cool idea"`
4. Push to your fork: `git push origin your-cool-feature`
5. Open a **Pull Request** and let’s build together!

