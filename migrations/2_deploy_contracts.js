const ConvertLib = artifacts.require("ConvertLib");
const SkillCoin = artifacts.require("SkillCoin");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, SkillCoin);
  deployer.deploy(SkillCoin);
};
