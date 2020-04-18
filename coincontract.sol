pragma solidity >= 0.4.21;


contract Coinflipper{
    uint256 public expiration = 2*256-1;
    address public player1;
    bytes32 public player1Commitment;

    address public player2;
    bool public player2Choice;
    bool player2Count;

    uint256 public betAmount;

    function Coinflip(bytes32 commitment) public payable{
        player1 = msg.sender;
        player1Commitment = commitment;
        betAmount = msg.value;
    }

    function cancelBet() public{
        require(msg.sender == player1);
        require(player2Count == false);

        betAmount = 0;
        msg.sender.transfer(address(this).balance);
    }

    function takeBet(bool choice) public payable {
        require(player2Count == false);
        require(msg.value == betAmount);

        player2Count = true;
        player2 = msg.sender;
        player2Choice = choice;

        expiration = now + 24 hours;
    }

    function reveal(bool choice, uint256 nonce) public {
        require(player2Count == true);
        require(now < expiration);

        //require(keccak256(choice, nonce) == player1Commitment);

        if (player2Choice == choice) {
            payable(player2).transfer(address(this).balance);
        } else {
            payable(player1).transfer(address(this).balance);
        }
    }

    function claimTimeout() public {
        require(now >= expiration);

        payable(player2).transfer(address(this).balance);
    }
}
