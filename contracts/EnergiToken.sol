pragma solidity ^0.5.0;
import './interfaces/IEnergiToken.sol';
import './ERC20.sol';

contract EnergiToken is  ERC20, IEnergiToken {
    
    address public owner;
    string public name;
    string public symbol;
    uint8 public decimals;
    bool public initialized = false;
    
    constructor () public{
        owner = msg.sender;
    }

    function initialize(
        address _owner,
        string calldata _name,
        string calldata _symbol,
        uint8 _decimals
    ) external onlyOwner{
        require(initialized == false,"Contract has already been initialized");
        owner = _owner;
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        initialized = true;
    }
    
    
    function setOwner(address _owner) external onlyOwner{
        owner = _owner;
    }
    function mint(address recipient, uint amount) external onlyOwner isInitialized{
        _mint(recipient, amount);
    }
    function burn(address recipient, uint amount) external onlyOwner isInitialized{
        _burn(recipient, amount);
    }
    
     modifier onlyOwner() {
        require(msg.sender == owner, "Unauthorized access to contract");
        _;
    }
    
      modifier isInitialized() {
        require(initialized == true, "Contract has not been initialized");
        _;
    }
}