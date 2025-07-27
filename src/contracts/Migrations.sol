pragma solidity ^0.8.0;

contract Migrations {
    address public owner;
    uint public last_complated_migration;

    constructor() public {
        owner = msg.sender;
    }

    modifier restricted(){
        if(msg.sender == owner) _;
    }

    function SetComplated(uint complated) public restricted {
        last_complated_migration = complated;
    }

    function Upgrade(address new_address) public restricted {
        Migrations upgraded = Migrations(new_address);
        upgraded.SetComplated(last_complated_migration);
    }
}