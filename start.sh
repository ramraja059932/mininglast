#!/bin/bash
set -e

mkdir -p /root/.config/solana

echo "$SOLANA_KEYPAIR_JSON" > /root/.config/solana/id.json

chmod 600 /root/.config/solana/id.json

echo "Wallet address:"
solana-keygen pubkey /root/.config/solana/id.json

exec /app/target/release/equium-miner \
  --rpc-url "$RPC_URL" \
  --keypair /root/.config/solana/id.json
