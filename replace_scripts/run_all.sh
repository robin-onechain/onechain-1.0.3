#!/bin/bash

set -e

echo "🔄 Starting SUI → OCT replacements across all file types..."
echo "================================================"

# Process .rs files
echo ""
echo "📝 Processing Rust (.rs) files..."
./sui_to_oct_replacements.sh
echo "✅ Completed Rust file replacements"

# Process .proto files
echo ""
echo "📝 Processing Protocol Buffer (.proto) files..."
./sui_to_oct_proto_replacements.sh
echo "✅ Completed Protocol Buffer file replacements"

# Process .move files
echo ""
echo "📝 Processing Move (.move) files..."
./sui_to_oct_move_replacements.sh
echo "✅ Completed Move file replacements"

# Process .json files
echo ""
echo "📝 Processing JSON (.json) files..."
./sui_to_oct_json_replacements.sh
echo "✅ Completed JSON file replacements"

# Process documentation files
echo ""
echo "📝 Processing Documentation (.md/.mdx) files..."
./sui_to_oct_docs_replacements.sh
echo "✅ Completed Documentation file replacements"

# Process snapshot test files
echo ""
echo "📝 Processing Snapshot Test (.snap) files..."
./sui_to_oct_snap_replacements.sh
echo "✅ Completed Snapshot Test file replacements"

echo ""
echo "================================================"
echo "✅ All SUI → OCT replacements completed successfully!"
echo ""
echo "Note: The following directories were excluded from all replacements:"
echo "  - ../target/*"
echo "  - ../replace_scripts/*"

echo ""
echo "📝 Processing replace_gas_coin.sh"
./replace_gas_coin.sh
echo "✅ Completed replace_gas_coin.sh"

echo ""
echo "📝 Processing replace_faucet_cargo.sh"
./replace_faucet_cargo.sh
echo "✅ Completed replace_faucet_cargoy.sh"

echo ""
echo "📝 Processing replace_sui_move.sh"
./replace_sui_move.sh
echo "✅ Completed replace_sui_move.sh"

echo ""
echo "📝 Processing replace_sui_md.sh"
./replace_sui_md.sh
echo "✅ Completed replace_sui_md.sh"

echo ""
echo "📝 Processing replace_pay_sui.sh"
./replace_pay_sui.sh
echo "✅ Completed replace_pay_sui.sh"

echo ""
echo "📝 Processing replace_client_commands.sh"
./replace_client_commands.sh
echo "✅ Completed replace_client_commands.sh"

echo ""
echo "📝 Processing replace_genesis_inspector.sh"
./replace_genesis_inspector.sh
echo "✅ Completed replace_genesis_inspector.sh"

echo ""
echo "📝 Processing replace_sui_oct_multiple.sh"
./replace_sui_oct_multiple.sh
echo "✅ Completed replace_sui_oct_multiple.sh"

echo ""
echo "📝 Processing replace_framework_comprehensive.sh"
./replace_framework_comprehensive.sh
echo "✅ Completed replace_framework_comprehensive.sh"

echo ""
echo "📝 Processing replace_specific_modifications.sh"
./replace_specific_modifications.sh
echo "✅ Completed replace_specific_modifications.sh"
