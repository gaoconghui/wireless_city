jQuery.fn.placeholder = function(){
	var i = document.createElement('input'),
		placeholdersupport = 'placeholder' in i;
	if(!placeholdersupport){
        	$(this).each(function() {
				var self = $(this), txt = self.attr('placeholder');
				self.wrap($('<div class="placeholder" data-exist="1"></div>').css({position:'relative',float:'left'}));
				var h = self.outerHeight();
				var size=self.css('fontSize');
				var paddingleft=0;
				if(self.css('paddingLeft')){
					paddingleft = self.css('paddingLeft');
				}else{
					paddingleft=0;
				}
				var margintop=0;
				if(self.css('marginTop')){
					margintop= self.css('marginTop');
				}else{
					margintop=0;
				}
				var marginleft=0;
				if(self.css('marginLeft')){
					marginleft= self.css('marginLeft');
				}else{
					marginleft=0;
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
	����jQuery�⣬Ȼ���������������������£�
	jQuery('input[placeholder]').placeholder();
	��ܰ�Ȩ����
*/