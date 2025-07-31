// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

import "./RWD.sol";
import "./Tether.sol";

contract DecentralBank {
    string public name = "Decentral Bank";
    address public owner;
    Tether public tether;
    RWD public rwd;

    address[] public stakers;

    mapping(address => uint) public stackingBalance;
    mapping(address => bool) public hasStacked;
    mapping(address => bool) public isStacking;

    constructor(RWD _rwd, Tether _tether ) public {
        rwd = _rwd;
        tether = _tether;
    }

    function depositToken(uint _amount) public {
        //require stacking amount to be grater than zero
        require(_amount > 0, "amount cannot to be zero");
        tether.transferFrom(msg.sender, address(this), _amount);
        // update staking balance
        stackingBalance[msg.sender] += _amount;

        if(!hasStacked[msg.sender]){
            stakers.push(msg.sender);
        }

        // update stacking balance
        isStacking[msg.sender] = true;
        hasStacked[msg.sender] = true;
    }

}