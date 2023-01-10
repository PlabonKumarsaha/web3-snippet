// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// booking a hotel room using ether
contract HotelRoom{
    //vacant
    //occupied
    enum Statuses {
        Vacant,
        Occupied
     }
    Statuses public currentStatus;
    event Occupy(address _occupant, uint256 _value);

    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }
    modifier onlyWhileVacant{
      //require checks if a statement is true
      // checks room is occupied?
        require(currentStatus == Statuses.Vacant, "Currently occupied"); 
        _;
    }

    modifier costs(uint _amount){
    //check price
        require(msg.value >= _amount, "Not enough ether provieded");
        _;
    }
    // pay the hotel room owner/samrt contract owner
    //crypto comes from the person involkes the function
    function book() public payable onlyWhileVacant costs(2 ether){
    
        currentStatus = Statuses.Occupied;

        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(sent);

        emit Occupy(msg.sender, msg.value);
    }


}
