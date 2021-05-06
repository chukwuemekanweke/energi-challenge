pragma solidity ^0.5.0;

interface IEnergiToken {
    
      function initialize(
        address _owner,
        string calldata _name,
        string calldata _symbol,
        uint8 _decimals
    ) external ;
    
    function setOwner(address  _owner) external;
    function mint(address recipient, uint amount) external;
    function burn(address recipient, uint amount) external;
}