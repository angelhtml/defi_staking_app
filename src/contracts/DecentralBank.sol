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
    mapping(address => uint) public hasStacked;
    mapping(address => uint) public isStacked;

    constructor(RWD _rwd, Tether _tether ) public {
        rwd = _rwd;
        tether = _tether;
    }

    function depositToken(uint _amount) public {
        tether.transferFrom(msg.sender, address(this), _amount);
        // update staking balance
        stackingBalance[msg.sender] += _amount
    }

}