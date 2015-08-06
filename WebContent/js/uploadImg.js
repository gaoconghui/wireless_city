jQuery.fn.extend({
    uploadPreview: function (opts) {
        var _self = this,
            _this = $(this);
        opts = jQuery.extend({},{
            Img: "ImgPr",
            Width: 100,
            Height: 100,
            ImgType: ["gif", "jpeg", "png","jpg"],
            Size:2*1024*1024,
            Callback: function () {
            }
        }, opts);
        _self.getObjectURL = function (file) {
            var url = null;
            if (window.createObjectURL != undefined) {
                url = window.createObjectURL(file);
            } else if (window.URL != undefined) {
                url = window.URL.createObjectURL(file);
            } else if (window.webkitURL != undefined) {
                url = window.webkitURL.createObjectURL(file);
            }
            return url;
        };
        _this.change(function () {
        	var src="";
        	var size;
            if (this.value) {
                if (!RegExp("\.(" + opts.ImgType.join("|") + ")$", "i").test(this.value.toLowerCase())) {
                    alert("请选择文件类型为：" + opts.ImgType.join("，") + "中的一种！");
                    this.value = "";
                    return false;
                }
                if (navigator.userAgent.match(/MSIE/)) {
                    try {
                    	src=_self.getObjectURL(this.files[0]);
                        $("#" + opts.Img).attr('src', src);
                    } catch (e) {
                        var obj = $("#" + opts.Img);
                        var div = obj.parent("div")[0];
                        _self.select();
                        if (top != self) {
                            window.parent.document.body.focus();
                        } else {
                            _self.blur();
                        }
                        src = document.selection.createRange().text;
                        document.selection.empty();
                        obj.hide();
                        obj.parent("div").css({
                            'filter': 'progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)',
                            'width': opts.Width + 'px',
                            'height': opts.Height + 'px'
                        });
                        div.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = src;
                    }
                } else {
                	size=this.files[0].size;
                	if(size>opts.Size){
                		alert("图片过大！不得大于"+countFileSize(opts.Size)+"!");
                		return false;
                	}
                	src=_self.getObjectURL(this.files[0]);
                    $("#" + opts.Img).attr('src',src);
                }
                opts.Callback();
            }
        });
    }
});