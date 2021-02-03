App= {
	web3Provider:null,
	contract:{},
	candidateList : [],
	init:async function() {

			
		return await App.initWeb3();
	},
	initWeb3: async function() {
					if(window.ethereum) {
					      App.web3Provider = window.ethereum;
					      try {  
					        await window.ethereum.enable();
					      } catch(error) {
					        console.error("Used denied account access");
					      }
				    } else if(window.web3) {
				      	App.web3Provider = window.web3.currentProvider;
				    } else {
				      	App.web3Provider = new Web3.providers.HttpProvider("http://127.0.0.1:7545");
				    }
				    web3 = new Web3(App.web3Provider);
					return App.initContract();
	},
	initContract: function(){
		//contract 생성
		App.contract = new web3.eth.Contract(abi);
		App.contract.options.address = "0x21c770efF663532b27012273334BD00FFF8Dd450";
		
		App.makeReceiver();
		App.bindEvents();
		App.highbid();
		App.recentbid();
	},
	
}
$(function(){
	App.init();
	console.log();
})