pragma solidity ^0.4.0;

contract SimpleStorage {

    uint data;

    function get() constant returns (uint) {
        return data;
    }

    function set(uint _data) {
        data = _data;
    }
}
