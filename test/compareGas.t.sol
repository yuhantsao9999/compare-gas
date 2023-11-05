// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {OldERC721, NewERC721A} from "../src/CompareGas.sol";

contract CompareGasTest is Test {
    OldERC721 oldERC721;
    NewERC721A newERC721A;

    address user1 = makeAddr("user1");
    address user2 = makeAddr("user2");

    function setUp() public {
        oldERC721 = new OldERC721();
        newERC721A = new NewERC721A();
    }

    // compare mint
    function testMint() public {
        vm.startPrank(user1);
        for (uint256 i = 0; i < 10; i++) {
            oldERC721.oMint(i);
        }
        newERC721A.aMint(user1, 10);
        vm.stopPrank();
    }

    // compare transfer
    function testTransfer() public {
        vm.startPrank(user1);
        for (uint256 i = 0; i < 10; i++) {
            oldERC721.oMint(i);
        }
        newERC721A.aMint(user1, 10);

        oldERC721.transferFrom(user1, user2, 5);
        newERC721A.transferFrom(user1, user2, 5);

        vm.stopPrank();
    }

    // compare approve
    function testApprove() public {
        vm.startPrank(user1);
        for (uint256 i = 0; i < 10; i++) {
            oldERC721.oMint(i);
        }
        newERC721A.aMint(user1, 10);
        oldERC721.approve(user2, 5);
        newERC721A.approve(user2, 5);
        vm.stopPrank();
    }
}
