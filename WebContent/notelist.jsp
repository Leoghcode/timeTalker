<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="./js/semantic.js"></script> 
<script src="./js/jquery.js"></script>
<script src="./js/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>	

<link rel="stylesheet" type="text/css" href="./css/common.css">
<link rel="stylesheet" type="text/css" href="./css/slide.css">
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="./css/flat-ui.min.css">
<link rel="stylesheet" type="text/css" href="./css/jquery.nouislider.css">
<link rel="stylesheet" type="text/css" href="./css/semantic.css">
<link rel="stylesheet" type="text/css" href="./css/modal.css">

<script type="text/javascript">
var noteContent='NewNote';
var noteTaskName='Default Task';
var token=document.cookie.split(";")[0].split("=")[1]; 
</script>

<style>
.trash{
float:left;
position:absolute;
right:50px;
}
body
{
			height: 100%;
			width: 100%;
			color: #555;
    		position:absolute;
			left:30px
}
#modalf
{

position:absolute;
height: 400px;
width:90%;
left:500px;
top:30px;
}
</style>

		
</head>
<body>
<br><br>

<button class="ui basic button" id="newb">
  <i class="edit icon"></i>
  New Note 
</button>
<div class="right menu" style="position:relative; right:40px">
<div class="ui action input">
  <input type="text" placeholder="Search..." id="searchbtn"> 
  <button class="ui button" onclick="searchnote()">Search</button>
</div>
</div>
<br><br>

<%-- semantic ui modal --%>
<div class="ui large test modal" id="modalf" style="height:600px">
<div class="ui top right attached label large" id="note_task_name">Code</div>
<div class="ui transparent input header">
  <input type="text" placeholder=noteContent id="placeholder">
</div>

 <span></span> 
    <div class="content">

<textarea 
 id="editor_id" 
 name="content"
 style="width:870px;
 height:400px;"
 >
&lt;strong&gt;Note&lt;/strong&gt;
</textarea>
      
    </div>
    <div class="actions">
      <div class="ui negative button" onclick='cancel()'>
        Cancel
      </div>
      <div class="ui positive right labeled icon button" onclick='save()'>
        Save
        <i class="checkmark icon"></i>
      </div>
    </div>
  </div>
  
<div class="ui relaxed divided list"  id="notelistCnt">

  <div class="item">
    <i class="large github middle aligned icon"></i>
    <div class="content" >
      <a class="header" onclick="notelink(this)">Testnote1</a>
   
      <i class="trash outline icon" onclick="deletenote(this)" ><a class="item" ></a></i>
      <div class="description">Read me please!</div>
    </div>  
  </div>
  
</div>







<script charset="utf-8" src="./editor/kindeditor.js"></script>
<script charset="utf-8" src="./editor/lang/zh-CN.js"></script>
<script>
var editor;

KindEditor.ready(function(K) {
	editor = K.create('textarea[name="content"]', {
		allowFileManager : true
	});
    
	editor.html();
 
})
</script>








<script>
var editorContent;
var divhtml;
var createOrchange=0;

function addDiv(pid){

	var parent=document.getElementById(pid);
	var div  = document.createElement("div");
	div.setAttribute("class", "item");
	div.innerHTML = divhtml;
	parent.appendChild(div);
	
}
function deleteDiv(obj){
	var parent=obj.parentNode;
	if(parent){
		parent.removeChild(obj);
	}
}
function deletenote(obj){ 
	
	 if (confirm("Are you sure to delete the note? \n YES:确定\n NO:取消")){ 
		 
		 var tempname=$(obj).prev().html();
		 $.ajax({
			 url: 'http://localhost:8888/note',
			 type: 'DELETE',
			 dataType:'jsonp',
			 crossDomain: true,
			 cache: false,
			 data: {
			 	'token':token,
			 	'notename':tempname 	
			 },
			 success: function(data){
				 if(data.result=='true')
				 {
						alert("Delete note sucessed!");
				 }
				 else alert("Delete note failed");
			 }
			 });
		 
		 deleteDiv(obj.parentNode.parentNode);
		 } 	
}

function addNote(notename,notedis,taskname){

	if(notename==null) notename ='SoftwareEng note';
	if(notedis==null) notedis='final exam preparation';
    divhtml='';
	divhtml += '<i class="large github middle aligned icon"></i>';
	divhtml += '<div class="content" >';
	divhtml += '<a class="header" onclick="notelink(this)">'+notename+'</a>';
	divhtml += ' <i class="trash outline icon" onclick="deletenote(this)"  ><a class="item" ></a></i>';
	divhtml += '  <div class="description">'+notedis+'</div>';
	divhtml += '</div>  ';

	addDiv('notelistCnt');
}

function loadlist(){
	$.ajax({
		 url: 'http://localhost:8888/note',
		 type: 'GET',
		 dataType:'jsonp',
		 cache: false,
		 crossDomain: true,
		 data: {
		 	'token':token
		 },
		 success: function(data){
			 for(var note in data){
				 var tag=note.tag;
				 var taskname=note.taskname;
				 var notename=note.notename;
				 
				 addNote(notename,tag,taskname);
			 }
		 	
		 }
		 });
}
$(document).ready(function(){
	// loadlist();
})

function notelink(obj){
	
var notename=$(obj).html();
var text;
var taskname;

	   $.ajax({
		 url: 'http://localhost:8888/note',
		 type: 'GET',
		 dataType:'jsonp',
		 cache: false,
		 crossDomain: true,
		 data: {
		 	'token':token,
		 	'notename':notename
		 },
		 success: function(data){
			 notename=data.notename;
			 text=data.text;
			 taskname=data.taskname;
		 }
		 });
	
	createOrchange=2;
	
	noteContent =notename;
	editorContent=text;
	noteTaskName=taskname;
	
	editor.html(editorContent);
	
	$('.ui.large.test.modal')
	  .modal('show')
	;
	$("#note_task_name").html(noteTaskName);
//	window.parent.document.getElementById("notelist_iframe").src="../taskpage.jsp";
}

$(function() {

	
	$("#newb").click(function(){
	    noteContent='NewNote';
		noteTaskName='Default Task';
		editor.html("");
		createOrchange=1;
		
		$('.ui.large.test.modal')
		  .modal('show')
		;
		$("#note_task_name").html(noteTaskName);
		

	});
	$('.ui.negative.button').click(function(){
		$('.ui.large.test.modal').modal('hide');
	});
	$('.ui.positive.right.labeled.icon.button').click(function(){
		
		
		$('.ui.large.test.modal').modal('hide');
	});
	
});

function cancel(){
	createOrchange=0;
}
function save(){
	
	  
	if(createOrchange==1)
	{
		noteContent=$("#placeholder").val();
		   $.ajax({
			 url: 'http://localhost:8888/note',
			 type: 'POST',
			 dataType:'jsonp',
			 cache: false,
			 crossDomain: true,
			 data: {
			 	'token':token,
			 	'notename':noteContent,
			 	'text':editor.html(),
			 	'taskname':noteTaskName 		 	
			 },
			 success: function(data){
				if(data.result=='true'){
					alert("New note sucessed!");
				}
				else alert("New note failed");
			 }
			 });
		addNote(noteContent,editor.html(),noteTaskName);       //这里 中间未tag
	}
	else
	{
		   $.ajax({
			 url: 'http://localhost:8888/note',
			 type: 'PUT',
			 dataType:'jsonp',
			 cache: false,
			 crossDomain: true,
			 data: {
			 	'token':token,
			 	'notename':noteContent,
			 	'text':editor.html(),
			 	'taskname':noteTaskName 		 	
			 },
			 success: function(data){
				if(data.result=='true'){
					alert("Change note sucessed!");
				}
				else alert("Change note failed");
			 }
			 });
		document.getElementById('notelistCnt').innerHTML='';
		loadlist();
	}
	
	createOrchange=0;
	
}


function searchnote(){
	var notename=$("#searchbtn").val();
	var text;
	var taskname;

		   $.ajax({
			 url: 'http://localhost:8888/note',
			 type: 'GET',
			 dataType:'jsonp',
			 cache: false,
			 crossDomain: true,
			 data: {
			 	'token':token,
			 	'notename':notename
			 },
			 success: function(data){
				 notename=data.notename;
				 text=data.text;
				 taskname=data.taskname;
			 }
			 });
		
		createOrchange=2;
		
		notetitle =notename;
		editorContent=text;
		notetask=taskname;
		
		editor.html(editorContent);
		$('.ui.large.test.modal')
		  .modal('show')
		;
}
</script>





</body>


</html>









