//SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.0 < 0.9.0;

contract TypesOfFunctions {
  address public owner;

  function pureFuction() public pure returns(uint){
    // a pure fuction do not read or modify the smart contract variable
    // it return value is always constant
    return 10;
  }

  function viewFuction() public view returns(address){
    // a view fuction can read the smart contract
    // variables without modifying  them
    return owner;
  }

  function viewFuction2() public view returns (address){
    // accessing the msg obeject is consider as reading the smart
    // contract data, so we need to mark that as a view fuction
    // as well
    return msg.sender;
  }
  
  function updateFuction(address newAddress) public returns (address){
    // if you don't specify either view or pure, the fuction
    // will be able to modify the contract variables, and also
    // read them
    owner = newAddress;
    return owner;
  }
}