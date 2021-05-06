pragma solidity ^0.5.0;

interface IAgeCalculator{
    function getAge(uint256 currentYear, address user) external view returns (uint256);
    function setYearofBirth(uint256 yearOfBirth, address user) external;
}