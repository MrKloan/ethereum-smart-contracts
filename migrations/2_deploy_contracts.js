const SimpleStorage = artifacts.require("./SimpleStorage.sol");
const Coin = artifacts.require("./Coin.sol");

module.exports = function(deployer) {
	deployer.deploy(SimpleStorage);
	deployer.deploy(Coin);
};
