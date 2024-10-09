// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract StructContract {
    struct Cat {
        string name;
        string gender;
        uint8 age;
        bool isHungry;
    }

    Cat public cat;
    Cat[] public cats;
    mapping(address => Cat[]) public catsPerOwner;

    function assignCat() external {
        // 1
        Cat memory udra = Cat('Udra', 'F', 6, true);
        Cat memory whitey = Cat({ name: 'Whitey', gender: 'F', age:  5, isHungry: false});
        Cat memory yellow = Cat('Yellow', 'M', 5, true);
        Cat memory belang = Cat('Belang','F', 5, true);
        Cat memory black = Cat('Black', 'M', 5, true);
        Cat memory bongki;
        bongki.name = "Bongki";
        bongki.gender = "F";
        bongki.age = 2;
        bongki.isHungry = true;

        cats.push(udra);
        cats.push(whitey);
        cats.push(yellow);
        cats.push(belang);
        cats.push(black);
        cats.push(bongki);

        catsPerOwner[msg.sender] = cats;
    
        // We want to write it on storage -> update it
        Cat storage _cat = cats[0]; 
        _cat.name = 'Pupu'; // cats[0].name also changed
        delete _cat.age;

        delete cats[4];

    }
}