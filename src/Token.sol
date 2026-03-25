// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
  address public owner = msg.sender;

    constructor() ERC20("ForTheCulture", "FTC") {
        _mint(owner, 1000 * 10 ** decimals());
    }

    function _onlyowner() internal view {
        msg.sender == owner;
    }

    modifier onlyOwner() {
        _onlyowner();
        _;
    }

    event Minted(address indexed to, uint256 amount);
    event Burned(address indexed from, uint256 amount); 
    event Transfered(address indexed from, address indexed to, uint256 amount);
    event Approved(address indexed owner, address indexed spender, uint256 amount);
    event CheckBalance(address indexed account, uint256 balance);
    event CheckTotalSupply(uint256 totalSupply);


 function mint(address to, uint256 amount) public onlyOwner {
    _mint(to, amount); // This is a default from ERC20
  } 

  function burn(address from, uint256 amount) public onlyOwner {
    _burn(from, amount); // This is a default from ERC20
  }

  function transfer(address from, address to, uint amount) public {
    _transfer(from, to, amount); // This is a default from ERC20
  }

  function checkBalance(address account) public view returns (uint256) {
        return balanceOf(account); // This is a default from ERC20
  }

  function checkTotalSupply() public view returns (uint256) {
    return totalSupply(); /// @title A title that should describe the contract/interface
    /// @author The name of the author
    /// @notice Explain to an end user what this does
    /// @dev Explain to a developer any extra details
  }

  function approve(address _owner, address spender, uint256 amount) public {
    _approve(_owner, spender, amount); // This is a default from ERC20
  }
   
}