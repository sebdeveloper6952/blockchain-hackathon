pragma solidity ^0.4.24;

import "./Ownable.sol";

contract Teacher is Ownable {
    
    struct CourseInfo{
        address institution; 
        bool giving;
        bool givingConfirmation;
    }
    
    mapping(address => CourseInfo) private courses;

    /// Only the current Institution can call functions with this modifier.
    modifier ownerInstitution(address course) {
        require(courses[course].institution == msg.sender, "Caller not authorized.");
        _;
    }
    
      /// Creater for course
    function createCourse(address _course, address _institution) public onlyOwner {
        courses[_course].institution = _institution;
        courses[_course].giving = true;
        courses[_course].givingConfirmation = false;
        
    }
    
    /// Getter for course
    function getCourseInfo(address _course) public view returns (address, bool, bool) {
        return (courses[_course].institution, courses[_course].giving, courses[_course].givingConfirmation);
    }
    
     /// Setter for course Confimation
    function courseConfimationInstitution(address _course, bool _state) public ownerInstitution(_course) {
        courses[_course].givingConfirmation = _state;
    }
    
     /// Setter for course giving
    function courseConfimation(address _course, bool _state) public onlyOwner {
        courses[_course].giving = _state;
    }
    
    

}