pragma solidity ^0.4.24;

contract Course {
    string private Name;
    address private Teacher;
    address private Institution;
    address private owner;
    mapping (address => string[]) public tokens;

    modifier onlyOwner {
        require(msg.sender == owner, "Caller not authorized.");
        _;
    }
    
    constructor (address _institution, string _name, address _teacher) public onlyOwner {
        Name = _name;
        owner = msg.sender;
    }
       /// Setter for name
    function setName(string _name) public onlyOwner {
        Name = _name;
    }
    
   /// Getter for name
    function getName() public view returns(string) {
        return Name;
    }
        /// Setter for Teacher
    function setTeacher(address _teacher) public onlyOwner {
        Teacher = _teacher;
    }
    
    /// Getter for Teacher
    function getTeacher() public view returns(address) {
        return Teacher;
    }

    
}