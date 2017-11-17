#!/bin/bash

# if the password file doesnt exist make one
if [[ ! -f password.txt  ]];then
  # parity requires the blank password file to have a newline
  echo > password.txt
fi

echo "building the solidity contracts..."
# we override the previous bin and abi
"solc" --overwrite -o build --bin --abi contracts/*.sol
if [[ $? != 0 ]]; then
  echo "couldn't build contracts.exiting..."
  exit $?
fi

echo "running parity:..."
parity --chain dev --unlock 0x00a329c0648769a73afac7f9381e08fb43dbea72 --password ./password.txt > log 2>&1 &
PID=$!
if [[ $? != 0 ]];then
  exit $?
else
  echo "parity's up..."
fi

echo "running truebit client..."
"cargo" run
echo "killing parity..."
kill -9 $PID
exit $?
