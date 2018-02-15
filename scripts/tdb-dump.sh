#!/bin/sh
mkdir -p target/STS
tdbdump --loc target/tdb > target/everything.nq
cat target/everything.nq | grep 'http://example.com/tanzarchiv> .' | serdi -i nquads -o ntriples - > target/STA/complete.nt
cat target/everything.nq | grep 'http://example.com/sts> .' | sed '/<undefined>/d' | serdi -i nquads -o ntriples - > target/STS/complete.nt
cat target/everything.nq | grep 'http://example.com/schema> .' | serdi -i nquads -o ntriples - > target/schema.nt
