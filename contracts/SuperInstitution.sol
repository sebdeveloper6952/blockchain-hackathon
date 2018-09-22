pragma solidity ^0.4.24;

import "./Ownable.sol";
import "./EducationToken.sol";

contract SuperInstitution {
    string public name;
    mapping (address => string) public tokenToName;

    constructor(string _name) public {
        name = _name;
    }

    function createToken(string _name, string _description) public {
        EducationToken createdToken = new EducationToken(_name, _description);
        tokenToName[address(createdToken)] = _name;
    }
}