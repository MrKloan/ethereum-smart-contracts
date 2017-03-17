pragma solidity ^0.4.0;

contract Ballot {

    struct Proposal {
        bytes32 name;
        uint votes;
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

    function Ballot(bytes32[] proposalNames) {
        chairperson = msg.sender;
        voters[chairperson].weight = 1;

        for(uint i = 0 ; i < proposalNames.length ; ++i) {
            proposals.push(Proposal({
                name: proposalNames[i],
                votes: 0
            }));
        }
    }

    function giveRightToVote(address voter) {
        if(msg.sender != chairperson || voters[voter].voted) {
            throw;
        }

        voters[voter].weight = 1;
    }

    function delegate(address to) {
        Voter sender = voters[msg.sender];

        if(sender.voted || to == msg.sender) {
            throw;
        }

        // Follow the delegations
        while(voters[to].delegate != address(0)) {
            to = voters[to].delegate;

            // Throw if there is a delegation loop
            if(to == msg.sender) {
                throw;
            }
        }

        sender.voted = true;
        sender.delegate = to;

        Voter delegate = voters[to];
        delegate.weight += sender.weight;

        // If the delegate has already voted, add the number of votes to the proposal
        if(delegate.voted) {
            proposals[delegate.vote].votes += sender.weight;
        }
    }

    function vote(uint proposal) {
        Voter sender = voters[msg.sender];

        if(sender.voted) {
            throw;
        }

        sender.voted = true;
        sender.vote = proposal;

        // If proposal is out of range, this will throw and revert all changes
        proposals[proposal].votes += sender.weight;
    }

    function winningProposal() constant returns (uint winningProposal) {
        uint winningVoteCount = 0;

        for(uint i = 0 ; i < proposals.length ; ++i) {
            if(proposals[i].votes > winningVoteCount) {
                winningVoteCount = proposals[i].votes;
                winningProposal = i;
            }
        }
    }

    function winner() constant returns (bytes32 winner) {
        winner = proposals[winningProposal()].name;
    }
}