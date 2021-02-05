App = {
	web3Provider: null,
	contract: {},
	candidateList: [],
	init: async function() {


		return await App.initWeb3();
	},
	initWeb3: async function() {
		if (window.ethereum) {
			App.web3Provider = window.ethereum;
			try {
				await window.ethereum.enable();
			} catch (error) {
				console.error("Used denied account access");
			}
		} else if (window.web3) {
			App.web3Provider = window.web3.currentProvider;
		} else {
			App.web3Provider = new Web3.providers.HttpProvider("http://127.0.0.1:7545");
		}
		web3 = new Web3(App.web3Provider);
		return App.initContract();
	},
	initContract: function() {



		App.contract = new web3.eth.Contract(abi);
		App.contract.options.address = "0x9Dd589D5e3Bab33029b44BAB12b7Ca77A596FD7F";

		App.voting();
		if(result != ""){
			App.voteResult(result)
		}

	},
	voting: function() {
		$('#btnVote').on('click', function() {
			/*var candidateId = $('#candidateSelect').val()
			if (!candidateId) {
				return alert('후보자를 선택하세요.')
			}*/
			
			
			
			
			
			/*App.contracts.Election.deployed()
				.then(function(instance) {
					return instance.vote(candidateId, { from: App.account })
				})
				.then(function(result) {
					if (result.receipt) {
						alert('성공적으로 투표했습니다.')
						location.reload();
					}
				})
				.catch(function(error) {
					alert(error.message)
				})*/
		})
		
	},
	inPerson: function(){
		web3.eth.getAccounts(function(error, accounts){
			if(error){
				console.log(error);
				return;
			}
			console.log(accounts);
			var account = accounts[0];
			let seq = $('#seq').val() //글번호  seq = seq.value seq = document.getElementId('seq').value
			let id = $('#vid').val() //주민 id
			
			App.contract.methods.addCandidate(seq,id) //글번호, 투표자id
						  .send({from:account})
						  .then(function(result){
							alert(id);
							$("#inPerson").submit();
						 	
						});
			
		})
	},
	voteResult : function(seq){
		web3.eth.getAccounts(function(error, accounts){
			if(error){
				console.log(error);
				return;
			}
			var account = accounts[0];
			//let seq3 = $('#seq').val()
			App.contract.methods.winnerName(seq)// 글번호
						  .call()
						  .then(function(result){
							$('#voteResultInput').html(result);				
						   });
			
		})
	},
	btnVote : function(){
		web3.eth.getAccounts(function(error, accounts){
			if(error){
				console.log(error);
				return;
			}
			var account = accounts[0];
			let seq2 = $('#seq').val()
			//let num = $('#num').val() //후보자 번호
			let num= Number($('#selectCandidate').find('input[name="name"]:checked').data('num'));
			
			App.contract.methods.vote(seq2, num)// 글번호, 투표번호
						  .send({from:account})
						  		
						  .then(function(result){
							alert(num+'번 후보에 투표하셨습니다.')
							
							location.href="voteStart.do"
							
						});
							
		
		})
	},

}

$(function() {
	App.init();
	console.log();
})