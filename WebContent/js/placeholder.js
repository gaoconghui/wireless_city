jQuery.fn.placeholder = function(){
	var i = document.createElement('input'),
		placeholdersupport = 'placeholder' in i;
	if(!placeholdersupport){
        	$(this).each(function() {
				var self = $(this), txt = self.attr('placeholder');
				self.wrap($('<div></div>').css({position:'relative',float:'left'}));
				var w=self.outerWidth(), h = self.outerHeight();
				var size=self.css('fontSize');
				if(self.css('paddingLeft')){
					var paddingleft = self.css('paddingLeft');
				}else{
					var paddingleft=0;
				}
				if(self.css('marginTop')){
					var margintop= self.css('marginTop');
				}else{
					var margintop=0;
				}
				if(self.css('marginLeft')){
					var marginleft= self.css('marginLeft');
				}else{
					var marginleft=0;
				}
				var borderwidth=self.css('borderWidth').match(/\d*/i)[0] * 1;
				var padding=paddingleft.match(/\d*/i)[0] * 1+borderwidth;
				var holder = $('<span></span>').text(txt).css({position:'absolute',display:'block',height:h+'px',lineHeight:h+'px',left:'0px', top:margintop,paddingLeft:padding+'px', color:'#999',fontSize:size,marginLeft:marginleft}).appendTo(self.parent());
				holder.click(function(e) {
					self.focus();
				});
				self.keyup(function() {
					if($(this).val() != ""){
						holder.hide();
					}else{
						holder.show();
					}
				});
				
        	});
   	 }
	return this;
};
/*
	引入jQuery库，然后引入这个插件，调用如下：
	jQuery('input[placeholder]').placeholder();
	俞杰版权所有
*/