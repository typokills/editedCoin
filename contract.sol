// pragma solidity ^0.4.21;

// contract Lottery{
//     uint256 public expiration = 2*256-1;
//     address payable player1;
//     uint256 public player1Commitment;

//     address payable player2;
//     bool public player2Choice;
//     bool player2Count;

//     uint256 public betAmount;

//     function Coinflip(uint256 commitment) public payable{
//         player1 = msg.sender;
//         player1Commitment = commitment;
//         betAmount = msg.value;
//     }

//     function cancelBet() public{
//         require(msg.sender == player1);
//         require(player2Count == false);

//         betAmount = 0;
//         msg.sender.transfer(address(this).balance);
//     }

//     function takeBet(bool choice) public payable {
//         require(player2Count == false);
//         require(msg.value == betAmount);

//         player2Count = true;
//         player2 = msg.sender;
//         player2Choice = choice;

//         expiration = now + 24 hours;
//     }

//     function reveal(bool choice, uint256 nonce) public {
//         require(player2Count == true);
//         require(now < expiration);

//         //require(keccak256(choice, nonce) == player1Commitment);

//         if (player2Choice == choice) {
//             player2.transfer(address (this).balance);
//         } else {
//             player1.transfer(address (this).balance);
//         }
//     }

//     function claimTimeout() public {
//         require(now >= expiration);

//         player2.transfer(address(this).balance);
//     }
// }


pragma solidity ^0.4.21;

contract Lottery {

    address private owner;
    uint private number;
    uint public betAmt;
    
    address player1;
    mapping(address => uint256) public deposits;

    // constructor() public {
    //     owner = msg.sender;
    // }

    function Lottery(uint commitment) public payable{
        player1 = msg.sender;
        player1Commitment = commitment;
        betAmount = msg.value;
    }

    function setNumber(uint _number) public {
        number = _number;
    }

    function getNumber() view public returns(uint) {
        return(number);
    }

    function getOwner() view public returns(address){
        return(owner);
    }

    function setBet(uint bet) public{
        betAmt = bet;
    }

    function getBet() view public returns(uint){
        return(betAmt);
    }

    

}