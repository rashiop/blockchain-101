// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/*
The wallet owners can:
- submit a transaction
- approve and revoke approval of pending transactions
- anyone can execute a transaction after enough owners has approved it.
*/

contract MultiSigWallet {
    event Deposit(address indexed sender, uint amount);
    event Submit(uint indexed txId); // transaction submitted waiting for owner to approve
    event Approve(address indexed owner, uint indexed txId);
    event Revoke(address indexed owner, uint indexed txId);
    event Execute(uint indexed txId); // when sufficient amount of approval, the TX can be executed

    struct Transaction {
        address to;
        uint value;
        bytes data;
        bool isExecuted;
    }


    // store owner
    address[] public owners;
    mapping(address => bool) public isOwner; // quick check
    uint public requiredApprover;

    Transaction[] public transactions;
    mapping(uint txId => mapping(address owner => bool)) public approvedTransactions;

    modifier onlyOwner {
        require(isOwner[msg.sender], "Only Owner");
        _;
    }

    modifier txExist(uint _txId) {
        require(transactions[_txId].to !=  address(0), "Transaction does not exist");
        _;
    }

    modifier isApproved(uint _txId) {
        require(approvedTransactions[_txId][msg.sender], "Transaction hasnt been approved");
        _;
    }
    
    modifier notApproved(uint _txId) {
        require(!approvedTransactions[_txId][msg.sender], "Transaction already approved");
        _;
    }

    modifier notExecuted(uint _txId) {
        require(!transactions[_txId].isExecuted, "Transaction already executed");
        _;
    }

    constructor(address[] memory _owners, uint _requiredApprover) payable{
        require(_owners.length > 0, "Owner required");
        require(
            _requiredApprover > 0 && _requiredApprover <= _owners.length,
            "Required approver must greater than 0 and less than equal owner length"
        );
        
        for (uint i = 0; i < _owners.length; i++) {
            address owner = _owners[i];
    
            require(owner != address(0), "Invalid owner");
            require(!isOwner[owner], "Owner is not unique");

            isOwner[owner] = true;
            owners.push(owner);   
        }
        requiredApprover = _requiredApprover;
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function submit(address _to, uint _value, bytes memory _data) external onlyOwner{
        transactions.push(Transaction({
            to: _to,
            value: _value,
            data: _data,
            isExecuted: false
        }));

        emit Submit(transactions.length - 1);
    }

    function approve(uint _txId)
        external
        onlyOwner
        txExist(_txId)
        notApproved(_txId)
        notExecuted(_txId)
    {
        approvedTransactions[_txId][msg.sender] = true;

        emit Approve(msg.sender, _txId);
    }

    function  _getApprovalCount(uint txId) private view returns(uint count) {
        for (uint i=0; i < owners.length; i++) {
            if (approvedTransactions[txId][owners[i]]){
                count++;
            }
        }
    }

    function revoke(uint _txId)
        external
        onlyOwner
        txExist(_txId)
        isApproved(_txId)
        notExecuted(_txId)
    {
        approvedTransactions[_txId][msg.sender] = false;

        emit Revoke(msg.sender, _txId);
    }

    function execute(uint _txId)
        external
        payable
        txExist(_txId)
        notExecuted(_txId) 
    {
        require(_getApprovalCount(_txId) >= requiredApprover, "Transaction not approved");
        Transaction storage _tx = transactions[_txId];

        _tx.isExecuted = true;
        (bool success,) = _tx.to.call{ value: msg.value }(_tx.data);
        require(success, "Failed to send the amount");
        
        emit Execute(_txId);
    }
}