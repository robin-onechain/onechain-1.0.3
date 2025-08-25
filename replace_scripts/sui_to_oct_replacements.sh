#!/bin/bash

# Script to replace SUI -> OCT across all *.rs files in the crates directory
# Uses find + gsed for global replacements

echo "Starting SUI -> OCT replacements in crates directory..."


# Function to perform replacement on all *.rs files
perform_replacements() {
    echo "Performing global replacements..."

    # Find all *.rs files in crates directory and apply replacements
    find ../crates -name "*.rs" -type f -exec gsed -i \
        -e 's/0x2::sui::SUI/0x2::oct::OCT/g' \
        -e 's/sui::sui::SUI/one::oct::OCT/g' \
        -e 's/sui::coin::Coin/one::coin::Coin/g' \
        -e 's/Coin<SUI>/Coin<OCT>/g' \
        -e 's/Balance<SUI>/Balance<OCT>/g' \
        -e 's/Coin<0x0000000000000000000000000000000000000000000000000000000000000002::sui::SUI>/Coin<0x0000000000000000000000000000000000000000000000000000000000000002::oct::OCT>/g' \
        -e 's/TransferSui/TransferOct/g' \
        -e 's/transferSui/transferOct/g' \
        -e 's/transfer_sui/transfer_oct/g' \
        -e 's/transfer-sui/transfer-oct/g' \
        -e 's/new_transfer_sui/new_transfer_oct/g' \
        -e 's/paySui/payOct/g' \
        -e 's/PaySui/PayOct/g' \
        -e 's/pay-sui/pay-oct/g' \
        -e 's/pay_sui/pay_oct/g' \
        -e 's/payAllSui/payAllOct/g' \
        -e 's/PayAllSui/PayAllOct/g' \
        -e 's/pay_all_sui/pay_all_oct/g' \
        -e 's/new_pay_sui/new_pay_oct/g' \
        -e 's/new_pay_all_sui/new_pay_all_oct/g' \
        -e 's/execute_pay_sui/execute_pay_oct/g' \
        -e 's/execute_pay_all_sui/execute_pay_all_oct/g' \
        -e 's/new_transfer_sui_allow_sponsor/new_transfer_oct_allow_sponsor/g' \
        -e 's/pay_sui_tx_kind/pay_oct_tx_kind/g' \
        -e 's/pay_all_sui_tx_kind/pay_all_oct_tx_kind/g' \
        -e 's/sui_coin_object_id/coin_object_id/g' \
        -e 's/StakedSui/StakedOct/g' \
        -e 's/staked_sui/staked_oct/g' \
        -e 's/staked SUI/staked OCT/g' \
        -e 's/stakedSuiId/stakedOctId/g' \
        -e 's/stakedSuis/stakedOcts/g' \
        -e 's/Staked SUI/Staked OCT/g' \
        -e 's/STAKED_SUI/STAKED_OCT/g' \
        -e 's/total_sui/total_oct/g' \
        -e 's/MIST_PER_SUI/MIST_PER_OCT/g' \
        -e 's/get_total_sui/get_total_oct/g' \
        -e 's/expected_sui/expected_oct/g' \
        -e 's/staking_pool_sui_balance/staking_pool_oct_balance/g' \
        -e 's/pending_total_sui_withdraw/pending_total_oct_withdraw/g' \
        -e 's/get_input_sui/get_input_oct/g' \
        -e 's/total_input_sui/total_input_oct/g' \
        -e 's/total_output_sui/total_output_oct/g' \
        {} +

    if [ $? -eq 0 ]; then
        echo "✅ Successfully completed all SUI -> OCT replacements!"
    else
        echo "❌ Some replacements may have failed. Please check the output above."
        exit 1
    fi
}

perform_replacements
