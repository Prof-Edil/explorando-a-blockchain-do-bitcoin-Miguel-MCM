# How many new outputs were created by block 123,456?
echo $(bitcoin-cli getblockstats 123456 '["outs"]') | jq .outs
