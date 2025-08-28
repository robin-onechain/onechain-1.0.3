#!/bin/bash

# Comprehensive script for framework changes: sui-framework -> one-framework, sui-system -> one-system, etc.

echo "Starting comprehensive framework replacements..."

# Directory renames
echo "Renaming directories..."
if [ -d "../crates/sui-framework/packages/sui-framework" ]; then
    mv "../crates/sui-framework/packages/sui-framework" "../crates/sui-framework/packages/one-framework"
    echo "Renamed sui-framework to one-framework"
fi

if [ -d "../crates/sui-framework/packages/sui-system" ]; then
    mv "../crates/sui-framework/packages/sui-system" "../crates/sui-framework/packages/one-system"
    echo "Renamed sui-system to one-system"
fi

if [ -d "../crates/sui-framework/docs/sui_system" ]; then
    mv "../crates/sui-framework/docs/sui_system" "../crates/sui-framework/docs/one_system"
    echo "Renamed docs/sui_system to docs/one_system"
fi

if [ -f "../crates/sui-framework/packages_compiled/sui-framework" ]; then
    mv "../crates/sui-framework/packages_compiled/sui-framework" "../crates/sui-framework/packages_compiled/one-framework"
    echo "Renamed packages_compiled/sui-framework to packages_compiled/one-framework"
fi

if [ -f "../crates/sui-framework/packages_compiled/sui-system" ]; then
    mv "../crates/sui-framework/packages_compiled/sui-system" "../crates/sui-framework/packages_compiled/one-system"
    echo "Renamed packages_compiled/sui-system to packages_compiled/one-system"
fi

# File renames
echo "Renaming files..."
if [ -f "../crates/sui-framework/packages/one-system/sources/sui_system.move" ]; then
    mv "../crates/sui-framework/packages/one-system/sources/sui_system.move" "../crates/sui-framework/packages/one-system/sources/one_system.move"
    echo "Renamed sui_system.move to one_system.move"
fi

if [ -f "../crates/sui-framework/docs/one_system/sui_system.md" ]; then
    mv "../crates/sui-framework/docs/one_system/sui_system.md" "../crates/sui-framework/docs/one_system/one_system.md"
    echo "Renamed sui_system.md to one_system.md"
fi

# Global replacements in all relevant files
echo "Applying global replacements..."

# Find and replace in all files (excluding target and replace_scripts directories)
find .. -type f \( -name "*.rs" -o -name "*.toml" -o -name "*.lock" -o -name "*.move" -o -name "*.md" -o -name "*.json" \) \
    ! -path "*/target/*" ! -path "*/replace_scripts/*" \
    -exec gsed -i \
        -e 's|Sui = { local = "\(.*\)/crates/sui-framework/packages/sui-framework" }|One = { local = "\1/crates/sui-framework/packages/one-framework" }|g' \
        -e 's/sui = "0x2"/one = "0x2"/g' \
        -e 's/\bSuiSystem\b/OneSystem/g' \
        -e 's/sui_system::/one_system::/g' \
        -e 's/sui_node::/one_node::/g' \
        -e 's/https:\/\/fullnode\.mainnet\.sui\.io:443/https:\/\/rpc-mainnet.onelabs.cc:443/g' \
        -e 's/https:\/\/fullnode\.testnet\.sui\.io:443/https:\/\/rpc-testnet.onelabs.cc:443/g' \
        -e 's/https:\/\/fullnode\.devnet\.sui\.io:443/https:\/\/rpc-devnet.onelabs.cc:443/g' \
        -e 's/sui\.workspace/one.workspace/g' \
        -e 's/sui-tool\.workspace = true/one-tool.workspace = true/g' \
        -e 's/sui-node\.workspace = true/one-node.workspace = true/g' {} \;

# Handle the Sui framework dependency separately
find .. -name "*.toml" ! -path "*/target/*" ! -path "*/replace_scripts/*" \
    -exec gsed -i 's/Sui = { local = "[^"]*crates\/sui-framework\/packages\/sui-framework"/One = { local = "..\/..\/..\/crates\/sui-framework\/packages\/one-framework"/g' {} \;

# Specific file modifications
echo "Modifying specific files..."

# crates/sui-framework/packages/one-framework/Move.toml
if [ -f "../crates/sui-framework/packages/one-framework/Move.toml" ]; then
    gsed -i 's/name = "Sui"/name = "One"/g' "../crates/sui-framework/packages/one-framework/Move.toml"
fi

# crates/sui-framework/packages/one-system/Move.toml
if [ -f "../crates/sui-framework/packages/one-system/Move.toml" ]; then
    gsed -i 's/Sui = { local = "\.\.\/sui-framework" }/One = { local = "..\/one-framework" }/g' "../crates/sui-framework/packages/one-system/Move.toml"
fi

# crates/sui-framework/src/lib.rs
if [ -f "../crates/sui-framework/src/lib.rs" ]; then
    gsed -i \
        -e 's/\bSui\b/One/g' \
        -e 's/sui-framework/one-framework/g' \
        -e 's/SuiSystem/OneSystem/g' \
        -e 's/SUI_SYSTEM/ONE_SYSTEM/g' \
        "../crates/sui-framework/src/lib.rs"
fi

# sui/Cargo.toml
if [ -f "../crates/sui/Cargo.toml" ]; then
    gsed -i 's/name = "sui"/name = "one"/g' "../crates/sui/Cargo.toml"
fi

# Root Cargo.toml
if [ -f "../Cargo.toml" ]; then
    gsed -i \
        -e 's/sui = { path = "crates\/sui" }/one = { path = "crates\/sui" }/g' \
        -e 's/sui-tool = { path = "crates\/one-tool" }/one-tool = { path = "crates\/sui-tool" }/g' \
        -e 's/sui-node = { path = "crates\/sui-node" }/one-node = { path = "crates\/sui-node" }/g' \
        "../Cargo.toml"
fi

# Cargo.lock - comprehensive replacements
if [ -f "../Cargo.lock" ]; then
    gsed -i \
        -e 's/\bsui\b/one/g' \
        -e 's/sui-tool/one-tool/g' \
        -e 's/sui-node/one-node/g' \
        "../Cargo.lock"
fi

echo "Comprehensive framework replacements completed!"
