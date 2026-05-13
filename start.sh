#!/bin/bash
set -e

mkdir -p /root/.config/solana

# Create wallet only if not exists
if [ ! -f /root/.config/solana/id.json ]; then
    echo "Creating new Solana wallet..."
    solana-keygen new \
      -o /root/.config/solana/id.json \
      --no-bip39-passphrase \
      --silent
fi

echo "Wallet address:"
solana-keygen pubkey /root/.config/solana/id.json

echo "Private key JSON:"
cat /root/.config/solana/id.json

exec /app/target/release/equium-miner \
  --rpc-url "$RPC_URL" \
  --keypair /root/.config/solana/id.json
