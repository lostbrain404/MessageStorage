// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract MessageStorage {
    address public Owner ;
    string public Message ;
    string [] public MessageHistory ;

    event MessageUpdated(string OldMsg , string NewMsg);

    ///@notice the onwer 
    constructor (){
        Owner = msg.sender ;
    }

    modifier OnlyOnwer(){
        require(msg.sender == Owner, "Only the owner can update the message"); _;
    }

    ///@notice update the message & register it 
    function SetMessage(string memory _InitialMemory)public OnlyOnwer{
        string memory Old = _InitialMemory ;
        MessageHistory.push(_InitialMemory);
        emit MessageUpdated(Old,_InitialMemory);
    }

    ///@notice get the new message 
    function GetMessage()public view returns (string memory){
        return Message;
    }

}
