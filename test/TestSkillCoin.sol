pragma solidity ^0.8.14;

import 'truffle/Assert.sol';
import 'truffle/DeployedAddresses.sol';
import '../contracts/SkillCoin.sol';

contract TestSkillCoin {
  function testInitialBalanceUsingDeployedContract() public {
    SkillCoin skill = SkillCoin(DeployedAddresses.SkillCoin());

    uint256 expected = 10000;

    Assert.equal(skill.getBalance(tx.origin), expected, 'Owner should have 10000 SkillCoin initially');
  }

  function testInitialBalanceWithNewSkillCoin() public {
    SkillCoin skillCoin = new SkillCoin();

    uint256 expected = 10000;

    Assert.equal(skillCoin.getBalance(tx.origin), expected, 'Owner should have 10000 SkillCoin initially');
  }
}
