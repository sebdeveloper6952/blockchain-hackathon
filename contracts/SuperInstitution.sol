pragma solidity ^0.4.24;

import "./EducationToken.sol";

contract SuperInstitution {
    string public name;
    mapping (address => bool) public approvedCourses;
    mapping (address => string) public institutions;

    EducationToken tokens; 
    address owner;
    modifier onlyOwner {
        require(msg.sender == owner, "Caller not authorized.");
        _;
    }

    modifier onlyAuthorized(course) {
        require(approvedCourses[course], "Caller not authorized.");
        _;
    }
    constructor(string _name) public {
        name = _name;
        tokens = new EducationToken("Reading1", "The student can produce the sound of the letters"); 
        owner = msg.sender;
    }

     /// Registers an approved course 
    function approveCourse(address course) public {
        approvedCourses[course] = true;
    }


     /// Transfer a token from the student to 
    function approveStudent(address course, address student) public onlyAuthorized(course) {
        tokens.createToken(student);   
    }
}