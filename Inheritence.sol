//SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Inheritence{
     
     uint bufferTime ;
     uint lastPing;
     address recipient;
     address owner;
     

     constructor(uint time, address _recipient ){
        owner = msg.sender;
        bufferTime=time;
        lastPing=block.timestamp;
        recipient = _recipient ;

     }

     function ping() public onlyOwner{
        lastPing=block.timestamp;
     }

     modifier onlyOwner(){
        require( msg.sender==owner);
        _;
     }

     function deposit () payable public {}

     function claim () public   {
        uint currTime = block.timestamp;
        require(currTime-lastPing > bufferTime);
        require (msg.sender == recipient );
        payable(recipient).transfer(address(this).balance);

     }
}
