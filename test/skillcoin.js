const SkillCoin = artifacts.require("SkillCoin");

contract('SkillCoin', (accounts) => {
  const owner = accounts[0];
  const user1 = accounts[1];
  const user2 = accounts[2];

  let skillCoinInstance;
  
  it('should put 1B coins in the owner account', async () => {
    skillCoinInstance = await SkillCoin.deployed(owner);
    const balance = await skillCoinInstance.balanceOf.call(owner);
    assert.equal(balance.valueOf(), 1000000000);
  });

  it('should send coins from owner to user', async () => {
    await skillCoinInstance.transfer(user1, 10, { from: owner });
    const balanceUser1 = (await skillCoinInstance.balanceOf.call(user1)).toNumber();
    assert.equal(balanceUser1, 10); 
  });

  it('should send coins from user to user', async () => {
    await skillCoinInstance.transfer(user2, 10, { from: user1 });

    const balanceUser1 = await skillCoinInstance.balanceOf(user1);
    const balanceUser2 = await skillCoinInstance.balanceOf(user2);
    const balanceOwner = await skillCoinInstance.balanceOf(owner);

    assert.equal(balanceUser1.toNumber(), 0); 
    assert.equal(balanceUser2.toNumber(), 10); 
    assert.equal(balanceOwner, 1000000000 - 10);
  });
});