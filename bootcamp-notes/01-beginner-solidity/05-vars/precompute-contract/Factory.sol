// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import './PrecomputeContract.sol';

contract Factory {
    event Deploy(address);

    // deploy
    function deploy(address _owner, uint _foo, uint _salt) 
        public
        payable 
    {
        // This syntax is a newer way to invoke create2 without assembly, you just need to pass salt
        // https://docs.soliditylang.org/en/latest/control-structures.html#salted-contract-creations-create2
        PrecomputeContract _contract = new PrecomputeContract{
            salt: bytes32(_salt)
        }(_owner, _foo);
        emit Deploy(address(_contract));
    }

    // how to get address without deploying first?
    function getAddress(bytes memory bytecode, uint _salt)
        public
        view 
        returns (address)
    {
        bytes32 hash = keccak256(
            abi.encodePacked(
                bytes1(0xff), address(this), _salt, keccak256(bytecode)
            )
        );
        // address will be last 20 bytes of hash
        return address(uint160(uint(hash)));
    }
    // bytecode for getaddress
     function getByteCode(address _owner, uint _foo)
        public
        pure
        returns (bytes memory)
    {
        bytes memory bytecode = type(PrecomputeContract).creationCode;

        return abi.encodePacked(bytecode, abi.encode(_owner, _foo));
    }
}

