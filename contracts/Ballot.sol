pragma solidity ^0.4.0;

contract Ballot {

    struct Proposal {
        bytes32 name;
        uint voteCount;
    }

    struct Voter {
        uint weight; // Accumulated by delegation
        address delegate;
        bool voted;
        uint vote;
    }

    address public chairperson;
    Proposal[] public proposals;
    mapping(address => Voter) public voters;


}