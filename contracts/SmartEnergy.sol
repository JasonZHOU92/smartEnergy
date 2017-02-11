pragma solidity ^0.4.0;
import "./ConvertLib.sol";

contract SmartEnergy {
   /* Constructor */
   mapping (address => uint) balances;
   address owner;
   public uint amount;
   public uint priceInCent;
   public uint dealDate;
   string greeting;
   Action public action;
   enum Action { Buy, Sell} // Enum


   function buy(address owner, uint amount, uint priceInCent, uint dealDate) returns(bool sufficient){
      if (balances[owner] < amount * priceInCent) return false;
      balances[owner] -= amount * priceInCent;
      return true;
   }

   function sell(address owner, uint amount, uint priceInCent, uint dealDate){
      balances[owner] += amount * priceInCent;
   }

   function SmartEnergy(uint amount, uint priceInCent, uint dealDate, Action action) {
       owner = msg.sender;
       amount = amount;
       priceInCent = priceInCent;
       dealDate = dealDate;
       action = action;
       balances[0] = getBalance(msg.sender);
   }

    function getTotalPrice(uint amount, uint priceInCent) returns(uint totalPrice) {
        totalPrice = amount * priceInCent;
    }

   	function getBalanceInEth(address addr) returns(uint){
   		ConvertLib.convert(getBalance(addr),2);
   	}

   	function getBalance(address addr) constant returns(uint) {
		return balances[addr];
	}

	function debug() returns (string){
        return "debug";
    }

}