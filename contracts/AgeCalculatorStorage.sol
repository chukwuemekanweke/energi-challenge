pragma solidity ^0.5.0;
import "./DataGrant.sol";

contract AgeCalculatorStorage is DataGrant{
    mapping(address=>uint256) birthYear;
    
    constructor () public{
        owner = msg.sender;
    }
    
    function setYearofBirth(uint256 yearOfBirth, address user) external onlyAccessor{
        birthYear[user] = yearOfBirth;
    }
    
    function getYearOfBirth(address user) external view returns (uint256){
        return birthYear[user];
    }
}