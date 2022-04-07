pragma solidity ^0.4.0;

contract Coin{
    address public minter;
    event Sent(address sender,address reciever,uint amount);
    mapping (address => uint) public balances;

    function Coin() public{
        minter=msg.sender;
    }

    function mint(address reciever,uint amt) public{
        if(msg.sender!=minter)
        return;
        balances[reciever]+=amt;
    }

    function send(address to,uint amt) public{
        if(balances[msg.sender]<amt)
        return;
        balances[to]+=amt;
        balances[msg.sender]-=amt;
        emit Sent(msg.sender,to,amt);
    }

}
