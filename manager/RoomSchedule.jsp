<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Arrays"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>致理科技大學-後端語料管理平台</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="plugins/datetimepicker/css/jquery.datetimepicker.min.css">

</head>
<body id="page-top">

	<script src="plugins/jquery/jquery-1.12.1.min.js"></script>
	<script src="plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="plugins/DataTables/js/jquery.dataTables.min.js"></script>
	<script src="plugins/moment/moment.min.js"></script>
	<script
		src="plugins/datetimepicker/js/jquery.datetimepicker.full.min.js"></script>
	<script src="plugins/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="plugins/jquery/jquery-clear-button.js"></script>
	<script src="plugins/icheck-1.0.2/icheck.min.js"></script>

	<script>
		//顯示視窗前呼叫
		$("#ooo").on("show.bs.modal", function(e) {
			console.log('顯示視窗前呼叫');
		});

		//轉場特效結束，已完全呈現時呼叫
		$("#ooo").on("shown.bs.modal", function(e) {
			console.log('轉場特效結束，已完全呈現時呼叫');
		});

		//關閉視窗前呼叫
		$("#ooo").on("hide.bs.modal", function(e) {
			console.log('關閉視窗前呼叫');
		});

		//轉場特效結束，已完全隱藏時呼叫
		$("#ooo").on("hidden.bs.modal", function(e) {
			console.log('轉場特效結束，已完全隱藏時呼叫');
		});

		//隱藏視窗
		$("#ooo").modal('hide');

		//開啟視窗
		$("#ooo").modal('show');

		//切換視窗顯示、不顯示
		$("#ooo").modal('toggle');

		//判斷視窗是否開啟中
		if ($("#ooo").hasClass('in')) {
			console.log('視窗目前是開啟的狀態..');
		}

		// 取消刪除
		$('#deleteCancel').on('click', function() {
			$('#deleteModal').modal('hide');
		});

		$('#deleteModal').on('shown.bs.modal', function() {
			var zIndex = 1060;

			$(this).css('z-index', zIndex);
		});

		$(function() {
			$("#ClassTime").datepicker();
		});
	</script>

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index.html">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-microphone"></i>
				</div>
				<div class="sidebar-brand-text mx-3">語料管理系統</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<!--  
      <li class="nav-item active">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>儀表板</span></a>
      </li>
-->
			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">相關課表</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-file"></i> <span>課程表</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Course:</h6>
						<a class="collapse-item" href="index.jsp">維護課程表</a>
					</div>
				</div></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-home"></i> <span>處室表</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Office:</h6>
						<a class="collapse-item" href="RoomSchedule.jsp">維護處室表</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Dictionary</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<!--  
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>Pages</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Login Screens:</h6>
						<a class="collapse-item" href="login.html">Login</a> <a
							class="collapse-item" href="register.html">Register</a> <a
							class="collapse-item" href="forgot-password.html">Forgot
							Password</a>
						<div class="collapse-divider"></div>
						<h6 class="collapse-header">Other Pages:</h6>
						<a class="collapse-item" href="blank.html">Blank Page</a>
					</div>
				</div></li>
-->
			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="dictionary.html">
					<i class="fas fa-fw fa-chart-area"></i> <span>字典表</span>
			</a></li>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link"
				href="correctables.html"> <i class="fas fa-fw fa-table"></i> <span>模糊校正表</span></a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>



					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">



						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<!--  
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">你的名字
							</span> <i class="fas fa-user rounded-circle"></i>
						</a> 
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 個人資料
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 設定
								</a>

								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									登出
								</a>
							</div></li>
							-->
					</ul>

				</nav>
				<!-- End of Topbar -->



				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">維護處室表</h1>

					<!-- DataTales Example -->
					<div class="card-header py-3">


						<!--
  「data-backdrop="static"」 鎖定背景，點擊背景時不自動關閉視窗
  「fade」 淡入、淡出的轉場效果
  「modal-lg」視窗大小，如modal-lg、modal-md、modal-sm
  「data-dismiss="modal"」 關閉視窗
  「data-keyboard="true"」 是否用ESC鍵關閉，預設為true
-->
						<div id="ooo" class="modal inmodal fade" tabindex="-1"
							role="dialog" aria-hidden="true" data-backdrop="static"
							data-keyboard="true">
							<div class="modal-dialog modal-lg">
								<form action="office_add.jsp">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title text-center" id="myModalLabel"
												style="">新增處室表</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button>

										</div>
										<div class="modal-body">

											<!--  
											<div class="form-group">
												<label for="ClassID" class="col-form-label">編號(自動帶入)</label>
												<input type="text" class="form-control" id="ClassID">
											</div>
											-->
											<div class="form-group">
												<label for="ClassName" class="col-form-label">處室名稱</label> <input
													type="text" class="form-control" id="ClassName"
													name="officeName">
											</div>
											<div class="form-group">
												<label for="ClassName" class="col-form-label">大樓</label> <input
													type="text" class="form-control" id="ClassName"
													name="building">
											</div>
											<div class="form-group">
												<label for="ClassName" class="col-form-label">樓層</label> <input
													type="text" class="form-control" id="ClassName"
													name="floor">
											</div>
											<div class="form-group">
												<label for="ClassUpload" class="col-form-label">圖檔名稱</label>
												<input type="text" class="form-control" id="ClassUpload"
													name="picName">
											</div>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary">確定</button>
											<button type="cancel" class="btn btn-default"
												data-dismiss="modal">取消</button>
										</div>
									</div>
								</form>
							</div>
						</div>

						<!-- 新增教室課表 -->
						<div id="AddRoomModule" class="modal inmodal fade" tabindex="-1"
							role="dialog" aria-hidden="true" data-backdrop="static"
							data-keyboard="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title text-center" id="myModalLabel" style="">
											新增教室課表</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>

									</div>
									<div class="modal-body">
										<form>
											<!--  
											<div class="form-group">
												<label for="RoomID" class="col-form-label">編號(自動帶入)</label>
												<input type="text" class="form-control" id="RoomID">
											</div>
											-->
											<div class="form-group">
												<label for="RoomName" class="col-form-label">教室名稱</label> <input
													type="text" class="form-control" id="RoomName">
											</div>
											<div class="form-group">
												<label for="RoomImg" class="col-form-label">圖檔名稱</label> <input
													type="text" class="form-control" id="RoomImg">
											</div>
										</form>
									</div>


									<div class="modal-footer">
										<button type="button" class="btn btn-primary">確定</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">取消</button>
									</div>

								</div>
							</div>
						</div>

						<!-- 使用按鈕開啟  data-target-->
						<button type="button" class="btn btn-primary btn-icon-split"
							data-toggle="modal" data-target="#ooo">
							<span class="icon text-white-80"> <i
								class="fas fa-book-reader"></i> 新增處室表
							</span>
						</button>

						<button type="button" class="btn btn-primary btn-icon-split"
							data-toggle="modal" data-target="#AddRoomModule">
							<span class="icon text-white-80"> <i
								class="fas fa-book-reader"></i> 新增教室表
							</span>
						</button>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>編號</th>
											<th>處室名稱</th>
											<th>大樓</th>
											<th>樓層</th>
											<th>圖名</th>
											<th>操作</th>
										</tr>
									</thead>

									<tbody>
										<%
											try {
												Class.forName("com.mysql.jdbc.Driver");
												String url = "jdbc:mysql://localhost:3306/chihlee?characterEncoding=UTF-8";
												Connection con = DriverManager.getConnection(url, "chihlee", "Chihlee123!");
												if (con.isClosed()) {
													out.println("連線 MySQL 失敗!!");
												} else {

													String query = "select * from office";
													Statement st = con.createStatement();
													ResultSet rs = st.executeQuery(query);
													while (rs.next()) {
										%>
										<tr>
											<td><%=rs.getLong("id")%></td>
											<td><%=rs.getString("officeName")%></td>
											<td><%=rs.getString("building")%></td>
											<td><%=rs.getString("floor")%></td>
											<td><%=rs.getString("picName")%></td>
											<td>
												<!--  
												<button type="button"
													class="btn btn-primary btn-circle btn-sm"
													data-toggle="modal" data-target="#editModal">
													<i class="fas fa-edit"></i>
												</button>
												-->
												<button type="button"
													class="btn btn-danger btn-circle btn-sm"
													data-toggle="modal"
													data-target="#deleteModal<%=rs.getLong("id")%>">
													<i class="fas fa-trash"></i>
												</button>
												<div id="deleteModal<%=rs.getLong("id")%>"
													class="modal fade" tabindex="-1" role="dialog"
													style="display: none;">
													<div class="modal-dialog modal-sm" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h4 class="modal-title" id="myModalLabel" style="">
																	刪除處室表</h4>
																<button type="button" class="close" data-dismiss="modal"
																	aria-hidden="true">×</button>
															</div>
															<div class="modal-body">
																<form id="deleteForm" class="form-horizontal">
																	<div class="form-group">
																		<div class="col-md-12">
																			確定要刪除 <font color="red"><span id="deleteMsg"></span></font>
																			處室表
																		</div>
																		<div class="col-md-12">
																			<font color="red"><span id="deleteMsg2"></span></font>
																		</div>
																	</div>
																</form>
															</div>

															<div class="modal-footer">
																<div class="col-md-12">
																	<button type="button" id="deleteConfirm"
																		class="btn btn-primary">確定</button>
																	<button type="button" id="deleteCancel"
																		class="btn btn-primary" data-dismiss="modal">取消</button>
																</div>
															</div>
											</td>

											<%
												}
														rs.close();
													}
													con.close();
												} catch (Exception sExec) {
													out.println("SQL錯誤:" + sExec.toString());
												}
											%>
										
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Chihlee 2019</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



</body>

</html>
