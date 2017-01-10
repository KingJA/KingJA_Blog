/**
 * Created by Administrator on 2016/12/30.
 */
$(document).ready(new function () {
    var top = document.getElementById("top");
    var content_wrap = document.getElementById("content_wrap");
    var input =  $("#text-input");
    var preview =  $("#preview");
    hljs.initHighlightingOnLoad();
    var md = window.markdownit({
        highlight: function (str, lang) {
            if (lang && hljs.getLanguage(lang)) {
                try {
                    return hljs.highlight(lang, str).value;
                } catch (__) {}
            }

            return ''; // use external default escaping
        }
    });
    // var content = $("#article").text();
    // $("#article").html(md.render(content));


    init();
    function Editor(input, preview) {
        this.update = function () {
            preview.innerHTML = md.render(input.value);
        };
        input.editor = this;

        this.update();
    }

    function initMarkdown() {
        var $ = function (id) {
            return document.getElementById(id);
        };
        new Editor($("text-input"), $("preview"));
    }
    function init() {
        initHeight();
        initEvent();
        initMarkdown();
    }
    function initEvent() {
        input.mouseenter(function () {
            preview.unbind("scroll");
            input.scroll(function(){
                preview.scrollTop(input.scrollTop());
            });
        });

        input.mouseleave(function () {
            input.unbind("scroll");
            preview.scroll(function(){
                input.scrollTop(preview.scrollTop());
            });
        });

    }
    function initHeight() {
        var leftHeight=($(window).height()-top.offsetHeight)-2+"px"
        content_wrap.style.height=leftHeight;
    }


});
