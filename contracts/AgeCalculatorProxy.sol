pragma solidity ^0.5.0;
import "./interfaces/IAgeCalculator.sol";
import "./interfaces/IAgeCalculatorStorage.sol";


contract AgeCalculatorProxy{
    
    address public owner;
    
    IAgeCalculator ageCalculator;
    IAgeCalculatorStorage ageStorage;
    
    constructor () public{
        owner = msg.sender;
    }
    
    function setAddresses(address storageAddr, address calculator) external onlyOwner{
        ageStorage = IAgeCalculatorStorage(storageAddr);
        ageCalculator = IAgeCalculator(calculator);
    }
    
    function getAddresses() external view returns (address storageAddr, address calculator){
        storageAddr = address(ageStorage);
        calculator = address(ageCalculator);
    }
    
    function setYearOfBirth(uint256 year) external {
        ageCalculator.setYearofBirth(year,msg.sender);
    }
    
    function getAge(uint256 currentYear) external view returns (uint256){
        return ageCalculator.getAge(currentYear, msg.sender);
    }

     modifier onlyOwner() {
        require(msg.sender == owner, "Unauthorized access to contract");
        _;
    }

}