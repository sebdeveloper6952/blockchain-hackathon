pragma solidity ^0.4.20;


contract EducationToken {

    string public name;
    string public description;
    address private owner;

    modifier onlyOwner {
        require(msg.sender == owner, "Caller not authorized.");
        _;
    }

    struct TokenInfo{
        uint256 date;
    }
    constructor(string _name, string _description) public {
        name = _name;
        description = _description;
        owner = msg.sender;
    }
    
    mapping(uint256 => address) private tokenIdToOwner;
    mapping(address => uint256) private ownershipCount;
    TokenInfo[] tokens;

    function createToken(string _description) public onlyOwner {
        TokenInfo memory tok = TokenInfo({
            date: block.timestamp
        });

        uint256 newTokenId = tokens.push(tok) - 1;

        // _transfer(address(0), _to, newTokenId);
    }

    function tranfer(address _to, uint256 _tokenId) public {
        _transfer(msg.sender, _to, _tokenId);
    }

    function _transfer(address _from, address _to, uint256 _tokenId) private {
        ownershipCount[_from]--;
        ownershipCount[_to]++;

        tokenIdToOwner[_tokenId] = _to;
    }
}