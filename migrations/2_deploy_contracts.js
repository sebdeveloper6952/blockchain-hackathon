var Identity = artifacts.require("Identity");
var Courses = artifacts.require("Courses");
var AcademicRegister = artifacts.require("AcademicRegister");
var Teacher = artifacts.require("Teacher");
var Institution = artifacts.require("Institution");

module.exports = function(deployer) {
    deployer.deploy(Identity, "sebas", "28310270921", "23123123123");
    deployer.deploy(Courses);
    deployer.deploy(AcademicRegister, web3.eth.accounts[0]);
    deployer.deploy(Teacher);
    deployer.deploy(Institution);
}