pragma solidity ^0.4.8;
import "./ConvertLib.sol";

contract SmartEnergy {
   /* Constructor */
   mapping (address => uint) balances;
   address owner;
   uint amount;
   uint priceInCent;
   uint dealDate;
   string greeting;
   Action action;
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
   }

    function getTotalPrice(uint amount, uint priceInCent) returns(uint totalPrice) {
        totalPrice = amount * priceInCent;
    }

   	function getBalanceInEth(address addr) returns(uint){
   		ConvertLib.convert(getBalance(addr),2);
   	}

   	function getBalance(address addr) returns(uint) {
		return balances[addr];
	}

	function getCurrentTimeStamp() return(unit) {
	    return block.timestamp
	}
}