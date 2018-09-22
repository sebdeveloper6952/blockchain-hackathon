pragma solidity ^0.4.24;

import "./Ownable.sol";

contract Institution is Ownable {
    
    string Name;
    address[] Courses;
    
    /// Setter for name
    function setName(string _name) public onlyOwner {
        Name = _name;
    }
    
   /// Getter for name
    function getName() public view returns(string) {
        return Name;
    }
    
    ///Create Course
    function createCourse(address _institution, string _name, address _teacher) public onlyOwner {
        address newCourse = new Course( _institution, _name, _teacher);
        Courses.push(newCourse);
    }

}

contract Course is Ownable{
    string private Name;
    address private Teacher;
    address private Institution;
    
    constructor (address _institution, string _name, address _teacher) public onlyOwner {
        Name = _name;
        Institution = _institution;
        Teacher = _teacher;
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