function gettime(){
	var dt=new Date();
	var arr_week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
	var strWeek=arr_week[dt.getDay()];
	var strHour=dt.getHours();
	var strMinutes=dt.getMinutes();
	var strSeconds=dt.getSeconds();
	if (strMinutes<10) strMinutes="0"+strMinutes;
	if (strSeconds<10) strSeconds="0"+strSeconds;
	var strYear=dt.getFullYear()+"年";
	var strMonth=(dt.getMonth()+1)+"月";
	var strDay=dt.getDate()+"日";
	var strTime=strHour+":"+strMinutes+":"+strSeconds;
	time.innerHTML=strYear+strMonth+strDay+" "+strTime;
	}
$(document).ready(
	setInterval(function(){
    gettime();},1000)
);

$(document).ready(
	function showtop(){
	$("#img").click(function(){
 		 $(".navTable").toggle();
  	});
	}
);
window.onload=function(){addTab("Home_page1");};
function addTab(url){
	console.log(11111);
	var content = '<iframe src="http://localhost:8080/to/'+url+'" id="iframe" width="99.8%" height="500px"></iframe>';
	$("#iframe").remove();
	$("#showMassage").append(content);
}
