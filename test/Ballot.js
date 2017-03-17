const Ballot = artifacts.require('./Ballot.sol');

contract('Ballot', accounts => {
	it('should create a new ballot with default proposals', () => {
		let ballot;

		return Ballot.deployed()
			.then(_ballot => {
				ballot = _ballot;
			});
	});
});