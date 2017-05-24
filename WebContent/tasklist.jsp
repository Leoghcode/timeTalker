<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% String s="NewTask"; 

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="./css/semantic.css">
<link rel="stylesheet" type="text/css" href="./myStyle/menu.css">
<link href="./css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="./css/common.css">
		<link rel="stylesheet" type="text/css" href="./css/slide.css">
		<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="./css/flat-ui.min.css">
		<link rel="stylesheet" type="text/css" href="./css/jquery.nouislider.css">
		<link rel="stylesheet" type="text/css" href="./css/modal.css">

<script src="./js/package.js"></script>
<script src="./js/jquery.js"></script>
<script src="./js/jquery.min.js"></script>
<script src="./js/semantic.js"></script> 
<script src="./js/bootstrap.min.js"></script>	
<style type="text/css">
#tasklistcontent
{
height: 90%;
width: 90%;
color: #555;
position:relative;
left:10px
}
#modalf
{

position:absolute;
height: 460px;
width:97%;
left:520px;
top:30px;
}


</style>

</head>
<body>
<div class="ui pointing menu">
  <a class="active item" id="today">
    Today tasks
  </a>
  <a class="item" id="all">
    All  tasks
  </a>
  <div class="right menu" id="searchitem">
    <div class="item">
      <div class="ui transparent icon input">
        <input type="text" placeholder="Search...">
        <i class="search link icon" onclick="searchtask(this)"></i>
      </div>
    </div>
  </div>
</div>


<div class="ui segment" id="tlcontent">
  <p id="seg"></p>
</div>


			<div style="display:none;">
			<div id="tasklistdiv">
			
				<button class="ui basic button" onclick="createtask()">
					  <i class="edit icon"></i>
					  Create Task
				</button>
			  <br>
<br>
				<div class="data-div" >
					<div class="row tableHeader">
						<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 ">
							Number
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
							Name
						</div>
						<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
							Status
						</div>
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
							Operation
						</div>
					</div>
					<div class="tablebody" id="tablebody">
						
					</div> 
				</div>
				<!--页码块-->
				<!-- <footer class="footer">
					<ul class="pagination">
						<li>
							<select>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
							</select>
							页
						</li>
						<li class="gray">
							共20页
						</li>
						<li>
							<i class="glyphicon glyphicon-menu-left">
								</i>
						</li>
						<li>
							<i class="glyphicon glyphicon-menu-right">
								</i>
						</li>
					</ul>
				</footer> -->
			</div>
			</div>  
			
			
		  <div class="ui large test modal" id="modalf">
		<div class="ui transparent input header">
		  <input type="text" placeholder=<%=s %> readonly="">
		</div>
		   
		    <div class="content" id="tasklistcontent">
				<!-- create task div -->
				<div id="createtaskcontent" >
				<form class="ui form" style="margin-left:10px;margin-right:10px">
					<div class="field">
					<label>Task Name</label>
					<input type="text" name="taskname" placeholder="Reading A book"/>
					</div>
					<div class="two fields">
						<div class="field">
							<label>Task Type</label>
							<select class="ui search dropdown">
							<option value="" >type</option>
							<option value="1">Read</option>
							<option value="2">Code</option>
							<option value="3">Write</option>
							</select>
						</div>
						<div class="field">
							<label >Status</label>
							<input type="text" name="status" readonly="" value="inProgress" placeholder="inProgress"/>
						</div>
					</div>
					<div class="two fields">
						<div class="field">
							<label>Start Time</label>
							<input type="date" name="starttime" value="2016-12-29" readonly="" placeholder="2016-06-06" />
						</div>
						<div class="field">
							<label>Predict End Time</label>
							<input type="date" name="predictendtime" value="2016-12-30" placeholder="2016-06-07" />
						</div>
					</div>
					<div id="alarmtime12">
					
						<label>Alarm Time</label>
						<div class="fields inline">
							<div class="fields inline">
							    <label>Days:</label>
							    <div class="field">
							      <div class="ui checkbox" onclick="daycheck('#allday')">
							        <input type="checkbox" id="allday" name="allday" value="" tabindex="0" class="hidden">
							        <label>All.</label>
							      </div>
							   		 </div>
							    <div class="field">
							      <div class="ui checkbox" onclick="daycheck('#monday')">
							        <input type="checkbox" id="monday" name="monday" value="" tabindex="0" class="hidden">
							        <label>Mon.</label>
							      </div>
							    </div>
							    <div class="field">
							      <div class="ui checkbox" onclick="daycheck('#tuesday')">
							        <input type="checkbox" id="tuesday" name="tuesday" value="" tabindex="0" class="hidden">
							        <label>Tues.</label>
							      </div>
							    </div>
							    <div class="field">
							      <div class="ui checkbox" onclick="daycheck('#wednesday')">
							        <input type="checkbox" id="wednesday" name="wednesday" value="" tabindex="0" class="hidden">
							        <label>Wed.</label>
							      </div>
							    </div>
							    <div class="field">
							      <div class="ui checkbox" onclick="daycheck('#thursday')">
							        <input type="checkbox" id="thursday" name="thursday" value="" tabindex="0" class="hidden">
							        <label>Thur.</label>
							      </div>
							    </div>
							    <div class="field">
							      <div class="ui checkbox" onclick="daycheck('#friday')">
							        <input type="checkbox" id="friday" name="firday" value="" tabindex="0" class="hidden">
							        <label>Fri.</label>
							      </div>
							    </div>
							    <div class="field">
							      <div class="ui checkbox" onclick="daycheck('#saturday')">
							        <input type="checkbox" id="saturday" name="saturday" value="" tabindex="0" class="hidden">
							        <label>Satur.</label>
							      </div>
							    </div>
							    <div class="field">
							      <div class="ui checkbox" onclick="daycheck('#sunday')">
							        <input type="checkbox" id="sunday" name="sunday" value="" tabindex="0" class="hidden">
							        <label>Sun.</label>
							      </div>
							    </div>
							  </div>
							<div class="two field inline" >
								<label>Begin Time</label>
								<input type="time" name="begintime"/>
							</div>
							<div class="two field inline">
								<label>Stop Time</label>
								<input type="time" name="endtime"/>
							</div>
							<div class="ui circular icon tiny green button" onclick="adddiv()"><i class="plus icon"></i></div>
							<div class="ui circular icon tiny red button"  onclick="removediv(this)"><i class="minus icon"></i></div>
						</div>
					</div>
					<div class="field">
						<label>Description</label>
						<textarea name="descriptionarea"></textarea>
					</div>
					<div class="ui submit button green" onclick="submitallvalues()"> Save </div>
					<div class="ui nonsubmit button red " onclick="cancelcreate()">Cancel</div>
				</form>
		</div>
		    </div>
		  </div>  
<script>
var todaytaskgroup=new Array();
var alltaskgroup=new Array();
function taskTime(date,starttime,endtime)
{
	this.date=date;
	this.starttime=starttime;
	this.endtime=endtime;
}
function taskObj(taskid,taskname,taskfinished,taskstarttime,taskfinishedtime,description,tasktime) 
{
	this.taskid=taskid;
	this.taskname=taskname;
	this.finished=taskfinished;
	this.taskstarttime=taskstarttime;
	this.taskfinishedtime=taskfinishedtime;
	this.description=description;
	this.tasktime=tasktime;
}
function tasklink(obj){
	//alert("tasklink");
	window.parent.document.getElementById("planlist_iframe").src="../taskpage.jsp";
	window.parent.document.getElementById("planlist_iframe").value=$(obj).parent().prev().prev().find("span").html();
	//alert(obj.parentNode.prev().prev().innerHTML);
}
function parseDate(date){
	var year=date.getFullYear();
	var month=date.getMonth()+1;
	var day=date.getDate();
	if(parseInt(month)<10)
		month="0"+month;
	if(parseInt(day)<10)
		day="0"+day;
	var ndate=year+"-"+month+"-"+day;
	return ndate;
	
}
function deletetask(obj){
	//alert($(obj).parent().prev().prev().find("span").html());
	 var taskname=$(obj).parent().prev().prev().find("span").html();
	$.ajax({
		url:"task",
		type:"DELETE",
		dataType:'json',
		cache:false,
		data:{
			'taskname':tasknamevalue,
			'token':token,
		},
		success:function(data){
			var result=data.result;
			if(result==true)
				alert("Delete successfully!");
			else
				alert("Fail to delete");
				
		}
		}); 
}

function searchtask(obj){
	var taskname=$(obj).prev().prop('value');
	var token=document.cookie.split(";")[0].split("=")[1];
	document.getElementById("tablebody").innerHTML="";
	$.ajax({
		url:"task",
		type:"GET",
		dataType:'json',
		cache:false,
		data:{
			'taskname':taskname,
			'token':token,
		},
		success:function(data){
			 var number=0;
			 //alert($("#tablebody").html());
			// alert(document.getElementById("#tablebody").innerHTML);
			// document.getElementById("#tablebody").innerHTML="";
			// alert(document.getElementById("#tablebody").innerHTML);
			for(var i in data){
				number++;
				var task=data[i];
				var taskstarttime=parseDate(new Date(task.starttime));
				//alert(task.starttime);
				var taskfinishtime=parseDate(new Date(task.finishtime));
			 	var tasktimearray=new Array();
				for(var j in task.time)
				{
					var times=task.time[j];	
					var t=new taskTime(times.date,times.starttime,times.endtime);
					tasktimearray[j]=t;
					//alert(times);
				}
				
				var taskobj=new taskObj(task.taskid,task.taskname,task.finished,taskstarttime,taskfinishtime,task.description,tasktimearray);
							//	taskObj(taskid,taskname,taskfinished,taskstarttime,taskfinishedtime,description,tasktime) 
				//alert(taskobj.tasktime[0].date);
				todaytaskgroup[i]=taskobj; 
				// '<div class="row">';
			/* 	this.taskid=taskid;
				this.taskname=taskname;
				this.finished=taskfinished;
				this.taskstarttime=taskstarttime;
				this.taskfinishedtime=taskfinishedtime;
				this.description=description;
				this.tasktime=tasktime; */
				var taskitem="";
				taskitem+='<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">';
				taskitem+=number;
				taskitem+='</div>';
				taskitem+='<div id="taskname'+number+'" class="col-lg-4 col-md-4 col-sm-4 col-xs-4" role="button" data-parent="#accordion" aria-expanded="true" aria-controls="collapseOne">';
				taskitem+='<span>'+taskobj.taskname+'</span>';
				taskitem+='</div>';
				taskitem+='<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">'+taskobj.finished+'</div>'; 
				taskitem+='<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">';
				taskitem+='<button class="btn btn-success btn-xs" onclick="tasklink(this)">View</button>';
				taskitem+='<button class="btn btn-danger btn-xs" onclick="deletetask(this)">Delete</button>';
				taskitem+='</div>';
				//alert(taskitem);
				var taskparent=document.getElementById("tablebody");
				//alert(taskparent.innerHTML);
				var taskitemdiv  = document.createElement("div");
				taskitemdiv.setAttribute('class','row');
				taskitemdiv.innerHTML=taskitem;
				taskparent.appendChild(taskitemdiv);
				//alert("hello");
				// alert("2"+document.getElementById("#tablebody").innerHTML);
			}
			// alert("2 "+$("#tablebody").html());
			//$("#tlcontent").load("tasklist.jsp #tasklistdiv");
		},
		 error:function(XMLResponse){
			 alert(XMLResponse.responseText);
		}

	});
}
function createtask(){

	$('.ui.large.test.modal')
	  .modal('show')
	;
	$("#tasklistcontent").load("tasklist.jsp #createtaskcontent");
}
$("#today").click(function(){
	var token=document.cookie.split(";")[0].split("=")[1];
	//var token="token";
	var finished=false;
	document.getElementById("tablebody").innerHTML="";
	$.ajax({
		url:"task",
		type:"GET",
		dataType:'json',
		cache:false,
		data:{
			'finished':finished,
			'token':token,
		},
		success:function(data){
			 var number=0;
			 //alert($("#tablebody").html());
			// alert(document.getElementById("#tablebody").innerHTML);
			// document.getElementById("#tablebody").innerHTML="";
			// alert(document.getElementById("#tablebody").innerHTML);
			for(var i in data){
				number++;
				var task=data[i];
				var taskstarttime=parseDate(new Date(task.starttime));
				//alert(task.starttime);
				var taskfinishtime=parseDate(new Date(task.finishtime));
			 	var tasktimearray=new Array();
				for(var j in task.time)
				{
					var times=task.time[j];	
					var t=new taskTime(times.date,times.starttime,times.endtime);
					tasktimearray[j]=t;
					//alert(times);
				}
				
				var taskobj=new taskObj(task.taskid,task.taskname,task.finished,taskstarttime,taskfinishtime,task.description,tasktimearray);
							//	taskObj(taskid,taskname,taskfinished,taskstarttime,taskfinishedtime,description,tasktime) 
				//alert(taskobj.tasktime[0].date);
				todaytaskgroup[i]=taskobj; 
				// '<div class="row">';
			/* 	this.taskid=taskid;
				this.taskname=taskname;
				this.finished=taskfinished;
				this.taskstarttime=taskstarttime;
				this.taskfinishedtime=taskfinishedtime;
				this.description=description;
				this.tasktime=tasktime; */
				var taskitem="";
				taskitem+='<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">';
				taskitem+=number;
				taskitem+='</div>';
				taskitem+='<div id="taskname'+number+'" class="col-lg-4 col-md-4 col-sm-4 col-xs-4" role="button" data-parent="#accordion" aria-expanded="true" aria-controls="collapseOne">';
				taskitem+='<span>'+taskobj.taskname+'</span>';
				taskitem+='</div>';
				taskitem+='<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">'+taskobj.finished+'</div>'; 
				taskitem+='<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">';
				taskitem+='<button class="btn btn-success btn-xs" onclick="tasklink(this)">View</button>';
				taskitem+='<button class="btn btn-danger btn-xs" onclick="deletetask(this)">Delete</button>';
				taskitem+='</div>';
				//alert(taskitem);
				var taskparent=document.getElementById("tablebody");
				//alert(taskparent.innerHTML);
				var taskitemdiv  = document.createElement("div");
				taskitemdiv.setAttribute('class','row');
				taskitemdiv.innerHTML=taskitem;
				taskparent.appendChild(taskitemdiv);
				//alert("hello");
				// alert("2"+document.getElementById("#tablebody").innerHTML);
			}
			// alert("2 "+$("#tablebody").html());
			//$("#tlcontent").load("tasklist.jsp #tasklistdiv");
		},
		 error:function(XMLResponse){
			 alert(XMLResponse.responseText);
		}
	});
	//alert("234");
	
});

$("#all").click(function(){
	var token=document.cookie.split(";")[0].split("=")[1];
	//var token="token";
	var finished=true;
	document.getElementById("tablebody").innerHTML="";
	$.ajax({
		url:"task",
		type:"GET",
		dataType:'json',
		cache:false,
		data:{
			'finished':finished,
			'token':token,
		},
		success:function(data){
			 var number=0;
			for(var i in data){
				number++;
				var task=data[i];
				var taskstarttime=parseDate(new Date(task.starttime));
				//alert(task.starttime);
				var taskfinishtime=parseDate(new Date(task.finishtime));
			 	var tasktimearray=new Array();
				for(var j in task.time)
				{
					var times=task.time[j];	
					var t=new taskTime(times.date,times.starttime,times.endtime);
					tasktimearray[j]=t;
				}
				var taskobj=new taskObj(task.taskid,task.taskname,task.finished,taskstarttime,taskfinishtime,task.description,tasktimearray);
							//	taskObj(taskid,taskname,taskfinished,taskstarttime,taskfinishedtime,description,tasktime) 
				//alert(taskobj.tasktime[0].date);
				todaytaskgroup[i]=taskobj; 
				// '<div class="row">';
			/* 	this.taskid=taskid;
				this.taskname=taskname;
				this.finished=taskfinished;
				this.taskstarttime=taskstarttime;
				this.taskfinishedtime=taskfinishedtime;
				this.description=description;
				this.tasktime=tasktime; */
				var taskitem="";
				taskitem+='<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">';
				taskitem+=number;
				taskitem+='</div>';
				taskitem+='<div id="topAD" class="col-lg-4 col-md-4 col-sm-4 col-xs-4" role="button" data-parent="#accordion" aria-expanded="true" aria-controls="collapseOne">';
				taskitem+='<span>'+taskobj.taskname+'</span>';
				taskitem+='</div>';
				taskitem+='<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">'+taskobj.finished+'</div>'; 
				taskitem+='<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">';
				taskitem+='<button class="btn btn-success btn-xs" onclick="tasklink(this)">View</button>';
				taskitem+='<button class="btn btn-danger btn-xs" onclick="deletetask(this)">Delete</button>';
				taskitem+='</div>';
				//alert(taskitem);
				var taskparent=document.getElementById("tablebody");
				//alert(taskparent.innerHTML);
				var taskitemdiv  = document.createElement("div");
				taskitemdiv.setAttribute('class','row');
				taskitemdiv.innerHTML=taskitem;
				taskparent.appendChild(taskitemdiv);
				//alert("hello");
			}
			//$("#tlcontent").load("tasklist.jsp #tasklistdiv");
		},
		 error:function(XMLResponse){
			 alert(XMLResponse.responseText);
		}
	});
	//alert("234");
	
});

$('.ui .item').on('click', function() {
	   $('.ui .item').removeClass('active');
	   $(this).addClass('active');
	}); 

$('.ui.negative.button').click(function(){
	$('.ui.large.test.modal').modal('hide');
});
$('.ui.positive.right.labeled.icon.button').click(function(){
	

	$('.ui.large.test.modal').modal('hide');
});

$(document).ready(function(){
	$("#tlcontent").load("tasklist.jsp #tasklistdiv");
	//$("#today").trigger('click');
	$('.ui.dropdown').dropdown();
	
});

//create task part
//days div
var dayfieldsid='';
var dayid0=new Array('allday','monday','tuesday','wednesday','thursday','friday','saturday','sunday');
var dayid=new Array('allday','monday','tuesday','wednesday','thursday','friday','saturday','sunday')
var dayname0=new Array('allday','monday','tuesday','wednesday','thursday','friday','saturday','sunday');
var dayname=new Array('allday','monday','tuesday','wednesday','thursday','friday','saturday','sunday');
var divnum=1;
var divno=1;
var daysdiv='';

 
function goback(){
	window.history.back();
}
//checkbox
function daycheck(obj){
	if(obj.indexOf('#allday')>=0)
	{
		//alert('<div class="ui checkbox" onclick="daycheck('+"'#wednesday')"+'">');
		var alldaycheck=$(obj).prop("checked");
		alldaycheck=!alldaycheck;
		//alert("1"+$(obj).prop("checked"));
		$(obj).prop("checked",alldaycheck);
		//alert("2"+$(obj).prop("checked"));
		//alert(obj.indexOf('a'));
		var tail=obj.substring(obj.indexOf('y')+1);
		//alert(tail);
		var days=new Array('#monday','#tuesday','#wednesday','#thursday','#friday','#saturday','#sunday');
	 	for(var i=0;i<days.length;i++)
		{
			if(alldaycheck != $(days[i]+tail).prop("checked"))
				$(days[i]+tail).prop("checked",alldaycheck);
			//alert(alldaycheck+" "+$(days[i]+tail).prop("checked")+" "+$(days[i]+tail).prop("checked"));
		} 
		//alert("3"+$(obj).prop("checked"));
	}
	
	else{ 
		 
		//alert(obj);
		 if(!$(obj).prop("checked"))
	     {
			 $(obj).prop("checked",true);
	     }
	     else
	     {
	    	 $(obj).prop("checked",false);
	    	 var tail=obj.substring(obj.indexOf('y')+1);
	 		//alert(tail);
	    	 if($('#allday'+tail).prop("checked")){
	    		 $('#allday'+tail).prop("checked",false);
	    	 }
	     }
	}
}

function submitallvalues(){
	var taskname=$('input[name="taskname"]').prop("value");
	var tasktype=$('.ui.search.dropdown option:selected').prop("value");
	var status=$('input[name="status"]').prop("value");
	var starttime=$('input[name="starttime"]').prop("value");
		starttime=changetimestamp(starttime);
		//alert("timestamp: "+starttime);
	var predictendtime=$('input[name="predictendtime"]').prop("value");
	predictendtime=changetimestamp(predictendtime);
	var description=$('textarea[name="descriptionarea"]').prop("value");
	var tasktime=cbvalues();
	alert("submiting!");
	$('.ui.large.test.modal')
	  .modal('hide')
	;
	$.ajax({
		url:"task",
		type:"POST",
		dataType:'json',
		cache:false,
		data:{
			'taskname':taskname,
			'starttime':starttime,
			'finishtime':finishtime,
			'description':description,
			'time':tasktime,
			'token':token,
		},
		success:function(data){
			var result=data.result;
			if(result==true){
				alert("Create successfully!");
				$('.ui.large.test.modal')
				  .modal('hide')
				;
				location.reload();
			}
			else{
				alert("Failure in creating.");
			}
		},
		});
	
}
//changetotimestamp
function changetimestamp(time){
	var str = time;
	str = str.replace(/-/g,'/'); 
	var date = new Date(str);
	var stamp=Date.parse(date);
	//alert("timestamp: "+stamp);
	return stamp;
}
//checkbox getvalue
function cbvalues(){
	//alert($("#monday").prop("checked"));
	//alert("hellocb");
	var str='"time":[';
	
	var days=new Array('#allday','#monday','#tuesday','#wednesday','#thursday','#friday','#saturday','#sunday');
	//alert(str);
	//alert($(days[1]).prop("checked"));
	var x="";
	var y="";
	var day="";
	for(var j=0;j<divnum;j++)
	{
		if(j==0)
		{
			x=$('input[name="begintime"]').prop('value');
			//alert($('input[name="begintime"]').prop('value'));
			//alert("x:"+x);
			y=$('input[name="endtime"]').prop('value');
			day="";
		}
		else
		{
			x=$('input[name="begintime'+(j+1)+'"]').prop('value');
			y=$('input[name="endtime'+(j+1)+'"]').prop('value');	
			//alert($('input[name="begintime"]').prop('value'));
			day=""+(j+1);
			//alert(day);
		}
		for(var i=0;i<8;i++)
		{
			if(i==0)
			{ 
				//alert(i);
				//alert($(days[0]+day).prop("name"));
				 if($(days[0]+day).prop("checked"))
					{
					 
					 	//alert("zero");
						  for(var l=0;l<7;l++)
						{
							str+='{"date":'+(l+1)+',"starttime":"'+x+'","endtime":"'+y+'"}';
							if(l!=6)
								str+=",";
						}
						str+=']';
						break;  
					}  
			}
			else
			{
				 if($(days[i]+day).prop("checked"))
					{	
					 	if(i!=1)
					 		str+=",";
						str+='{"date":'+(i+1)+',"starttime":"'+x+'","endtime":"'+y+'"}';
					} 
				 if(i==7)
					str+=']';
			}
		}
	}
	//alert(str);
	if(str==null)
		return false; 
	else
		return true;
} 


//checkbox plus minus
function adddiv(){
	if(divnum>7)
		alert("come to a maximum number:7!");
	else{
		divnum++;
		divno++;
		 for(var i=0;i<8;i++){
			dayid[i]=dayid0[i]+divno;
			dayname[i]=dayname0[i]+divno;
		} 
		
	 	var parent=document.getElementById("alarmtime12");
		var div  = document.createElement("div");
		div.setAttribute('class','fields inline');
		{
			daysdiv+='<div class="fields inline">';
			daysdiv+='<label>Days:</label>';
			daysdiv+='<div class="field">';
			daysdiv+='<div class="ui checkbox" onclick="daycheck('+"'#"+dayid[0]+"'"+')">';
			daysdiv+='<input type="checkbox" id="'+dayid[0]+'" name="'+dayname[0]+'" value="" tabindex="0" class="hidden">';
			daysdiv+='<label>All.</label>';
			daysdiv+='</div>';
			daysdiv+='</div>';
			daysdiv+='<div class="field">';
			daysdiv+='<div class="ui checkbox" onclick="daycheck('+"'#"+dayid[1]+"'"+')">';
			daysdiv+='<input type="checkbox" id="'+dayid[1]+'" name="'+dayname[1]+'" value="" tabindex="0" class="hidden">';
			daysdiv+='<label>Mon.</label>';
			daysdiv+='</div>';
			daysdiv+='</div>';
			daysdiv+='<div class="field">';
			daysdiv+='<div class="ui checkbox" onclick="daycheck('+"'#"+dayid[2]+"'"+')">';
			daysdiv+='<input type="checkbox" id="'+dayid[2]+'" name="'+dayname[2]+'" value="" tabindex="0" class="hidden">';
			daysdiv+='<label>Tues.</label>';
			daysdiv+='</div>';
			daysdiv+='</div>';
			daysdiv+='<div class="field">';
			daysdiv+='<div class="ui checkbox" onclick="daycheck('+"'#"+dayid[3]+"'"+')">';
			daysdiv+='<input type="checkbox" id="'+dayid[3]+'" name="'+dayname[3]+'" value="" tabindex="0" class="hidden">';
			daysdiv+='<label>Wed.</label>';
			daysdiv+='</div>';
			daysdiv+='</div>';
			daysdiv+='<div class="field">';
			daysdiv+='<div class="ui checkbox" onclick="daycheck('+"'#"+dayid[4]+"'"+')">';
			daysdiv+='<input type="checkbox" id="'+dayid[4]+'" name="'+dayname[4]+'" value="" tabindex="0" class="hidden">';
			daysdiv+='<label>Thur.</label>';
			daysdiv+='</div>';
			daysdiv+='</div>';
			daysdiv+='<div class="field">';
			daysdiv+='<div class="ui checkbox" onclick="daycheck('+"'#"+dayid[5]+"'"+')">';
			daysdiv+='<input type="checkbox" id="'+dayid[5]+'" name="'+dayname[5]+'" value="" tabindex="0" class="hidden">';
			daysdiv+='<label>Fri.</label>';
			daysdiv+='</div>';
			daysdiv+='</div>';
			daysdiv+='<div class="field">';
			daysdiv+='<div class="ui checkbox" onclick="daycheck('+"'#"+dayid[6]+"'"+')">';
			daysdiv+='<input type="checkbox" id="'+dayid[6]+'" name="'+dayname[6]+'" value="" tabindex="0" class="hidden">';
			daysdiv+='<label>Satur.</label>';
			daysdiv+='</div>';
			daysdiv+='</div>';
			daysdiv+='<div class="field">';
			daysdiv+='<div class="ui checkbox" onclick="daycheck('+"'#"+dayid[7]+"'"+')">';
			daysdiv+='<input type="checkbox" id="'+dayid[7]+'" name="'+dayname[7]+'" value="" tabindex="0" class="hidden">';
			daysdiv+='<label>Sun.</label>';
			daysdiv+='</div>';
			daysdiv+='</div>';
			daysdiv+='</div>';
			daysdiv+='<div class="two field inline" >';
			daysdiv+='<label>Begin Time</label>';
			daysdiv+='<input type="time" name="begintime'+divno+'" value="" />';
			daysdiv+='</div>';
			daysdiv+='<div class="two field inline">';
			daysdiv+='<label>Stop Time</label>';
			daysdiv+='<input type="time" name="endtime'+divno+'" value="" />';
			daysdiv+='</div>';
			daysdiv+='<div class="ui circular icon tiny green button" onclick="adddiv()"><i class="plus icon"></i></div>';
			daysdiv+='<div class="ui circular icon tiny red button" onclick="removediv(this)"><i class="minus icon"></i></div>';
			}
		div.innerHTML=daysdiv;
		//alert(daysdiv);
		parent.appendChild(div);
		daysdiv="";
		//alert(divnum);
	}
}

function removeObj(obj){
	var parent=obj.parentNode;
	if(parent){
		parent.removeChild(obj);
	}
}
function removediv(obj){
	if(divnum==1)
		alert("must choose at least 1 type");
	else{
		 //divnum--;
		//var parent=document.getElementById("alarmtime12");
		//var div=;
		//parent.removeChild($(obj).parent()); 
		//alert(obj.parentNode.innerHTML);
		//alert(obj.parentNode.innerHTML);
		removeObj(obj.parentNode);
		//alert(document.getElementById("alarmtime11").innerHTML);
		divnum--;
		//alert(divnum);
		
	}
}
function cancelcreate(){
	//alert("cancel creating a task!");
	$('.ui.large.test.modal')
	  .modal('hide')
	;
}
//ajax

</script>
</body>
</html>