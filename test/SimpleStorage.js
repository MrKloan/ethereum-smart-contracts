const SimpleStorage = artifacts.require('./SimpleStorage.sol');

contract('SimpleStorage', accounts => {
	it("should store the value 100", () => {
		let storage;

		return SimpleStorage.deployed()
			.then(_storage => {
				storage = _storage;
				storage.set(100, {from: accounts[0]})
			})
			.then(() => storage.get.call(accounts[0]))
			.then(data => assert.equal(data, 100, "100 wasn't stored in the contract"));
	});
});
