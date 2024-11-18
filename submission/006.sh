# Which tx in block 257,343 spends the coinbase output of block 256,128?
hash1=$(bitcoin-cli getblockhash 256128)
block1=$(bitcoin-cli getblock $hash1 2)
hash2=$(bitcoin-cli getblockhash 257343)
block2=$(bitcoin-cli getblock $hash2 2)
coinbaseTx=$(echo $block1 | jq ".tx[] | select(.vin[] | has(\"coinbase\")).txid")
echo $block2 | jq -r ".tx[] | select( .vin[].txid == $coinbaseTx)".txid