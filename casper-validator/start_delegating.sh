#!/bin/bash

source .delegate_env

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\e[0;96m'
NC='\033[0m'

export KEYS_PATH=/etc/casper/validator_keys
if [ ! -f ${KEYS_PATH}/secret_key.pem -a ! -f ${KEYS_PATH}/public_key.pem -a ! -f ${KEYS_PATH}/public_key_hex ]
then
    echo -e "${RED}Casper-client keys not located in /etc/casper/validator_keys.${NC}"
    echo -e -n "${CYAN}Please input directory of casper-keys: ${NC}"
    read KEY_DIR
elif [ -f ${KEYS_PATH}/secret_key.pem -a -f ${KEYS_PATH}/public_key.pem -a -f ${KEYS_PATH}/public_key_hex ]
then
    KEY_DIR=KEYS_PATH
fi

public_hex_path="${KEY_DIR}/public_key_hex"
echo $public_hex_path
if nc -z -v localhost 8888; echo $? = 1
then
    TARGET_HOST="167.99.223.12"
    echo -e "${GREEN}Set Target Host as $TARGET_HOST, as localhost is not a casper-node.${NC}"
elif nc -z -v localhost 8888; echo $? = 0
then
    TARGET_HOST="127.0.0.1"
fi

PUBLIC_KEY_HEX=$(cat $public_hex_path)
KEY_BASE_DIR=$(dirname "$public_hex_path")
STATE_ROOT_HASH=$(casper-client get-state-root-hash --node-address http://${TARGET_HOST}:7777 | jq -r '.result | .state_root_hash')
PURSE_UREF=$(casper-client query-state --node-address http://${TARGET_HOST}:7777 --key "$PUBLIC_KEY_HEX" --state-root-hash "$STATE_ROOT_HASH" | jq -r '.result | .stored_value | .Account | .main_purse')
BALANCE=$(casper-client get-balance --node-address http://${TARGET_HOST}:7777 --purse-uref "$PURSE_UREF" --state-root-hash "$STATE_ROOT_HASH" | jq -r '.result | .balance_value')

echo -e "${CYAN}Balance: ${NC}${BALANCE%?????????} ${CYAN}CSPR${NC}"

CHAIN_NAME=$(curl -s http://${TARGET_HOST}:8888/status | jq -r '.chainspec_name')

echo -e -n "${GREEN}Please input the PUBLIC KEY HEX of the validator you wish to delegate to:${NC} "
read VALIDATOR_PUBLIC_KEY_HEX
echo -e "${CYAN}Will be delegating ${NC}${GREEN}${AMOUNT%?????????}${NC}${CYAN} CSPR to ${NC}${GREEN}$VALIDATOR_PUBLIC_KEY_HEX${NC}${CYAN} on ${NC}${GREEN}$CHAIN_NAME${NC}${CYAN} network from public key ${NC}${GREEN}$PUBLIC_KEY_HEX${NC}${CYAN}." 


casper-client put-deploy \
    --chain-name "$CHAIN_NAME" \
        --node-address "http://${TARGET_HOST}:7777/" \
        --secret-key "${KEY_BASE_DIR}/secret_key.pem" \
            --session-path "$HOME/casper-node/target/wasm32-unknown-unknown/release/delegate.wasm" \
            --payment-amount 3000000000 \
                --gas-price=1 \
                --session-arg "validator:public_key='$VALIDATOR_PUBLIC_KEY_HEX'" \
                --session-arg "amount:u512='$AMOUNT'"\
                --session-arg "delegator:public_key='$PUBLIC_KEY_HEX'"

