pragma solidity ^0.5.11;

contract OptometristRegistry {
    struct OptometristInfo {
        bytes32 name;
        uint npi;
        uint licenseNum;
    }
    mapping (uint => OptometristInfo) public optometrists;
    uint[] public optometristNPIs;
    function createOptometrist(bytes32 _name, uint _npi, uint _licenseNum) public {
        OptometristInfo storage newOpt = optometrists[_npi];
        newOpt.name = _name;
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
}