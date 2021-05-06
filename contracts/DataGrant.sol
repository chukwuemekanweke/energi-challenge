pragma solidity ^0.5.0;

contract DataGrant {


    mapping(address => bool) private accessors;

    address public owner;

    constructor() public {
        owner = msg.sender;
    }


    function transferOwnership(address payable newOwner) public onlyOwner {
        if (newOwner != address(0)) {
            owner = newOwner;
        }
    }


    function activateAccessor(address accessor) external onlyOwner {
        require(accessor!=address(0x0),"Invalid contract address");
        accessors[accessor] = true;
    }

    function deactivateAccessor(address accessor) external onlyOwner {
        require(accessor!=address(0x0),"Invalid contract address");
        accessors[accessor] = false;
    }


    modifier onlyOwner() {
        require(msg.sender == owner, "Unauthorized access to contract");
        _;
    }

     modifier onlyAccessor() {
        bool hasAccess = accessors[msg.sender];
        require(hasAccess == true, "unauthorized access to contract");
        _;
    }

}