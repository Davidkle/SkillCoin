const SkillCoin = artifacts.require("SkillCoin");

module.exports = function(deployer) {
  deployer.deploy(SkillCoin);
};
