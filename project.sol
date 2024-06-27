// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyERC20Token {
    string public name = "My ERC20 Token";
    string public symbol = "MYT";
    uint public decimals = 18;
    uint public totalSupply;

    mapping (address => uint) public balances;
    mapping (address => mapping (address => uint)) public allowed;

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);

    address private owner;

    constructor() {
        owner = msg.sender;
        totalSupply = 0;
    }

    function mint(address _to, uint _amount) public {
        require(msg.sender == owner, "Only the owner can mint tokens");
        totalSupply += _amount;
        balances[_to] += _amount;
        emit Transfer(address(0), _to, _amount);
    }

    function burn(uint _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        totalSupply -= _amount;
        emit Transfer(msg.sender, address(0), _amount);
    }

    function transfer(address _to, uint _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        emit Transfer(msg.sender, _to, _amount);
    }

    function approve(address _spender, uint _amount) public {
        allowed[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
    }

    function transferFrom(address _from, address _to, uint _amount) public {
        require(balances[_from] >= _amount, "Insufficient balance");
        require(allowed[_from][msg.sender] >= _amount, "Insufficient allowance");
        balances[_from] -= _amount;
        balances[_to] += _amount;
        allowed[_from][msg.sender] -= _amount;
        emit Transfer(_from, _to, _amount);
    }

    function balanceOf(address _owner) public view returns (uint) {
        return balances[_owner];
    }

    function allowance(address _owner, address _spender) public view returns (uint) {
        return allowed[_owner][_spender];
    }
}
