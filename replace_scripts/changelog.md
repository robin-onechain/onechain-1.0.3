# Changelog

## sui_to_oct_replacements.sh

SUI → OCT global replacement

```
  - 0x2::sui::SUI -> 0x2::oct::OCT
  - sui::sui::SUI -> one::oct::OCT
  - sui::coin::Coin -> one::coin::Coin
  - Coin<SUI> -> Coin<OCT>
  - Balance<SUI> -> Balance<OCT>
  - Coin<0x0000000000000000000000000000000000000000000000000000000000000002::sui::SUI>
  -> Coin<0x0000000000000000000000000000000000000000000000000000000000000002::oct::OCT>
  - TransferSui -> TransferOct
  - transferSui -> transferOct
  - transfer_sui -> transfer_oct
  - transfer-sui -> transfer-oct
  - new_transfer_sui -> new_transfer_oct
  - paySui -> payOct
  - PaySui -> PayOct
  - pay-sui -> pay-oct
  - pay_sui -> pay_oct
  - payAllSui -> payAllOct
  - PayAllSui -> PayAllOct
  - pay_all_sui -> pay_all_oct
  - new_pay_sui -> new_pay_oct
  - new_pay_all_sui -> new_pay_all_oct
  - execute_pay_sui -> execute_pay_oct
  - execute_pay_all_sui -> execute_pay_all_oct
  - new_transfer_sui_allow_sponsor -> new_transfer_oct_allow_sponsor
  - pay_sui_tx_kind -> pay_oct_tx_kind
  - pay_all_sui_tx_kind -> pay_all_oct_tx_kind
  - sui_coin_object_id -> coin_object_id
  - StakedSui -> StakedOct
  - staked_sui -> staked_oct
  - staked SUI -> staked OCT
  - stakedSuiId -> stakedOctId
  - stakedSuis -> stakedOcts
  - Staked SUI -> Staked OCT
  - STAKED_SUI -> STAKED_OCT
  - total_sui -> total_oct
  - MIST_PER_SUI -> MIST_PER_OCT
  - get_total_sui -> get_total_oct
  - expected_sui -> expected_oct
  - staking_pool_sui_balance -> staking_pool_oct_balance
  - pending_total_sui_withdraw -> pending_total_oct_withdraw
  - get_input_sui -> get_input_oct
  - total_input_sui -> total_input_sui
  - total_output_sui -> total_output_oct
```

### docs, json, move, proto, snap files

```
sui_to_oct_docs_replacements.sh
sui_to_oct_json_replacements.sh
sui_to_oct_move_replacements.sh
sui_to_oct_proto_replacements.sh
sui_to_oct_snap_replacements.sh
```
like the replacement in rust source code file, but for docs, json, mvoe, proto, snap files.
