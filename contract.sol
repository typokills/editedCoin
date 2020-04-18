// pragma solidity ^0.4.21;

// contract CoinFlip {
//     address public player1;
//     uint256 public player1Password;

//     uint256 public betAmount;

//     address public player2;
//     bool public player2Choice;

//     uint256 public expiration = 2**256-1;

//     function CoinFlip(uint256 Password) public payable {
//         player1 = msg.sender;
//         player1Password = Password;
//         betAmount = msg.value;
//     }

//     function cancel() public {
//         require(msg.sender == player1);
//         require(player2 == 0);

//         betAmount = 0;
//         msg.sender.transfer(address(this).balance);
//     }

//     function takeBet(bool choice) public payable {
//         require(player2 == 0);
//         require(msg.value == betAmount);

//         player2 = msg.sender;
//         player2Choice = choice;

//         expiration = now + 24 hours;
//     }

//     function reveal(bool choice, uint256 Password) public {
//         require(player2 != 0);
//         require(now < expiration);

//         require(Password == player1Password);

//         if (player2Choice == choice) {
//             player2.transfer(address(this).balance);
//         } else {
//             player1.transfer(address(this).balance);
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
    uint256 public betAmt;

    uint256 public expiration = 2*256-1;
    address public player1;
    uint256 public player1Password;

    address public player2;
    bool public player2Choice;

    // constructor() public {
    //     owner = msg.sender;
    // }

    function Lottery(uint Password) public payable{
        player1 = msg.sender;
        player1Password = Password;
        betAmt = msg.value;
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

    function getPw() view public returns (uint){
        return(player1Password);
    }

    

}