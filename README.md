# 🔐 Vault System with Foundry

This is a simple smart contract system for learning how to **store, deposit, and withdraw ETH securely** using **Foundry**, a blazing-fast Ethereum development framework.

💡 It's designed for educational purposes and runs on **Anvil** (a local testnet). No real ETH involved.

---

## 📦 What's Inside

| Folder | Purpose |
|--------|---------|
| `src/` | Contains smart contracts: `VaultBase`, `VaultManager`, and a `SafeMath` library |
| `script/` | Scripts to deploy and interact with the vault |
| `test/` | Sample tests for your contract |
| `broadcast/` | JSON logs from Anvil test runs (included for transparency and learning) |

---

## 🛠️ Features

- ✅ Deposit ETH into your own personal vault  
- ✅ Withdraw ETH (with balance checks)  
- ✅ Uses events to log transactions  
- ✅ Library (`SafeMath`) for secure math ops  
- ✅ Base + Manager contracts (Inheritance!)  
- ✅ `.env` and `foundry.toml` setup included  
