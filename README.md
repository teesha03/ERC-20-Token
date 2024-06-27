# MY ERC-20 Token
A basic ERC20 token implementation in Solidity.

## Description
This contract implements a basic ERC20 token, allowing users to mint, burn, transfer, and approve tokens. The contract has the following features:

- Minting: The contract owner can mint new tokens and assign them to a specified address.
- Burning: Token holders can burn a specified amount of tokens from their balance.
- Transferring: Token holders can transfer tokens to another address.
- Approving: Token holders can approve another address to spend tokens on their behalf.
- Balance checking: Users can check the token balance of a specified address.
- Allowance checking: Users can check the approved allowance of a specified address for another address.


## Functions

- mint(address _to, uint _amount): 
Mints new tokens and assigns them to the specified address _to.
- burn(uint _amount):
Burns a specified amount of tokens from the caller's balance.
- transfer(address _to, uint _amount):
Transfers a specified amount of tokens to the specified address _to.
- approve(address _spender, uint _amount):
Approves the specified address _spender to spend a specified amount of tokens on behalf of the caller.
- transferFrom(address _from, address _to, uint _amount):
Transfers a specified amount of tokens from the specified address _from to the specified address _to, using the approved allowance.
- balanceOf(address _owner):
Returns the token balance of the specified address _owner.
- allowance(address _owner, address _spender):
Returns the approved allowance of the specified address _owner for the specified address _spender.

## Deployment
To deploy this contract, simply compile and deploy it to the Ethereum blockchain using your preferred development environment.

## License

This project is licensed under the MIT License.
