var AcademicRegister = artifacts.require("AcademicRegister");

contract("AcademicRegister", function() {
    let instance;
    let accounts;

    before(async () => {
        instance = await AcademicRegister.deployed();
        accounts = await web3.eth.accounts;
    });

    it("AcademicRegister created successfully.", function () {
        instance.getCurrentInstitution()
        .then(function (institution) {
            assert.equal(institution, web3.eth.accounts[0]);
        });
    });

});