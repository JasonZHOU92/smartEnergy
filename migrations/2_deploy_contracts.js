var ConvertLib = artifacts.require("./ConvertLib.sol");
var SmartEnergy = artifacts.require("./SmartEnergy.sol");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, SmartEnergy);
  deployer.deploy(SmartEnergy);
};
