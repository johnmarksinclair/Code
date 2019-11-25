pragma solidity ^0.5.11;

contract OptometristRegistry {
    struct Optometrist {
        bytes16 name;
        uint npi;
        uint licenseNum;
    }
    mapping (address => Optometrist) public optometrists;
    address[] public optometristAccts;
    function createOptometrist(address _address, bytes16 _name, uint _npi, uint _licenseNum) public {
        //var optometrist = optometrists[_address];
        Optometrist(_name, _npi, _licenseNum);
        Optometrist.name = _name;
        Optometrist.npi = _npi;
        Optometrist.licenseNum = _licenseNum;
        optometristAccts.push(_address)-1;
    }
    function getOptometrists() public view returns (address[] memory) {
        return optometristAccts;
    }
    function getOptometrist(address ins) public view returns (bytes16, uint, uint) {
        return(optometrists[ins].name, optometrists[ins].npi, optometrists[ins].licenseNum);
    }
    function countOptometrists() public view returns (uint) {
        return optometristAccts.length;
    }
}