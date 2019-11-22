###常用函数
######绑定事件时，可以带参数，通过参数可以获得很多属性信息
```gwt javascript
$('body').click(function (event) {
  var target = $(event.target);       // 判断自己当前点击的内容
  if (!target.hasClass('deng')
    && !target.hasClass('kongtiao')
    && !target.parents().hasClass('popover')) {
    jqueryMap.$parentDom.find('.popover').popover('hide');      // 当点击body的非弹出框相关的内容的时候，关闭所有popover
  }
});
```
######show，hide等函数可以带参数
```gwt javascript
$("p").show(1000); 
$("p").hide(1000);
// 在一秒内慢慢显示或隐藏
```
######语法
```gwt javascript
$(selector).hide(speed,callback);
$(selector).show(speed,callback);
//切换显示和隐藏
$("p").toggle();
$(selector).toggle(speed,callback);
```

######动画
```gwt javascript
$("button").click(function(){
 $("div").animate({
  left:'250px',
   opacity:'0.5',
   height:'150px',
   width:'150px'
    });
  });
```