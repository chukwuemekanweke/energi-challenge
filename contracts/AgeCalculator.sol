pragma solidity ^0.5.0;
import "./DataGrant.sol";
import "./interfaces/IAgeCalculatorStorage.sol";

contract AgeCalculator is DataGrant{
    

    IAgeCalculatorStorage ageCalculatorStorage;
    
    function getAge(uint256 currentYear, address user) external view returns (uint256){
        uint256 yearOfBirth = ageCalculatorStorage.getYearOfBirth(user);
        require(yearOfBirth!=0,"Birth year has not been set");
        return _getUserAge(yearOfBirth,currentYear);
    }
    
     function setYearofBirth(uint256 yearOfBirth, address user) external onlyAccessor{
        require(yearOfBirth!=0,"Birth year cannot be zero");
        ageCalculatorStorage.setYearofBirth(yearOfBirth,user);
    }
    
    function _getUserAge(uint256 yearofBirth, uint256 currentYear) internal pure returns(uint256){
        bool isLeapYear = _isLeapYear(yearofBirth);
        uint256 age = 0;
        if(isLeapYear){
            age = currentYear - yearofBirth;
        }
        else{
            age  = (currentYear - yearofBirth)/4; //todo: Use SafeMath.sol instead for division
        }
        return age;
    }
    
    function _isLeapYear(uint256 year) internal pure returns (bool){
        
        if (year % 400 == 0)
            return true;
     
        if (year % 100 == 0)
            return false;
     
        if (year % 4 == 0)
            return true;
            
        return false;
    }
    
   
    

     modifier onlyOwner() {
        require(msg.sender == owner, "Unauthorized access to contract");
        _;
    }

}