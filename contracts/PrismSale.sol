// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract PrismSale {
  uint public totalSales;
  uint public maxSales;

  address public owner;
  address public charity;

  mapping (address => bool) sales;

  constructor() {
    totalSales = 0;
    maxSales = 100;

    owner = 0x5838dF13b25d7DD652aC6F4e1F504791104c9a43;
    charity = 0x095f1fD53A56C01c76A2a56B7273995Ce915d8C4;
  }

  function canBuy () public view returns (bool) {
    return totalSales < maxSales;
  }

  function hasAccess () public view returns (bool) {
    return sales[msg.sender];
  }

  function buy () public payable returns (bool) {
    require(canBuy() == true, "can't buy this");
    require(msg.value == 0.01 ether, "you did not send the correct amount");
    require(hasAccess() == false, "already bought");

    // let's make to owner payable (80% of the value), and 20% to the charity. 'msg.value' is the full amount
    payable(owner).transfer(msg.value * 80 / 100 ); 
    payable(charity).transfer(msg.value * 20 / 100);
    
    totalSales = totalSales + 1;

    sales[msg.sender] = true;

    return true;
  }
}
