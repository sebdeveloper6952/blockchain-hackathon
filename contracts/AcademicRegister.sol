pragma solidity ^0.4.24;

import "./Ownable.sol";

contract AcademicRegister is Ownable {
    
    struct CourseInfo {
        address institution; 
        address teacher;
        address course;
    }
    
    address public currentInstitution;
    
    mapping(address => CourseInfo) private courses;
    
    /// Only the current Institution can call functions with this modifier.
    modifier isCurrentInstitution() {
        require(currentInstitution == msg.sender, "Caller not authorized.");
        _;
    }
    
    /// Only the current Institution can call functions with this modifier.
    modifier ownerInstitution(address course) {
        require(courses[course].institution == msg.sender, "Caller not authorized.");
        _;
    }

    constructor(address _currentInstitution) public {
        currentInstitution = _currentInstitution;
    }
    
    /// Getter for current Institution
    function getCurrentInstitution() public view returns (address) {
        return currentInstitution;
    }
    
      /// Setter for current Institution.
    function setCurrentInstitution(address _institution) public onlyOwner {
        currentInstitution = _institution;
    }
    
    /// Getter for course
    function getCourseInfo(address _course) public view returns (address, address, address) {
        return (courses[_course].institution, courses[_course].teacher, courses[_course].course);
    }
    
     /// Setter for course
    function setCourseInfo(address _course, address _teacher, address _institution) public ownerInstitution(_course) isCurrentInstitution {
        courses[_course].teacher = _teacher;
        courses[_course].institution = _institution;
    }
    
      /// Creater for course
    function createCourse(address _course, address _teacher, address _institution) public isCurrentInstitution {
        courses[_course].teacher = _teacher;
        courses[_course].institution = _institution;
    }

}