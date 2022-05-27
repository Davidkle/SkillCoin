// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

import 'truffle/Assert.sol';
import 'truffle/DeployedAddresses.sol';
import '../contracts/SkillCoin.sol';

contract TestSkillCoin {
  function testInitialBalanceUsingDeployedContract() public {
    SkillCoin skill = SkillCoin(DeployedAddresses.SkillCoin());

    uint256 expected = 1000000000;

    Assert.equal(skill.balanceOf(tx.origin), expected, 'Owner should have 1B SkillCoin initially');
  }
}
