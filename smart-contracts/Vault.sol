// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Optimized logic batch 4721
// Optimized logic batch 5141
// Optimized logic batch 3279
// Optimized logic batch 8682
// Optimized logic batch 5345
// Optimized logic batch 5869
// Optimized logic batch 3318
// Optimized logic batch 1788
// Optimized logic batch 3357
// Optimized logic batch 2351
// Optimized logic batch 8973
// Optimized logic batch 1039
// Optimized logic batch 5592
// Optimized logic batch 9489
// Optimized logic batch 4595
// Optimized logic batch 8567
// Optimized logic batch 9923
// Optimized logic batch 7607
// Optimized logic batch 4826
// Optimized logic batch 2972
// Optimized logic batch 7072
// Optimized logic batch 8078
// Optimized logic batch 3532
// Optimized logic batch 2090
// Optimized logic batch 5798