#!/bin/sh

rm -rf $HOME/.openblockchaind

#create users - when testnet goes live, change the values to validator/user/etc (more general)
openblockchaind config chain-id moxy
openblockchaind config keyring-backend test
openblockchaind config output json
openblockchaind keys add kody
openblockchaind keys add amy
openblockchaind keys add chris
openblockchaind keys add drea
openblockchaind keys add makayla

#variable name -> address
KODY=$(openblockchaind keys show kody -a)
AMY=$(openblockchaind keys show amy -a)
CHRIS=$(openblockchaind keys show chris -a)
DREA=$(openblockchaind keys show drea -a)
MAKAYLA=$(openblockchaind keys show makayla -a)

#setup chain
openblockchaind init my-node --chain-id moxy

#modify config for development
config="$HOME/.openblockchaind/config/config.toml"
if [ "$(uname)" = "Linux" ]; then
  sed -i "s/cors_allowed_origins = \[\]/cors_allowed_origins = [\"*\"]/g" $config
else
  sed -i '' "s/cors_allowed_origins = \[\]/cors_allowed_origins = [\"*\"]/g" $config
fi

#add accounts to genesis
openblockchaind add-genesis-account $KODY 1000000000000000xobp,5000000000obp
openblockchaind add-genesis-account $AMY 1000000000000000xobp,5000000000obp
openblockchaind add-genesis-account $CHRIS 1000000000000000xobp,5000000000obp
openblockchaind add-genesis-account $DREA 1000000000000000xobp,5000000000obp
openblockchaind add-genesis-account $MAKAYLA 1000000000000000xobp,5000000000obp

openblockchaind gentx kody 10000000000xobp --chain-id moxy --keyring-backend test
openblockchaind collect-gentxs
openblockchaind validate-genesis
openblockchaind start