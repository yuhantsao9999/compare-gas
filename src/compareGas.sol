// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721Enumerable} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import {ERC721A} from "./ERC721A.sol";

contract OldERC721 is ERC721Enumerable {
    constructor() ERC721("ERC721 token", "OET") {}

    function oMint(uint tokenId) public {
        _safeMint(msg.sender, tokenId);
    }

    // function oApprove(address to, uint256 tokenId) public {
    //     _approve(to, tokenId);
    // }

    function oTransferFrom(address from, address to, uint256 tokenId) public {
        _transfer(from, to, tokenId);
    }
}

contract NewERC721A is ERC721A {
    constructor() ERC721A("ERC721A token", "IEAT") {}

    function aMint(address to, uint256 quantity) public {
        _mint(to, quantity);
    }

    // function aApprove(address to, uint256 tokenId) public {
    //     approve(to, tokenId);
    // }

    function aTransferFrom(address from, address to, uint256 tokenId) public {
        transferFrom(from, to, tokenId);
    }
}
