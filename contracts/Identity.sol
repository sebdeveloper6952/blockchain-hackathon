pragma solidity ^0.4.24;

contract Identity {
    
    string private name;
    string private cui;
    string private bornDate;
    mapping(address => bool) private authorizedAccounts;
    address private owner;

    event identityCreatedEvent();

    modifier onlyOwner {
        require(msg.sender == owner, "Caller not authorized.");
        _;
    }
    
    constructor(string _name, string _cui, string _bornDate) public {
        name = _name;
        cui = _cui;
        bornDate = _bornDate;
        owner = msg.sender;
        emit identityCreatedEvent();
    }
    
    /// Only authorized addresses can call functions with this modifier.
    modifier authorizedOnly() {
        require(authorizedAccounts[msg.sender], "Caller not authorized.");
        _;
    }
    
    /// Getter for Identity name.
    function getName() public view authorizedOnly returns (string) {
        return name;
    }
    
    /// Getter for Identity CUI.
    function getCui() public view authorizedOnly returns(string) {
        return cui;
    }
    
    /// Getter for Identity born date.
    function getBornDate() public view authorizedOnly returns(string) {
        return bornDate;
    }
    
    /// Give authorization to a contract to an address.
    function authorizeAccount(address _newAddress) public onlyOwner {
        authorizedAccounts[_newAddress] = true;
    }

    function isAuthorized(address _address) public view returns (bool) {
        return authorizedAccounts[_address];
    }

    /// Give authorization to a contract to an address.
    function deauthorizeAccount(address _newAddress) public onlyOwner {
        authorizedAccounts[_newAddress] = false;
    }
}