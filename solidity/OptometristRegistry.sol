pragma solidity ^0.5.11;

contract OptometristRegistry {
    struct OptometristInfo {
        bytes32 name;
        uint npi;
        uint licenseNum;
    }
    mapping (uint => OptometristInfo) private optometrists;
    uint[] private optometristNPIs;
    function createOptometrist(string memory _name, uint _npi, uint _licenseNum) public {
        OptometristInfo storage newOpt = optometrists[_npi];
        newOpt.name = stringToBytes32(_name);
        newOpt.licenseNum = _licenseNum;
        optometristNPIs.push(_npi);
    }
    function getOptometrist(uint _npi) public view returns (bytes32, uint, uint) {
        OptometristInfo storage opt = optometrists[_npi];
        return (opt.name, opt.npi, opt.licenseNum);
    }
    function countOptometrists() public view returns (uint) {
        return optometristNPIs.length;
    }
    function stringToBytes32(string memory source) private returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }
        assembly {
            result := mload(add(source, 32))
        }
    }
}