<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
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
<body>

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
				<input type="date" name="starttime" value="2016-06-06" readonly="" placeholder="2016-06-06" />
			</div>
			<div class="field">
				<label>Predict End Time</label>
				<input type="date" name="predictendtime" value="2016-06-07" placeholder="2016-06-07" />
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



<script type="text/javascript">
//days div
 var dayfieldsid='';
var dayid=new Array('allday','monday','tuesday','wednesday','thursday','friday','saturday','sunday');
//var dayid=new Array(8);
var dayname=new Array('allday','monday','tuesday','wednesday','thursday','friday','saturday','sunday');
//var dayname=new Array(8);

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
		alert("1"+$(obj).prop("checked"));
		$(obj).prop("checked",alldaycheck);
		alert("2"+$(obj).prop("checked"));
		//alert(obj.indexOf('a'));
		var tail=obj.substring(obj.indexOf('y')+1);
		//alert(tail);
		var days=new Array('#monday','#tuesday','#wednesday','#thursday','#friday','#saturday','#sunday');
	 	for(var i=0;i<days.length;i++)
		{
			if(alldaycheck != $(days[i]+tail).prop("checked"))
				$(days[i]+tail).prop("checked",alldaycheck);
			alert(alldaycheck+" "+$(days[i]+tail).prop("checked")+" "+$(days[i]+tail).prop("checked"));
		} 
		alert("3"+$(obj).prop("checked"));
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
	 		alert(tail);
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
	var predictendtime=$('input[name="predictendtime"]').prop("value");
	var description=$('textarea[name="descriptionarea"]').prop("value");
	alert(description);
}
//checkbox getvalue
function cbvalues(){
	//alert($("#monday").prop("checked"));
	 var str="";
	var days=new Array('#allday','#monday','#tuesday','#wednesday','#thursday','#friday','#saturday','#sunday');
	//alert($(days[1]).prop("checked"));
	for(var i=0;i<8;i++)
	{
		if(i==0)
		{
			if($(days[0]).prop("checked"))
				{
					str="1 2 3 4 5 6 7";
					break;
				}
		}
		else{
			if($(days[i]).prop("checked")){
				str+=i;
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
			dayid[i]=dayid[i]+divno;
			dayname[i]=dayname[i]+divno;
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
		daysdiv+='<input type="time" name="begintime"/>';
		daysdiv+='</div>';
		daysdiv+='<div class="two field inline">';
		daysdiv+='<label>Stop Time</label>';
		daysdiv+='<input type="time" name="endtime"/>';
		daysdiv+='</div>';
		daysdiv+='<div class="ui circular icon tiny green button" onclick="adddiv()"><i class="plus icon"></i></div>';
		daysdiv+='<div class="ui circular icon tiny red button" onclick="removediv(this)"><i class="minus icon"></i></div>';
		}
		div.innerHTML=daysdiv;
		//alert(daysdiv);
		parent.appendChild(div);
		alert(div.innerHTML);
		//alert(divnum);
		daysdiv="";
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
		 divnum--;
		var parent=document.getElementById("alarmtime11");
		//var div=;
		parent.removeChild($(obj).parent()); 
		//alert(obj.parentNode.innerHTML);
		//alert(obj.parentNode.innerHTML);
		removeObj(obj.parentNode);
		//alert(document.getElementById("alarmtime11").innerHTML);
		divnum--;
		//alert(divnum);
		
	}
}
function cancelcreate(){
	alert("cancel creating a task!");
	//$('.ui.large.test.modal')
	  //.modal('hide')
	//;
}
$('.ui .item').on('click', function() {
	   $('.ui .item').removeClass('active');
	   $(this).addClass('active');
	}); 

</script>
</body>
</html>