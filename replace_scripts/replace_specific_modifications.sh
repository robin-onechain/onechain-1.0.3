#!/bin/bash

# Script for specific file modifications

echo "Starting specific file modifications..."

# crates/sui-node/Cargo.toml
if [ -f "../crates/sui-node/Cargo.toml" ]; then
    gsed -i 's/sui-node/one-node/g' "../crates/sui-node/Cargo.toml"
fi

# crates/sui-indexer/Cargo.toml
if [ -f "../crates/sui-indexer/Cargo.toml" ]; then
    gsed -i 's/name = "sui-indexer"/name = "one-indexer"/g' "../crates/sui-indexer/Cargo.toml"
fi

# crates/sui-node/src/lib.rs
if [ -f "../crates/sui-node/src/lib.rs" ]; then
    gsed -i \
        -e 's/sui-node/one-node/g' \
        -e 's/fetch_jwks(provider, &client, true)/fetch_jwks(provider, \&client)/g' \
        "../crates/sui-node/src/lib.rs"
fi

# crates/sui-types/src/sui_system_state/mod.rs
if [ -f "../crates/sui-types/src/sui_system_state/mod.rs" ]; then
    gsed -i 's/ident_str!("sui_system")/ident_str!("one_system")/g' "../crates/sui-types/src/sui_system_state/mod.rs"
fi

# crates/sui-tool/Cargo.toml
if [ -f "../crates/sui-tool/Cargo.toml" ]; then
    gsed -i 's/sui-tool = { path = "crates\/one-tool" }/one-tool = { path = "crates\/one-tool" }/g' "../crates/sui-tool/Cargo.toml"
fi

# crates/sui-tool/src/main.rs
if [ -f "../crates/sui-tool/src/main.rs" ]; then
    gsed -i 's/sui-tool/one-tool/g' "../crates/sui-tool/src/main.rs"
fi

# crates/sui-open-rpc/spec/openrpc.json
if [ -f "../crates/sui-open-rpc/spec/openrpc.json" ]; then
    gsed -i \
        -e 's/unsafe_payAllSui/unsafe_payAllOct/g' \
        -e 's/unsafe_paySui/unsafe_payOct/g' \
        -e 's/unsafe_transferSui/unsafe_transferOct/g' \
        "../crates/sui-open-rpc/spec/openrpc.json"
fi

# crates/sui-config/src/lib.rs
if [ -f "../crates/sui-config/src/lib.rs" ]; then
    gsed -i \
        -e 's/\bsui\b/one/g' \
        -e 's/var_os("SUI_CONFIG_DIR")/var_os("ONE_CONFIG_DIR")/g' \
        "../crates/sui-config/src/lib.rs"
fi

# crates/sui/src/main.rs
if [ -f "../crates/sui/src/main.rs" ]; then
    gsed -i 's/name = env!("CARGO_BIN_NAME")/name = "one"/g' "../crates/sui/src/main.rs"
fi

# crates/sui/src/sui_commands.rs
if [ -f "../crates/sui/src/sui_commands.rs" ]; then
    gsed -i \
        -e 's/\bsui\b/one/g' \
        -e 's/\bSui\b/OneChain/g' \
        -e 's/default_value = "sui_indexer"/default_value = "one_indexer"/g' \
        -e 's/pg_db_name: "sui_indexer"/pg_db_name: "one_indexer"/g' \
        -e 's/var_os("SUI_CONFIG_WITH_RPC_URL")/var_os("ONE_CONFIG_WITH_RPC_URL")/g' \
        "../crates/sui/src/sui_commands.rs"
fi

# external-crates/move/crates/move-compiler/src/editions/mod.rs
if [ -f "../external-crates/move/crates/move-compiler/src/editions/mod.rs" ]; then
    gsed -i \
        -e 's/SUI_ADDR_NAME: Symbol = symbol!("sui")/SUI_ADDR_NAME: Symbol = symbol!("one")/g' \
        -e 's/SUI_SYSTEM_ADDR_NAME: Symbol = symbol!("sui_system")/SUI_SYSTEM_ADDR_NAME: Symbol = symbol!("one_system")/g' \
        -e 's/SUI_MODULE_NAME: Symbol = symbol!("sui")/SUI_MODULE_NAME: Symbol = symbol!("oct")/g' \
        -e 's/SUI_OTW_NAME: Symbol = symbol!("SUI")/SUI_OTW_NAME: Symbol = symbol!("OCT")/g' \
        -e 's/SUI_SYSTEM_MODULE_NAME: Symbol = symbol!("sui_system")/SUI_SYSTEM_MODULE_NAME: Symbol = symbol!("one_system")/g' \
        "../external-crates/move/crates/move-compiler/src/editions/mod.rs"
fi

# crates/sui-name-service/src/lib.rs
if [ -f "../crates/sui-name-service/src/lib.rs" ]; then
    gsed -i \
        -e 's/const MAINNET_NS_PACKAGE_ADDRESS: &str = "0xd22b24490e0bae52676651b4f56660a5ff8022a2576e0089f79b3c88d44e08f0";/const MAINNET_NS_PACKAGE_ADDRESS: \&str = "0xb518b15510de80320a046288ca391a2a06b8aa4ca979287549edc123dbe8313f";/g' \
        -e 's/const MAINNET_NS_REGISTRY_ID: &str = "0xe64cd9db9f829c6cc405d9790bd71567ae07259855f4fba6f02c84f52298c106";/const MAINNET_NS_REGISTRY_ID: \&str = "0x7bd439c354340ced161f29bbd9ee8c4799402fb83ec43eec0277a356e68878cf";/g' \
        "../crates/sui-name-service/src/lib.rs"
fi

# crates/sui-types/src/digests.rs
if [ -f "../crates/sui-types/src/digests.rs" ]; then
    gsed -i \
        -e 's/pub const MAINNET_CHAIN_IDENTIFIER_BASE58: &str = "4btiuiMPvEENsttpZC7CZ53DruC3MAgfznDbASZ7DR6S";/pub const MAINNET_CHAIN_IDENTIFIER_BASE58: \&str = "82BXqhKfNQ11TPtEnG7UfToCDRH5mGMYZoUkREW46Tz6";/g' \
        -e 's/pub const TESTNET_CHAIN_IDENTIFIER_BASE58: &str = "69WiPg3DAQiwdxfncX6wYQ2siKwAe6L9BZthQea3JNMD";/pub const TESTNET_CHAIN_IDENTIFIER_BASE58: \&str = "7kb4vByy1gDLyRg22otcCwLXBdA4wqBt3XQPxYoLFrPy";/g' \
        "../crates/sui-types/src/digests.rs"
fi

echo "Specific file modifications completed!"