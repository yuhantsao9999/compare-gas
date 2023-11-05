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

    // function testGetTokenId0to4() public {
    //     vm.startPrank(user1);

    //     for (uint256 i = 0; i < 4; i++) {
    //         oldERC721.oMint(i);
    //     }
    //     newERC721A.aMint(4);

    //     console2.log("oldERC721 ownerOf(0)", oldERC721.ownerOfWithoutCheck(0));
    //     console2.log("oldERC721 ownerOf(1)", oldERC721.ownerOfWithoutCheck(1));
    //     console2.log("oldERC721 ownerOf(2)", oldERC721.ownerOfWithoutCheck(2));
    //     console2.log("oldERC721 ownerOf(3)", oldERC721.ownerOfWithoutCheck(3));
    //     console2.log("oldERC721 ownerOf(4)", oldERC721.ownerOfWithoutCheck(4));
    //     console2.log(
    //         "newERC721A ownerOf(0)",
    //         newERC721A.ownerOfByOriginData(0)
    //     );
    //     console2.log(
    //         "newERC721A ownerOf(1)",
    //         newERC721A.ownerOfByOriginData(1)
    //     );
    //     console2.log(
    //         "newERC721A ownerOf(2)",
    //         newERC721A.ownerOfByOriginData(2)
    //     );
    //     console2.log(
    //         "newERC721A ownerOf(3)",
    //         newERC721A.ownerOfByOriginData(3)
    //     );
    //     console2.log(
    //         "newERC721A ownerOf(4)",
    //         newERC721A.ownerOfByOriginData(4)
    //     );
    //     console2.log("newERC721A totalSupply", newERC721A.totalSupply());
    //     vm.stopPrank();
    // }

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
