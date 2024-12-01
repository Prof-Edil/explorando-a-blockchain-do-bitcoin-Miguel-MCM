# Only one single output remains unspent from block 123,321. What address was it sent to?
hash=$(bitcoin-cli getblockhash 123321)
block=$(bitcoin-cli getblock $hash 2)
txs=$(echo $block | jq ".tx[].txid")
for  tx in $txs
do
    out=$(bitcoin-cli gettxout "${tx:1:64}" 0)
    echo $out | jq -r .scriptPubKey.address
done
