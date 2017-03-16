pragma solidity ^0.4.0;

contract Coin {

    address minter;
    mapping(address => uint) balances;

    function Coin() {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) {
        if(minter != msg.sender) throw;
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) {
        if(balances[msg.sender] < amount) throw;

        balances[msg.sender] -= amount;
        balances[receiver] += amount;

        Sent(msg.sender, receiver, amount);
    }

    function getBalance() constant returns (uint) {
        return balances[msg.sender];
    }

    event Sent(address from, address to, uint amount);
}
