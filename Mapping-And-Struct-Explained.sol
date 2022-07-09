//SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.0 < 0.9.0;

contract StructAndMapping {

  struct User {
    string name;
    uint reward;
  }

  mapping(address => User) users;

  // {
  //   0x000000:  {name:"", reward: 0},
  //   0x000000:  {name:"", reward: 0},
  //   0x000000:  {name:"", reward: 0},
  // }

  event UserCreated(address indexed userAddress, string indexed name);

  function createUser(string memory name) public returns(bool created) {
    // newUser = User(name=name, reward=0) # this won't work
    User memory newUser = users[msg.sender];
    newUser.name = name;
    newUser.reward = 0;
    users[msg.sender] = newUser;
    emit UserCreated(msg.sender, name);
    return true;
  }

  function getUser(address userAddress) public view returns(string memory name, uint reward){
    User memory user = users[userAddress];
    return (user.name, user.reward);
  }
}