// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MultiDelegateCall {
    error DelegatecallFailed();

    function multiDelegatcall(bytes[] memory data) 
        external
        payable
        returns(bytes[] memory results) 
    {
        results = new bytes[](data.length);

        for(uint256 i; i < data.length; i++) {
            (bool ok, bytes memory res) = address(this).delegatecall(data[i]);
            if (!ok) {
                revert DelegatecallFailed();
            }
            results[i] = res;
        }
    }
}

// Why use multi delegatecall? Why not multi call?
// alice -> multicall -- call ---> test (msg.sender = multicall)
// alice -> test -- delegatecall --> test (msg.sender = alice)
contract TestMultiDelegatecall is MultiDelegateCall {
    event Log(address caller, string func, uint256 i);

    function func1(uint256 x, uint256 y) external {
        emit Log(msg.sender, "func1", x+y);
    }

    function func2() external returns (uint256) {
        emit Log(msg.sender, "func2", 2);
        return 11;
    }

    mapping(address => uint256) public balanceOf;

    // WARNING: unsafe code when used in combination with multi-delegatecall
    // user can mint multiple times for the price of msg.value
    function mint() external payable {
        balanceOf[msg.sender] += msg.value;
    }
}

contract Helper {
    function getFunc1Data(uint256 x, uint256 y)
        external 
        pure 
        returns (bytes memory) 
    {
        return abi.encodeWithSelector(TestMultiDelegatecall.func1.selector, x, y);
    }

    function getFunc2Data() external pure returns (bytes memory) {
        return abi.encodeWithSelector(TestMultiDelegatecall.func2.selector);
    }

    function getMintData() external pure returns (bytes memory) {
        return abi.encodeWithSelector(TestMultiDelegatecall.mint.selector);
    }
}