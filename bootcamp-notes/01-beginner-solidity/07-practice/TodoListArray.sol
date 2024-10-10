// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract TodoListArray {
    struct Todo {
        string text;
        bool isComplete;
    }

    Todo[] public todos;

    function create(string calldata _text) external {
        todos.push(Todo({
            text: _text,
            isComplete: false
        }));
    } 

    function update(uint _idx, string calldata _text) external {
        // if only 1 field => storage (only access storage once)
        // if multiple fields => memory
        // - storage expensive => access array index in storage multiple times
        // - memory cheaper => only access array in storage 1x; memory gas price is way cheaper
        todos[_idx].text = _text;
    }

    function toggleComplete(uint _idx) external {
        todos[_idx].isComplete = !todos[_idx].isComplete;
    }

    function get(uint _idx) external view returns(string memory, bool) {
        Todo memory _todo = todos[_idx];
        return (_todo.text, _todo.isComplete);
        // return (todos[_idx]);
    }

}