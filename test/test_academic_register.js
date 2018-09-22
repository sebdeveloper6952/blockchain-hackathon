var AcademicRegister = artifacts.require("AcademicRegister");

contract("AcademicRegister", function() {
    let instance;
    let accounts;

    before(async () => {
        instance = await AcademicRegister.deployed();
        accounts = await web3.eth.accounts;
    });

    it("Sets current institution.", function () {
        instance.setCurrentInstitution(accounts[1])
        .then(function () {
            return instance.getCurrentInstitution();
        }).then(function (institution, valid) {
            assert.equal(institution, accounts[1], "Current institution.");
        });
    });

    // it("Institution sets course...", function () {

    // });

});