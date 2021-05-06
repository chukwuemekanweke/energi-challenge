pragma solidity ^0.5.0;

interface IAgeCalculatorStorage {
    function setYearofBirth(uint256 yearOfBirth, address user) external;
    function getYearOfBirth(address user) external view returns (uint256);
}