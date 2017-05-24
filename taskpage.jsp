<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/taskpage.css">
<link rel="stylesheet" type="text/css" href="./css/semantic.css">

<script src="./js/jquery.js"></script>
<script src="./js/jquery.min.js"></script>	
<script src="./js/semantic.js"></script>
<script src="./js/semantic.min.js"></script>
<script type="text/javascript" src="./js/index.js"></script>
<script type="text/javascript" src="./js/package.js"></script>
<style>
body
{
			height: 100%;
			width: 100%;
			color: #555;
    		position:absolute;
			left:30px
}
</style>
</head>
<body onload="loadtaskdata()">


<!-- onload="loadtaskdata()" -->
<div id="taskpage">
<div>
<div class="ui button" id="goback" onclick="goback()">
<i class="left arrow icon"></i>
</div>
</div>

<div class="ui pointing menu">
  <a class="active item" id="taskinfo">
    Task Info.
  </a>
  <a class="item" id="viewnote">
    View Notes
  </a>
</div>
<div class="ui segment" id="tpcontent" >
  <p id="seg"></p>
</div>


	<div style="display:none">
	<div id="taskcontent" >
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
				<input type="date" name="starttime" value="2016-06-06" readonly="" placeholder="2016-06-06" />
			</div>
			<div class="field">
				<label>Predict End Time</label>
				<input type="date" name="predictendtime" value="2016-06-07" placeholder="2016-06-07" />
			</div>
		</div>
		<div id="alarmtime11">
		
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
				        <input type="checkbox" id="friday" name="friday" value="" tabindex="0" class="hidden">
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
					<input type="time" name="begintime" value=""/>
				</div>
				<div class="two field inline">
					<label>Stop Time</label>
					<input type="time" name="endtime" value=""/>
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
		<div class="ui nonsubmit button red" onclick="">Cancel</div>
	</form>
<script>
	$(".taskbtnn").click(function(){
		alert("alert");
	});
	</script>

	</div>
	</div>
</div>


<script type="text/javascript">
//data part
var tasknamevalue=window.parent.document.getElementById("planlist_iframe").value;
//alert("taskid:"+"");
 function taskTime(date,starttime,endtime)
{
	this.date=date;
	this.starttime=starttime;
	this.endtime=endtime;
}
function taskObj(taskid,taskname,tasktype,taskfinished,taskstarttime,taskfinishedtime,description,tasktime) 
{
	this.taskid=taskid;
	this.taskname=taskname;
	this.tasktype=tasktype;
	this.finished=taskfinished;
	this.taskstarttime=taskstarttime;
	this.taskfinishedtime=taskfinishedtime;
	this.description=description;
	this.tasktime=tasktime;
//	this.jtasktime=jtasktime;
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
function loadtaskdata(){
	//var token=document.cookie.split(";")[0].split("=")[1];
	//alert("load");
	var token="token";
	$.ajax({
		url:"task",
		type:"GET",
		dataType:'json',
		cache:false,
		data:{
			'taskname':tasknamevalue,
			'token':token,
		},
		success:function(data){
			 //alert($("#tablebody").html());
			// alert(document.getElementById("#tablebody").innerHTML);
			// document.getElementById("#tablebody").innerHTML="";
			// alert(document.getElementById("#tablebody").innerHTML);
				var task=data[0];
				var taskstarttime=parseDate(new Date(task.starttime));
				//alert(taskstarttime);
				var taskfinishtime=parseDate(new Date(task.finishtime));
				//alert(task.finishtime);
			 	var tasktimearray=new Array();
				for(var j in task.time)
				{
					var times=task.time[j];	
					var t=new taskTime(times.date,times.starttime,times.endtime);
					tasktimearray[j]=t;
					//alert(t.starttime+" "+t.endtime);
				}
				var taskobj=new taskObj(task.taskid,task.taskname,task.typeid,task.finished,taskstarttime,taskfinishtime,task.description,tasktimearray);
							//	taskObj(taskid,taskname,taskfinished,taskstarttime,taskfinishedtime,description,tasktime) 
				//alert(taskobj.tasktime[0].date);
				//alert(task.typeid);
				//fill the table
				$('input[name="taskname"]').prop("value",taskobj.taskname);
				//alert($('input[name="taskname"]').prop("value"));
				$('.ui.search.dropdown option:selected').prop("value",2);
				$('input[name="starttime"]').prop("value",taskobj.taskstarttime);
				$('input[name="status"]').prop("value",((taskobj.finished==false)?"inProgress":"finished"));
				$('input[name="predictendtime"]').prop("value",taskobj.taskfinishedtime);
				$('textarea[name="descriptionarea"]').prop("value",taskobj.description);
				//alert($('textarea[name="descriptionarea"]').prop("value"));
				parsetasktime(taskobj.tasktime);
				//test();
				
		},
		error:function(XMLResponse){
			 alert(XMLResponse.responseText);
		}
		
	}); 
}	

function parsetasktime(tasktimearray){
	//alert(tasktimearray.length);
	var arr=new Array();
	var b=new Array(tasktimearray.length);
	var starttimes=new Array();
	var endtimes=new Array();
	for(var i=0;i<b.length;i++)
		{
			b[i]=-1;
		}
	var number=0;
	for(var i=0;i<tasktimearray.length-1;i++)
	{
			if(i==0)
			{
				b[i]=number;
				var x=tasktimearray[i].date;
				var arr1=[0,0,0,0,0,0,0];
				arr1[x-1]=1;
				arr[number++]=arr1;
				starttimes[number-1]=tasktimearray[i].starttime;
				endtimes[number-1]=tasktimearray[i].endtime;
				//alert(arr1[0]+" "+arr1[1]+" "+arr1[2]+" "+arr1[3]+" "+arr1[4]+" "+arr1[5]+" "+arr1[6]);
			}
			for(var j=i+1;j<tasktimearray.length;j++)
			{
					if((tasktimearray[j].starttime==tasktimearray[i].starttime)&&(tasktimearray[j].endtime==tasktimearray[i].endtime))
					{	
						//alert(i+" "+j);
						if(b[j]==-1)
						{
							b[j]=b[i];
							var x=tasktimearray[j].date;
							arr[b[i]][x-1]=1;
							//alert("dsadsdsdsa"+arr[b[i]][0]+" "+arr[b[i]][1]+" "+arr[b[i]][2]+" "+arr[b[i]][3]+" "+arr[b[i]][4]+" "+arr[b[i]][5]+" "+arr[b[i]][6]);
							//alert(i+" "+j+number);
							//alert(starttimes[number-1]+" "+endtimes[number-1]);
						}
					}
					else if((i==j-1)&&(b[j]==-1))
					{
						//alert("222 "+i+" "+j);
						b[j]=number;
						var x=tasktimearray[j].date;
						var arr1=[0,0,0,0,0,0,0];
						arr1[x-1]=1;
						arr[number++]=arr1;
						//alert("dsadsdsdsa"+arr[b[j]][0]+" "+arr[b[j]][1]+" "+arr[b[j]][2]+" "+arr[b[j]][3]+" "+arr[b[j]][4]+" "+arr[b[j]][5]+" "+arr[b[j]][6]);
						
						starttimes[number-1]=tasktimearray[j].starttime;
						endtimes[number-1]=tasktimearray[j].endtime;
					}
				}
		}
		//alert(number);
	var dname0=["monday","tuesday","wednesday","thursday","friday","saturday","sunday"];
	var dname =["monday","tuesday","wednesday","thursday","friday","saturday","sunday"];
	
	for(var i=0;i<number;i++)
	{
		if(i==0)
		{	
			for(var j=0;j<7;j++)
			{	
				//alert("arr: "+arr[i][j]);
				if(arr[i][j]==1)
					//alert($('input[name='+dname[j]+']').prop("checked"));
				$('input[name='+dname[j]+']').prop("checked",true);
				//alert("input"+$('input[name='+dname[j]+']').prop("checked"));
				//alert(dname[j]+" "+$('input[name='+dname[j]+']').prop('checked'));
			}
			//alert(starttimes[0]);
			$('input[name="begintime"]').prop('value',starttimes[i]);
			$('input[name="endtime"]').prop('value',endtimes[i]);
			//alert($('input[name="begintime"]').prop("name"));
			//alert(1+""+$('input[name="begintime"]').prop('value'));
			//alert($('input[name="begintime"]').prop('value')+" "+$('input[name="endtime"]').prop('value'));
		}
		 else
		{
			adddiv();
			for(var k=0;k<7;k++)
			{
				dname[k]=dname0[k]+(i+1);	
			}
			
			for(var j=0;j<7;j++)
			{	
				if(arr[i][j]==1)
				$('input[name='+dname[j]+']').prop("checked",true);
			}
			//alert($('input[name="begintime'+(i+1)+'"]').prop('name'));
			$('input[name="begintime'+(i+1)+'"]').prop('value',starttimes[i]);
			$('input[name="endtime'+(i+1)+'"]').prop('value',endtimes[i]);
		} 
		
	}
} 
 function test(){
		var t1=new taskTime(1,"01:00","02:00");
		var t2=new taskTime(2,"02:00","03:00");
		var t3=new taskTime(3,"01:00","02:00");
		var t4=new taskTime(4,"01:00","02:00");
		var t5=new taskTime(5,"02:00","03:00");
		var t6=new taskTime(6,"01:00","02:00");
		var ta=new Array();
		ta[0]=t1;
		ta[1]=t2;
		ta[2]=t3;
		ta[3]=t4;
		ta[4]=t5;
		ta[5]=t6;
		parsetasktime(ta);
	}
//days div
var dayfieldsid='';
var dayid0=new Array('allday','monday','tuesday','wednesday','thursday','friday','saturday','sunday');
var dayid=new Array('allday','monday','tuesday','wednesday','thursday','friday','saturday','sunday')
var dayname0=new Array('allday','monday','tuesday','wednesday','thursday','friday','saturday','sunday');
var dayname=new Array('allday','monday','tuesday','wednesday','thursday','friday','saturday','sunday');
var divnum=1;
var divno=1;
var daysdiv='';

$(document).ready(function(){
		$('.ui.dropdown').dropdown();
		//$('.ui.checkbox').checkbox();

		 
});
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
		$(obj).prop("checked",alldaycheck);
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

/* function submitallvalues(){
	var taskname=$('input[name="taskname"]').prop("value");
	var tasktype=$('.ui.search.dropdown option:selected').prop("value");
	var status=$('input[name="status"]').prop("value");
	var starttime=$('input[name="starttime"]').prop("value");
	var predictendtime=$('input[name="predictendtime"]').prop("value");
	var description=$('textarea[name="descriptionarea"]').prop("value");
	//var tasktime="time:[date:]"
	cbvalues();
} */
function submitallvalues(){
	var taskname=$('input[name="taskname"]').prop("value");
	var tasktype=$('.ui.search.dropdown option:selected').prop("value");
	var status=$('input[name="status"]').prop("value");
	var starttime=$('input[name="starttime"]').prop("value");
		starttime=changetimestamp(starttime);
	var predictendtime=$('input[name="predictendtime"]').prop("value");
	predictendtime=changetimestamp(predictendtime);
	var description=$('textarea[name="descriptionarea"]').prop("value");
	var tasktime=cbvalues();
	
	
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
			if(result==true)
				alert("change successfully!");
			else
					alert("fail to change!");
		},
		});
	
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
	alert(str);
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
		
	 	var parent=document.getElementById("alarmtime11");
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
		/* divnum--;
		var parent=document.getElementById("alarmtime11");
		//var div=;
		parent.removeChild($(obj).parent()); */
		//alert(obj.parentNode.innerHTML);
		//alert(obj.parentNode.innerHTML);
		removeObj(obj.parentNode);
		//alert(document.getElementById("alarmtime11").innerHTML);
		divnum--;
		//alert(divnum);
		
	}
}
$("#taskinfo").click(function(){
	$("#tpcontent").load("taskpage.jsp #taskcontent");
});


$("#viewnote").click(function(){
	$("#tpcontent").load("notelist.jsp");
});

$(document).ready(function(){
	$("#tpcontent").load("taskpage.jsp #taskcontent");
	/*$("#selectdropdown option").click(function(){
		getSelectItem();
	});
	*/
});

//select functions

$('.ui .item').on('click', function() {
	   $('.ui .item').removeClass('active');
	   $(this).addClass('active');
	}); 
	
/* if((tasktimearray[j].starttime==tasktimearray[i].starttime)&&(tasktimearray[j].endtime==tasktimearray[i].endtime))
{	
	//alert(i+" "+j);
	if(b[i]==-1&&b[j]==-1)
	{	b[i]=number;
		b[j]=number;
		var x=tasktimearray[i].date;
		var y=tasktimearray[j].date;
		var arr1=[0,0,0,0,0,0,0];
		arr1[x-1]=1;
		arr1[y-1]=1;
		arr[number++]=arr1;
		//alert(arr1[0]+" "+arr1[1]+" "+arr1[2]+" "+arr1[3]+" "+arr1[4]+" "+arr1[5]+" "+arr1[6]);
		starttimes[number-1]=tasktimearray[i].starttime;
		endtimes[number-1]=tasktimearray[i].endtime;
		//alert(i+" "+j+number);
		//alert(starttimes[number-1]+" "+endtimes[number-1]);
	}
	else if(b[i]!=-1&&b[j]==-1)
		{
			b[j]=b[i];
			var x=tasktimearray[j].date;
			arr[b[i]][x-1]=1;
			//alert(arr1[0]+" "+arr1[1]+" "+arr1[2]+" "+arr1[3]+" "+arr1[4]+" "+arr1[5]+" "+arr1[6]);
		} */
</script>
</body>
</html>