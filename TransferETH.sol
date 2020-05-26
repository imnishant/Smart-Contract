pragma solidity ^0.5.11;

contract TransferETH
{
    mapping (address => uint) balances;
    
    function deposit(address to) external payable
    {
        require(msg.value > 0);
        balances[to] += msg.value;    
    }
    
    function getBalance(address add) public view returns (uint)
    {
        return balances[add];
    }
    
    function sendEther(address payable to, uint amount) external
    {
        require(amount > 0 && amount <= balances[to]);
        balances[to] -= amount;
        to.transfer(amount);
    }
}
