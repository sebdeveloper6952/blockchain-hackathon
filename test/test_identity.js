var Identity = artifacts.require("Identity");

contract("Identity", function() {
    let instance;
    let accounts;

    before(async () => {
        instance = await Identity.deployed();
        accounts = await web3.eth.accounts;
    });

    it('Authorize an account.', function () {
        instance.authorizeAccount(accounts[1])
        .then(function (receipt) {
            instance.isAuthorized(accounts[1])
            .then(function (isauth) {
                assert(isauth);
            });
        });
    });

    it("Contract initialized correctly.", function() {
        instance.getName().then(function (name) {
            assert.equal(name, "Persona 1", "Identity name...");
            return _instance.getCui();
        }).then(function (cui) {
            assert.equal(cui, "28310270921", "Identity cui...");
            return _instance.getBornDate();
        }).then(function (date) {
            assert.equal(date, "23123123123", "Identity born date...");
        });
    });

});