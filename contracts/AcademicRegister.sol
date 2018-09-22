pragma solidity ^0.4.24;


contract AcademicRegister {
    //Information of the courses that has taken
    struct CourseInfo {
        address institution; 
        address teacher;
        address course;
    }
    
    address public currentInstitution;
    //Validation from the institution
    bool private validation;
    
    mapping(address => CourseInfo) private courses;
    //owner of the wallet
    address private owner;

    modifier onlyOwner {
        require(msg.sender == owner, "Caller not authorized.");
        _;
    }
    
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
    
    constructor() public {
        /// save the owner of this registry
        owner = msg.sender;
    }

    /// Getter for current Institution
    function getCurrentInstitution() public view returns (address, bool) {
        return (currentInstitution, validation);
    }
    
      /// Setter for current Institution.
    function setCurrentInstitution(address _institution) public onlyOwner {
        currentInstitution = _institution;
        validation = false;
    }
    
    function institutionValidation(bool _state) public isCurrentInstitution {
        validation = _state;
    }


    /// Getter for course
    function getCourseInfo(address _course) public view returns (address, address, address) {
        return (courses[_course].institution, courses[_course].teacher, courses[_course].course);
    }
    
     /// Setter for course
    function setCourseInfo(address _course, address _teacher) public ownerInstitution(_course) isCurrentInstitution {
        courses[_course].teacher = _teacher;
    }
    
      /// Creater for course
    function createCourse(address _course, address _teacher) public isCurrentInstitution {
        courses[_course].teacher = _teacher;
        courses[_course].institution = currentInstitution;
    }
}