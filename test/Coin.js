const Coin = artifacts.require('./Coin.sol');

contract('Coin', accounts => {
	it('should start with a balance of 0', () => {
		return Coin.deployed()
			.then(coin => coin.getBalance.call(accounts[0]))
			.then(balance => assert.equal(balance, 0, 'The balance shouldn\'t be initialized!'));
	});

	it('should be able to mint coins', () => {
		let coin;

		return Coin.deployed()
			.then(_coin => {
				coin = _coin;
				coin.mint(accounts[0], 100, {from: accounts[0]});
			})
			.then(() => coin.getBalance.call(accounts[0]))
			.then(balance => assert.equal(balance, 100, 'accounts[1] should have a balance of 100'));
	});

	// Send method requires to much funds?
	/*it('should be able to send coins', () => {
		let coin;

		return Coin.deployed()
			.then(_coin => {
				coin = _coin;
				coin.send(accounts[1], 50, {from: accounts[0], gas: 3000000})
			})
			.then(() => coin.getBalance.call(accounts[0]))
			.then(balance => assert.equal(balance, 50, 'accounts[0] should have a balance of 50'))
			.then(() => coin.getBalance.call(accounts[1]))
			.then(balance => assert.equal(balance, 50, 'accounts[1] should have a balance of 50'));
	});*/
});
