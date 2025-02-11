# Palkeoramix decompiler. 

const name = 'NameWrapper', 0
const registrar = 0xf2b8fea09420d4a6a567cdb2598505dee5c97ebd
const ens = 0x5e300ab602199073f23b6eb0ef3d0b9c68930931

def storage:
  stor0 is mapping of struct at storage 0
  unknowned70554d is mapping of struct at storage 1
  stor2 is mapping of uint8 at storage 2
  stor3 is mapping of uint8 at storage 3
  unknown53095467Address is addr at storage 4
  stor5 is mapping of struct at storage 5
  upgradeContractAddress is addr at storage 6

def upgradeContract() payable: 
  return upgradeContractAddress

def unknown53095467() payable: 
  return unknown53095467Address

def owner() payable: 
  return addr(stor0.length)

def controllers(address _param1) payable: 
  require calldata.size - 4 >=′ 32
  require _param1 == _param1
  return bool(stor3[_param1])

def isApprovedForAll(address _owner, address _operator) payable: 
  require calldata.size - 4 >=′ 64
  require _owner == _owner
  require _operator == _operator
  return bool(stor2[addr(_owner)][addr(_operator)])

def unknowned70554d(uint256 _param1) payable: 
  require calldata.size - 4 >=′ 32
  return unknowned70554d[_param1].field_0

#
#  Regular functions
#

def _fallback() payable: # default function
  revert

def getData(uint256 _id) payable: 
  require calldata.size - 4 >=′ 32
  return unknowned70554d[_id].field_0, 0, 0

def ownerOf(uint256 _tokenId) payable: 
  require calldata.size - 4 >=′ 32
  return unknowned70554d[_tokenId].field_0

def renounceOwnership() payable: 
  if addr(stor0.length) != caller:
      revert with 0, 'Ownable: caller is not the owner'
  addr(stor0.length) = 0
  log OwnershipTransferred(
        address previousOwner=addr(stor0.length),
        address newOwner=0)

def unknown1534e177(uint256 _param1) payable: 
  require calldata.size - 4 >=′ 32
  require _param1 == addr(_param1)
  if addr(stor0.length) != caller:
      revert with 0, 'Ownable: caller is not the owner'
  unknown53095467Address = addr(_param1)

def balanceOf(address _owner, uint256 _cardId) payable: 
  require calldata.size - 4 >=′ 64
  require _owner == _owner
  if not _owner:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC1155: balance query for the zero address'
  if unknowned70554d[_cardId].field_0 - _owner:
      return 0
  return 1

def setController(address _param1, bool _param2) payable: 
  require calldata.size - 4 >=′ 64
  require _param1 == _param1
  require _param2 == _param2
  if addr(stor0.length) != caller:
      revert with 0, 'Ownable: caller is not the owner'
  stor3[addr(_param1)] = uint8(_param2)
  log 0x4c976945: _param2, _param1

def unknownadf4960a(uint256 _param1, uint256 _param2) payable: 
  require calldata.size - 4 >=′ 64
  require _param2 == uint32(_param2)
  if 0 >= block.timestamp:
      return (uint32(_param2) == uint32(_param2 and Mask(96, 0, unknowned70554d[_param1].field_0) >> 160))
  return not uint32(_param2)

def transferOwnership(address _newOwner) payable: 
  require calldata.size - 4 >=′ 32
  require _newOwner == _newOwner
  if addr(stor0.length) != caller:
      revert with 0, 'Ownable: caller is not the owner'
  if not _newOwner:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Ownable: new owner is the zero address'
  addr(stor0.length) = _newOwner
  log OwnershipTransferred(
        address previousOwner=addr(stor0.length),
        address newOwner=_newOwner)

def setApprovalForAll(address _to, bool _approved) payable: 
  require calldata.size - 4 >=′ 64
  require _to == _to
  require _approved == _approved
  if not caller - _to:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC1155: setting approval status for self'
  stor2[caller][addr(_to)] = uint8(_approved)
  log ApprovalForAll(
        address owner=_approved,
        address operator=caller,
        bool approved=_to)

def unknownfd0cd0d9(uint256 _param1) payable: 
  require calldata.size - 4 >=′ 32
  if not unknowned70554d[_param1].field_0:
      return bool(unknowned70554d[_param1].field_0)
  static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
          gas gas_remaining wei
         args _param1
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  require ext_call.return_data[0] == ext_call.return_data[12 len 20]
  return (ext_call.return_data[12 len 20] == this.address)

def unknown41415eab(uint256 _param1, uint256 _param2) payable: 
  require calldata.size - 4 >=′ 64
  require _param2 == addr(_param2)
  if unknowned70554d[_param1].field_0 != addr(_param2):
      if not stor2[stor1[_param1].field_0][addr(_param2)]:
          return bool(stor2[stor1[_param1].field_0][addr(_param2)])
  return 1

def setTTL(bytes32 _param1, uint64 _param2) payable: 
  require calldata.size - 4 >=′ 64
  require _param2 == _param2
  if unknowned70554d[_param1].field_0 != caller:
      if not stor2[stor1[_param1].field_0][caller]:
          revert with 0, _param1, caller
  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setTTL(bytes32 param1, uint64 param2) with:
       gas gas_remaining wei
      args _param1, _param2
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]

def setResolver(bytes32 _param1, address _param2) payable: 
  require calldata.size - 4 >=′ 64
  require _param2 == _param2
  if unknowned70554d[_param1].field_0 != caller:
      if not stor2[stor1[_param1].field_0][caller]:
          revert with 0, _param1, caller
  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
       gas gas_remaining wei
      args _param1, _param2
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]

def supportsInterface(bytes4 _interfaceId) payable: 
  require calldata.size - 4 >=′ 32
  require _interfaceId == Mask(32, 224, _interfaceId)
  if 0x7b63b70900000000000000000000000000000000000000000000000000000000 == Mask(32, 224, _interfaceId):
      return True
  if 0x150b7a0200000000000000000000000000000000000000000000000000000000 == Mask(32, 224, _interfaceId):
      return True
  if 0xd9b67a2600000000000000000000000000000000000000000000000000000000 == Mask(32, 224, _interfaceId):
      return True
  if 0xe89341c00000000000000000000000000000000000000000000000000000000 == Mask(32, 224, _interfaceId):
      return True
  return (Mask(32, 224, _interfaceId) == 0x1ffc9a700000000000000000000000000000000000000000000000000000000)

def unknown5d3590d5(uint256 _param1, uint256 _param2, uint256 _param3) payable: 
  require calldata.size - 4 >=′ 96
  require _param1 == addr(_param1)
  require _param2 == addr(_param2)
  if addr(stor0.length) != caller:
      revert with 0, 'Ownable: caller is not the owner'
  call addr(_param1).transfer(address to, uint256 tokens) with:
       gas gas_remaining wei
      args addr(_param2), _param3
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  require ext_call.return_data[0] == bool(ext_call.return_data[0])

def unknown5ed61cc7(array _param1, uint256 _param2, uint256 _param3, uint256 _param4, uint256 _param5, uint256 _param6) payable: 
  require calldata.size - 4 >=′ 192
  require _param1 <= 18446744073709551615
  require _param1 + 35 <′ calldata.size
  require _param1.length <= 18446744073709551615
  require _param1 + _param1.length + 36 <= calldata.size
  require _param2 == addr(_param2)
  require _param5 == addr(_param5)
  require _param6 == uint16(_param6)
  if not stor3[caller]:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Controllable: Caller is not a controller'
  call 0xf2b8fea09420d4a6a567cdb2598505dee5c97ebd.0x5b130720 with:
       gas gas_remaining wei
      args 0, uint32(sha3(_param1[all])), this.address, _param3, _param4
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  if _param1.length < 1:
      revert with 671984822
  ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)

def unknown402906fc(uint256 _param1, uint256 _param2) payable: 
  require calldata.size - 4 >=′ 64
  require _param2 == uint16(_param2)
  if unknowned70554d[_param1].field_0 != caller:
      if not stor2[stor1[_param1].field_0][caller]:
          revert with 0, _param1, caller
  if 0 >= block.timestamp:
      if uint16(_param2):
          if 65537 and uint16(_param2) or Mask(96, 0, unknowned70554d[_param1].field_0) >> 160 != 65537:
              revert with 0, _param1
  else:
      if uint16(_param2):
          if 65537 and uint16(_param2) != 65537:
              revert with 0, _param1
  unknowned70554d[_param1].field_0 = unknowned70554d[_param1].field_0
  unknowned70554d[_param1].field_160 = uint16(_param2)
  unknowned70554d[_param1].field_176 = 0
  log 0x39873f00: uint16(_param2), _param1
  return uint16(_param2)

def unknownd8c9921a(uint256 _param1, uint256 _param2, uint256 _param3) payable: 
  require calldata.size - 4 >=′ 96
  require _param3 == addr(_param3)
  if unknowned70554d[_param1][_param2].field_0 != caller:
      if not stor2[stor1[_param1][_param2].field_0][caller]:
          revert with 0, sha3(_param1, _param2), caller
  if not _param1 + 0x1b29c373c8114ecf835779726a19cdbba0f0496500b9d69f3b0faf0b9be49013:
      revert with 1633306371
  if not addr(_param3):
      revert with 0, addr(_param3)
  if this.address == addr(_param3):
      revert with 0, addr(_param3)
  unknowned70554d[_param1][_param2].field_0 = 0
  log 0xc3d58168: sha3(_param1, _param2), 1, caller, unknowned70554d[_param1][_param2].field_0, 0
  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
       gas gas_remaining wei
      args sha3(_param1, _param2), addr(_param3)
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  log 0xee2ba119: addr(_param3), sha3(_param1, _param2)

def setUpgradeContract(address _address) payable: 
  require calldata.size - 4 >=′ 32
  require _address == _address
  if addr(stor0.length) != caller:
      revert with 0, 'Ownable: caller is not the owner'
  if upgradeContractAddress:
      require ext_code.size(0xf2b8fea09420d4a6a567cdb2598505dee5c97ebd)
      call 0xf2b8fea09420d4a6a567cdb2598505dee5c97ebd.setApprovalForAll(address to, bool approved) with:
           gas gas_remaining wei
          args upgradeContractAddress, 0
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setApprovalForAll(address to, bool approved) with:
           gas gas_remaining wei
          args upgradeContractAddress, 0
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
  upgradeContractAddress = _address
  if _address:
      require ext_code.size(0xf2b8fea09420d4a6a567cdb2598505dee5c97ebd)
      call 0xf2b8fea09420d4a6a567cdb2598505dee5c97ebd.setApprovalForAll(address to, bool approved) with:
           gas gas_remaining wei
          args upgradeContractAddress, 1
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setApprovalForAll(address to, bool approved) with:
           gas gas_remaining wei
          args upgradeContractAddress, 1
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]

def unknownee7eba78(uint256 _param1, array _param2, uint256 _param3, uint256 _param4) payable: 
  require calldata.size - 4 >=′ 128
  require _param2 <= 18446744073709551615
  require _param2 + 35 <′ calldata.size
  require _param2.length <= 18446744073709551615
  require _param2 + _param2.length + 36 <= calldata.size
  require _param3 == addr(_param3)
  require _param4 == addr(_param4)
  if not upgradeContractAddress:
      revert with 616683220
  if unknowned70554d[_param1][sha3(_param2[all])].field_0 != caller:
      if not stor2[stor1[_param1][sha3(_param2[all])].field_0][caller]:
          revert with 0, sha3(_param1, sha3(_param2[all])), caller
  if 0 < block.timestamp:
  unknowned70554d[_param1][sha3(_param2[all])].field_0 = 0
  log 0xc3d58168: sha3(_param1, sha3(_param2[all])), 1, caller, unknowned70554d[_param1][sha3(_param2[all])].field_0, 0
  if addr(_param3) != unknowned70554d[_param1][sha3(_param2[all])].field_0:
  mem[452 len _param2.length] = _param2[all]
  mem[_param2.length + 452] = 0
  require ext_code.size(upgradeContractAddress)
  call upgradeContractAddress.0x24c1af44 with:
       gas gas_remaining wei
      args _param1, 224, addr(_param3), addr(_param4), 0, 0, 0, _param2.length, _param2[all], mem[_param2.length + 452 len ceil32(_param2.length) - _param2.length]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]

def unknown8b4dfa75(uint256 _param1, uint256 _param2, uint256 _param3) payable: 
  require calldata.size - 4 >=′ 96
  require _param2 == addr(_param2)
  require _param3 == addr(_param3)
  if unknowned70554d[0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed][_param1].field_0 != caller:
      if not stor2[stor1[0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed][_param1].field_0][caller]:
          revert with 0, sha3(0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed, _param1), caller
  if not addr(_param2) - this.address:
      revert with 0, addr(_param2)
  unknowned70554d[0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed][_param1].field_0 = 0
  log 0xc3d58168: sha3(0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed, _param1), 1, caller, unknowned70554d[0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed][_param1].field_0, 0
  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
       gas gas_remaining wei
      args sha3(0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed, _param1), addr(_param3)
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  log 0xee2ba119: addr(_param3), sha3(0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed, _param1)
  require ext_code.size(0xf2b8fea09420d4a6a567cdb2598505dee5c97ebd)
  call 0xf2b8fea09420d4a6a567cdb2598505dee5c97ebd.safeTransferFrom(address from, address to, uint256 tokenId) with:
       gas gas_remaining wei
      args this.address, addr(_param2), _param1
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]

def unknown6e5d6ad2(uint256 _param1, uint256 _param2, uint256 _param3) payable: 
  require calldata.size - 4 >=′ 96
  require _param3 == uint64(_param3)
  if unknowned70554d[_param1].field_0 != caller:
      if not stor2[stor1[_param1].field_0][caller]:
          if unknowned70554d[_param1][_param2].field_0 != caller:
              if not stor2[stor1[_param1][_param2].field_0][caller]:
                  revert with 0, sha3(_param1, _param2), caller
          if not stor2[stor1[_param1].field_0][caller]:
              revert with 0, sha3(_param1, _param2)
  if uint64(_param3) > 0:
      unknowned70554d[_param1][_param2].field_0 = unknowned70554d[_param1][_param2].field_0
      log 0xf675815a: 0, sha3(_param1, _param2)
      return 0
  if uint64(_param3) < 0:
      unknowned70554d[_param1][_param2].field_0 = unknowned70554d[_param1][_param2].field_0
      log 0xf675815a: 0, sha3(_param1, _param2)
      return 0
  unknowned70554d[_param1][_param2].field_0 = unknowned70554d[_param1][_param2].field_0
  unknowned70554d[_param1][_param2].field_160 = 0
  unknowned70554d[_param1][_param2].field_192 = uint64(_param3)
  log 0xf675815a: uint64(_param3), sha3(_param1, _param2)
  return uint64(_param3)

def onERC721Received(address _operator, address _from, uint256 _tokenId, bytes _data) payable: 
  require calldata.size - 4 >=′ 128
  require _operator == _operator
  require _from == _from
  require _data <= 18446744073709551615
  require _data + 35 <′ calldata.size
  require _data.length <= 18446744073709551615
  require _data + _data.length + 36 <= calldata.size
  if caller != 0xf2b8fea09420d4a6a567cdb2598505dee5c97ebd:
      revert with 422683960
  require _data.length >=′ 128
  require cd[(_data + 36)] <= 18446744073709551615
  require _data + cd[(_data + 36)] + 67 <′ _data + _data.length + 36
  if cd[(_data + cd[(_data + 36)] + 36)] > 18446744073709551615:
      revert with 0, 65
  if ceil32(ceil32(cd[(_data + cd[(_data + 36)] + 36)])) + 97 < 96 or ceil32(ceil32(cd[(_data + cd[(_data + 36)] + 36)])) + 97 > 18446744073709551615:
      revert with 0, 65
  require cd[(_data + 36)] + cd[(_data + cd[(_data + 36)] + 36)] + 68 <= _data.length + 36
  require cd[(_data + 68)] == addr(cd[(_data + 68)])
  require cd[(_data + 100)] == uint16(cd[(_data + 100)])
  require cd[(_data + 132)] == addr(cd[(_data + 132)])
  if _tokenId != sha3(call.data[_data + cd[(_data + 36)] + 68 len cd[(_data + cd[(_data + 36)] + 36)]]):
      revert with 0, sha3(call.data[_data + cd[(_data + 36)] + 68 len cd[(_data + cd[(_data + 36)] + 36)]]), _tokenId
  require ext_code.size(0xf2b8fea09420d4a6a567cdb2598505dee5c97ebd)
  call 0xf2b8fea09420d4a6a567cdb2598505dee5c97ebd.reclaim(uint256 param1, address param2) with:
       gas gas_remaining wei
      args _tokenId, this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  if cd[(_data + cd[(_data + 36)] + 36)] < 1:
      revert with 671984822
  ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)

def renew(uint256 _tokenId, uint256 _numCycles) payable: 
  require calldata.size - 4 >=′ 64
  if not stor3[caller]:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Controllable: Caller is not a controller'
  call 0xf2b8fea09420d4a6a567cdb2598505dee5c97ebd.renew(uint256 tokenId, uint256 numCycles) with:
       gas gas_remaining wei
      args _tokenId, _numCycles
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  static call 0xf2b8fea09420d4a6a567cdb2598505dee5c97ebd.ownerOf(uint256 deedId) with:
          gas gas_remaining wei
         args _tokenId
  if ext_call.success:
      require return_data.size >=′ 32
      require ext_call.return_data[0] == ext_call.return_data[12 len 20]
      if this.address == ext_call.return_data[12 len 20]:
          static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                  gas gas_remaining wei
                 args sha3(0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed, _tokenId)
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >=′ 32
          require ext_call.return_data[0] == ext_call.return_data[12 len 20]
          if ext_call.return_data[12 len 20] == this.address:
              if uint64(ext_call.return_data[0]) + (2160 * 24 * 3600) > 18446744073709551615:
                  revert with 0, 17
              unknowned70554d[0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed][_tokenId].field_0 = unknowned70554d[0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed][_tokenId].field_0
              unknowned70554d[0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed][_tokenId].field_160 = 0
              unknowned70554d[0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed][_tokenId].field_192 = uint64(uint64(ext_call.return_data[0]) + (2160 * 24 * 3600))
  return ext_call.return_data[0]

def unknowne72bf00f(array _param1, uint256 _param2, uint256 _param3) payable: 
  require calldata.size - 4 >=′ 96
  require _param1 <= 18446744073709551615
  require _param1 + 35 <′ calldata.size
  require _param1.length <= 18446744073709551615
  require _param1 + _param1.length + 36 <= calldata.size
  require _param2 == addr(_param2)
  require _param3 == addr(_param3)
  if not upgradeContractAddress:
      revert with 616683220
  if unknowned70554d[0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed][sha3(_param1[all])].field_0 != caller:
      if not stor2[stor1[0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed][sha3(_param1[all])].field_0][caller]:
          revert with 0, sha3(0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed, sha3(_param1[all])), caller
  if 0 < block.timestamp:
  unknowned70554d[0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed][sha3(_param1[all])].field_0 = 0
  log 0xc3d58168: sha3(0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed, sha3(_param1[all])), 1, caller, unknowned70554d[0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed][sha3(_param1[all])].field_0, 0
  if addr(_param2) != unknowned70554d[0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed][sha3(_param1[all])].field_0:
  mem[388 len _param1.length] = _param1[all]
  mem[_param1.length + 388] = 0
  require ext_code.size(upgradeContractAddress)
  call upgradeContractAddress.0xf9547a9e with:
       gas gas_remaining wei
      args 160, addr(_param2), 0, 0, addr(_param3), _param1.length, _param1[all], mem[_param1.length + 388 len ceil32(_param1.length) - _param1.length]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]

def uri(uint256 _id) payable: 
  require calldata.size - 4 >=′ 32
  mem[96] = 0xe89341c00000000000000000000000000000000000000000000000000000000
  mem[100] = _id
  static call unknown53095467Address.uri(uint256 id) with:
          gas gas_remaining wei
         args _id
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  mem[96 len return_data.size] = ext_call.return_data[0 len return_data.size]
  mem[64] = ceil32(return_data.size) + 96
  require return_data.size >=′ 32
  _4 = mem[96 len 4], Mask(224, 32, _id) >> 32
  require mem[96 len 4], Mask(224, 32, _id) >> 32 <= 18446744073709551615
  require return_data.size + 96 >′ mem[96 len 4], Mask(224, 32, _id) >> 32 + 127
  _5 = mem[mem[96 len 4], Mask(224, 32, _id) >> 32 + 96]
  if mem[mem[96 len 4], Mask(224, 32, _id) >> 32 + 96] > 18446744073709551615:
      revert with 0, 65
  if ceil32(ceil32(mem[mem[96 len 4], Mask(224, 32, _id) >> 32 + 96])) + 1 < 0 or ceil32(return_data.size) + ceil32(ceil32(mem[mem[96 len 4], Mask(224, 32, _id) >> 32 + 96])) + 97 > 18446744073709551615:
      revert with 0, 65
  mem[64] = ceil32(return_data.size) + ceil32(ceil32(mem[mem[96 len 4], Mask(224, 32, _id) >> 32 + 96])) + 97
  mem[ceil32(return_data.size) + 96] = _5
  require _4 + _5 + 32 <= return_data.size
  mem[ceil32(return_data.size) + 128 len ceil32(_5)] = mem[_4 + 128 len ceil32(_5)]
  mem[_5 + ceil32(return_data.size) + 128] = 0
  mem[mem[64]] = 32
  mem[mem[64] + 32] = _5
  mem[mem[64] + 64 len ceil32(_5)] = mem[ceil32(return_data.size) + 128 len ceil32(_5)]
  mem[_5 + mem[64] + 64] = 0
  return Array(len=_5, data=mem[mem[64] + 64 len ceil32(_5)])

def unknown8cf8b41e(array _param1, uint256 _param2, uint256 _param3, uint256 _param4) payable: 
  require calldata.size - 4 >=′ 128
  require _param1 <= 18446744073709551615
  require _param1 + 35 <′ calldata.size
  require _param1.length <= 18446744073709551615
  require _param1 + _param1.length + 36 <= calldata.size
  require _param2 == addr(_param2)
  require _param3 == uint16(_param3)
  require _param4 == addr(_param4)
  static call 0xf2b8fea09420d4a6a567cdb2598505dee5c97ebd.ownerOf(uint256 deedId) with:
          gas gas_remaining wei
         args sha3(_param1[all])
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  require ext_call.return_data[0] == ext_call.return_data[12 len 20]
  if ext_call.return_data[12 len 20] != caller:
      static call 0xf2b8fea09420d4a6a567cdb2598505dee5c97ebd.isApprovedForAll(address owner, address operator) with:
              gas gas_remaining wei
             args addr(ext_call.return_data[0]), caller
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >=′ 32
      require ext_call.return_data[0] == bool(ext_call.return_data[0])
      if not ext_call.return_data[0]:
          revert with 0, sha3(0xe4d63c8c37eeb1307ca8868d95e632445f0fb69aff462960c4f050f4641b6fed, sha3(_param1[all])), caller
  require ext_code.size(0xf2b8fea09420d4a6a567cdb2598505dee5c97ebd)
  call 0xf2b8fea09420d4a6a567cdb2598505dee5c97ebd.transferFrom(address from, address to, uint256 tokens) with:
       gas gas_remaining wei
      args addr(ext_call.return_data[0]), this.address, sha3(_param1[all])
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require ext_code.size(0xf2b8fea09420d4a6a567cdb2598505dee5c97ebd)
  call 0xf2b8fea09420d4a6a567cdb2598505dee5c97ebd.reclaim(uint256 param1, address param2) with:
       gas gas_remaining wei
      args sha3(_param1[all]), this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  if _param1.length < 1:
      revert with 671984822
  ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)

def balanceOfBatch(address[] _param1, uint256[] _param2) payable: 
  require calldata.size - 4 >=′ 64
  require _param1 <= 18446744073709551615
  require _param1 + 35 <′ calldata.size
  if _param1.length > 18446744073709551615:
      revert with 0, 65
  if ceil32(32 * _param1.length) + 97 < 96 or ceil32(32 * _param1.length) + 97 > 18446744073709551615:
      revert with 0, 65
  mem[96] = _param1.length
  require _param1 + (32 * _param1.length) + 36 <= calldata.size
  s = 128
  idx = _param1 + 36
  while idx < _param1 + (32 * _param1.length) + 36:
      require cd[idx] == addr(cd[idx])
      mem[s] = cd[idx]
      s = s + 32
      idx = idx + 32
      continue 
  require _param2 <= 18446744073709551615
  require _param2 + 35 <′ calldata.size
  if _param2.length > 18446744073709551615:
      revert with 0, 65
  if ceil32(32 * _param2.length) + 98 < 97 or ceil32(32 * _param1.length) + ceil32(32 * _param2.length) + 98 > 18446744073709551615:
      revert with 0, 65
  mem[ceil32(32 * _param1.length) + 97] = _param2.length
  require _param2 + (32 * _param2.length) + 36 <= calldata.size
  idx = _param2 + 36
  s = ceil32(32 * _param1.length) + 129
  while idx < _param2 + (32 * _param2.length) + 36:
      mem[s] = cd[idx]
      idx = idx + 32
      s = s + 32
      continue 
  if _param1.length != _param2.length:
      revert with 0, 'ERC1155: accounts and ids length mismatch'
  if _param1.length > 18446744073709551615:
      revert with 0, 65
  mem[ceil32(32 * _param1.length) + ceil32(32 * _param2.length) + 98] = _param1.length
  if _param1.length:
      mem[ceil32(32 * _param1.length) + ceil32(32 * _param2.length) + 130 len 32 * _param1.length] = call.data[calldata.size len 32 * _param1.length]
  idx = 0
  while idx < _param1.length:
      if idx >= _param1.length:
          revert with 0, 50
      if idx >= _param2.length:
          revert with 0, 50
      if not mem[(32 * idx) + 140 len 20]:
          revert with 0, 'ERC1155: balance query for the zero address'
      mem[0] = mem[(32 * idx) + ceil32(32 * _param1.length) + 129]
      mem[32] = 1
      if idx >= _param1.length:
          revert with 0, 50
      if unknowned70554d[mem[(32 * idx) + ceil32(32 * _param1.length) + 129]].field_0 - mem[(32 * idx) + 140 len 20]:
          mem[(32 * idx) + ceil32(32 * _param1.length) + ceil32(32 * _param2.length) + 130] = 0
      else:
          mem[(32 * idx) + ceil32(32 * _param1.length) + ceil32(32 * _param2.length) + 130] = 1
      if not idx + 1:
          revert with 0, 17
      idx = idx + 1
      continue 
  return Array(len=_param1.length, data=mem[ceil32(32 * _param1.length) + ceil32(32 * _param2.length) + 130 len 32 * _param1.length]), 

def setRecord(bytes32 _param1, address _param2, address _param3, uint64 _param4) payable: 
  require calldata.size - 4 >=′ 128
  require _param2 == _param2
  require _param3 == _param3
  require _param4 == _param4
  if unknowned70554d[_param1].field_0 != caller:
      if not stor2[stor1[_param1].field_0][caller]:
          revert with 0, _param1, caller
  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setRecord(bytes32 param1, address param2, address param3, uint64 param4) with:
       gas gas_remaining wei
      args 0, uint32(_param1), this.address, addr(_param3), _param4
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  if not _param2:
      unknowned70554d[_param1].field_0 = 0
      log 0xc3d58168: _param1, 1, caller, unknowned70554d[_param1].field_0, 0
      require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
           gas gas_remaining wei
          args _param1, 0
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      log 0xee2ba119: 0, _param1
      stop
  if 0 < block.timestamp:
  if unknowned70554d[_param1].field_0 != unknowned70554d[_param1].field_0:
      revert with 0, 'ERC1155: insufficient balance for transfer'
  if not unknowned70554d[_param1].field_0 - _param2:
      stop
  unknowned70554d[_param1].field_0 = _param2
  unknowned70554d[_param1].field_160 = 0
  log 0xc3d58168: _param1, 1, caller, unknowned70554d[_param1].field_0, _param2
  if not ext_code.size(_param2):
      stop
  mem[132] = caller
  mem[164] = unknowned70554d[_param1].field_0
  mem[196] = _param1
  mem[228] = 1
  mem[260] = 160
  mem[292] = 0
  mem[324 len 0] = None
  mem[324] = 0
  call _param2.onERC1155Received(address param1, address param2, uint256 param3, uint256 param4, bytes param5) with:
       gas gas_remaining wei
      args 0, uint32(caller), unknowned70554d[_param1].field_0, _param1, 1, 160, 0, None
  mem[128] = ext_call.return_data[0]
  if ext_call.success:
      require return_data.size >=′ 32
      require ext_call.return_data[0] == Mask(32, 224, ext_call.return_data[0])
      if Mask(32, 224, ext_call.return_data[0]) != 0xf23a6e6100000000000000000000000000000000000000000000000000000000:
          revert with 0, 'ERC1155: ERC1155Receiver rejected tokens'
  else:
      if return_data.size <= 3:
          revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
      if -(uint32(_param1) >> 224) + Error(string error):
          revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
      if return_data.size >= 68:
          mem[128 len return_data.size - 4] = ext_call.return_data[4 len return_data.size - 4]
          if ext_call.return_data[0] <= 18446744073709551615 and ext_call.return_data[0] + 36 <= return_data.size:
              if mem[ext_call.return_data[0] + 128] <= 18446744073709551615:
  ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)

def unknown33c69ea9(uint256 _param1, uint256 _param2, uint256 _param3, uint256 _param4) payable: 
  require calldata.size - 4 >=′ 128
  require _param3 == uint32(_param3)
  require _param4 == uint64(_param4)
  if 4294836223 or uint32(_param3) != 4294836223:
      revert with 0, sha3(_param1, _param2)
  if not unknowned70554d[_param1][_param2].field_0:
      revert with 1400157593
  static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
          gas gas_remaining wei
         args sha3(_param1, _param2)
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  require ext_call.return_data[0] == ext_call.return_data[12 len 20]
  if ext_call.return_data[12 len 20] != this.address:
      revert with 1400157593
  if _param1:
      if unknowned70554d[_param1].field_0 != caller:
          if not stor2[stor1[_param1].field_0][caller]:
              revert with 0, sha3(_param1, _param2), caller
  else:
      if unknowned70554d[_param1][_param2].field_0 != caller:
          if not stor2[stor1[_param1][_param2].field_0][caller]:
              revert with 0, sha3(_param1, _param2), caller
  if Mask(16, 16, _param3):
      revert with 0, sha3(_param1, _param2)
  if 0 >= block.timestamp:
      if uint16(_param3):
          if 65537 and Mask(96, 0, unknowned70554d[_param1][_param2].field_0) >> 160 or _param3 != 65537:
              revert with 0, sha3(_param1, _param2)
      unknowned70554d[_param1][_param2].field_0 = unknowned70554d[_param1][_param2].field_0
      unknowned70554d[_param1][_param2].field_160 = uint32(_param3)
      if uint64(_param4) > 0:
          unknowned70554d[_param1][_param2].field_192 = 0
          log 0x39873f00: uint32(_param3), sha3(_param1, _param2)
      else:
          if uint64(_param4) < 0:
              unknowned70554d[_param1][_param2].field_192 = 0
              log 0x39873f00: uint32(_param3), sha3(_param1, _param2)
          else:
              unknowned70554d[_param1][_param2].field_192 = uint64(_param4)
              log 0x39873f00: uint32(_param3), sha3(_param1, _param2)
              if uint64(_param4) > 0:
                  log 0xf675815a: uint64(_param4), sha3(_param1, _param2)
  else:
      if uint16(_param3):
          if 65537 and _param3 != 65537:
              revert with 0, sha3(_param1, _param2)
      unknowned70554d[_param1][_param2].field_0 = unknowned70554d[_param1][_param2].field_0
      unknowned70554d[_param1][_param2].field_160 = uint32(_param3)
      if uint64(_param4) > 0:
          unknowned70554d[_param1][_param2].field_192 = 0
          log 0x39873f00: uint32(_param3), sha3(_param1, _param2)
      else:
          if uint64(_param4) < 0:
              unknowned70554d[_param1][_param2].field_192 = 0
              log 0x39873f00: uint32(_param3), sha3(_param1, _param2)
          else:
              unknowned70554d[_param1][_param2].field_192 = uint64(_param4)
              log 0x39873f00: uint32(_param3), sha3(_param1, _param2)
              if uint64(_param4) > 0:
                  log 0xf675815a: uint64(_param4), sha3(_param1, _param2)

def unknown20c38e2b(uint256 _param1) payable: 
  require calldata.size - 4 >=′ 32
  if stor5[_param1].field_0:
      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
          revert with 0, 34
      if stor5[_param1].field_0:
          if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
              revert with 0, 34
          if Mask(256, -1, stor5[_param1].field_0):
              if 31 < uint255(stor5[_param1].field_0) * 0.5:
                  mem[128] = stor5[_param1].field_0
                  idx = 128
                  s = 0
                  while (uint255(stor5[_param1].field_0) * 0.5) + 96 > idx:
                      mem[idx + 32] = stor5[_param1][s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor5[_param1].field_0), data=mem[128 len ceil32(uint255(stor5[_param1].field_0) * 0.5)])
              mem[128] = 256 * stor5[_param1].field_8
      else:
          if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
              revert with 0, 34
          if stor5[_param1].field_1:
              if 31 < stor5[_param1].field_1:
                  mem[128] = stor5[_param1].field_0
                  idx = 128
                  s = 0
                  while stor5[_param1].field_1 + 96 > idx:
                      mem[idx + 32] = stor5[_param1][s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor5[_param1].field_0), data=mem[128 len ceil32(uint255(stor5[_param1].field_0) * 0.5)])
              mem[128] = 256 * stor5[_param1].field_8
      mem[ceil32(uint255(stor5[_param1].field_0) * 0.5) + 192 len ceil32(uint255(stor5[_param1].field_0) * 0.5)] = mem[128 len ceil32(uint255(stor5[_param1].field_0) * 0.5)]
      mem[(uint255(stor5[_param1].field_0) * 0.5) + ceil32(uint255(stor5[_param1].field_0) * 0.5) + 192] = 0
      return Array(len=2 * Mask(256, -1, stor5[_param1].field_0), data=mem[128 len ceil32(uint255(stor5[_param1].field_0) * 0.5)], mem[(2 * ceil32(uint255(stor5[_param1].field_0) * 0.5)) + 192 len 2 * ceil32(uint255(stor5[_param1].field_0) * 0.5)]), 
  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
      revert with 0, 34
  if stor5[_param1].field_0:
      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
          revert with 0, 34
      if Mask(256, -1, stor5[_param1].field_0):
          if 31 < uint255(stor5[_param1].field_0) * 0.5:
              mem[128] = stor5[_param1].field_0
              idx = 128
              s = 0
              while (uint255(stor5[_param1].field_0) * 0.5) + 96 > idx:
                  mem[idx + 32] = stor5[_param1][s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor5[_param1].field_0, data=mem[128 len ceil32(stor5[_param1].field_1)])
          mem[128] = 256 * stor5[_param1].field_8
  else:
      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
          revert with 0, 34
      if stor5[_param1].field_1:
          if 31 < stor5[_param1].field_1:
              mem[128] = stor5[_param1].field_0
              idx = 128
              s = 0
              while stor5[_param1].field_1 + 96 > idx:
                  mem[idx + 32] = stor5[_param1][s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor5[_param1].field_0, data=mem[128 len ceil32(stor5[_param1].field_1)])
          mem[128] = 256 * stor5[_param1].field_8
  mem[ceil32(stor5[_param1].field_1) + 192 len ceil32(stor5[_param1].field_1)] = mem[128 len ceil32(stor5[_param1].field_1)]
  mem[stor5[_param1].field_1 + ceil32(stor5[_param1].field_1) + 192] = 0
  return Array(len=stor5[_param1].field_0, data=mem[128 len ceil32(stor5[_param1].field_1)], mem[(2 * ceil32(stor5[_param1].field_1)) + 192 len 2 * ceil32(stor5[_param1].field_1)]), 

def safeTransferFrom(address _from, address _to, uint256 _id, uint256 _value, bytes _data) payable: 
  require calldata.size - 4 >=′ 160
  require _from == _from
  require _to == _to
  require _data <= 18446744073709551615
  require _data + 35 <′ calldata.size
  if _data.length > 18446744073709551615:
      revert with 0, 65
  if ceil32(ceil32(_data.length)) + 97 < 96 or ceil32(ceil32(_data.length)) + 97 > 18446744073709551615:
      revert with 0, 65
  mem[96] = _data.length
  require _data + _data.length + 36 <= calldata.size
  mem[128 len _data.length] = _data[all]
  if not _to:
      revert with 0, 'ERC1155: transfer to the zero address'
  if caller == _from:
      if _value != 1:
          revert with 0, 'ERC1155: insufficient balance for transfer'
      if unknowned70554d[_id].field_0 != _from:
          revert with 0, 'ERC1155: insufficient balance for transfer'
      if not unknowned70554d[_id].field_0 - _to:
          stop
      unknowned70554d[_id].field_0 = _to
      unknowned70554d[_id].field_160 = 0
      log 0xc3d58168: _id, _value, caller, _from, _to
      if not ext_code.size(_to):
          stop
      mem[ceil32(ceil32(_data.length)) + 101] = caller
      mem[ceil32(ceil32(_data.length)) + 133] = _from
      mem[ceil32(ceil32(_data.length)) + 165] = _id
      mem[ceil32(ceil32(_data.length)) + 197] = _value
      mem[ceil32(ceil32(_data.length)) + 229] = 160
      mem[ceil32(ceil32(_data.length)) + 261] = _data.length
      mem[ceil32(ceil32(_data.length)) + 293 len ceil32(_data.length)] = _data[all], Mask(8 * ceil32(_data.length) - _data.length, -(8 * ceil32(_data.length) + -ceil32(ceil32(_data.length)) + 27) + 256, caller) >> -(8 * ceil32(_data.length) + -ceil32(ceil32(_data.length)) + 27) + 256
      mem[_data.length + ceil32(ceil32(_data.length)) + 293] = 0
      call _to.onERC1155Received(address param1, address param2, uint256 param3, uint256 param4, bytes param5) with:
           gas gas_remaining wei
          args caller, addr(_from), _id, _value, Array(len=_data.length, data=_data[all])
      mem[ceil32(ceil32(_data.length)) + 97] = ext_call.return_data[0]
      if ext_call.success:
          require return_data.size >=′ 32
          require ext_call.return_data[0] == Mask(32, 224, ext_call.return_data[0])
          if Mask(32, 224, ext_call.return_data[0]) != 0xf23a6e6100000000000000000000000000000000000000000000000000000000:
              revert with 0, 'ERC1155: ERC1155Receiver rejected tokens'
          stop
      if return_data.size <= 3:
          revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
      mem[0 len 4] = ext_call.return_data[0 len 4]
      if -(uint32(_id) >> 224) + Error(string error):
          revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
      if return_data.size < 68:
          revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
      mem[ceil32(ceil32(_data.length)) + 97 len return_data.size - 4] = ext_call.return_data[4 len return_data.size - 4]
      if ext_call.return_data[0] > 18446744073709551615 or ext_call.return_data[0] + 36 > return_data.size:
          revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
      if mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] > 18446744073709551615:
          revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
      if ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 32 > return_data.size - 4:
          revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
      if floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98 < 97 or ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98 > 18446744073709551615:
          revert with 0, 65
      mem[64] = ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98
      if 0 >= block.timestamp:
          if 0 >= block.timestamp:
              if not ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97:
                  _490 = ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98
                  mem[ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                  mem[mem[64] + 4] = 32
                  mem[mem[64] + 36] = 52
                  mem[_490 + 68] = 'ERC1155: transfer to non ERC1155'
                  mem[_490 + 100] = 'Receiver implementer'
                  revert with memory
                    from mem[64]
                     len _490 + -mem[64] + 132
              _482 = ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98
              mem[ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98] = 0x8c379a000000000000000000000000000000000000000000000000000000000
              mem[mem[64] + 4] = 32
              _498 = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97]
              mem[mem[64] + 36] = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97]
              mem[_482 + 68 len ceil32(_498)] = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 129 len ceil32(_498)]
              mem[_498 + _482 + 68] = 0
              revert with memory
                from mem[64]
                 len ceil32(_498) + _482 + -mem[64] + 68
          if not ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97:
              _491 = ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98
              mem[ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98] = 0x8c379a000000000000000000000000000000000000000000000000000000000
              mem[mem[64] + 4] = 32
              mem[mem[64] + 36] = 52
              mem[_491 + 68] = 'ERC1155: transfer to non ERC1155'
              mem[_491 + 100] = 'Receiver implementer'
              revert with memory
                from mem[64]
                 len _491 + -mem[64] + 132
          _483 = ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98
          mem[ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98] = 0x8c379a000000000000000000000000000000000000000000000000000000000
          mem[mem[64] + 4] = 32
          _500 = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97]
          mem[mem[64] + 36] = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97]
          mem[_483 + 68 len ceil32(_500)] = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 129 len ceil32(_500)]
          mem[_500 + _483 + 68] = 0
          revert with memory
            from mem[64]
             len ceil32(_500) + _483 + -mem[64] + 68
      if 0 >= block.timestamp:
          if not ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97:
              _492 = ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98
              mem[ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98] = 0x8c379a000000000000000000000000000000000000000000000000000000000
              mem[mem[64] + 4] = 32
              mem[mem[64] + 36] = 52
              mem[_492 + 68] = 'ERC1155: transfer to non ERC1155'
              mem[_492 + 100] = 'Receiver implementer'
              revert with memory
                from mem[64]
                 len _492 + -mem[64] + 132
          _484 = ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98
          mem[ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98] = 0x8c379a000000000000000000000000000000000000000000000000000000000
          mem[mem[64] + 4] = 32
          _502 = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97]
          mem[mem[64] + 36] = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97]
          mem[_484 + 68 len ceil32(_502)] = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 129 len ceil32(_502)]
          mem[_502 + _484 + 68] = 0
          revert with memory
            from mem[64]
             len ceil32(_502) + _484 + -mem[64] + 68
      if not ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97:
          _493 = ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98
          mem[ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98] = 0x8c379a000000000000000000000000000000000000000000000000000000000
          mem[mem[64] + 4] = 32
          mem[mem[64] + 36] = 52
          mem[_493 + 68] = 'ERC1155: transfer to non ERC1155'
          mem[_493 + 100] = 'Receiver implementer'
          revert with memory
            from mem[64]
             len _493 + -mem[64] + 132
      _485 = ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98
      mem[ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98] = 0x8c379a000000000000000000000000000000000000000000000000000000000
      mem[mem[64] + 4] = 32
      _504 = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97]
      mem[mem[64] + 36] = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97]
      mem[_485 + 68 len ceil32(_504)] = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 129 len ceil32(_504)]
      mem[_504 + _485 + 68] = 0
      revert with memory
        from mem[64]
         len ceil32(_504) + _485 + -mem[64] + 68
  if not stor2[addr(_from)][caller]:
      revert with 0, 'ERC1155: caller is not owner nor approved'
  if _value != 1:
      revert with 0, 'ERC1155: insufficient balance for transfer'
  if unknowned70554d[_id].field_0 != _from:
      revert with 0, 'ERC1155: insufficient balance for transfer'
  if not unknowned70554d[_id].field_0 - _to:
      stop
  unknowned70554d[_id].field_0 = _to
  unknowned70554d[_id].field_160 = 0
  log 0xc3d58168: _id, _value, caller, _from, _to
  if not ext_code.size(_to):
      stop
  mem[ceil32(ceil32(_data.length)) + 101] = caller
  mem[ceil32(ceil32(_data.length)) + 133] = _from
  mem[ceil32(ceil32(_data.length)) + 165] = _id
  mem[ceil32(ceil32(_data.length)) + 197] = _value
  mem[ceil32(ceil32(_data.length)) + 229] = 160
  mem[ceil32(ceil32(_data.length)) + 261] = _data.length
  mem[ceil32(ceil32(_data.length)) + 293 len ceil32(_data.length)] = _data[all], Mask(8 * ceil32(_data.length) - _data.length, -(8 * ceil32(_data.length) + -ceil32(ceil32(_data.length)) + 27) + 256, caller) >> -(8 * ceil32(_data.length) + -ceil32(ceil32(_data.length)) + 27) + 256
  mem[_data.length + ceil32(ceil32(_data.length)) + 293] = 0
  call _to.onERC1155Received(address param1, address param2, uint256 param3, uint256 param4, bytes param5) with:
       gas gas_remaining wei
      args caller, addr(_from), _id, _value, Array(len=_data.length, data=_data[all])
  mem[ceil32(ceil32(_data.length)) + 97] = ext_call.return_data[0]
  if ext_call.success:
      require return_data.size >=′ 32
      require ext_call.return_data[0] == Mask(32, 224, ext_call.return_data[0])
      if Mask(32, 224, ext_call.return_data[0]) != 0xf23a6e6100000000000000000000000000000000000000000000000000000000:
          revert with 0, 'ERC1155: ERC1155Receiver rejected tokens'
      stop
  if return_data.size <= 3:
      revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
  mem[0 len 4] = ext_call.return_data[0 len 4]
  if -(uint32(_id) >> 224) + Error(string error):
      revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
  if return_data.size < 68:
      revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
  mem[ceil32(ceil32(_data.length)) + 97 len return_data.size - 4] = ext_call.return_data[4 len return_data.size - 4]
  if ext_call.return_data[0] > 18446744073709551615 or ext_call.return_data[0] + 36 > return_data.size:
      revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
  if mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] > 18446744073709551615:
      revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
  if ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 32 > return_data.size - 4:
      revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
  if floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98 < 97 or ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98 > 18446744073709551615:
      revert with 0, 65
  mem[64] = ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98
  if 0 >= block.timestamp:
      if 0 >= block.timestamp:
          if not ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97:
              _494 = ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98
              mem[ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98] = 0x8c379a000000000000000000000000000000000000000000000000000000000
              mem[mem[64] + 4] = 32
              mem[mem[64] + 36] = 52
              mem[_494 + 68] = 'ERC1155: transfer to non ERC1155'
              mem[_494 + 100] = 'Receiver implementer'
              revert with memory
                from mem[64]
                 len _494 + -mem[64] + 132
          _486 = ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98
          mem[ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98] = 0x8c379a000000000000000000000000000000000000000000000000000000000
          mem[mem[64] + 4] = 32
          _506 = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97]
          mem[mem[64] + 36] = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97]
          mem[_486 + 68 len ceil32(_506)] = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 129 len ceil32(_506)]
          mem[_506 + _486 + 68] = 0
          revert with memory
            from mem[64]
             len ceil32(_506) + _486 + -mem[64] + 68
      if not ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97:
          _495 = ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98
          mem[ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98] = 0x8c379a000000000000000000000000000000000000000000000000000000000
          mem[mem[64] + 4] = 32
          mem[mem[64] + 36] = 52
          mem[_495 + 68] = 'ERC1155: transfer to non ERC1155'
          mem[_495 + 100] = 'Receiver implementer'
          revert with memory
            from mem[64]
             len _495 + -mem[64] + 132
      _487 = ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98
      mem[ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98] = 0x8c379a000000000000000000000000000000000000000000000000000000000
      mem[mem[64] + 4] = 32
      _508 = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97]
      mem[mem[64] + 36] = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97]
      mem[_487 + 68 len ceil32(_508)] = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 129 len ceil32(_508)]
      mem[_508 + _487 + 68] = 0
      revert with memory
        from mem[64]
         len ceil32(_508) + _487 + -mem[64] + 68
  if 0 >= block.timestamp:
      if not ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97:
          _496 = ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98
          mem[ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98] = 0x8c379a000000000000000000000000000000000000000000000000000000000
          mem[mem[64] + 4] = 32
          mem[mem[64] + 36] = 52
          mem[_496 + 68] = 'ERC1155: transfer to non ERC1155'
          mem[_496 + 100] = 'Receiver implementer'
          revert with memory
            from mem[64]
             len _496 + -mem[64] + 132
      _488 = ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98
      mem[ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98] = 0x8c379a000000000000000000000000000000000000000000000000000000000
      mem[mem[64] + 4] = 32
      _510 = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97]
      mem[mem[64] + 36] = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97]
      mem[_488 + 68 len ceil32(_510)] = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 129 len ceil32(_510)]
      mem[_510 + _488 + 68] = 0
      revert with memory
        from mem[64]
         len ceil32(_510) + _488 + -mem[64] + 68
  if not ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97:
      _497 = ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98
      mem[ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98] = 0x8c379a000000000000000000000000000000000000000000000000000000000
      mem[mem[64] + 4] = 32
      mem[mem[64] + 36] = 52
      mem[_497 + 68] = 'ERC1155: transfer to non ERC1155'
      mem[_497 + 100] = 'Receiver implementer'
      revert with memory
        from mem[64]
         len _497 + -mem[64] + 132
  _489 = ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98
  mem[ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97] + 31) + 98] = 0x8c379a000000000000000000000000000000000000000000000000000000000
  mem[mem[64] + 4] = 32
  _512 = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97]
  mem[mem[64] + 36] = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 97]
  mem[_489 + 68 len ceil32(_512)] = mem[ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 129 len ceil32(_512)]
  mem[_512 + _489 + 68] = 0
  revert with memory
    from mem[64]
     len ceil32(_512) + _489 + -mem[64] + 68

def safeBatchTransferFrom(address _from, address _to, uint256[] _ids, uint256[] _values, bytes _data) payable: 
  require calldata.size - 4 >=′ 160
  require _from == _from
  require _to == _to
  require _ids <= 18446744073709551615
  require _ids + 35 <′ calldata.size
  if _ids.length > 18446744073709551615:
      revert with 0, 65
  if ceil32(32 * _ids.length) + 97 < 96 or ceil32(32 * _ids.length) + 97 > 18446744073709551615:
      revert with 0, 65
  mem[96] = _ids.length
  require _ids + (32 * _ids.length) + 36 <= calldata.size
  idx = _ids + 36
  s = 128
  while idx < _ids + (32 * _ids.length) + 36:
      mem[s] = cd[idx]
      idx = idx + 32
      s = s + 32
      continue 
  require _values <= 18446744073709551615
  require _values + 35 <′ calldata.size
  if _values.length > 18446744073709551615:
      revert with 0, 65
  if ceil32(32 * _values.length) + 98 < 97 or ceil32(32 * _ids.length) + ceil32(32 * _values.length) + 98 > 18446744073709551615:
      revert with 0, 65
  mem[ceil32(32 * _ids.length) + 97] = _values.length
  require _values + (32 * _values.length) + 36 <= calldata.size
  idx = _values + 36
  s = ceil32(32 * _ids.length) + 129
  while idx < _values + (32 * _values.length) + 36:
      mem[s] = cd[idx]
      idx = idx + 32
      s = s + 32
      continue 
  require _data <= 18446744073709551615
  require _data + 35 <′ calldata.size
  if _data.length > 18446744073709551615:
      revert with 0, 65
  if ceil32(ceil32(_data.length)) + 99 < 98 or ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 99 > 18446744073709551615:
      revert with 0, 65
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + 98] = _data.length
  require _data + _data.length + 36 <= calldata.size
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + 130 len _data.length] = _data[all]
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + _data.length + 130] = 0
  if _ids.length != _values.length:
      revert with 0, 'ERC1155: ids and amounts length mismatch'
  if not _to:
      revert with 0, 'ERC1155: transfer to the zero address'
  if caller == _from:
      idx = 0
      while idx < _ids.length:
          if idx >= _ids.length:
              revert with 0, 50
          if idx >= _values.length:
              revert with 0, 50
          if mem[(32 * idx) + ceil32(32 * _ids.length) + 129] != 1:
              revert with 0, 'ERC1155: insufficient balance for transfer'
          if unknowned70554d[mem[(32 * idx) + 128]].field_0 != _from:
              revert with 0, 'ERC1155: insufficient balance for transfer'
          mem[0] = mem[(32 * idx) + 128]
          mem[32] = 1
          unknowned70554d[mem[(32 * idx) + 128]].field_0 = _to
          unknowned70554d[mem[(32 * idx) + 128]].field_160 = 0
          if not idx + 1:
              revert with 0, 17
          idx = idx + 1
          continue 
      mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 99] = 64
      mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 195 len 32 * _ids.length] = mem[128 len 32 * _ids.length]
      mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + (32 * _ids.length) + 195] = _values.length
      mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + (32 * _ids.length) + 227 len 32 * _values.length] = mem[ceil32(32 * _ids.length) + 129 len 32 * _values.length]
      log 0x4a39dc06: Array(len=_ids.length, data=mem[128 len 32 * _ids.length], _values.length, mem[ceil32(32 * _ids.length) + 129 len 32 * _values.length]), (32 * _ids.length) + 96, caller, _from, _to
      if not ext_code.size(_to):
          stop
      mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 99] = 0xbc197c8100000000000000000000000000000000000000000000000000000000
      mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 103] = caller
      mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 135] = _from
      mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 167] = 160
      mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 263] = _ids.length
      mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 295 len 32 * _ids.length] = mem[128 len 32 * _ids.length]
      mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 199] = (32 * _ids.length) + 192
      mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + (32 * _ids.length) + 295] = _values.length
      mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + (32 * _ids.length) + 327 len 32 * _values.length] = mem[ceil32(32 * _ids.length) + 129 len 32 * _values.length]
      mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 231] = (32 * _ids.length) + (32 * _values.length) + 224
      mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + (32 * _ids.length) + (32 * _values.length) + 327] = _data.length
      mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + (32 * _ids.length) + (32 * _values.length) + 359 len ceil32(_data.length)] = _data[all], Mask(8 * ceil32(_data.length) - _data.length, -(8 * ceil32(_data.length) + -ceil32(ceil32(_data.length)) + 27) + 256, caller) >> -(8 * ceil32(_data.length) + -ceil32(ceil32(_data.length)) + 27) + 256
      mem[_data.length + ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + (32 * _ids.length) + (32 * _values.length) + 359] = 0
      call _to.onERC1155BatchReceived(address param1, address param2, uint256[] param3, uint256[] param4, bytes param5) with:
           gas gas_remaining wei
          args caller, addr(_from), Array(len=_ids.length, data=mem[128 len 32 * _ids.length], _values.length, mem[ceil32(32 * _ids.length) + 129 len 32 * _values.length], _data.length, _data[all], Mask(8 * ceil32(_data.length) - _data.length, -(8 * ceil32(_data.length) + -ceil32(ceil32(_data.length)) + 27) + 256, caller) >> -(8 * ceil32(_data.length) + -ceil32(ceil32(_data.length)) + 27) + 256), (32 * _ids.length) + 192, (32 * _ids.length) + (32 * _values.length) + 224
      mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 99] = ext_call.return_data[0]
      if ext_call.success:
          require return_data.size >=′ 32
          require ext_call.return_data[0] == Mask(32, 224, ext_call.return_data[0])
          if Mask(32, 224, ext_call.return_data[0]) != 0xbc197c8100000000000000000000000000000000000000000000000000000000:
              revert with 0, 'ERC1155: ERC1155Receiver rejected tokens'
          stop
      if return_data.size <= 3:
          revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
      mem[0 len 4] = ext_call.return_data[0 len 4]
      if -(uint32(mem[4 len 28]) >> 224) + Error(string error):
          revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
      if return_data.size < 68:
          revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
      mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 99 len return_data.size - 4] = ext_call.return_data[4 len return_data.size - 4]
      if ext_call.return_data[0] > 18446744073709551615 or ext_call.return_data[0] + 36 > return_data.size:
          revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
      if mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99] > 18446744073709551615:
          revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
      if ext_call.return_data[0] + mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99] + 32 > return_data.size - 4:
          revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
      if floor32(ext_call.return_data[0] + mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99] + 31) + 100 < 99 or ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99] + 31) + 100 > 18446744073709551615:
          revert with 0, 65
      mem[64] = ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99] + 31) + 100
      if not ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99:
          mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99] + 31) + 100] = 0x8c379a000000000000000000000000000000000000000000000000000000000
          revert with mem[mem[64] len 4], 'ERC1155: transfer to non ERC1155Receiver implementer'
      _881 = ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99] + 31) + 100
      mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99] + 31) + 100] = 0x8c379a000000000000000000000000000000000000000000000000000000000
      mem[mem[64] + 4] = 32
      _885 = mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99]
      mem[mem[64] + 36] = mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99]
      mem[mem[64] + 68 len ceil32(_885)] = mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 131 len ceil32(_885)]
      mem[_885 + mem[64] + 68] = 0
      revert with memory
        from mem[64]
         len ceil32(_885) + _881 + -mem[64] + 68
  mem[0] = caller
  if not stor2[addr(_from)][caller]:
      revert with 0, 'ERC1155: transfer caller is not owner nor approved'
  idx = 0
  while idx < _ids.length:
      if idx >= _ids.length:
          revert with 0, 50
      if idx >= _values.length:
          revert with 0, 50
      if mem[(32 * idx) + ceil32(32 * _ids.length) + 129] != 1:
          revert with 0, 'ERC1155: insufficient balance for transfer'
      if unknowned70554d[mem[(32 * idx) + 128]].field_0 != _from:
          revert with 0, 'ERC1155: insufficient balance for transfer'
      mem[0] = mem[(32 * idx) + 128]
      mem[32] = 1
      unknowned70554d[mem[(32 * idx) + 128]].field_0 = _to
      unknowned70554d[mem[(32 * idx) + 128]].field_160 = 0
      if not idx + 1:
          revert with 0, 17
      idx = idx + 1
      continue 
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 99] = 64
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 195 len 32 * _ids.length] = mem[128 len 32 * _ids.length]
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + (32 * _ids.length) + 195] = _values.length
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + (32 * _ids.length) + 227 len 32 * _values.length] = mem[ceil32(32 * _ids.length) + 129 len 32 * _values.length]
  log 0x4a39dc06: Array(len=_ids.length, data=mem[128 len 32 * _ids.length], _values.length, mem[ceil32(32 * _ids.length) + 129 len 32 * _values.length]), (32 * _ids.length) + 96, caller, _from, _to
  if not ext_code.size(_to):
      stop
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 99] = 0xbc197c8100000000000000000000000000000000000000000000000000000000
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 103] = caller
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 135] = _from
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 167] = 160
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 263] = _ids.length
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 295 len 32 * _ids.length] = mem[128 len 32 * _ids.length]
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 199] = (32 * _ids.length) + 192
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + (32 * _ids.length) + 295] = _values.length
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + (32 * _ids.length) + 327 len 32 * _values.length] = mem[ceil32(32 * _ids.length) + 129 len 32 * _values.length]
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 231] = (32 * _ids.length) + (32 * _values.length) + 224
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + (32 * _ids.length) + (32 * _values.length) + 327] = _data.length
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + (32 * _ids.length) + (32 * _values.length) + 359 len ceil32(_data.length)] = _data[all], Mask(8 * ceil32(_data.length) - _data.length, -(8 * ceil32(_data.length) + -ceil32(ceil32(_data.length)) + 27) + 256, caller) >> -(8 * ceil32(_data.length) + -ceil32(ceil32(_data.length)) + 27) + 256
  mem[_data.length + ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + (32 * _ids.length) + (32 * _values.length) + 359] = 0
  call _to.onERC1155BatchReceived(address param1, address param2, uint256[] param3, uint256[] param4, bytes param5) with:
       gas gas_remaining wei
      args caller, addr(_from), Array(len=_ids.length, data=mem[128 len 32 * _ids.length], _values.length, mem[ceil32(32 * _ids.length) + 129 len 32 * _values.length], _data.length, _data[all], Mask(8 * ceil32(_data.length) - _data.length, -(8 * ceil32(_data.length) + -ceil32(ceil32(_data.length)) + 27) + 256, caller) >> -(8 * ceil32(_data.length) + -ceil32(ceil32(_data.length)) + 27) + 256), (32 * _ids.length) + 192, (32 * _ids.length) + (32 * _values.length) + 224
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 99] = ext_call.return_data[0]
  if ext_call.success:
      require return_data.size >=′ 32
      require ext_call.return_data[0] == Mask(32, 224, ext_call.return_data[0])
      if Mask(32, 224, ext_call.return_data[0]) != 0xbc197c8100000000000000000000000000000000000000000000000000000000:
          revert with 0, 'ERC1155: ERC1155Receiver rejected tokens'
      stop
  if return_data.size <= 3:
      revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
  mem[0 len 4] = ext_call.return_data[0 len 4]
  if -(uint32(mem[4 len 28]) >> 224) + Error(string error):
      revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
  if return_data.size < 68:
      revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + 99 len return_data.size - 4] = ext_call.return_data[4 len return_data.size - 4]
  if ext_call.return_data[0] > 18446744073709551615 or ext_call.return_data[0] + 36 > return_data.size:
      revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
  if mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99] > 18446744073709551615:
      revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
  if ext_call.return_data[0] + mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99] + 32 > return_data.size - 4:
      revert with 0, 'ERC1155: transfer to non ERC1155Receiver implementer'
  if floor32(ext_call.return_data[0] + mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99] + 31) + 100 < 99 or ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99] + 31) + 100 > 18446744073709551615:
      revert with 0, 65
  mem[64] = ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99] + 31) + 100
  if not ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99:
      mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99] + 31) + 100] = 0x8c379a000000000000000000000000000000000000000000000000000000000
      revert with mem[mem[64] len 4], 'ERC1155: transfer to non ERC1155Receiver implementer'
  _882 = ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99] + 31) + 100
  mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + floor32(ext_call.return_data[0] + mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99] + 31) + 100] = 0x8c379a000000000000000000000000000000000000000000000000000000000
  mem[mem[64] + 4] = 32
  _887 = mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99]
  mem[mem[64] + 36] = mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 99]
  mem[mem[64] + 68 len ceil32(_887)] = mem[ceil32(32 * _ids.length) + ceil32(32 * _values.length) + ceil32(ceil32(_data.length)) + ext_call.return_data[0] + 131 len ceil32(_887)]
  mem[_887 + mem[64] + 68] = 0
  revert with memory
    from mem[64]
     len ceil32(_887) + _882 + -mem[64] + 68

def unknownc658e086(uint256 _param1, array _param2, uint256 _param3, uint256 _param4, uint256 _param5) payable: 
  require calldata.size - 4 >=′ 160
  require _param2 <= 18446744073709551615
  require _param2 + 35 <′ calldata.size
  require _param2.length <= 18446744073709551615
  require _param2 + _param2.length + 36 <= calldata.size
  require _param3 == addr(_param3)
  require _param4 == uint32(_param4)
  require _param5 == uint64(_param5)
  if 0 >= block.timestamp:
      if unknowned70554d[_param1].field_0 == caller:
          if 0 >= block.timestamp:
              if 4294836223 or uint32(_param4) != 4294836223:
                  revert with 0, sha3(_param1, sha3(_param2[all]))
              if stor5[_param1].field_0:
                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                      revert with 0, 34
              else:
                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                      revert with 0, 34
              if stor5[_param1].field_0:
                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                      revert with 0, 34
                  if not Mask(256, -1, stor5[_param1].field_0):
                      if _param2.length < 1:
                          revert with 671984822
                  else:
                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                          if _param2.length < 1:
                              revert with 671984822
              else:
                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                      revert with 0, 34
                  if not stor5[_param1].field_1:
                      if _param2.length < 1:
                          revert with 671984822
                  else:
                      if 31 >= stor5[_param1].field_1:
                          if _param2.length < 1:
                              revert with 671984822
          else:
              if 0 >= block.timestamp:
                  if 4294836223 or uint32(_param4) != 4294836223:
                      revert with 0, sha3(_param1, sha3(_param2[all]))
                  if stor5[_param1].field_0:
                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                          revert with 0, 34
                  else:
                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                          revert with 0, 34
                  if stor5[_param1].field_0:
                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                          revert with 0, 34
                      if not Mask(256, -1, stor5[_param1].field_0):
                          if _param2.length < 1:
                              revert with 671984822
                      else:
                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                              if _param2.length < 1:
                                  revert with 671984822
                  else:
                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                          revert with 0, 34
                      if not stor5[_param1].field_1:
                          if _param2.length < 1:
                              revert with 671984822
                      else:
                          if 31 >= stor5[_param1].field_1:
                              if _param2.length < 1:
                                  revert with 671984822
              else:
                  if not unknowned70554d[_param1][sha3(_param2[all])].field_0:
                      if 4294836223 or uint32(_param4) != 4294836223:
                          revert with 0, sha3(_param1, sha3(_param2[all]))
                      if stor5[_param1].field_0:
                          if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                              revert with 0, 34
                      else:
                          if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                              revert with 0, 34
                      if stor5[_param1].field_0:
                          if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                              revert with 0, 34
                          if not Mask(256, -1, stor5[_param1].field_0):
                              if _param2.length < 1:
                                  revert with 671984822
                          else:
                              if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                  if _param2.length < 1:
                                      revert with 671984822
                      else:
                          if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                              revert with 0, 34
                          if not stor5[_param1].field_1:
                              if _param2.length < 1:
                                  revert with 671984822
                          else:
                              if 31 >= stor5[_param1].field_1:
                                  if _param2.length < 1:
                                      revert with 671984822
                  else:
                      static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                              gas gas_remaining wei
                             args sha3(_param1, sha3(_param2[all]))
                      if not ext_call.success:
                          revert with ext_call.return_data[0 len return_data.size]
                      require return_data.size >=′ 32
                      require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                      if 4294836223 or uint32(_param4) != 4294836223:
                          revert with 0, sha3(_param1, sha3(_param2[all]))
                      if ext_call.return_data[12 len 20]:
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                              if not Mask(256, -1, stor5[_param1].field_0):
                                  if _param2.length < 1:
                                      revert with 671984822
                              else:
                                  if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                      if _param2.length < 1:
                                          revert with 671984822
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                              if not stor5[_param1].field_1:
                                  if _param2.length < 1:
                                      revert with 671984822
                              else:
                                  if 31 >= stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                      else:
                          if 0 >= block.timestamp:
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length > 255:
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                              if _param2.length < 1:
                                                  revert with 671984822
                                  else:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length <= 255:
                                      else:
                                          if 31 >= stor5[_param1].field_1:
                                              if _param2.length < 1:
                                                  revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length <= 255:
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                              if _param2.length < 1:
                                                  revert with 671984822
                                  else:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= stor5[_param1].field_1:
                                              if _param2.length < 1:
                                                  revert with 671984822
                          else:
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                              if _param2.length < 1:
                                                  revert with 671984822
                                  else:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= stor5[_param1].field_1:
                                              if _param2.length < 1:
                                                  revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= stor5[_param1].field_1:
                                  else:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                              if _param2.length < 1:
                                                  revert with 671984822
      else:
          if not stor2[stor1[_param1].field_0][caller]:
              revert with 0, _param1, caller
          if 0 >= block.timestamp:
              if 4294836223 or uint32(_param4) != 4294836223:
                  revert with 0, sha3(_param1, sha3(_param2[all]))
              if stor5[_param1].field_0:
                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                      revert with 0, 34
              else:
                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                      revert with 0, 34
              if stor5[_param1].field_0:
                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                      revert with 0, 34
                  if not Mask(256, -1, stor5[_param1].field_0):
                      if _param2.length < 1:
                          revert with 671984822
                  else:
                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                          if _param2.length < 1:
                              revert with 671984822
              else:
                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                      revert with 0, 34
                  if not stor5[_param1].field_1:
                      if _param2.length < 1:
                          revert with 671984822
                  else:
                      if 31 >= stor5[_param1].field_1:
                          if _param2.length < 1:
                              revert with 671984822
          else:
              if 0 >= block.timestamp:
                  if 4294836223 or uint32(_param4) != 4294836223:
                      revert with 0, sha3(_param1, sha3(_param2[all]))
                  if stor5[_param1].field_0:
                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                          revert with 0, 34
                  else:
                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                          revert with 0, 34
                  if stor5[_param1].field_0:
                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                          revert with 0, 34
                      if not Mask(256, -1, stor5[_param1].field_0):
                          if _param2.length < 1:
                              revert with 671984822
                      else:
                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                              if _param2.length < 1:
                                  revert with 671984822
                  else:
                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                          revert with 0, 34
                      if not stor5[_param1].field_1:
                          if _param2.length < 1:
                              revert with 671984822
                      else:
                          if 31 >= stor5[_param1].field_1:
                              if _param2.length < 1:
                                  revert with 671984822
              else:
                  if not unknowned70554d[_param1][sha3(_param2[all])].field_0:
                      if 4294836223 or uint32(_param4) != 4294836223:
                          revert with 0, sha3(_param1, sha3(_param2[all]))
                      if stor5[_param1].field_0:
                          if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                              revert with 0, 34
                      else:
                          if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                              revert with 0, 34
                      if stor5[_param1].field_0:
                          if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                              revert with 0, 34
                          if not Mask(256, -1, stor5[_param1].field_0):
                              if _param2.length < 1:
                                  revert with 671984822
                          else:
                              if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                  if _param2.length < 1:
                                      revert with 671984822
                      else:
                          if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                              revert with 0, 34
                          if not stor5[_param1].field_1:
                              if _param2.length < 1:
                                  revert with 671984822
                          else:
                              if 31 >= stor5[_param1].field_1:
                                  if _param2.length < 1:
                                      revert with 671984822
                  else:
                      static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                              gas gas_remaining wei
                             args sha3(_param1, sha3(_param2[all]))
                      if not ext_call.success:
                          revert with ext_call.return_data[0 len return_data.size]
                      require return_data.size >=′ 32
                      require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                      if 4294836223 or uint32(_param4) != 4294836223:
                          revert with 0, sha3(_param1, sha3(_param2[all]))
                      if ext_call.return_data[12 len 20]:
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                              if not Mask(256, -1, stor5[_param1].field_0):
                                  if _param2.length < 1:
                                      revert with 671984822
                              else:
                                  if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                      if _param2.length < 1:
                                          revert with 671984822
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                              if not stor5[_param1].field_1:
                                  if _param2.length < 1:
                                      revert with 671984822
                              else:
                                  if 31 >= stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                      else:
                          if 0 >= block.timestamp:
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length <= 255:
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                              if _param2.length < 1:
                                                  revert with 671984822
                                  else:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= stor5[_param1].field_1:
                                              if _param2.length < 1:
                                                  revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                              if _param2.length < 1:
                                                  revert with 671984822
                                  else:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= stor5[_param1].field_1:
                                              if _param2.length < 1:
                                                  revert with 671984822
                          else:
                              if not stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                  else:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= stor5[_param1].field_1:
                                  else:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                              if _param2.length < 1:
                                                  revert with 671984822
  else:
      if unknowned70554d[_param1].field_0 == caller:
          if 0 >= block.timestamp:
              if 4294836223 or uint32(_param4) != 4294836223:
                  revert with 0, sha3(_param1, sha3(_param2[all]))
              if stor5[_param1].field_0:
                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                      revert with 0, 34
              else:
                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                      revert with 0, 34
              if stor5[_param1].field_0:
                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                      revert with 0, 34
                  if not Mask(256, -1, stor5[_param1].field_0):
                      if _param2.length < 1:
                          revert with 671984822
                  else:
                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                          if _param2.length < 1:
                              revert with 671984822
              else:
                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                      revert with 0, 34
                  if not stor5[_param1].field_1:
                      if _param2.length < 1:
                          revert with 671984822
                  else:
                      if 31 >= stor5[_param1].field_1:
                          if _param2.length < 1:
                              revert with 671984822
          else:
              if 0 >= block.timestamp:
                  if 4294836223 or uint32(_param4) != 4294836223:
                      revert with 0, sha3(_param1, sha3(_param2[all]))
                  if stor5[_param1].field_0:
                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                          revert with 0, 34
                  else:
                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                          revert with 0, 34
                  if stor5[_param1].field_0:
                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                          revert with 0, 34
                      if not Mask(256, -1, stor5[_param1].field_0):
                          if _param2.length < 1:
                              revert with 671984822
                      else:
                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                              if _param2.length < 1:
                                  revert with 671984822
                  else:
                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                          revert with 0, 34
                      if not stor5[_param1].field_1:
                          if _param2.length < 1:
                              revert with 671984822
                      else:
                          if 31 >= stor5[_param1].field_1:
                              if _param2.length < 1:
                                  revert with 671984822
              else:
                  if not unknowned70554d[_param1][sha3(_param2[all])].field_0:
                      if 4294836223 or uint32(_param4) != 4294836223:
                          revert with 0, sha3(_param1, sha3(_param2[all]))
                      if 0 >= block.timestamp:
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                              if not Mask(256, -1, stor5[_param1].field_0):
                                  if _param2.length < 1:
                                      revert with 671984822
                              else:
                                  if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                      if _param2.length < 1:
                                          revert with 671984822
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                              if not stor5[_param1].field_1:
                                  if _param2.length < 1:
                                      revert with 671984822
                              else:
                                  if 31 >= stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                      else:
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not Mask(256, -1, stor5[_param1].field_0):
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                          if _param2.length < 1:
                                              revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not Mask(256, -1, stor5[_param1].field_0):
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                          if _param2.length < 1:
                                              revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length > 255:
                  else:
                      static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                              gas gas_remaining wei
                             args sha3(_param1, sha3(_param2[all]))
                      if not ext_call.success:
                          revert with ext_call.return_data[0 len return_data.size]
                      require return_data.size >=′ 32
                      require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                      if 4294836223 or uint32(_param4) != 4294836223:
                          revert with 0, sha3(_param1, sha3(_param2[all]))
                      if ext_call.return_data[12 len 20]:
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not Mask(256, -1, stor5[_param1].field_0):
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                          if _param2.length < 1:
                                              revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not Mask(256, -1, stor5[_param1].field_0):
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                          if _param2.length < 1:
                                              revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length > 255:
                      else:
                          if 0 < block.timestamp:
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                  else:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if stor5[_param1].field_1:
                                  else:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                          else:
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                              if _param2.length < 1:
                                                  revert with 671984822
                                  else:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= stor5[_param1].field_1:
                                              if _param2.length < 1:
                                                  revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= stor5[_param1].field_1:
                                  else:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                              if _param2.length < 1:
                                                  revert with 671984822
      else:
          if not stor2[stor1[_param1].field_0][caller]:
              revert with 0, _param1, caller
          if 0 >= block.timestamp:
              if 4294836223 or uint32(_param4) != 4294836223:
                  revert with 0, sha3(_param1, sha3(_param2[all]))
              if stor5[_param1].field_0:
                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                      revert with 0, 34
              else:
                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                      revert with 0, 34
              if stor5[_param1].field_0:
                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                      revert with 0, 34
                  if not Mask(256, -1, stor5[_param1].field_0):
                      if _param2.length < 1:
                          revert with 671984822
                  else:
                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                          if _param2.length < 1:
                              revert with 671984822
              else:
                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                      revert with 0, 34
                  if not stor5[_param1].field_1:
                      if _param2.length < 1:
                          revert with 671984822
                  else:
                      if 31 >= stor5[_param1].field_1:
                          if _param2.length < 1:
                              revert with 671984822
          else:
              if 0 >= block.timestamp:
                  if 4294836223 or uint32(_param4) != 4294836223:
                      revert with 0, sha3(_param1, sha3(_param2[all]))
                  if stor5[_param1].field_0:
                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                          revert with 0, 34
                  else:
                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                          revert with 0, 34
                  if stor5[_param1].field_0:
                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                          revert with 0, 34
                      if not Mask(256, -1, stor5[_param1].field_0):
                          if _param2.length < 1:
                              revert with 671984822
                      else:
                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                              if _param2.length < 1:
                                  revert with 671984822
                  else:
                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                          revert with 0, 34
                      if not stor5[_param1].field_1:
                          if _param2.length < 1:
                              revert with 671984822
                      else:
                          if 31 >= stor5[_param1].field_1:
                              if _param2.length < 1:
                                  revert with 671984822
              else:
                  if not unknowned70554d[_param1][sha3(_param2[all])].field_0:
                      if 4294836223 or uint32(_param4) != 4294836223:
                          revert with 0, sha3(_param1, sha3(_param2[all]))
                      if 0 >= block.timestamp:
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                              if not Mask(256, -1, stor5[_param1].field_0):
                                  if _param2.length < 1:
                                      revert with 671984822
                              else:
                                  if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                      if _param2.length < 1:
                                          revert with 671984822
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                              if not stor5[_param1].field_1:
                                  if _param2.length < 1:
                                      revert with 671984822
                              else:
                                  if 31 >= stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                      else:
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not Mask(256, -1, stor5[_param1].field_0):
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                          if _param2.length < 1:
                                              revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length > 255:
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not Mask(256, -1, stor5[_param1].field_0):
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length > 255:
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length <= 255:
                  else:
                      static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                              gas gas_remaining wei
                             args sha3(_param1, sha3(_param2[all]))
                      if not ext_call.success:
                          revert with ext_call.return_data[0 len return_data.size]
                      require return_data.size >=′ 32
                      require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                      if 4294836223 or uint32(_param4) != 4294836223:
                          revert with 0, sha3(_param1, sha3(_param2[all]))
                      if ext_call.return_data[12 len 20]:
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not Mask(256, -1, stor5[_param1].field_0):
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                          if _param2.length < 1:
                                              revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length > 255:
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not Mask(256, -1, stor5[_param1].field_0):
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length > 255:
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length <= 255:
                      else:
                          if 0 < block.timestamp:
                              if not stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if Mask(256, -1, stor5[_param1].field_0):
                                  else:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if stor5[_param1].field_1:
                              else:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if stor5[_param1].field_1:
                                  else:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                          else:
                              if not stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                  else:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= stor5[_param1].field_1:
                                  else:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                              if _param2.length < 1:
                                                  revert with 671984822
  ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)

def unknown24c1af44(uint256 _param1, array _param2, uint256 _param3, uint256 _param4, uint256 _param5, uint256 _param6, uint256 _param7) payable: 
  require calldata.size - 4 >=′ 224
  require _param2 <= 18446744073709551615
  require _param2 + 35 <′ calldata.size
  if _param2.length > 18446744073709551615:
      revert with 0, 65
  if ceil32(ceil32(_param2.length)) + 97 < 96 or ceil32(ceil32(_param2.length)) + 97 > 18446744073709551615:
      revert with 0, 65
  require _param2 + _param2.length + 36 <= calldata.size
  require _param3 == addr(_param3)
  require _param4 == addr(_param4)
  require _param5 == uint64(_param5)
  require _param6 == uint32(_param6)
  require _param7 == uint64(_param7)
  if 0 >= block.timestamp:
      if unknowned70554d[_param1].field_0 == caller:
          if 0 >= block.timestamp:
              if 4294836223 or uint32(_param6) != 4294836223:
                  revert with 0, sha3(_param1, sha3(_param2[all]))
              if stor5[_param1].field_0:
                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                      revert with 0, 34
              else:
                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                      revert with 0, 34
              if stor5[_param1].field_0:
                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                      revert with 0, 34
                  if not Mask(256, -1, stor5[_param1].field_0):
                      if _param2.length < 1:
                          revert with 671984822
                  else:
                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                          if _param2.length < 1:
                              revert with 671984822
              else:
                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                      revert with 0, 34
                  if not stor5[_param1].field_1:
                      if _param2.length < 1:
                          revert with 671984822
                  else:
                      if 31 >= stor5[_param1].field_1:
                          if _param2.length < 1:
                              revert with 671984822
          else:
              if 0 >= block.timestamp:
                  if 4294836223 or uint32(_param6) != 4294836223:
                      revert with 0, sha3(_param1, sha3(_param2[all]))
                  if stor5[_param1].field_0:
                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                          revert with 0, 34
                  else:
                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                          revert with 0, 34
                  if stor5[_param1].field_0:
                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                          revert with 0, 34
                      if not Mask(256, -1, stor5[_param1].field_0):
                          if _param2.length < 1:
                              revert with 671984822
                      else:
                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                              if _param2.length < 1:
                                  revert with 671984822
                  else:
                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                          revert with 0, 34
                      if not stor5[_param1].field_1:
                          if _param2.length < 1:
                              revert with 671984822
                      else:
                          if 31 >= stor5[_param1].field_1:
                              if _param2.length < 1:
                                  revert with 671984822
              else:
                  if not unknowned70554d[_param1][sha3(_param2[all])].field_0:
                      if 4294836223 or uint32(_param6) != 4294836223:
                          revert with 0, sha3(_param1, sha3(_param2[all]))
                      if stor5[_param1].field_0:
                          if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                              revert with 0, 34
                      else:
                          if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                              revert with 0, 34
                      if stor5[_param1].field_0:
                          if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                              revert with 0, 34
                          if not Mask(256, -1, stor5[_param1].field_0):
                              if _param2.length < 1:
                                  revert with 671984822
                          else:
                              if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                  if _param2.length < 1:
                                      revert with 671984822
                      else:
                          if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                              revert with 0, 34
                          if not stor5[_param1].field_1:
                              if _param2.length < 1:
                                  revert with 671984822
                          else:
                              if 31 >= stor5[_param1].field_1:
                                  if _param2.length < 1:
                                      revert with 671984822
                  else:
                      static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                              gas gas_remaining wei
                             args sha3(_param1, sha3(_param2[all]))
                      if not ext_call.success:
                          revert with ext_call.return_data[0 len return_data.size]
                      require return_data.size >=′ 32
                      require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                      if 4294836223 or uint32(_param6) != 4294836223:
                          revert with 0, sha3(_param1, sha3(_param2[all]))
                      if ext_call.return_data[12 len 20]:
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                              if not Mask(256, -1, stor5[_param1].field_0):
                                  if _param2.length < 1:
                                      revert with 671984822
                              else:
                                  if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                      if _param2.length < 1:
                                          revert with 671984822
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                              if not stor5[_param1].field_1:
                                  if _param2.length < 1:
                                      revert with 671984822
                              else:
                                  if 31 >= stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                      else:
                          if 0 >= block.timestamp:
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length > 255:
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                              if _param2.length < 1:
                                                  revert with 671984822
                                  else:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length <= 255:
                                      else:
                                          if 31 >= stor5[_param1].field_1:
                                              if _param2.length < 1:
                                                  revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length <= 255:
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                              if _param2.length < 1:
                                                  revert with 671984822
                                  else:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= stor5[_param1].field_1:
                                              if _param2.length < 1:
                                                  revert with 671984822
                          else:
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                              if _param2.length < 1:
                                                  revert with 671984822
                                  else:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= stor5[_param1].field_1:
                                              if _param2.length < 1:
                                                  revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= stor5[_param1].field_1:
                                  else:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                              if _param2.length < 1:
                                                  revert with 671984822
      else:
          if not stor2[stor1[_param1].field_0][caller]:
              revert with 0, _param1, caller
          if 0 >= block.timestamp:
              if 4294836223 or uint32(_param6) != 4294836223:
                  revert with 0, sha3(_param1, sha3(_param2[all]))
              if stor5[_param1].field_0:
                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                      revert with 0, 34
              else:
                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                      revert with 0, 34
              if stor5[_param1].field_0:
                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                      revert with 0, 34
                  if not Mask(256, -1, stor5[_param1].field_0):
                      if _param2.length < 1:
                          revert with 671984822
                  else:
                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                          if _param2.length < 1:
                              revert with 671984822
              else:
                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                      revert with 0, 34
                  if not stor5[_param1].field_1:
                      if _param2.length < 1:
                          revert with 671984822
                  else:
                      if 31 >= stor5[_param1].field_1:
                          if _param2.length < 1:
                              revert with 671984822
          else:
              if 0 >= block.timestamp:
                  if 4294836223 or uint32(_param6) != 4294836223:
                      revert with 0, sha3(_param1, sha3(_param2[all]))
                  if stor5[_param1].field_0:
                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                          revert with 0, 34
                  else:
                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                          revert with 0, 34
                  if stor5[_param1].field_0:
                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                          revert with 0, 34
                      if not Mask(256, -1, stor5[_param1].field_0):
                          if _param2.length < 1:
                              revert with 671984822
                      else:
                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                              if _param2.length < 1:
                                  revert with 671984822
                  else:
                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                          revert with 0, 34
                      if not stor5[_param1].field_1:
                          if _param2.length < 1:
                              revert with 671984822
                      else:
                          if 31 >= stor5[_param1].field_1:
                              if _param2.length < 1:
                                  revert with 671984822
              else:
                  if not unknowned70554d[_param1][sha3(_param2[all])].field_0:
                      if 4294836223 or uint32(_param6) != 4294836223:
                          revert with 0, sha3(_param1, sha3(_param2[all]))
                      if stor5[_param1].field_0:
                          if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                              revert with 0, 34
                      else:
                          if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                              revert with 0, 34
                      if stor5[_param1].field_0:
                          if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                              revert with 0, 34
                          if not Mask(256, -1, stor5[_param1].field_0):
                              if _param2.length < 1:
                                  revert with 671984822
                          else:
                              if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                  if _param2.length < 1:
                                      revert with 671984822
                      else:
                          if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                              revert with 0, 34
                          if not stor5[_param1].field_1:
                              if _param2.length < 1:
                                  revert with 671984822
                          else:
                              if 31 >= stor5[_param1].field_1:
                                  if _param2.length < 1:
                                      revert with 671984822
                  else:
                      static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                              gas gas_remaining wei
                             args sha3(_param1, sha3(_param2[all]))
                      if not ext_call.success:
                          revert with ext_call.return_data[0 len return_data.size]
                      require return_data.size >=′ 32
                      require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                      if 4294836223 or uint32(_param6) != 4294836223:
                          revert with 0, sha3(_param1, sha3(_param2[all]))
                      if ext_call.return_data[12 len 20]:
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                              if not Mask(256, -1, stor5[_param1].field_0):
                                  if _param2.length < 1:
                                      revert with 671984822
                              else:
                                  if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                      if _param2.length < 1:
                                          revert with 671984822
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                              if not stor5[_param1].field_1:
                                  if _param2.length < 1:
                                      revert with 671984822
                              else:
                                  if 31 >= stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                      else:
                          if 0 >= block.timestamp:
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length <= 255:
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                              if _param2.length < 1:
                                                  revert with 671984822
                                  else:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= stor5[_param1].field_1:
                                              if _param2.length < 1:
                                                  revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                              if _param2.length < 1:
                                                  revert with 671984822
                                  else:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= stor5[_param1].field_1:
                                              if _param2.length < 1:
                                                  revert with 671984822
                          else:
                              if not stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                  else:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= stor5[_param1].field_1:
                                  else:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                              if _param2.length < 1:
                                                  revert with 671984822
  else:
      if unknowned70554d[_param1].field_0 == caller:
          if 0 >= block.timestamp:
              if 4294836223 or uint32(_param6) != 4294836223:
                  revert with 0, sha3(_param1, sha3(_param2[all]))
              if stor5[_param1].field_0:
                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                      revert with 0, 34
              else:
                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                      revert with 0, 34
              if stor5[_param1].field_0:
                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                      revert with 0, 34
                  if not Mask(256, -1, stor5[_param1].field_0):
                      if _param2.length < 1:
                          revert with 671984822
                  else:
                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                          if _param2.length < 1:
                              revert with 671984822
              else:
                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                      revert with 0, 34
                  if not stor5[_param1].field_1:
                      if _param2.length < 1:
                          revert with 671984822
                  else:
                      if 31 >= stor5[_param1].field_1:
                          if _param2.length < 1:
                              revert with 671984822
          else:
              if 0 >= block.timestamp:
                  if 4294836223 or uint32(_param6) != 4294836223:
                      revert with 0, sha3(_param1, sha3(_param2[all]))
                  if stor5[_param1].field_0:
                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                          revert with 0, 34
                  else:
                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                          revert with 0, 34
                  if stor5[_param1].field_0:
                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                          revert with 0, 34
                      if not Mask(256, -1, stor5[_param1].field_0):
                          if _param2.length < 1:
                              revert with 671984822
                      else:
                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                              if _param2.length < 1:
                                  revert with 671984822
                  else:
                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                          revert with 0, 34
                      if not stor5[_param1].field_1:
                          if _param2.length < 1:
                              revert with 671984822
                      else:
                          if 31 >= stor5[_param1].field_1:
                              if _param2.length < 1:
                                  revert with 671984822
              else:
                  if not unknowned70554d[_param1][sha3(_param2[all])].field_0:
                      if 4294836223 or uint32(_param6) != 4294836223:
                          revert with 0, sha3(_param1, sha3(_param2[all]))
                      if 0 >= block.timestamp:
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                              if not Mask(256, -1, stor5[_param1].field_0):
                                  if _param2.length < 1:
                                      revert with 671984822
                              else:
                                  if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                      if _param2.length < 1:
                                          revert with 671984822
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                              if not stor5[_param1].field_1:
                                  if _param2.length < 1:
                                      revert with 671984822
                              else:
                                  if 31 >= stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                      else:
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not Mask(256, -1, stor5[_param1].field_0):
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                          if _param2.length < 1:
                                              revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not Mask(256, -1, stor5[_param1].field_0):
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                          if _param2.length < 1:
                                              revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length > 255:
                  else:
                      static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                              gas gas_remaining wei
                             args sha3(_param1, sha3(_param2[all]))
                      if not ext_call.success:
                          revert with ext_call.return_data[0 len return_data.size]
                      require return_data.size >=′ 32
                      require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                      if 4294836223 or uint32(_param6) != 4294836223:
                          revert with 0, sha3(_param1, sha3(_param2[all]))
                      if ext_call.return_data[12 len 20]:
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not Mask(256, -1, stor5[_param1].field_0):
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                          if _param2.length < 1:
                                              revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not Mask(256, -1, stor5[_param1].field_0):
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                          if _param2.length < 1:
                                              revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length > 255:
                      else:
                          if 0 < block.timestamp:
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                  else:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if stor5[_param1].field_1:
                                  else:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                          else:
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                              if _param2.length < 1:
                                                  revert with 671984822
                                  else:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= stor5[_param1].field_1:
                                              if _param2.length < 1:
                                                  revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= stor5[_param1].field_1:
                                  else:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                              if _param2.length < 1:
                                                  revert with 671984822
      else:
          if not stor2[stor1[_param1].field_0][caller]:
              revert with 0, _param1, caller
          if 0 >= block.timestamp:
              if 4294836223 or uint32(_param6) != 4294836223:
                  revert with 0, sha3(_param1, sha3(_param2[all]))
              if stor5[_param1].field_0:
                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                      revert with 0, 34
              else:
                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                      revert with 0, 34
              if stor5[_param1].field_0:
                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                      revert with 0, 34
                  if not Mask(256, -1, stor5[_param1].field_0):
                      if _param2.length < 1:
                          revert with 671984822
                  else:
                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                          if _param2.length < 1:
                              revert with 671984822
              else:
                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                      revert with 0, 34
                  if not stor5[_param1].field_1:
                      if _param2.length < 1:
                          revert with 671984822
                  else:
                      if 31 >= stor5[_param1].field_1:
                          if _param2.length < 1:
                              revert with 671984822
          else:
              if 0 >= block.timestamp:
                  if 4294836223 or uint32(_param6) != 4294836223:
                      revert with 0, sha3(_param1, sha3(_param2[all]))
                  if stor5[_param1].field_0:
                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                          revert with 0, 34
                  else:
                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                          revert with 0, 34
                  if stor5[_param1].field_0:
                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                          revert with 0, 34
                      if not Mask(256, -1, stor5[_param1].field_0):
                          if _param2.length < 1:
                              revert with 671984822
                      else:
                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                              if _param2.length < 1:
                                  revert with 671984822
                  else:
                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                          revert with 0, 34
                      if not stor5[_param1].field_1:
                          if _param2.length < 1:
                              revert with 671984822
                      else:
                          if 31 >= stor5[_param1].field_1:
                              if _param2.length < 1:
                                  revert with 671984822
              else:
                  if not unknowned70554d[_param1][sha3(_param2[all])].field_0:
                      if 4294836223 or uint32(_param6) != 4294836223:
                          revert with 0, sha3(_param1, sha3(_param2[all]))
                      if 0 >= block.timestamp:
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                              if not Mask(256, -1, stor5[_param1].field_0):
                                  if _param2.length < 1:
                                      revert with 671984822
                              else:
                                  if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                      if _param2.length < 1:
                                          revert with 671984822
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                              if not stor5[_param1].field_1:
                                  if _param2.length < 1:
                                      revert with 671984822
                              else:
                                  if 31 >= stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                      else:
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not Mask(256, -1, stor5[_param1].field_0):
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                          if _param2.length < 1:
                                              revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length > 255:
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not Mask(256, -1, stor5[_param1].field_0):
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length > 255:
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length <= 255:
                  else:
                      static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                              gas gas_remaining wei
                             args sha3(_param1, sha3(_param2[all]))
                      if not ext_call.success:
                          revert with ext_call.return_data[0 len return_data.size]
                      require return_data.size >=′ 32
                      require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                      if 4294836223 or uint32(_param6) != 4294836223:
                          revert with 0, sha3(_param1, sha3(_param2[all]))
                      if ext_call.return_data[12 len 20]:
                          if stor5[_param1].field_0:
                              if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                  revert with 0, 34
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not Mask(256, -1, stor5[_param1].field_0):
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                          if _param2.length < 1:
                                              revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length > 255:
                          else:
                              if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                  revert with 0, 34
                              if stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not Mask(256, -1, stor5[_param1].field_0):
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length > 255:
                              else:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_1:
                                      if _param2.length < 1:
                                          revert with 671984822
                                  else:
                                      if 31 >= stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                          if _param2.length <= 255:
                      else:
                          if 0 < block.timestamp:
                              if not stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if Mask(256, -1, stor5[_param1].field_0):
                                  else:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if stor5[_param1].field_1:
                              else:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if stor5[_param1].field_1:
                                  else:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                          else:
                              if not stor5[_param1].field_0:
                                  if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                      revert with 0, 34
                                  if stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                  else:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                              else:
                                  if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                      revert with 0, 34
                                  if not stor5[_param1].field_0:
                                      if not stor5[_param1].field_0 - (stor5[_param1].field_1 < 32):
                                          revert with 0, 34
                                      if not stor5[_param1].field_1:
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= stor5[_param1].field_1:
                                  else:
                                      if not stor5[_param1].field_0 - (uint255(stor5[_param1].field_0) * 0.5 < 32):
                                          revert with 0, 34
                                      if not Mask(256, -1, stor5[_param1].field_0):
                                          if _param2.length < 1:
                                              revert with 671984822
                                      else:
                                          if 31 >= uint255(stor5[_param1].field_0) * 0.5:
                                              if _param2.length < 1:
                                                  revert with 671984822
  ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)

def unknowneb8ae530(array _param1, uint256 _param2, uint256 _param3) payable: 
  require calldata.size - 4 >=′ 96
  require _param1 <= 18446744073709551615
  require _param1 + 35 <′ calldata.size
  require _param1.length <= 18446744073709551615
  require _param1 + _param1.length + 36 <= calldata.size
  require _param2 == addr(_param2)
  require _param3 == addr(_param3)
  mem[96] = _param1.length
  mem[128 len _param1.length] = _param1[all]
  mem[_param1.length + 128] = 0
  if 0 >= _param1.length:
      revert with 0, 'readLabel: Index out of bounds'
  if 0 >= _param1.length:
      revert with 0, 50
  _5 = mem[128]
  if Mask(256, -248, mem[128]):
      if 1 > (uint8(mem[128]) >> 248) + 1:
          revert with 0, 17
      require (uint8(mem[128]) >> 248) + 1 <= _param1.length
      _9 = sha3(mem[129 len uint8(mem[128]) >> 248])
      if 0 > uint8(mem[128]) >> 248:
          revert with 0, 17
      if 1 > (uint8(mem[128]) >> 248) + 1:
          revert with 0, 17
      mem[64] = (2 * ceil32(_param1.length)) + 160
      mem[ceil32(_param1.length) + 128] = _param1.length
      mem[ceil32(_param1.length) + 160 len _param1.length] = _param1[all]
      mem[ceil32(_param1.length) + _param1.length + 160] = 0
      if (uint8(_5) >> 248) + 1 >= _param1.length:
          revert with 0, 'readLabel: Index out of bounds'
      if (uint8(_5) >> 248) + 1 >= _param1.length:
          revert with 0, 50
      if Mask(256, -248, mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]):
          if 1 > (uint8(_5) >> 248) + 2:
              revert with 0, 17
          if 0 > uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248:
              revert with 0, 17
          require (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 2 <= _param1.length
          if 0 > uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248:
              revert with 0, 17
          if 1 > (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 2:
              revert with 0, 17
          if sha3(mem[ceil32(_param1.length) + (uint8(_5) >> 248) + 162 len uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248]):
              if (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 2 >= _param1.length:
                  revert with 0, 'readLabel: Index out of bounds'
              if (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 2 >= _param1.length:
                  revert with 0, 50
              if Mask(256, -248, mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]):
                  if 1 > (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 3:
                      revert with 0, 17
                  if 0 > uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248:
                      revert with 0, 17
                  require (uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 3 <= _param1.length
                  if 0 > uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248:
                      revert with 0, 17
                  if 1 > (uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 3:
                      revert with 0, 17
                  if sha3(mem[ceil32(_param1.length) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 163 len uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248]):
                      if (uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 3 >= _param1.length:
                          revert with 0, 'readLabel: Index out of bounds'
                      if (uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 3 >= _param1.length:
                          revert with 0, 50
                      if not Mask(256, -248, mem[(uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 163]):
                          if 0 > uint8(mem[(uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 163]) >> 248:
                              revert with 0, 17
                      else:
                          if 1 > (uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 4:
                              revert with 0, 17
                  else:
                      if _param1.length - 1 > _param1.length:
                          revert with 0, 17
                      if (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 2 != _param1.length - 1:
                          revert with 0, 'namehash: Junk at end of name'
                      if _param1.length > 18446744073709551615:
                          revert with 0, 65
                      if stor5[('map', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32)))))))][_9].field_0:
              else:
                  if 0 > uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248:
                      revert with 0, 17
                  if 1 > (uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 3:
                      revert with 0, 17
                  if _param1.length - 1 > _param1.length:
                      revert with 0, 17
                  if (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 2 != _param1.length - 1:
                      revert with 0, 'namehash: Junk at end of name'
                  if _param1.length > 18446744073709551615:
                      revert with 0, 65
                  if not stor5[('map', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32)))))))][_9].field_0:
                      if not stor5[('map', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32)))))))][_9].field_0 - (stor5[('map', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32)))))))][_9].field_1 < 32):
                          revert with 0, 34
                      if stor5[('map', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32)))))))][_9].field_1 <= 31:
                          if _param1.length > 31 != 1:
                              if not _param1.length:
                                  stor5[('map', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32)))))))][_9].field_0 = 2 * _param1.length
                              else:
                                  stor5[('map', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32)))))))][_9].field_0 = _param1.length
                  else:
                      if not stor5[('map', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32)))))))][_9].field_0 - (uint255(stor5[('map', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32)))))))][_9].field_0) * 0.5 < 32):
                          revert with 0, 34
                      if uint255(stor5[('map', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32)))))))][_9].field_0) * 0.5 <= 31:
                          if _param1.length > 31 != 1:
                              if _param1.length:
                                  stor5[('map', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32)))))))][_9].field_0 = _param1.length
                              else:
                                  stor5[('map', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32)))))))][_9].field_0 = 2 * _param1.length
          else:
              if _param1.length - 1 > _param1.length:
                  revert with 0, 17
              if (uint8(_5) >> 248) + 1 != _param1.length - 1:
                  revert with 0, 'namehash: Junk at end of name'
              if _param1.length > 18446744073709551615:
                  revert with 0, 65
              if not stor5[0][_9].field_0:
                  if not stor5[0][_9].field_0 - (stor5[0][_9].field_1 < 32):
                      revert with 0, 34
                  if stor5[0][_9].field_1 <= 31:
                      if _param1.length > 31 != 1:
                          if _param1.length:
                              stor5[0][_9].field_0 = _param1.length
                              static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                                      gas gas_remaining wei
                                     args sha3(0, _9)
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >=′ 32
                              require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                              if caller == ext_call.return_data[12 len 20]:
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  if not addr(_param3):
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0, _9), this.address
                                  else:
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0, _9), addr(_param3)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                              else:
                                  static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.isApprovedForAll(address owner, address operator) with:
                                          gas gas_remaining wei
                                         args addr(ext_call.return_data[0]), caller
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  require return_data.size >=′ 32
                          else:
                              stor5[0][_9].field_0 = 2 * _param1.length
                              static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                                      gas gas_remaining wei
                                     args sha3(0, _9)
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >=′ 32
                              require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                              if ext_call.return_data[12 len 20] != caller:
                                  static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.isApprovedForAll(address owner, address operator) with:
                                          gas gas_remaining wei
                                         args addr(ext_call.return_data[0]), caller
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  require return_data.size >=′ 32
                                  require ext_call.return_data[0] == bool(ext_call.return_data[0])
                              else:
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  if not addr(_param3):
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0, _9), this.address
                                  else:
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0, _9), addr(_param3)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
              else:
                  if not stor5[0][_9].field_0 - (uint255(stor5[0][_9].field_0) * 0.5 < 32):
                      revert with 0, 34
                  if uint255(stor5[0][_9].field_0) * 0.5 <= 31:
                      if _param1.length > 31 != 1:
                          if _param1.length:
                              stor5[0][_9].field_0 = _param1.length
                              static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                                      gas gas_remaining wei
                                     args sha3(0, _9)
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >=′ 32
                              require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                              if ext_call.return_data[12 len 20] != caller:
                                  static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.isApprovedForAll(address owner, address operator) with:
                                          gas gas_remaining wei
                                         args addr(ext_call.return_data[0]), caller
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  require return_data.size >=′ 32
                                  require ext_call.return_data[0] == bool(ext_call.return_data[0])
                              else:
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  if not addr(_param3):
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0, _9), this.address
                                  else:
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0, _9), addr(_param3)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                          else:
                              stor5[0][_9].field_0 = 2 * _param1.length
                              static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                                      gas gas_remaining wei
                                     args sha3(0, _9)
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >=′ 32
                              require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                              if ext_call.return_data[12 len 20] != caller:
                                  static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.isApprovedForAll(address owner, address operator) with:
                                          gas gas_remaining wei
                                         args addr(ext_call.return_data[0]), caller
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  require return_data.size >=′ 32
                                  require ext_call.return_data[0] == bool(ext_call.return_data[0])
                              else:
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  if not addr(_param3):
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0, _9), this.address
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                  else:
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0, _9), addr(_param3)
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                      require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0, _9), this.address
      else:
          if 0 > uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248:
              revert with 0, 17
          if 1 > (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 2:
              revert with 0, 17
          if _param1.length - 1 > _param1.length:
              revert with 0, 17
          if (uint8(_5) >> 248) + 1 != _param1.length - 1:
              revert with 0, 'namehash: Junk at end of name'
          if _param1.length > 18446744073709551615:
              revert with 0, 65
          if stor5[0][_9].field_0:
              if not stor5[0][_9].field_0 - (uint255(stor5[0][_9].field_0) * 0.5 < 32):
                  revert with 0, 34
              if uint255(stor5[0][_9].field_0) * 0.5 <= 31:
                  if _param1.length > 31 != 1:
                      if not _param1.length:
                          stor5[0][_9].field_0 = 2 * _param1.length
                          static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                                  gas gas_remaining wei
                                 args sha3(0, _9)
                          if not ext_call.success:
                              revert with ext_call.return_data[0 len return_data.size]
                          require return_data.size >=′ 32
                          require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                          if caller == ext_call.return_data[12 len 20]:
                              require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                              if not addr(_param3):
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0, _9), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  if unknowned70554d[0][_9].field_0:
                                      if 0 >= block.timestamp:
                                          unknowned70554d[0][_9].field_0 = 0
                              else:
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0, _9), addr(_param3)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0, _9), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                          else:
                              static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.isApprovedForAll(address owner, address operator) with:
                                      gas gas_remaining wei
                                     args addr(ext_call.return_data[0]), caller
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >=′ 32
                              require ext_call.return_data[0] == bool(ext_call.return_data[0])
                              if not ext_call.return_data[0]:
                                  revert with 0, sha3(0, _9), caller
                              require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                              if addr(_param3):
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0, _9), addr(_param3)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                              call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                   gas gas_remaining wei
                                  args sha3(0, _9), this.address
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                      else:
                          stor5[0][_9].field_0 = _param1.length
                          static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                                  gas gas_remaining wei
                                 args sha3(0, _9)
                          if not ext_call.success:
                              revert with ext_call.return_data[0 len return_data.size]
                          require return_data.size >=′ 32
                          require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                          if caller == ext_call.return_data[12 len 20]:
                              require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                              if addr(_param3):
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0, _9), addr(_param3)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                              call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                   gas gas_remaining wei
                                  args sha3(0, _9), this.address
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                          else:
                              static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.isApprovedForAll(address owner, address operator) with:
                                      gas gas_remaining wei
                                     args addr(ext_call.return_data[0]), caller
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >=′ 32
                              require ext_call.return_data[0] == bool(ext_call.return_data[0])
                              if not ext_call.return_data[0]:
                                  revert with 0, sha3(0, _9), caller
                              require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                              if not addr(_param3):
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0, _9), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                              else:
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0, _9), addr(_param3)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0, _9), this.address
          else:
              if not stor5[0][_9].field_0 - (stor5[0][_9].field_1 < 32):
                  revert with 0, 34
              if stor5[0][_9].field_1 <= 31:
                  if _param1.length > 31 != 1:
                      if _param1.length:
                          stor5[0][_9].field_0 = _param1.length
                          static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                                  gas gas_remaining wei
                                 args sha3(0, _9)
                          if not ext_call.success:
                              revert with ext_call.return_data[0 len return_data.size]
                          require return_data.size >=′ 32
                          require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                          if caller == ext_call.return_data[12 len 20]:
                              require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                              if not addr(_param3):
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0, _9), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  if unknowned70554d[0][_9].field_0:
                              else:
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0, _9), addr(_param3)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0, _9), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                          else:
                              static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.isApprovedForAll(address owner, address operator) with:
                                      gas gas_remaining wei
                                     args addr(ext_call.return_data[0]), caller
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >=′ 32
                              require ext_call.return_data[0] == bool(ext_call.return_data[0])
                              if not ext_call.return_data[0]:
                                  revert with 0, sha3(0, _9), caller
                              require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                              if not addr(_param3):
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0, _9), this.address
                              else:
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0, _9), addr(_param3)
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                      else:
                          stor5[0][_9].field_0 = 2 * _param1.length
                          static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                                  gas gas_remaining wei
                                 args sha3(0, _9)
                          if not ext_call.success:
                              revert with ext_call.return_data[0 len return_data.size]
                          require return_data.size >=′ 32
                          require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                          if caller == ext_call.return_data[12 len 20]:
                              require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                              if addr(_param3):
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0, _9), addr(_param3)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                              call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                   gas gas_remaining wei
                                  args sha3(0, _9), this.address
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                          else:
                              static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.isApprovedForAll(address owner, address operator) with:
                                      gas gas_remaining wei
                                     args addr(ext_call.return_data[0]), caller
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >=′ 32
                              require ext_call.return_data[0] == bool(ext_call.return_data[0])
                              if not ext_call.return_data[0]:
                                  revert with 0, sha3(0, _9), caller
                              require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                              if not addr(_param3):
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0, _9), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                              else:
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0, _9), addr(_param3)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0, _9), this.address
  else:
      if 0 > uint8(mem[128]) >> 248:
          revert with 0, 17
      if 1 > (uint8(mem[128]) >> 248) + 1:
          revert with 0, 17
      mem[64] = (2 * ceil32(_param1.length)) + 160
      mem[ceil32(_param1.length) + 128] = _param1.length
      mem[ceil32(_param1.length) + 160 len _param1.length] = _param1[all]
      mem[ceil32(_param1.length) + _param1.length + 160] = 0
      if (uint8(_5) >> 248) + 1 >= _param1.length:
          revert with 0, 'readLabel: Index out of bounds'
      if (uint8(_5) >> 248) + 1 >= _param1.length:
          revert with 0, 50
      if Mask(256, -248, mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]):
          if 1 > (uint8(_5) >> 248) + 2:
              revert with 0, 17
          if 0 > uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248:
              revert with 0, 17
          require (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 2 <= _param1.length
          if 0 > uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248:
              revert with 0, 17
          if 1 > (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 2:
              revert with 0, 17
          if sha3(mem[ceil32(_param1.length) + (uint8(_5) >> 248) + 162 len uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248]):
              if (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 2 >= _param1.length:
                  revert with 0, 'readLabel: Index out of bounds'
              if (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 2 >= _param1.length:
                  revert with 0, 50
              if Mask(256, -248, mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]):
                  if 1 > (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 3:
                      revert with 0, 17
                  if 0 > uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248:
                      revert with 0, 17
                  require (uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 3 <= _param1.length
                  if 0 > uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248:
                      revert with 0, 17
                  if 1 > (uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 3:
                      revert with 0, 17
                  if sha3(mem[ceil32(_param1.length) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 163 len uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248]):
                      if (uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 3 >= _param1.length:
                          revert with 0, 'readLabel: Index out of bounds'
                      if (uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 3 >= _param1.length:
                          revert with 0, 50
                      if not Mask(256, -248, mem[(uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 163]):
                          if 0 > uint8(mem[(uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 163]) >> 248:
                              revert with 0, 17
                          if 1 > (uint8(mem[(uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 163]) >> 248) + (uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 4:
                              revert with 0, 17
                          if _param1.length - 1 > _param1.length:
                              revert with 0, 17
                          if (uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 3 != _param1.length - 1:
                              revert with 0, 'namehash: Junk at end of name'
                      else:
                          if 1 > (uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 4:
                              revert with 0, 17
                          if 0 > uint8(mem[(uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 163]) >> 248:
                              revert with 0, 17
                          require (uint8(mem[(uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 163]) >> 248) + (uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 4 <= _param1.length
                          if 0 > uint8(mem[(uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 163]) >> 248:
                              revert with 0, 17
                  else:
                      if _param1.length - 1 > _param1.length:
                          revert with 0, 17
                      if (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 2 != _param1.length - 1:
                          revert with 0, 'namehash: Junk at end of name'
                      if _param1.length > 18446744073709551615:
                          revert with 0, 65
                      if not stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_0:
                          if not stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_0 - (stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_1 < 32):
                              revert with 0, 34
                          if stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_1 <= 31:
                              if _param1.length > 31 != 1:
                                  if not _param1.length:
                                      stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_0 = 2 * _param1.length
                                  else:
                                      stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_0 = _param1.length
                      else:
                          if not stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_0 - (uint255(stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_0) * 0.5 < 32):
                              revert with 0, 34
                          if uint255(stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_0) * 0.5 <= 31:
                              if _param1.length > 31 != 1:
                                  if _param1.length:
                                      stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_0 = _param1.length
                                  else:
                                      stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_0 = 2 * _param1.length
              else:
                  if 0 > uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248:
                      revert with 0, 17
                  if 1 > (uint8(mem[(uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + ceil32(_param1.length) + 162]) >> 248) + (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 3:
                      revert with 0, 17
                  if _param1.length - 1 > _param1.length:
                      revert with 0, 17
                  if (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 2 != _param1.length - 1:
                      revert with 0, 'namehash: Junk at end of name'
                  if _param1.length > 18446744073709551615:
                      revert with 0, 65
                  if not stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_0:
                      if not stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_0 - (stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_1 < 32):
                          revert with 0, 34
                      if stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_1 <= 31:
                          if _param1.length > 31 != 1:
                              if _param1.length:
                                  stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_0 = _param1.length
                              else:
                                  stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_0 = 2 * _param1.length
                              if not sha3(0, sha3(mem[ceil32(_param1.length) + (uint8(_5) >> 248) + 162 len uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248])) + 0x1b29c373c8114ecf835779726a19cdbba0f0496500b9d69f3b0faf0b9be49013:
                                  revert with 1633306371
                              static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                                      gas gas_remaining wei
                                     args sha3(sha3(0, sha3(mem[ceil32(_param1.length) + (uint8(_5) >> 248) + 162 len uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248])), 0)
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >=′ 32
                              require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                  else:
                      if not stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_0 - (uint255(stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_0) * 0.5 < 32):
                          revert with 0, 34
                      if uint255(stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_0) * 0.5 <= 31:
                          if _param1.length > 31 != 1:
                              if _param1.length:
                                  stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_0 = _param1.length
                                  if not sha3(0, sha3(mem[ceil32(_param1.length) + (uint8(_5) >> 248) + 162 len uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248])) + 0x1b29c373c8114ecf835779726a19cdbba0f0496500b9d69f3b0faf0b9be49013:
                                      revert with 1633306371
                                  static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                                          gas gas_remaining wei
                                         args sha3(sha3(0, sha3(mem[ceil32(_param1.length) + (uint8(_5) >> 248) + 162 len uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248])), 0)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  require return_data.size >=′ 32
                                  require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                              else:
                                  stor5[('map', ('data', 0, ('sha3', ('mem', ('range', ('add', 162, ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1'))))), ('mask_shl', 256, -248, -248, ('var', '_5'))), ('mask_shl', 256, -248, -248, ('mem', ('range', ('add', 161, ('mask_shl', 256, -248, -248, ('var', '_5')), ('mask_shl', 251, 5, 0, ('add', 31, ('cd', ('add', 4, ('param', '_param1')))))), 32))))))), ('name', 'stor0', 0))].field_0 = 2 * _param1.length
                                  if not sha3(0, sha3(mem[ceil32(_param1.length) + (uint8(_5) >> 248) + 162 len uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248])) + 0x1b29c373c8114ecf835779726a19cdbba0f0496500b9d69f3b0faf0b9be49013:
                                      revert with 1633306371
                                  static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                                          gas gas_remaining wei
                                         args sha3(sha3(0, sha3(mem[ceil32(_param1.length) + (uint8(_5) >> 248) + 162 len uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248])), 0)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  require return_data.size >=′ 32
                                  require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                                  if ext_call.return_data[12 len 20] != caller:
                                      static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.isApprovedForAll(address owner, address operator) with:
                                              gas gas_remaining wei
                                             args addr(ext_call.return_data[0]), caller
          else:
              if _param1.length - 1 > _param1.length:
                  revert with 0, 17
              if (uint8(_5) >> 248) + 1 != _param1.length - 1:
                  revert with 0, 'namehash: Junk at end of name'
              if _param1.length > 18446744073709551615:
                  revert with 0, 65
              if stor5[('name', 'stor0', 0)].field_0:
                  if not stor5[('name', 'stor0', 0)].field_0 - (uint255(stor5[('name', 'stor0', 0)].field_0) * 0.5 < 32):
                      revert with 0, 34
                  if uint255(stor5[('name', 'stor0', 0)].field_0) * 0.5 <= 31:
                      if _param1.length > 31 != 1:
                          if not _param1.length:
                              stor5[('name', 'stor0', 0)].field_0 = 2 * _param1.length
                              static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                                      gas gas_remaining wei
                                     args sha3(0)
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >=′ 32
                              require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                              if caller == ext_call.return_data[12 len 20]:
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  if not addr(_param3):
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0), this.address
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                      if stor1[('name', 'stor0', 0)].field_0:
                                          if 0 >= block.timestamp:
                                              stor1[('name', 'stor0', 0)].field_0 = 0
                                  else:
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0), addr(_param3)
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                      require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0), this.address
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                              else:
                                  static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.isApprovedForAll(address owner, address operator) with:
                                          gas gas_remaining wei
                                         args addr(ext_call.return_data[0]), caller
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  require return_data.size >=′ 32
                                  require ext_call.return_data[0] == bool(ext_call.return_data[0])
                                  if not ext_call.return_data[0]:
                                      revert with 0, sha3(0), caller
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  if addr(_param3):
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0), addr(_param3)
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                          else:
                              stor5[('name', 'stor0', 0)].field_0 = _param1.length
                              static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                                      gas gas_remaining wei
                                     args sha3(0)
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >=′ 32
                              require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                              if caller == ext_call.return_data[12 len 20]:
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  if addr(_param3):
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0), addr(_param3)
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                              else:
                                  static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.isApprovedForAll(address owner, address operator) with:
                                          gas gas_remaining wei
                                         args addr(ext_call.return_data[0]), caller
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  require return_data.size >=′ 32
                                  require ext_call.return_data[0] == bool(ext_call.return_data[0])
                                  if not ext_call.return_data[0]:
                                      revert with 0, sha3(0), caller
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  if not addr(_param3):
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0), this.address
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                  else:
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0), addr(_param3)
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                      require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0), this.address
              else:
                  if not stor5[('name', 'stor0', 0)].field_0 - (stor5[('name', 'stor0', 0)].field_1 < 32):
                      revert with 0, 34
                  if stor5[('name', 'stor0', 0)].field_1 <= 31:
                      if _param1.length > 31 != 1:
                          if _param1.length:
                              stor5[('name', 'stor0', 0)].field_0 = _param1.length
                              static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                                      gas gas_remaining wei
                                     args sha3(0)
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >=′ 32
                              require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                              if caller == ext_call.return_data[12 len 20]:
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  if not addr(_param3):
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0), this.address
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                      if stor1[('name', 'stor0', 0)].field_0:
                                  else:
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0), addr(_param3)
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                      require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0), this.address
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                              else:
                                  static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.isApprovedForAll(address owner, address operator) with:
                                          gas gas_remaining wei
                                         args addr(ext_call.return_data[0]), caller
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  require return_data.size >=′ 32
                                  require ext_call.return_data[0] == bool(ext_call.return_data[0])
                                  if not ext_call.return_data[0]:
                                      revert with 0, sha3(0), caller
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  if not addr(_param3):
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0), this.address
                                  else:
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0), addr(_param3)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                          else:
                              stor5[('name', 'stor0', 0)].field_0 = 2 * _param1.length
                              static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                                      gas gas_remaining wei
                                     args sha3(0)
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >=′ 32
                              require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                              if caller == ext_call.return_data[12 len 20]:
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  if addr(_param3):
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0), addr(_param3)
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                              else:
                                  static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.isApprovedForAll(address owner, address operator) with:
                                          gas gas_remaining wei
                                         args addr(ext_call.return_data[0]), caller
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  require return_data.size >=′ 32
                                  require ext_call.return_data[0] == bool(ext_call.return_data[0])
                                  if not ext_call.return_data[0]:
                                      revert with 0, sha3(0), caller
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  if not addr(_param3):
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0), this.address
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                  else:
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0), addr(_param3)
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                      require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                      call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                           gas gas_remaining wei
                                          args sha3(0), this.address
      else:
          if 0 > uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248:
              revert with 0, 17
          if 1 > (uint8(mem[(uint8(_5) >> 248) + ceil32(_param1.length) + 161]) >> 248) + (uint8(_5) >> 248) + 2:
              revert with 0, 17
          if _param1.length - 1 > _param1.length:
              revert with 0, 17
          if (uint8(_5) >> 248) + 1 != _param1.length - 1:
              revert with 0, 'namehash: Junk at end of name'
          if _param1.length > 18446744073709551615:
              revert with 0, 65
          if not stor5[('name', 'stor0', 0)].field_0:
              if not stor5[('name', 'stor0', 0)].field_0 - (stor5[('name', 'stor0', 0)].field_1 < 32):
                  revert with 0, 34
              if stor5[('name', 'stor0', 0)].field_1 <= 31:
                  if _param1.length > 31 != 1:
                      if _param1.length:
                          stor5[('name', 'stor0', 0)].field_0 = _param1.length
                          static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                                  gas gas_remaining wei
                                 args sha3(0)
                          if not ext_call.success:
                              revert with ext_call.return_data[0 len return_data.size]
                          require return_data.size >=′ 32
                          require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                          if ext_call.return_data[12 len 20] != caller:
                              static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.isApprovedForAll(address owner, address operator) with:
                                      gas gas_remaining wei
                                     args addr(ext_call.return_data[0]), caller
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >=′ 32
                              require ext_call.return_data[0] == bool(ext_call.return_data[0])
                              if not ext_call.return_data[0]:
                                  revert with 0, sha3(0), caller
                              require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                              if addr(_param3):
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), addr(_param3)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                              call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                   gas gas_remaining wei
                                  args sha3(0), this.address
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                          else:
                              if not addr(_param3):
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = this.address
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len _param1.length] = _param1[all]
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + _param1.length + 288] = 0
                                  if stor1[('name', 'stor0', 0)].field_0:
                                      stor1[('name', 'stor0', 0)].field_0 = 0
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = sha3(0)
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 320] = 1
                                      log 0xc3d58168: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 64], caller, stor1[('name', 'stor0', 0)].field_0, 0
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0
                                      log 0xee2ba119: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 32], sha3(0)
                                  else:
                                      if 0 < block.timestamp:
                                          if 0 < block.timestamp:
                                              if not stor1[('name', 'stor0', 0)].field_0:
                                      else:
                                          if 0 >= block.timestamp:
                                              if not stor1[('name', 'stor0', 0)].field_0:
                                                  if addr(_param2):
                                                  ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = 32
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 324] = 31
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 356] = 'ERC1155: mint of existing token'
                                              revert with memory
                                                from (4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288
                                                 len (5 * ceil32(_param1.length)) + 100
                                          if stor1[('name', 'stor0', 0)].field_0:
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = 32
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 324] = 31
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 356] = 'ERC1155: mint of existing token'
                                              revert with memory
                                                from (4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288
                                                 len (5 * ceil32(_param1.length)) + 100
                                          if not addr(_param2):
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = 32
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 324] = 33
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 356] = 'ERC1155: mint to the zero addres'
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 388] = 's'
                                              revert with memory
                                                from (4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288
                                                 len (5 * ceil32(_param1.length)) + 132
                                          if addr(_param2) - this.address:
                                              stor1[('name', 'stor0', 0)].field_0 = addr(_param2)
                                              stor1[('name', 'stor0', 0)].field_160 = 0
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = sha3(0)
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 320] = 1
                                              log 0xc3d58168: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 64], caller, 0, addr(_param2)
                              else:
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), addr(_param3)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = this.address
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len _param1.length] = _param1[all]
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + _param1.length + 288] = 0
                                  if not stor1[('name', 'stor0', 0)].field_0:
                                      if 0 >= block.timestamp:
                                          if 0 < block.timestamp:
                                  else:
                                      stor1[('name', 'stor0', 0)].field_0 = 0
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = sha3(0)
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 320] = 1
                                      log 0xc3d58168: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 64], caller, stor1[('name', 'stor0', 0)].field_0, 0
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0
                                      log 0xee2ba119: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 32], sha3(0)
                      else:
                          stor5[('name', 'stor0', 0)].field_0 = 2 * _param1.length
                          static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                                  gas gas_remaining wei
                                 args sha3(0)
                          if not ext_call.success:
                              revert with ext_call.return_data[0 len return_data.size]
                          require return_data.size >=′ 32
                          require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                          if ext_call.return_data[12 len 20] != caller:
                              static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.isApprovedForAll(address owner, address operator) with:
                                      gas gas_remaining wei
                                     args addr(ext_call.return_data[0]), caller
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >=′ 32
                              require ext_call.return_data[0] == bool(ext_call.return_data[0])
                              if not ext_call.return_data[0]:
                                  revert with 0, sha3(0), caller
                              require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                              if not addr(_param3):
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  if stor1[('name', 'stor0', 0)].field_0:
                                      if 0 >= block.timestamp:
                                          stor1[('name', 'stor0', 0)].field_0 = 0
                              else:
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), addr(_param3)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                          else:
                              if addr(_param3):
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), addr(_param3)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = this.address
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len _param1.length] = _param1[all]
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + _param1.length + 288] = 0
                                  if not stor1[('name', 'stor0', 0)].field_0:
                                      if 0 >= block.timestamp:
                                          if 0 < block.timestamp:
                                              if not stor1[('name', 'stor0', 0)].field_0:
                                  else:
                                      stor1[('name', 'stor0', 0)].field_0 = 0
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = sha3(0)
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 320] = 1
                                      log 0xc3d58168: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 64], caller, stor1[('name', 'stor0', 0)].field_0, 0
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0
                                      log 0xee2ba119: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 32], sha3(0)
                              else:
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = this.address
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len _param1.length] = _param1[all]
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + _param1.length + 288] = 0
                                  if stor1[('name', 'stor0', 0)].field_0:
                                      stor1[('name', 'stor0', 0)].field_0 = 0
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = sha3(0)
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 320] = 1
                                      log 0xc3d58168: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 64], caller, stor1[('name', 'stor0', 0)].field_0, 0
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0
                                      log 0xee2ba119: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 32], sha3(0)
                                      if 0 >= block.timestamp:
                                      else:
                                  else:
                                      if 0 < block.timestamp:
                                          if 0 >= block.timestamp:
                                              if not stor1[('name', 'stor0', 0)].field_0:
                                              ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)
                                          if not stor1[('name', 'stor0', 0)].field_0:
                                              if addr(_param2):
                                              ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = 32
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 324] = 31
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 356] = 'ERC1155: mint of existing token'
                                          revert with memory
                                            from (4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288
                                             len (5 * ceil32(_param1.length)) + 100
                                      if stor1[('name', 'stor0', 0)].field_0:
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = 32
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 324] = 31
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 356] = 'ERC1155: mint of existing token'
                                          revert with memory
                                            from (4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288
                                             len (5 * ceil32(_param1.length)) + 100
                                      if not addr(_param2):
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = 32
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 324] = 33
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 356] = 'ERC1155: mint to the zero addres'
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 388] = 's'
                                          revert with memory
                                            from (4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288
                                             len (5 * ceil32(_param1.length)) + 132
                                      if 0 >= block.timestamp:
                                          if addr(_param2) - this.address:
                                              stor1[('name', 'stor0', 0)].field_0 = addr(_param2)
                                              stor1[('name', 'stor0', 0)].field_160 = 0
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = sha3(0)
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 320] = 1
                                              log 0xc3d58168: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 64], caller, 0, addr(_param2)
                                      else:
                                          if not addr(_param2) - this.address:
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = 32
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 324] = 52
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 356] = 'ERC1155: newOwner cannot be the '
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 388] = 'NameWrapper contract'
                                              revert with memory
                                                from (4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288
                                                 len (5 * ceil32(_param1.length)) + 132
                                          stor1[('name', 'stor0', 0)].field_0 = addr(_param2)
                                          stor1[('name', 'stor0', 0)].field_160 = 0
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = sha3(0)
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 320] = 1
                                          log 0xc3d58168: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 64], caller, 0, addr(_param2)
          else:
              if not stor5[('name', 'stor0', 0)].field_0 - (uint255(stor5[('name', 'stor0', 0)].field_0) * 0.5 < 32):
                  revert with 0, 34
              if uint255(stor5[('name', 'stor0', 0)].field_0) * 0.5 <= 31:
                  if _param1.length > 31 != 1:
                      if _param1.length:
                          stor5[('name', 'stor0', 0)].field_0 = _param1.length
                          static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                                  gas gas_remaining wei
                                 args sha3(0)
                          if not ext_call.success:
                              revert with ext_call.return_data[0 len return_data.size]
                          require return_data.size >=′ 32
                          require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                          if ext_call.return_data[12 len 20] != caller:
                              static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.isApprovedForAll(address owner, address operator) with:
                                      gas gas_remaining wei
                                     args addr(ext_call.return_data[0]), caller
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >=′ 32
                              require ext_call.return_data[0] == bool(ext_call.return_data[0])
                              if not ext_call.return_data[0]:
                                  revert with 0, sha3(0), caller
                              require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                              if not addr(_param3):
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  if stor1[('name', 'stor0', 0)].field_0:
                                      if 0 >= block.timestamp:
                                          stor1[('name', 'stor0', 0)].field_0 = 0
                              else:
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), addr(_param3)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                          else:
                              if addr(_param3):
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), addr(_param3)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = this.address
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len _param1.length] = _param1[all]
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + _param1.length + 288] = 0
                                  if not stor1[('name', 'stor0', 0)].field_0:
                                      if 0 >= block.timestamp:
                                          if 0 < block.timestamp:
                                              if not stor1[('name', 'stor0', 0)].field_0:
                                  else:
                                      stor1[('name', 'stor0', 0)].field_0 = 0
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = sha3(0)
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 320] = 1
                                      log 0xc3d58168: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 64], caller, stor1[('name', 'stor0', 0)].field_0, 0
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0
                                      log 0xee2ba119: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 32], sha3(0)
                              else:
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = this.address
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len _param1.length] = _param1[all]
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + _param1.length + 288] = 0
                                  if stor1[('name', 'stor0', 0)].field_0:
                                      stor1[('name', 'stor0', 0)].field_0 = 0
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = sha3(0)
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 320] = 1
                                      log 0xc3d58168: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 64], caller, stor1[('name', 'stor0', 0)].field_0, 0
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0
                                      log 0xee2ba119: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 32], sha3(0)
                                      if 0 >= block.timestamp:
                                      else:
                                  else:
                                      if 0 < block.timestamp:
                                          if 0 >= block.timestamp:
                                              if not stor1[('name', 'stor0', 0)].field_0:
                                              ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)
                                          if not stor1[('name', 'stor0', 0)].field_0:
                                              if addr(_param2):
                                              ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = 32
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 324] = 31
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 356] = 'ERC1155: mint of existing token'
                                          revert with memory
                                            from (4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288
                                             len (5 * ceil32(_param1.length)) + 100
                                      if stor1[('name', 'stor0', 0)].field_0:
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = 32
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 324] = 31
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 356] = 'ERC1155: mint of existing token'
                                          revert with memory
                                            from (4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288
                                             len (5 * ceil32(_param1.length)) + 100
                                      if not addr(_param2):
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = 32
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 324] = 33
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 356] = 'ERC1155: mint to the zero addres'
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 388] = 's'
                                          revert with memory
                                            from (4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288
                                             len (5 * ceil32(_param1.length)) + 132
                                      if 0 >= block.timestamp:
                                          if addr(_param2) - this.address:
                                              stor1[('name', 'stor0', 0)].field_0 = addr(_param2)
                                              stor1[('name', 'stor0', 0)].field_160 = 0
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = sha3(0)
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 320] = 1
                                              log 0xc3d58168: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 64], caller, 0, addr(_param2)
                                      else:
                                          if not addr(_param2) - this.address:
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = 32
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 324] = 52
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 356] = 'ERC1155: newOwner cannot be the '
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 388] = 'NameWrapper contract'
                                              revert with memory
                                                from (4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288
                                                 len (5 * ceil32(_param1.length)) + 132
                                          stor1[('name', 'stor0', 0)].field_0 = addr(_param2)
                                          stor1[('name', 'stor0', 0)].field_160 = 0
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = sha3(0)
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 320] = 1
                                          log 0xc3d58168: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 64], caller, 0, addr(_param2)
                      else:
                          stor5[('name', 'stor0', 0)].field_0 = 2 * _param1.length
                          static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.owner(bytes32 symbol) with:
                                  gas gas_remaining wei
                                 args sha3(0)
                          if not ext_call.success:
                              revert with ext_call.return_data[0 len return_data.size]
                          require return_data.size >=′ 32
                          require ext_call.return_data[0] == ext_call.return_data[12 len 20]
                          if caller == ext_call.return_data[12 len 20]:
                              if addr(_param3):
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), addr(_param3)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = this.address
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len _param1.length] = _param1[all]
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + _param1.length + 288] = 0
                                  if not stor1[('name', 'stor0', 0)].field_0:
                                      if 0 < block.timestamp:
                                          if 0 < block.timestamp:
                                          ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)
                                      if 0 >= block.timestamp:
                                          if not stor1[('name', 'stor0', 0)].field_0:
                                          ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)
                                      if not stor1[('name', 'stor0', 0)].field_0:
                                          if addr(_param2):
                                          ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = 32
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 324] = 31
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 356] = 'ERC1155: mint of existing token'
                                      revert with memory
                                        from (4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288
                                         len (5 * ceil32(_param1.length)) + 100
                                  stor1[('name', 'stor0', 0)].field_0 = 0
                                  mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = sha3(0)
                                  mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 320] = 1
                                  log 0xc3d58168: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 64], caller, stor1[('name', 'stor0', 0)].field_0, 0
                                  mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0
                                  log 0xee2ba119: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 32], sha3(0)
                              else:
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = this.address
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len _param1.length] = _param1[all]
                                  mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + _param1.length + 288] = 0
                                  if stor1[('name', 'stor0', 0)].field_0:
                                      stor1[('name', 'stor0', 0)].field_0 = 0
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = sha3(0)
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 320] = 1
                                      log 0xc3d58168: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 64], caller, stor1[('name', 'stor0', 0)].field_0, 0
                                      mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0
                                      log 0xee2ba119: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 32], sha3(0)
                                      if 0 >= block.timestamp:
                                      else:
                                  else:
                                      if 0 < block.timestamp:
                                          if 0 >= block.timestamp:
                                              if not stor1[('name', 'stor0', 0)].field_0:
                                                  if addr(_param2):
                                                  ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = 32
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 324] = 31
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 356] = 'ERC1155: mint of existing token'
                                              revert with memory
                                                from (4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288
                                                 len (5 * ceil32(_param1.length)) + 100
                                          if stor1[('name', 'stor0', 0)].field_0:
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = 32
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 324] = 31
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 356] = 'ERC1155: mint of existing token'
                                              revert with memory
                                                from (4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288
                                                 len (5 * ceil32(_param1.length)) + 100
                                          if not addr(_param2):
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = 32
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 324] = 33
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 356] = 'ERC1155: mint to the zero addres'
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 388] = 's'
                                              revert with memory
                                                from (4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288
                                                 len (5 * ceil32(_param1.length)) + 132
                                          if addr(_param2) - this.address:
                                              stor1[('name', 'stor0', 0)].field_0 = addr(_param2)
                                              stor1[('name', 'stor0', 0)].field_160 = 0
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = sha3(0)
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 320] = 1
                                              log 0xc3d58168: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 64], caller, 0, addr(_param2)
                                      else:
                                          if stor1[('name', 'stor0', 0)].field_0:
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = 32
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 324] = 31
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 356] = 'ERC1155: mint of existing token'
                                              revert with memory
                                                from (4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288
                                                 len (5 * ceil32(_param1.length)) + 100
                                          if not addr(_param2):
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = 32
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 324] = 33
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 356] = 'ERC1155: mint to the zero addres'
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 388] = 's'
                                              revert with memory
                                                from (4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288
                                                 len (5 * ceil32(_param1.length)) + 132
                                          if not addr(_param2) - this.address:
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = 32
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 324] = 52
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 356] = 'ERC1155: newOwner cannot be the '
                                              mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 388] = 'NameWrapper contract'
                                              revert with memory
                                                from (4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288
                                                 len (5 * ceil32(_param1.length)) + 132
                                          stor1[('name', 'stor0', 0)].field_0 = addr(_param2)
                                          stor1[('name', 'stor0', 0)].field_160 = 0
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288] = sha3(0)
                                          mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 320] = 1
                                          log 0xc3d58168: mem[(4 * ceil32(_param1.length)) + ceil32(return_data.size) + 288 len (5 * ceil32(_param1.length)) + 64], caller, 0, addr(_param2)
                          else:
                              mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + 260] = addr(ext_call.return_data[0])
                              mem[(2 * ceil32(_param1.length)) + ceil32(return_data.size) + 292] = caller
                              static call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.isApprovedForAll(address owner, address operator) with:
                                      gas gas_remaining wei
                                     args addr(ext_call.return_data[0]), caller
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >=′ 32
                              require ext_call.return_data[0] == bool(ext_call.return_data[0])
                              if not ext_call.return_data[0]:
                                  revert with 0, sha3(0), caller
                              if addr(_param3):
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setResolver(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), addr(_param3)
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  if stor1[('name', 'stor0', 0)].field_0:
                              else:
                                  mem[(2 * ceil32(_param1.length)) + (2 * ceil32(return_data.size)) + 292] = this.address
                                  require ext_code.size(0x5e300ab602199073f23b6eb0ef3d0b9c68930931)
                                  call 0x5e300ab602199073f23b6eb0ef3d0b9c68930931.setOwner(bytes32 param1, address param2) with:
                                       gas gas_remaining wei
                                      args sha3(0), this.address
                                  if not ext_call.success:
                                      revert with ext_call.return_data[0 len return_data.size]
                                  mem[(2 * ceil32(_param1.length)) + (2 * ceil32(return_data.size)) + 288 len _param1.length] = _param1[all]
                                  mem[(2 * ceil32(_param1.length)) + (2 * ceil32(return_data.size)) + _param1.length + 288] = 0
                                  if stor1[('name', 'stor0', 0)].field_0:
                                      if 0 >= block.timestamp:
                                          stor1[('name', 'stor0', 0)].field_0 = 0
                                          mem[(4 * ceil32(_param1.length)) + (2 * ceil32(return_data.size)) + 288] = sha3(0)
                                          mem[(4 * ceil32(_param1.length)) + (2 * ceil32(return_data.size)) + 320] = 1
                                          log 0xc3d58168: mem[(4 * ceil32(_param1.length)) + (2 * ceil32(return_data.size)) + 288 len (5 * ceil32(_param1.length)) + 64], caller, stor1[('name', 'stor0', 0)].field_0, 0
  ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)


