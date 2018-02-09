FROM node:4.6

RUN mkdir /naivechain
ADD package.json /naivechain/
ADD main.js /naivechain/

RUN cd /naivechain && npm install

EXPOSE 3001
EXPOSE 6001

ENTRYPOINT cd /naivechain && npm install && PEERS=$PEERS npm start 
docker-compose up
curl -H "Content-type:application/json" --data '{"data" : "Some data to the first block"}' http://localhost:3001/mineBlock
