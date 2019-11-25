pragma solidity ^0.5.11;

contract OptometristRegistry2 {
    struct Optometrist {
        bytes16 name;
        uint npi;
        uint licenseNum;
    }
    mapping (address => Optometrist) optometrists;
    address[] public optometristAccts;
    function createOptometrist(address _address, bytes16 _name, uint _npi, uint _licenseNum) public {
        var optometrist = optometrists[_address];
        optometrist.name = _name;
        optometrist.npi = _npi;
        optometrist.licenseNum = _licenseNum;
        optometristAccts.push(_address)-1;
    }
    function getOptometrists() public view returns (address[]) {
        return optometristAccts;
    }
    function getOptometrist(address ins) public view returns (bytes16, uint, uint) {
        return(optometrists[ins].name, optometrists[ins].npi, optometrists[ins].licenseNum);
    }
    function countOptometrists() public view returns (uint) {
        return optometristAccts.length;
    }
}