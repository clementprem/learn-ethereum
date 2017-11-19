### Install dependencies  
`npm install ethereumjs-testrpc web3@0.20.1 solc`

### Deploy smart contract in testrpc

Start testrpc
`testrpc`

Open node console `node`

`Web3 = require('web3');`

`web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));`

`code = fs.readFileSync('Voting.sol').toString()`

`solc = require('solc')`

`compiledCode = solc.compile(code)`

`abiDefinition = JSON.parse(compiledCode.contracts[':Voting'].interface)`

`VotingContract = web3.eth.contract(abiDefinition)`

`byteCode = compiledCode.contracts[':Voting'].bytecode`

`deployedContract = VotingContract.new(['Rama','Nick','Jose'],{data: byteCode, from: web3.eth.accounts[0], gas: 4700000})`

`contractInstance = VotingContract.at(deployedContract.address)`

### Intract with the contract

`contractInstance.totalVotesFor.call('Rama')`

`contractInstance.voteForCandidate('Rama', {from: web3.eth.accounts[0]})`
