pragma solidity ^0.5.12;

contract RealEstate
{
    address payable public seller;
    address public buyer;
    string public streetAddress;
    string title;
    uint256 public price;
    constructor() public
    {
        //Who is the Seller?
        seller=msg.sender;
        //What is the Street Address?
        streetAddress="350 5th Ave, New York, NY 10118";
        //What is the Title?
        title="Practice House";
        //What is the Price?
        price=99000000000000000000; //Equivalent to 99 ethers and also this variable is a state variable
    }
    
    function buyHouse() payable public
    {
        require(seller!=address(0));    //It checks that seller actually exists and its not just the default value
        require(buyer==address(0));     //It means that the buyer has not been set yet, finally means we never buy this house twice
        require(msg.sender!=seller);
        require(msg.value==price);  //We don't want to overpay or underpay for the house
        buyer=msg.sender;
        seller.transfer(msg.value);
    }
}