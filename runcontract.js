/**
 * Created by jaszhou on 11/02/2017.
 */
var Web3 = require('web3'),
    filesystem = require("fs"),
    BigNumber = require('bignumber.js');

var web3 = new Web3(new Web3.providers.HttpProvider("http://127.0.0.1:8007"));

var myAccount = web3.eth.accounts[0];

var address = "0x733e1a8bcca8cdefd63f598a6932d4abe67848cc";


var abiString = filesystem.readFileSync("build/contracts/SmartEnergy.json", "utf8");
var abi = JSON.parse(abiString);
var Contract = web3.eth.contract(abi);
var MyContract = Contract.at(address);


console.log('greeting: ' + MyContract.showGreeting.call());