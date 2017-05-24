<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ch">

<script src="../js/jquery.js" type="text/javascript"></script>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/semantic.js"></script> 
<script src="../js/dropdown.js"></script> 
		<link rel="stylesheet" type="text/css" href="../css/dropdown.css">
		<link rel="stylesheet" type="text/css" href="../css/semantic.css">
		<link rel="stylesheet" type="text/css" href="../css/common.css">
		<link rel="stylesheet" type="text/css" href="../css/slide.css">
		<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="../css/flat-ui.min.css">
		<link rel="stylesheet" type="text/css" href="../css/jquery.nouislider.css">
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="description" content="try to help you manage your plan and time!">
		<meta name="keywords" content="time management">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<title>TimeTalker</title>

		
	<script>
			$(function() {
				$(".meun-item").click(function() {
					$(".meun-item").removeClass("meun-item-active");
					$(this).addClass("meun-item-active");
					var itmeObj = $(".meun-item").find("img");
					itmeObj.each(function() {
						var items = $(this).attr("src");
						items = items.replace("_grey.png", ".png");
						items = items.replace(".png", "_grey.png")
						$(this).attr("src", items);
					});
					var attrObj = $(this).find("img").attr("src");;
					attrObj = attrObj.replace("_grey.png", ".png");
					$(this).find("img").attr("src", attrObj);
				});
				$("#topAD").click(function() {
					$("#topA").toggleClass(" glyphicon-triangle-right");
					$("#topA").toggleClass(" glyphicon-triangle-bottom");
				});
				$("#topBD").click(function() {
					$("#topB").toggleClass(" glyphicon-triangle-right");
					$("#topB").toggleClass(" glyphicon-triangle-bottom");
				});
				$("#topCD").click(function() {
					$("#topC").toggleClass(" glyphicon-triangle-right");
					$("#topC").toggleClass(" glyphicon-triangle-bottom");
				});
				$(".toggle-btn").click(function() {
					$("#leftMeun").toggleClass("show");
					$("#rightContent").toggleClass("pd0px");
				})
			})
		</script>


<style id="__web-inspector-hide-shortcut-style__" type="text/css">
.__web-inspector-hide-shortcut__, .__web-inspector-hide-shortcut__ *, .__web-inspector-hidebefore-shortcut__::before, .__web-inspector-hideafter-shortcut__::after
{
    visibility: hidden !important;
}
</style>

</head>

	
	<!-- header -->

 <%@ include file="header.jsp" %>
 

 </div>
	
		<div id="wrap">
		
			<!-- 左侧菜单栏目块 -->
			<div class="leftMeun" id="leftMeun">
				<div id="logoDiv">
					<p id="logoP"><span>Time Talker</span></p>
				</div>
			
			
			
				<div class="meun-item meun-item-active" href="#chart" aria-controls="chart" role="tab" data-toggle="tab">
				<i class="pie chart icon"></i>
				DashBoard</div>
				
				<div class="meun-item" href="#planlist" aria-controls="planlist" role="tab" data-toggle="tab">
				<i class="calendar outline icon"></i>
				Tasks</div>
				<div class="meun-item" href="#notelist" aria-controls="notelist" role="tab" data-toggle="tab"><i class="edit icon"></i>
				Notes</div>
				
				<br><br><br>
				<br><br><br>
				<br><br><br>
				<br>
				
				<div class="meun-item"  aria-controls="notelist" role="tab" data-toggle="tab"><i class="mail forward icon"></i>
				Get started</div>
				
				<div class="meun-item"  aria-controls="notelist" role="tab" data-toggle="tab"><i class="users icon"></i>
				About us</div>
					
    			<div style="position:fixed;left:-10px;bottom:30px">
			     <button class="ui inverted button" >
				  <i class="download icon"></i>
				 Download Client
				 </button>  
			</div>
				

				
			</div>
			
			<!-- 右侧具体内容栏目 -->
			<div id="rightContent">
			
				<a class="toggle-btn" id="nimei">
					
				</a>
				<!-- Tab panes -->
				<div class="tab-content">
					<!-- 资源管理模块 -->
					<div role="tabpanel" class="tab-pane" id="planlist">
					 	<iframe id="planlist_iframe" name="planlist_iframe" src="../tasklist.jsp" 
					onload="this.height=document.body.scrollHeight" 
					width=99%  frameborder="0"  value="">
					</iframe>
					</div>
									

						<!--弹出删除权限警告窗口-->
						<div class="modal fade" id="deleteChar" role="dialog" aria-labelledby="gridSystemModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
										<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
									</div>
									<div class="modal-body">
										<div class="container-fluid">
											确定要删除该权限？删除后不可恢复！
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
										<button type="button" class="btn btn-xs btn-danger">保 存</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->
					
					<!--用户管理模块-->
					<div role="tabpanel" class="tab-pane" id="addnote">
						
						
						<!--页码块-->
						

						<!--弹出添加用户窗口-->
						<div class="modal fade" id="addUser" role="dialog" aria-labelledby="gridSystemModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
										<h4 class="modal-title" id="gridSystemModalLabel">添加用户</h4>
									</div>
									<div class="modal-body">
										<div class="container-fluid">
											<form class="form-horizontal">
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">用户名：</label>
													<div class="col-xs-8 ">
														<input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
													</div>
												</div>
												<div class="form-group">
													<label for="sLink" class="col-xs-3 control-label">真实姓名：</label>
													<div class="col-xs-8 ">
														<input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">
													</div>
												</div>
												<div class="form-group">
													<label for="sOrd" class="col-xs-3 control-label">电子邮箱：</label>
													<div class="col-xs-8">
														<input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
													</div>
												</div>
												<div class="form-group">
													<label for="sKnot" class="col-xs-3 control-label">电话：</label>
													<div class="col-xs-8">
														<input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="">
													</div>
												</div>
												<div class="form-group">
													<label for="sKnot" class="col-xs-3 control-label">地区：</label>
													<div class="col-xs-8">
														<select class=" form-control select-duiqi">
															<option value="">国际关系地区</option>
															<option value="">北京大学</option>
															<option value="">天津大学</option>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label for="sKnot" class="col-xs-3 control-label">权限：</label>
													<div class="col-xs-8">
														<select class=" form-control select-duiqi">
															<option value="">管理员</option>
															<option value="">普通用户</option>
															<option value="">游客</option>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label for="situation" class="col-xs-3 control-label">状态：</label>
													<div class="col-xs-8">
														<label class="control-label" for="anniu">
															<input type="radio" name="situation" id="normal">正常</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<label class="control-label" for="meun">
															<input type="radio" name="situation" id="forbid"> 禁用</label>
													</div>
												</div>
											</form>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
										<button type="button" class="btn btn-xs btn-green">保 存</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->

						<!--弹出修改用户窗口-->
						<div class="modal fade" id="reviseUser" role="dialog" aria-labelledby="gridSystemModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
										<h4 class="modal-title" id="gridSystemModalLabel">修改用户</h4>
									</div>
									<div class="modal-body">
										<div class="container-fluid">
											<form class="form-horizontal">
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">用户名：</label>
													<div class="col-xs-8 ">
														<input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
													</div>
												</div>
												<div class="form-group">
													<label for="sLink" class="col-xs-3 control-label">真实姓名：</label>
													<div class="col-xs-8 ">
														<input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">
													</div>
												</div>
												<div class="form-group">
													<label for="sOrd" class="col-xs-3 control-label">电子邮箱：</label>
													<div class="col-xs-8">
														<input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
													</div>
												</div>
												<div class="form-group">
													<label for="sKnot" class="col-xs-3 control-label">电话：</label>
													<div class="col-xs-8">
														<input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="">
													</div>
												</div>
												<div class="form-group">
													<label for="sKnot" class="col-xs-3 control-label">地区：</label>
													<div class="col-xs-8">
														<input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="">
													</div>
												</div>
												<div class="form-group">
													<label for="sKnot" class="col-xs-3 control-label">权限：</label>
													<div class="col-xs-8">
														<input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="">
													</div>
												</div>
												<div class="form-group">
													<label for="situation" class="col-xs-3 control-label">状态：</label>
													<div class="col-xs-8">
														<label class="control-label" for="anniu">
															<input type="radio" name="situation" id="normal">正常</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<label class="control-label" for="meun">
															<input type="radio" name="situation" id="forbid"> 禁用</label>
													</div>
												</div>
											</form>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
										<button type="button" class="btn btn-xs btn-green">保 存</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->

						<!--弹出删除用户警告窗口-->
						<div class="modal fade" id="deleteUser" role="dialog" aria-labelledby="gridSystemModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
										<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
									</div>
									<div class="modal-body">
										<div class="container-fluid">
											确定要删除该用户？删除后不可恢复！
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
										<button type="button" class="btn  btn-xs btn-danger">保 存</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->

					</div>
					<!-- 修改密码模块 -->
					<div role="tabpanel" class="tab-pane" id="notelist">
						
					<iframe id="planlist_iframe" name="planlist_iframe" src="../notelist.jsp" 
					onload="this.height=document.body.scrollHeight" 
					width=100%  frameborder="0" >
					</iframe>

					</div>
					<!--地区管理模块-->
					<div role="tabpanel" class="tab-pane active" id="chart">

					<iframe id="chart_iframe" name="chart_iframe" src="../semantic.jsp" 
					onload="this.height=document.body.scrollHeight" 
					width=100%  frameborder="0"  >
					</iframe>
					</div>
					
					<!--规则管理模块-->
					<div role="tabpanel" class="tab-pane" id="accountmanage">
						<div class="data-div">
							<div class="tablebody col-lg-10 col-lg-offset-1">
								
								

											
									
							</div>
						</div>
					</div>
					<!--时间段管理模块-->
					<div role="tabpanel" class="tab-pane" id="time">
						<div class="check-div form-inline">
							<span href="#sitt" aria-controls="sitt" role="tab" data-toggle="tab" style="cursor: pointer;"><span class="glyphicon glyphicon glyphicon-chevron-left"></span>&nbsp;&nbsp;返回上一页</span>

							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-yellow btn-xs " data-toggle="modal" data-target="#addTime">添加时间段 </button>

						</div>
						<div class="data-div">
							<div class="row tableHeader">
								<div class="col-xs-3 ">
									编码
								</div>
								<div class="col-xs-3">
									开始
								</div>
								<div class="col-xs-3">
									结束
								</div>

								<div class="col-xs-3">
									操作
								</div>
							</div>
							<div class="tablebody">

								<div class="row">
									<div class="col-xs-3 ">
										6426398978
									</div>
									<div class="col-xs-3">
										10:10
									</div>
									<div class="col-xs-3">
										19:30
									</div>
									<div class="col-xs-3">
										<button class="btn btn-success btn-xs" data-toggle="modal" data-target="#changeTime">修改</button>
										<button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteTime">删除</button>
									</div>
								</div>

							</div>

						</div>
						<!--页码块-->
						<footer class="footer">
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
						</footer>

						<!--弹出增加时间段窗口-->
						<div class="modal fade" id="addTime" role="dialog" aria-labelledby="gridSystemModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
										<h4 class="modal-title" id="gridSystemModalLabel">时间段设置</h4>
									</div>
									<div class="modal-body">
										<div class="container-fluid">
											<form class="form-horizontal">
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">开始时间：</label>
													<div class="col-xs-8 ">
														<input type="email" class="form-control input-sm" id="sName" placeholder="">
													</div>
												</div>
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">结束时间：</label>
													<div class="col-xs-8 ">
														<input type="email" class="form-control input-sm" id="sName" placeholder="">
													</div>
												</div>
											</form>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
										<button type="button" class="btn btn-xs btn-green">保 存</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->

						<!--修改增加时间段窗口-->
						<div class="modal fade" id="changeTime" role="dialog" aria-labelledby="gridSystemModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
										<h4 class="modal-title" id="gridSystemModalLabel">修改时间段</h4>
									</div>
									<div class="modal-body">
										<div class="container-fluid">
											<form class="form-horizontal">
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">开始时间：</label>
													<div class="col-xs-8 ">
														<input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
													</div>
												</div>
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">结束时间：</label>
													<div class="col-xs-8 ">
														<input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
													</div>
												</div>
											</form>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
										<button type="button" class="btn btn-green btn-xs">保 存</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->
						<!--弹出删除时间段警告窗口-->
						<div class="modal fade" id="deleteTime" role="dialog" aria-labelledby="gridSystemModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
										<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
									</div>
									<div class="modal-body">
										<div class="container-fluid">
											确定要删除该时间段？
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
										<button type="button" class="btn btn-danger btn-xs">保 存</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->

					</div>
					<!--座位管理模块-->
					<div role="tabpanel" class="tab-pane" id="sitt">

						
						
						<!--页码块-->
						

						<!--弹出添加楼宇窗口-->
						<div class="modal fade" id="addBuilding" role="dialog" aria-labelledby="gridSystemModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
										<h4 class="modal-title" id="gridSystemModalLabel">添加楼宇</h4>
									</div>
									<div class="modal-body">
										<div class="container-fluid">
											<form class="form-horizontal">
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">楼层：</label>
													<div class="col-xs-8 ">
														<input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
													</div>
												</div>
												<div class="form-group">
													<label for="sLink" class="col-xs-3 control-label">区域：</label>
													<div class="col-xs-8 ">
														<input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">
													</div>
												</div>
												<div class="form-group">
													<label for="sOrd" class="col-xs-3 control-label">座位数：</label>
													<div class="col-xs-8">
														<input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
													</div>
												</div>
											</form>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
										<button type="button" class="btn btn-xs btn-green">保 存</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->

						<!--弹出修改用户窗口-->
						<div class="modal fade" id="reviseUser" role="dialog" aria-labelledby="gridSystemModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
										<h4 class="modal-title" id="gridSystemModalLabel">修改用户</h4>
									</div>
									<div class="modal-body">
										<div class="container-fluid">
											<form class="form-horizontal">
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">用户名：</label>
													<div class="col-xs-8 ">
														<input type="email" class="form-control input-sm" id="sName" placeholder="">
													</div>
												</div>
												<div class="form-group">
													<label for="sLink" class="col-xs-3 control-label">真实姓名：</label>
													<div class="col-xs-8 ">
														<input type="" class="form-control input-sm" id="sLink" placeholder="">
													</div>
												</div>
												<div class="form-group">
													<label for="sOrd" class="col-xs-3 control-label">电子邮箱：</label>
													<div class="col-xs-8">
														<input type="" class="form-control input-sm" id="sOrd" placeholder="">
													</div>
												</div>
												<div class="form-group">
													<label for="sKnot" class="col-xs-3 control-label">电话：</label>
													<div class="col-xs-8">
														<input type="" class="form-control input-sm" id="sKnot" placeholder="">
													</div>
												</div>
												<div class="form-group">
													<label for="sKnot" class="col-xs-3 control-label">地区：</label>
													<div class="col-xs-8">
														<input type="" class="form-control input-sm" id="sKnot" placeholder="">
													</div>
												</div>
												<div class="form-group">
													<label for="sKnot" class="col-xs-3 control-label">权限：</label>
													<div class="col-xs-8">
														<input type="" class="form-control input-sm" id="sKnot" placeholder="">
													</div>
												</div>
												<div class="form-group">
													<label for="situation" class="col-xs-3 control-label">状态：</label>
													<div class="col-xs-8">
														<label class="control-label" for="anniu">
															<input type="radio" name="situation" id="normal">正常</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<label class="control-label" for="meun">
															<input type="radio" name="situation" id="forbid"> 禁用</label>
													</div>
												</div>
											</form>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-xs btn-xs btn-white" data-dismiss="modal">取 消</button>
										<button type="button" class="btn btn-xs btn-green">保 存</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->

						<!--弹出删除用户警告窗口-->
						<div class="modal fade" id="deleteUser" role="dialog" aria-labelledby="gridSystemModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
										<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
									</div>
									<div class="modal-body">
										<div class="container-fluid">
											确定要删除该用户？删除后不可恢复！
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
										<button type="button" class="btn btn-green btn-xs">保 存</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->
					</div>
					<!--座位详情模块-->
					<div role="tabpanel" class="tab-pane" id="sitDetail">
						<div class="check-div form-inline">
							<span href="#sitt" aria-controls="sitt" role="tab" data-toggle="tab" style="cursor: pointer;"><span class="glyphicon glyphicon glyphicon-chevron-left"></span>&nbsp;&nbsp;返回上一页</span>
						</div>
						<div class="data-div">
							<div class="row tableHeader">
								<div class="col-xs-6 ">
									座位编码
								</div>
								<div class="col-xs-6 ">
									座位名称
								</div>

							</div>
							<div class="tablebody">

								<div class="row">
									<div class="col-xs-6 ">
										sad2345fas345533
									</div>
									<div class="col-xs-6">
										王座
									</div>

								</div>

							</div>

						</div>
						<!--页码块-->
						<footer class="footer">
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
						</footer>

					</div>
					<!--人员管理模块-->
					<div role="tabpanel" class="tab-pane" id="stud">
						
						
						<!--页码块-->
						

						<!--弹出删除违约记录警告窗口-->

						<div class="modal fade" id="deleteObey" role="dialog" aria-labelledby="gridSystemModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
										<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
									</div>
									<div class="modal-body">
										<div class="container-fluid">
											确定要删除该违约记录？删除后不可恢复！
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
										<button type="button" class="btn btn-xs btn-danger">保 存</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->

					</div>
				
				<%--profile  --%>
					<div role="tabpanel" class="tab-pane" id="profile">

					<iframe id="profile_iframe" name="profile_iframe" src="../profile.jsp" 
					onload="this.height=document.body.scrollHeight" 
					width=100%  frameborder="0"  >
					</iframe>
					</div>
				
				</div>
			</div>
		</div>
		
		
		
	
		<!-- 滑块js -->
		<!--	<script type="text/javascript">
			scale = function(btn, bar, title, unit) {
				this.btn = document.getElementById(btn);
				this.bar = document.getElementById(bar);
				this.title = document.getElementById(title);
				this.step = this.bar.getElementsByTagName("div")[0];
				this.unit = unit;
				this.init();
			};
			scale.prototype = {
				init: function() {
					var f = this,
						g = document,
						b = window,
						m = Math;
					f.btn.onmousedown = function(e) {
						var x = (e || b.event).clientX;
						var l = this.offsetLeft;
//						var max = f.bar.offsetWidth - this.offsetWidth;
						var max = f.bar.offsetWidth-20 ;
						g.onmousemove = function(e) {
							var thisX = (e || b.event).clientX;
							var to = m.min(max, m.max(-2, l + (thisX - x)));
							f.btn.style.left = to+ 'px';
							f.ondrag(m.round(m.max(0, to / max) * 100), to);
							b.getSelection ? b.getSelection().removeAllRanges() : g.selection.empty();
						};
						g.onmouseup = new Function('this.onmousemove=null');
					};
				},
				ondrag: function(pos, x) {
					this.step.style.width = Math.max(0, x) +2+ 'px';
					this.title.innerHTML = pos / 10 + this.unit + "";
				}
			}
			new scale('btn0', 'bar0', 'title0', "分钟");
			new scale('btn1', 'bar1', 'title1', "分钟");
			new scale('btn2', 'bar2', 'title2', "天");
			new scale('btn3', 'bar3', 'title3', "次");
		</script>
	-->
		<script src="../js/jquery.nouislider.js"></script>

		<!-- this page specific inline scripts -->
		<script>
			 //min/max slider
			function huadong(my, unit, def,max) {
				$(my).noUiSlider({
					range: [0, max],
					start: [def],
					handles: 1,
					connect: 'upper',
					slide: function() {
						var val =Math.floor($(this).val());
						$(this).find(".noUi-handle").text(
							val + unit
						);
						console.log($(this).find(".noUi-handle").parent().parent().html());
					},
					set: function() {
						var val =Math.floor($(this).val());
						$(this).find(".noUi-handle").text(
							val + unit
						);
					}
				});
				$(my).val(def, true);
			}
			huadong('.slider-minmax1', "分钟", "5",30);
			huadong('.slider-minmax2', "分钟", "6",15);
			huadong('.slider-minmax3', "分钟", "10",60);
			huadong('.slider-minmax4', "次", "2",10);
			huadong('.slider-minmax5', "天", "3",7);
			huadong('.slider-minmax6', "天", "8",10);
		</script>
	

</body>

		
</html>