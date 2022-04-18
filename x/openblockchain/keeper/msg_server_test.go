package keeper_test

import (
	"context"
	"testing"

	keepertest "github.com/OpenBlockProject/openblockchain/testutil/keeper"
	"github.com/OpenBlockProject/openblockchain/x/openblockchain/keeper"
	"github.com/OpenBlockProject/openblockchain/x/openblockchain/types"
	sdk "github.com/cosmos/cosmos-sdk/types"
)

func setupMsgServer(t testing.TB) (types.MsgServer, context.Context) {
	k, ctx := keepertest.OpenblockchainKeeper(t)
	return keeper.NewMsgServerImpl(*k), sdk.WrapSDKContext(ctx)
}
