package keeper

import (
	"github.com/OpenBlockProject/openblockchain/x/openblockchain/types"
)

var _ types.QueryServer = Keeper{}
