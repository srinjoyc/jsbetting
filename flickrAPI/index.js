$(document).ready(function(){
	$("#button").click(function(){
		$.getJSON("http://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?",
		{
			tags: "lighthouse",
			tagmode: "any",
			format: "json"
		}, function(data){
			$.each(data.items, function(index, item){
				var img = $('<img/>').attr("src",item.media.m);
				img.appendTo('#image-slider');
				setTimeout(function(){ 
					img.fadeOut( "slow", function() {
			    	img.remove();
				  });
				}, 2000);
			});
		});
	});
});