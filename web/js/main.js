/**
 * Created by Administrator on 2016/12/30.
 */
$(document).ready(new function () {
    var top = document.getElementById("top");
    var content_wrap = document.getElementById("content_wrap");
    var input =  $("#text-input");
    var preview =  $("#preview");
    init();

    function init() {
        initHeight();
        initEvent();
    }
    function initEvent() {
        input.mouseenter(function () {
            console.log("输入获取焦点")
            preview.unbind("scroll");
            input.scroll(function(){
                preview.scrollTop(input.scrollTop());
                console.log('输入滚动');
            });
        });

        input.mouseleave(function () {
            console.log("输出获取焦点")
            input.unbind("scroll");
            preview.scroll(function(){
                input.scrollTop(preview.scrollTop());
                console.log('输出滚动');
            });
        });

    }
    function initHeight() {
        console.log("top:"+top.offsetHeight);
        var leftHeight=($(window).height()-top.offsetHeight)-2+"px"
        console.log("剩余高度:"+leftHeight);
        content_wrap.style.height=leftHeight;
    }


});
