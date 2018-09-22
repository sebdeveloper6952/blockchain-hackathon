var Identity = artifacts.require("Identity");
// var Courses = artifacts.require("Courses");
var AcademicRegister = artifacts.require("AcademicRegister");
// var Teacher = artifacts.require("Teacher");
// var Institution = artifacts.require("Institution");
// var SuperInstitution = artifacts.require("SuperInstitution");

module.exports = function(deployer) {
    deployer.deploy(Identity, "Persona 1", "28310270921", "23123123123");
    // deployer.deploy(Courses);
    deployer.deploy(AcademicRegister);
    // deployer.deploy(Teacher);
    // deployer.deploy(Institution);
    // deployer.deploy(SuperInstitution, "SuperInstitution");
}