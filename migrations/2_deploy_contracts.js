const SimpleStorage = artifacts.require("./SimpleStorage.sol");
const Coin = artifacts.require("./Coin.sol");
const Ballot = artifacts.require('./Ballot.sol');

module.exports = function(deployer) {
	deployer.deploy(SimpleStorage);
	deployer.deploy(Coin);
	deployer.deploy(Ballot);
};
