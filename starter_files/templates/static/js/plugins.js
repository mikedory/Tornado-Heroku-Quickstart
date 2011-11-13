/*
var scriptFolder = 'static/js/'
*/

// remap jQuery to $
(function($){


})(window.jQuery);


// Improved console.log!
// usage: log('inside coolFunc',this,arguments);
window.log = function(){
	log.history = log.history || []; 
	log.history.push(arguments);
	if(this.console){
		console.log( Array.prototype.slice.call(arguments) );
	}
};

// catch all document.write() calls
(function(doc){
	var write = doc.write;
	doc.write = function(q){ 
		log('document.write(): ',arguments); 
		if (/docwriteregexwhitelist/.test(q)) write.apply(doc,arguments);	
	};
})(document);
