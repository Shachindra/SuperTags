// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/utils/Strings.sol";
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Context} from "@openzeppelin/contracts/utils/Context.sol";

/**
 * @title ERC-721 Burnable Token
 * @dev ERC-721 Token that can be burned (destroyed).
 */
contract SuperTags is Context, ERC721 {
    // Set Constants for Interface ID and Roles
    bytes4 private constant _INTERFACE_ID_ERC2981 = 0x2a55205a;
    
    using Strings for uint256;

    uint8 public version = 1;

    uint256 public Counter;

    // Optional mapping for token URIs
    mapping(uint256 => string) private _tokenURIs;

    event SuperTagRegistered(
        uint256 tokenID,
        address indexed creator,
        string metaDataURI
    );
    event SuperTagsAssetDestroyed(uint indexed tokenId, address ownerOrApproved);

    /**
     * @dev Grants `ST_ADMIN_ROLE`, `ST_CREATOR_ROLE` and `ST_OPERATOR_ROLE` to the
     * account that deploys the contract.
     *
     * Token URIs will be autogenerated based on `baseURI` and their token IDs.
     * See {ERC721-tokenURI}.
     */
    constructor(
        string memory name,
        string memory symbol
    ) ERC721(name, symbol) {
    }

    /**
     * @dev Creates a new token for `to`. Its token ID will be automatically
     * assigned (and available on the emitted {IERC721-Transfer} event), and the token
     * URI autogenerated based on the base URI passed at construction.
     *
     * See {ERC721-_safeMint}.
     *
     * Requirements:
     *
     * - the caller must have the `FLOW_CREATOR_ROLE`.
     */
    function registerTag(
        string memory metadataURI
    ) public returns (uint256) {
        // We cannot just use balanceOf to create the new tokenId because tokens
        // can be burned (destroyed), so we need a separate counter.
        Counter++;
        uint256 currentTokenID = Counter;
        _safeMint(_msgSender(), currentTokenID);
        _setTokenURI(currentTokenID, metadataURI);

        emit SuperTagRegistered(currentTokenID, _msgSender(), metadataURI);
        return currentTokenID;
    }

    /**
     * @dev Creates a new token for `to`. Its token ID will be automatically
     * assigned (and available on the emitted {IERC721-Transfer} event), and the token
     * URI autogenerated based on the base URI passed at construction.
     *
     * See {ERC721-_safeMint}.
     *
     * Requirements:
     *
     * - the caller must have the `FLOW_CREATOR_ROLE`.
     */
    function delegateTagRegistration(
        address creator,
        string memory metadataURI
    ) public returns (uint256) {
        // We cannot just use balanceOf to create the new tokenId because tokens
        // can be burned (destroyed), so we need a separate counter.
        Counter++;
        uint256 currentTokenID = Counter;
        _safeMint(creator, currentTokenID);
        _setTokenURI(currentTokenID, metadataURI);

        emit SuperTagRegistered(currentTokenID, creator, metadataURI);
        return currentTokenID;
    }

    /**
     * @notice Burns `tokenId`. See {ERC721-_burn}.
     *
     * @dev Requirements:
     *
     * - The caller must own `tokenId` or be an approved operator.
     */
    function destroyAsset(uint256 tokenId) public {
        require(
            (_msgSender() == ownerOf(tokenId) || isApprovedForAll(ownerOf(tokenId), _msgSender()) || getApproved(tokenId) == _msgSender()),
            "SuperTags: Caller is not token owner or approved"
        );
        _burn(tokenId);
        emit SuperTagsAssetDestroyed(tokenId, _msgSender());
    }

    /**
     * @dev Sets `_tokenURI` as the tokenURI of `tokenId`.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function _setTokenURI(
        uint256 tokenId,
        string memory _tokenURI
    ) internal virtual {
        require(_ownerOf(tokenId) != address(0), "SuperTags: Non-Existent Asset");
        _tokenURIs[tokenId] = _tokenURI;
    }
    
    /**
     * @dev Burns `tokenId`. See {ERC721-_burn}.
     *
     * Requirements:
     *
     * - The caller must own `tokenId` or be an approved operator.
     */
    function burn(uint256 tokenId) public virtual {
        // Setting an "auth" arguments enables the `_isAuthorized` check which verifies that the token exists
        // (from != 0). Therefore, it is not needed to verify that the return value is not 0 here.
        _update(address(0), tokenId, _msgSender());
    }
}