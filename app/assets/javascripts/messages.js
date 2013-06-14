var hbry = hbry || {};

(function($){
	var delay = function(fn, options) {
	  var opts = $.extend({interval: 1000, runOnce: false}, options)
	  var callback = function() {
	    fn();
	    if (! opts.runOnce) {
	      start();
	    }
    };
	  var start = function() {
	    setTimeout(callback, opts.interval);
	  };

	  start();
	};
	
	hbry.messages = {
		last_message: null,
		poll: function(url) {
			alert(url)
		}
	};
	
	$(function(){
		var messages_table = $.find("table[data-messages-url]")
		if ($.isEmptyObject(messages_table)) {
			return
		}
		
		delay(function() { hbry.messages.poll($(messages_table[0]).data("messages-url")) }, { interval: 5000 })
	});
})(jQuery);