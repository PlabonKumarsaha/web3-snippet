// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mapping {
    //mapping
    //mapping(key => value)names;
    mapping(uint => string)public names;
    mapping(uint => Book)public books;
    //address is for a user and the following line means that all  
    mapping(address =>mapping(uint => Book))public myBooks;

    struct Book {
        string title;
        string author;
    }

    constructor()public {
        names[1] = "adam";
        names[2] = "bruice";
    }

    function addBook(uint _id, string memory _title, string memory _author)public{
        books[_id] = Book(_title,_author);
    }
//msg is a inbuild function for solidity which stores client contarct message
   function addMyBook(uint _id, string memory _title, string memory _author)public{
        myBooks[msg.sender][_id] = Book(_title,_author);
    }
}
