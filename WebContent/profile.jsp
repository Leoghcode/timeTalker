<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<link href="./myStyle/profile.css"  type="text/css" rel="stylesheet" />
<link type="text/css" rel="stylesheet" href="./myStyle/header.css" />
<link rel="stylesheet" type="text/css" href="./css/semantic.css">
<script src="./js/jquery.min.js"></script>
<script src="./js/semantic.js"></script>
<script type="text/javascript" src="./js/form.js"></script>
<script type="text/javascript" src="./js/form.min.js"></script>
<script type="text/javascript" src="./js/index.js"></script>
<script type="text/javascript" src="./js/package.js"></script>
<style type="text/css">
#pwdmodal {

position:absolute;
width:40%;
top:100px;
}
</style>
<body onload="getprofile()">
 <div class="panel panel-default" id="profile-panel" data-content="Test" data-toggle="popover" data-placement="top" data-trigger="manual">
      <div class="panel-heading">Edit Personal Information</div>
      <div class="panel-body">
        <form class="settings form-horizontal">
          <div class="form-group" align="right">
            <div class="col-sm-7 col-md-6 tooltip-md p-top-xs-5">
				<input type="file" name="uploadimg" id="uploadimg" class="hidden" onchange="displayimage(this)"/>
              <a href="#" onclick="selectimage()">
                <img src="./img/avatar1.jpg" class="img-circle" id="imagedisplay" style="height:120px;width:120px;" />
                Change photo
              </a>
              <div id="flash-profile-photo_public" class="text-danger"></div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-4 col-md-3 control-label">Username</label>
            <div class="col-sm-8 col-md-7 tooltip-md p-top-xs-5">
              <div class="row">
                <div class="col-md-7 m-bottom-xs-10">
                  <input name="username" type="text" class="form-control" value="" />
                  <!--{{current_user.username}}  -->
                </div>
              </div>
              <div class="row">
                <div class="col-xs-12">
                  <div id="flash-username" class="text-danger"></div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-4 col-md-3 control-label">E-mail</label>
            <div class="col-sm-7 col-md-6 tooltip-md p-top-xs-5">
    				<div class="row">
                <div class="col-md-7 m-bottom-xs-10">
                  <input name="email" type="email" class="form-control" value="xxxxxxx@qq.com" />
                </div>
              </div>
              <div id="flash-profile-email_public" class="text-danger"></div>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-4 col-md-3 control-label">Password</label>
            <div class="col-sm-8 col-md-7 tooltip-md p-top-xs-5">
              <div class="row">
                <div class="col-md-7 m-bottom-xs-10">
                  <button class="ui button" type="button" onclick="changepwd()">ChangePassword</button>
                </div>
              </div>
              <div class="row">
                <div class="col-xs-12">
                  <div id="flash-username" class="text-danger"></div>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group" style="margin-top:30px;">
            <div class="col-sm-offset-4 col-md-offset-3 col-md-2">
              <button type="submit" class="btn btn-success" data-loading-text="Saving..." onclick="submitprofile()">Save</button>
            </div>
            <div id="flash-success" class="text-success col-sm-4 col-md-7 col-lg-8" style="padding-top:8px;">
            </div>
          </div>
        </form>
      </div>
    </div>
   
    <%-- semantic ui change password modal  --%>
  <div class="ui large pwdmodal modal" id="pwdmodal" >
		 <div class="ui transparent input header">
		  <input type="text" placeholder="Change Password" readonly="" />
		</div>
		 <div class="content">	
			<form class="ui form" id="pwdform" action="http://www.baidu.com" method="POST">
			    <div class="required  field">
			      <label>Old Password</label>
			      <input type="password" name="oldpwd">
			    </div>
			   	<div class="required  field">
			      <label>New Password</label>
			      <input type="password" name="newpwd">
			    </div>
			   	<div class="required field">
			      <label>Type  New  Password Again</label>
			      <input type="password" name="newpwd1">
			    </div>
			    <div><p></p></div>
			    <div class="ui submit button green" onclick="commitmodal()"> Commit </div>
				<div class="ui nonsubmit button red" onclick="cancelmodal()">Cancel</div>
			</form>
    	</div>
    </div>
    
	

<script data-cfasync="false" type='text/javascript'>/*<![CDATA[*/window.olark||(function(c){var f=window,d=document,l=f.location.protocol=="https:"?"https:":"http:",z=c.name,r="load";var nt=function(){
f[z]=function(){
(a.s=a.s||[]).push(arguments)};var a=f[z]._={
},q=c.methods.length;while(q--){(function(n){f[z][n]=function(){
f[z]("call",n,arguments)}})(c.methods[q])}a.l=c.loader;a.i=nt;a.p={
0:+new Date};a.P=function(u){
a.p[u]=new Date-a.p[0]};function s(){
a.P(r);f[z](r)}f.addEventListener?f.addEventListener(r,s,false):f.attachEvent("on"+r,s);var ld=function(){function p(hd){
hd="head";return["<",hd,"></",hd,"><",i,' onl' + 'oad="var d=',g,";d.getElementsByTagName('head')[0].",j,"(d.",h,"('script')).",k,"='",l,"//",a.l,"'",'"',"></",i,">"].join("")}var i="body",m=d[i];if(!m){
return setTimeout(ld,100)}a.P(1);var j="appendChild",h="createElement",k="src",n=d[h]("div"),v=n[j](d[h](z)),b=d[h]("iframe"),g="document",e="domain",o;n.style.display="none";m.insertBefore(n,m.firstChild).id=z;b.frameBorder="0";b.id=z+"-loader";if(/MSIE[ ]+6/.test(navigator.userAgent)){
b.src="javascript:false"}b.allowTransparency="true";v[j](b);try{
b.contentWindow[g].open()}catch(w){
c[e]=d[e];o="javascript:var d="+g+".open();d.domain='"+d.domain+"';";b[k]=o+"void(0);"}try{
var t=b.contentWindow[g];t.write(p());t.close()}catch(x){
b[k]=o+'d.write("'+p().replace(/"/g,String.fromCharCode(92)+'"')+'");d.close();'}a.P(2)};ld()};nt()})({
loader: "static.olark.com/jsclient/loader0.js",name:"olark",methods:["configure","extend","declare","identify"]});
</script>
<!-- end olark code -->

<script>

olark.configure('system.ask_for_name', 'hidden');
if (window.current_user) {
  olark.configure('features.prechat_survey', false);
  if (window.current_user.nickname)
    olark('api.chat.updateVisitorNickname', {snippet: window.current_user.nickname});
  if (window.current_user.email)
    olark('api.visitor.updateEmailAddress', {emailAddress: window.current_user.email});
}
function hideFields() {
  $('#habla_name_input').parent().hide();
  if (window.current_user.email) {
    $('#habla_offline_email_input').parent().hide();
  }
}
olark('api.box.onExpand', hideFields);
olark('api.box.onShow', hideFields);

olark.identify('4159-757-10-7625');

function changepwd(){
	$(".ui.large.pwdmodal.modal").modal('show');
}
function commitmodal(){
	var coldpwd=$('input[name="oldpwd"]').prop("value");
	var cnewpwd=$('input[name="newpwd"]').prop("value");
	var cnewpwd1=$('input[name="newpwd1"]').prop("value");
	
	if(coldpwd==""){alert("empty old password!");return;}
	else if(cnewpwd==""){alert("empty new password!");return;}
	else if(cnewpwd1==""){alert("please type new password again!");return;}
	else{
		if(coldpwd=="123")
			{alert("wrong old password!");return;}
		else if(cnewpwd!=cnewpwd1)
			{alert("conflicts in new passwords");return;}
		else{
				alert("change success!");
				$(".ui.large.pwdmodal.modal").modal('hide');
				return;
			}
	}
	var token="token";
	$ajax({
		url:'changpwd',
		type:'PUT',
		dataType:'json',
		cache:false,
		data:{
			'token':token,
			'nowpassword':newpassword	
		},
		success:function(data){
			var result=data.result;
			var token=data.token;
			if(result==true)
				alert("change successfully!");
			else
				alert("change failure!");
		}
	})
	//var semail=$('input[name="email"]').prop("value");
	
}
function cancelmodal(){
	$(".ui.large.pwdmodal.modal").modal('hide');
}

function submitprofile(){
	var susername=$('input[name="username"]').prop("value");
	var semail=$('input[name="email"]').prop("value");
	var simg=$('input[name="uploadimg"]');
	//alert(susername);
	if(susername==""){alert("empty username");return;}
	else if(semail==""){alert("empty email");return;}
	else {
		alert("Change success!");
		$('input[name="username"]').prop("value",susername);
		$('input[name="email"]').prop("value",semail);
	}

}
function getprofile(){
	$('input[name="username"]').prop("value","Leo");
	$('input[name="email"]').prop("value","107xxxxxxx@qq.com");
}

function selectimage(){
	/* var obj=$('input[name="uploadimg"]');
	obj.trigger("click"); */
	$("#uploadimg").trigger("click");
	//alert("img!");
}

function displayimage(imgFile){
	var filextension=imgFile.value.substring(imgFile.value.lastIndexOf("."),imgFile.value.length);
    filextension=filextension.toLowerCase();
    if ((filextension!='.jpg')&&(filextension!='.gif')&&(filextension!='.jpeg')&&(filextension!='.png')&&(filextension!='.bmp'))
    {
    alert("can not support such type image!");
    imgFile.focus();
    }
    else
    {
    var path;
    if(document.all)//IE
    {
    	alert("IE");
    imgFile.select();
    path = document.selection.createRange().text;
    document.getElementById("imgdisplay").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//使用滤镜效果  
    }
    else//FF
    {
    	var imgURL="";
    	//path = "F:\Tools\eclipseneon\workspace\TimeTalker\WebContent\img"+imgFile.value.substring(imgFile.valueof("fakepath"),imgFile.value.length);
    	try{     
            var file = null;  
            if(imgFile.files){  
                file = imgFile.files[0];  
               // alert(file.value);
            }   
            //Firefox 因安全性问题已无法直接通过input[file].value 获取完整的文件路径  
            try{  
                //Firefox7.0   
                imgURL =  file.getAsDataURL(); 
                //alert("//Firefox7.0"+imgRUL);                           
            }catch(e){  
                //Firefox8.0以上                            
                imgURL = window.URL.createObjectURL(file); 
                //alert("imgURL1 "+imgURL);
                //alert("//Firefox8.0以上"+imgRUL);  
            }  
         }catch(e){      //这里不知道怎么处理了，如果是遨游的话会报这个异常                   
            //支持html5的浏览器,比如高版本的firefox、chrome、ie10  
            if (imgFile) {                            
                var reader = new FileReader();   
                reader.onload = function (e) {                                        
                    imgURL = e.target.result;    
                };  
                reader.readAsDataURL(file.files[0]);   
            }    
         }  
    	$("#imagedisplay").prop("src",imgURL);
    	//alert(imgFile.value+" \n"+$("#imagedisplay").prop("src"));
    // document.getElementById("img1").src = path;
    }
    }
}
</script>

</body>

      
