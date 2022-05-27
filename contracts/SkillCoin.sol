// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;
import './ERC20.sol';

contract SkillCoin is ERC20 {
  uint256 private constant MAX_UINT256 = 2**256 - 1;
  mapping(address => uint256) public balances;
  mapping(address => mapping(address => uint256)) public allowed;
  uint256 public totalSupply;

  /*
    NOTE:
    The following variables are OPTIONAL vanities. One does not have to include them.
    They allow one to customise the token contract & in no way influences the core functionality.
    Some wallets/interfaces might not even bother to look at this information.
    */
  string public name = 'Skill';
  uint8 public decimals = 18;
  string public symbol = 'SKL';

  constructor() {
    uint256 _initialAmount = 1000000000;

    balances[msg.sender] = _initialAmount; // Give the creator all initial tokens
    totalSupply = _initialAmount; // Update total supply
  }

  function transfer(address _to, uint256 _value) public override returns (bool success) {
    require(balances[msg.sender] >= _value, 'token balance is lower than the value requested');
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    emit Transfer(msg.sender, _to, _value); //solhint-disable-line indent, no-unused-vars
    return true;
  }

  function transferFrom(
    address _from,
    address _to,
    uint256 _value
  ) public override returns (bool success) {
    uint256 allowance_ = allowed[_from][msg.sender];
    require(
      balances[_from] >= _value && allowance_ >= _value,
      'token balance or allowance is lower than amount requested'
    );
    balances[_to] += _value;
    balances[_from] -= _value;
    if (allowance_ < MAX_UINT256) {
      allowed[_from][msg.sender] -= _value;
    }
    emit Transfer(_from, _to, _value); //solhint-disable-line indent, no-unused-vars
    return true;
  }

  function balanceOf(address _owner) public view override returns (uint256 balance) {
    return balances[_owner];
  }

  function approve(address _spender, uint256 _value) public override returns (bool success) {
    allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value); //solhint-disable-line indent, no-unused-vars
    return true;
  }

  function allowance(address _owner, address _spender) public view override returns (uint256 remaining) {
    return allowed[_owner][_spender];
  }
}
