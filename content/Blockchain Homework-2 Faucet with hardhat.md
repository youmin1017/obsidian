---
tags:
  - blockchain
---
## Notes

* Ethereum wallet addresses are in hex [0-9A-F]*. While the address itself is case-insensitive (`A` is the same as `a` to the network)

### Features

1. Deposit
2. Withdraw
3. Manager(Owner)
4. Register
5. Withdraw (Faucet)
6. getContractBalance -> should only called by owner
7. setInterest -> only called by manager
8. Transfer
9. Split Faucet to another smart contract

### Requirements

說明：各組繳交10頁以內之說明文件，內容包括：  
1. 首頁註明成員之學號與姓名  
2. 程式說明（程式結構及流程等），不要附上原始程式碼！  
3. 執行結果（相關截圖）與說明  
4. 遭遇的困難與解決方法

Better including the following features/functions in the contract:

1. Constructor and Selfdestruct (deprecated)
2. Function Modifiers
3. Contract Inheritance
4. Error Handling (assert, require, revert)
5. Events
6. Calling Other Contracts


## Refs

https://docs.soliditylang.org/en/v0.8.25/solidity-by-example.html
> Furthermore, instead of destroying the contract by calling selfdestruct, which is currently deprecated, we will disable the contract’s functionalities by freezing it, resulting in the reversion of any call after it being frozen.






