pragma solidity ^0.4.20;

import "./AccessControl.sol";
import "../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract EducationToken is Ownable{

    string public name;
    string public description;

    struct TokenInfo{
        uint256 date;
    }
    constructor(string _name, string _description) public {
        name = _name;
        description = _description;
    }
    
    mapping(uint256 => address) private tokenIdtoOwner;
    mapping(address => uint256) private ownershipCount;
    TokenInfo[] tokens;

    function createToken(string _description) onlyOwner public {
        TokenInfo memory tok = TokenInfo({
            date: block.timestamp
        });

        uint256 newTokenId = tokens.push(tok) - 1;

        _transfer(address(0), _to, newTokenId);
    }

    function tranfer(address _to, uint256 _tokenId) public {
        _transfer(msg.sender, _to, _tokenId);
    }

    function _transfer(address _from, address _to, uint256 _tokenId) private {
        ownershipCount[_from]--;
        ownershipCount[_to]++;

        tokenIdtoOwner[_tokenId] = _to;
    }
}