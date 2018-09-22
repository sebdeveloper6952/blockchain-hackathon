pragma solidity ^0.4.24;

import "./Course.sol";

contract Institution {
    
    string Name;
    address[] Courses;
    
    mapping (address => bool) public Students;
    mapping (address => bool) public Teachers;

    address private owner = msg.sender;

    modifier onlyOwner {
        require(msg.sender == owner, "Caller not authorized.");
        _;
    }
    
    /// Setter for name
    function setName(string _name) public onlyOwner {
        Name = _name;
    }
    
   /// Getter for name
    function getName() public view returns(string) {
        return Name;
    }
    
    /// Create Course
    /// leer addresses de tokens que queremos
    function createCourse(address _institution, string _name, address _teacher) public onlyOwner {
        address newCourse = new Course( _institution, _name, _teacher);
        Courses.push(newCourse);
    }

    /// Add Student
    function addStudent(_address) public onlyOwner {
        Students[_newAddress] = true;
    }

    /// Remove Student
    function removeStudent(_address) public onlyOwner {
        Students[_newAddress] = false;
    }

    /// Add teacher
    function addTeacher(_address) public onlyOwner {
        Teachers[_newAddress] = true;
    }

    /// Remove teacher
    function removeTeacher(_address) public onlyOwner {
        Teachers[_newAddress] = false;
    }
}