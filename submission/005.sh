# Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
#   `37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517`
tx=$(bitcoin-cli getrawtransaction 37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517 2)
p1=$(echo $tx | jq '.vin[0].txinwitness[1]')
p2=$(echo $tx | jq '.vin[1].txinwitness[1]')
p3=$(echo $tx | jq '.vin[2].txinwitness[1]')
p4=$(echo $tx | jq '.vin[3].txinwitness[1]')
bitcoin-cli createmultisig 4 [$p1,$p2,$p3,$p4] | jq -r '.address'
