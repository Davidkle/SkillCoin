const SkillCoin = artifacts.require("SkillCoin");

contract('SkillCoin', (accounts) => {
  const owner = accounts[0];
  const user1 = accounts[1];
  const user2 = accounts[2];
  
  it('should put 1B coins in the owner account', async () => {
    const skillCoinInstance = await SkillCoin.deployed(owner);
    const balance = await skillCoinInstance.balanceOf.call(owner);
    assert.equal(balance.valueOf(), 1000000000);
  });

  it('should send coins correctly', async () => {
    const skillCoinInstance = await SkillCoin.deployed(owner);
    await skillCoinInstance.transfer(user1, 10);

    const balanceUser1 = (await skillCoinInstance.balanceOf.call(user1)).toNumber();
    assert.equal(balanceUser1, 10); 
  });
});