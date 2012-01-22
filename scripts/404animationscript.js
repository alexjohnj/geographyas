function quoteClicked(){

	var quoteDiv = $("#carlQuote");
	var errorTextDiv = $("#text");
	var earthImageDiv = $("#earth");
	var solImageDiv = $("#sol");
	var redStripe = $('#redStripe');
	var orangeStripe = $('#orangeStripe');
	var greenStripe = $('#greenStripe');
	
	errorTextDiv[0].style.opacity = "0";
	solImageDiv[0].style.opacity = "0";
	earthImageDiv[0].style.width = "10px";
	
	quoteDiv[0].style.top = "0";
	quoteDiv[0].style.marginLeft = "20%";
	quoteDiv[0].style.height = "100%";
	quoteDiv[0].style.width = "60%";
	quoteDiv[0].style.opacity = "0.7";
	
	greenStripe[0].style.opacity = "0.1";
	redStripe[0].style.opacity = "0.2";
	orangeStripe[0].style.opacity = "0.25";
}

function closeQuote(){
	
	var quoteDiv = $("#carlQuote");
	var errorTextDiv = $("#text");
	var earthImageDiv = $("#earth");
	var solImageDiv = $("#sol");
	var redStripe = $('#redStripe');
	var orangeStripe = $('#orangeStripe');
	var greenStripe = $('#greenStripe');
	
	quoteDiv[0].style.top = "93%";
	quoteDiv[0].style.height = "0px";
	quoteDiv[0].style.width = "0%";
	quoteDiv[0].style.opacity = "0";
	
	greenStripe[0].style.opacity = "0";
	redStripe[0].style.opacity = "0";
	orangeStripe[0].style.opacity = "0";
		
	errorTextDiv[0].style.opacity = "1";
	solImageDiv[0].style.opacity = "1";
	earthImageDiv[0].style.width = "545px";
}