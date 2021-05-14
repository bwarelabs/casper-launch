#!/bin/bash

source .unbonding_env

PUBLIC_KEY_HEX=$(sudo -u casper cat /etc/casper/validator_keys/public_key_hex)
STATE_ROOT_HASH=$(casper-client get-state-root-hash --node-address http://127.0.0.1:7777 | jq -r '.result | .state_root_hash')
PURSE_UREF=$(sudo -u casper casper-client query-state --node-address http://127.0.0.1:7777 --key "$PUBLIC_KEY_HEX" --state-root-hash "$STATE_ROOT_HASH" | jq -r '.result | .stored_value | .Account | .main_purse')
casper-client get-balance --node-address http://127.0.0.1:7777 --purse-uref "$PURSE_UREF" --state-root-hash "$STATE_ROOT_HASH" | jq -r '.result | .balance_value'

PUBLIC_KEY_HEX=$(sudo -u casper cat /etc/casper/validator_keys/public_key_hex)
CHAIN_NAME=$(curl -s http://127.0.0.1:8888/status | jq -r '.chainspec_name')

casper-client put-deploy --chain-name "$CHAIN_NAME" \
		         --node-address "http://127.0.0.1:7777" \
			 --secret-key "/etc/casper/validator_keys/secret_key.pem" \
			 --session-path  "$HOMEDIR/casper-node/target/wasm32-unknown-unknown/release/withdraw_bid.wasm"  \
			 --payment-amount 1000000000  \
			 --session-arg="public_key:public_key='$PUBLIC_KEY_HEX'" \
			 --session-arg="amount:u512='$AMOUNT'" \
			 --session-arg="unbond_purse:opt_uref=null"
