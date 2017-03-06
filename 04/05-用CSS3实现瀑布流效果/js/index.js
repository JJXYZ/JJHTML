/**
 * Created by xiaomage on 15/11/2.
 */
//当屏幕加载完毕
$(window).on('load', function(){
   // 实现瀑布流布局
    waterFall();
    // 造数据
    var dataImg = {"data":[{"src":"0.jpg"},{"src":"4.jpg"},{"src":"7.jpg"},{"src":"10.jpg"}]};
    // 滚动的时候加载图片
    $(window).on('scroll', function(){
        if(cheackWillLoadImg()){
            $.each(dataImg.data, function(index, value){
                // 创建一个新的盒子
                var newBox = $('<div>').addClass('box').appendTo($('#main'));
                var newPic = $('<div>').addClass('pic').appendTo($(newBox));
                $('<img>').attr('src', 'images/'+ $(value).attr('src')).appendTo($(newPic));
            });
            // 实现瀑布流布局
            waterFall();
        }
    })
});



//实现瀑布流布局
function  waterFall(){

    var allBox = $('#main>.box');
    // 取出其中一个盒子的宽度
    var boxWidth = allBox.eq(0).outerWidth();
    // 求出屏幕的宽度
    var screenW = $(window).width();
    // 求出列数
    var cols = Math.floor(screenW / boxWidth);
    // 让父标签居中
    $('#main').css({
        'width' : boxWidth * cols + 'px',
        'margin' : '0 auto'
    });

    // 定义一个高度数组
    var heightArr = [];
    $.each(allBox, function(index, value){
      // 取出每一个盒子的高度
        var boxHeight = $(value).outerHeight();
       if(index < cols){// 第一行
           heightArr[index] = boxHeight;
       }else{// 剩余的行
           // 取出最矮盒子的高度
           var minBoxHeight = Math.min.apply(null, heightArr);
           // 取出最矮盒子对应的索引
           var minBoxIndex = $.inArray(minBoxHeight, heightArr);
           // 对剩余的盒子进行定位
           $(value).css({
               'position' : 'absolute',
               'top' : minBoxHeight + 'px',
               'left' : minBoxIndex * boxWidth + 'px'
           });
           // 更新数组中的最矮盒子的高度
           heightArr[minBoxIndex] += boxHeight;

       }
    });

}


function cheackWillLoadImg(){
//    alert(0);
    // 拿到最后一个盒子
    var lastBox = $('#main>div').last();
    var lastBoxDis = $(lastBox).offset().top+ Math.floor($(lastBox).outerHeight()/2);
    var topScrollH = $(window).scrollTop();
    var screenH = $(window).height();

    return lastBoxDis < (topScrollH + screenH)? true:false;
}

