package keeper_test

import (
	"testing"

	testkeeper "github.com/OpenBlockProject/openblockchain/testutil/keeper"
	"github.com/OpenBlockProject/openblockchain/x/openblockchain/types"
	"github.com/stretchr/testify/require"
)

func TestGetParams(t *testing.T) {
	k, ctx := testkeeper.OpenblockchainKeeper(t)
	params := types.DefaultParams()

	k.SetParams(ctx, params)

	require.EqualValues(t, params, k.GetParams(ctx))
}
