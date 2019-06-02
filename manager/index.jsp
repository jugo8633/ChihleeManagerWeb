<%@ page contentType="text/html; charset=utf-8" language="java"
	session="false"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Arrays"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>

<!DOCTYPE html>
<html lang="utf8">

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



			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">相關課表</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span>課程表</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Components:</h6>
						<a class="collapse-item" href="ClassSchedule.html">維護課程表</a>
					</div>
				</div></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>處室表</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Utilities:</h6>
						<a class="collapse-item" href="RoomSchedule.html">維護處室表</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Addons</div>

			<!-- Nav Item - Pages Collapse Menu -->
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
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">你的名字
							</span> <i class="fas fa-user rounded-circle"></i>
						</a> <!-- Dropdown - User Information -->
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

					</ul>

				</nav>
				<!-- End of Topbar -->



				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">維護課程表</h1>

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
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title text-center" id="myModalLabel" style="">
											新增課表</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>

									</div>
									<div class="modal-body">
										<form>
											<div class="form-group">
												<label for="ClassID" class="col-form-label">編號(自動帶入)</label>
												<input type="text" class="form-control" id="ClassID">
											</div>
											<div class="form-group">
												<label for="ClassName" class="col-form-label">課程名稱(請選擇)</label>
												<input type="text" class="form-control" id="ClassName">
											</div>
											<div class="form-group">
												<label for="ClassTime" class="col-form-label">授課時間</label> <input
													type="text" class="form-control" id="ClassTime">
											</div>
											<div class="form-group">
												<label for="ClassNum" class="col-form-label">節次</label> <select
													class="form-control" id="ClassNum">
													<option>一</option>
													<option>二</option>
													<option>三</option>
													<option>四</option>
													<option>五</option>
													<option>六</option>
												</select>

											</div>
											<div class="form-group">
												<label for="ClassTeacher" class="col-form-label">授課老師(請選擇)</label>
												<select class="form-control" id="ClassTeacher">
													<option selected="selected" value="">陳文雄</option>
													<option selected="selected" value="">劉福音</option>
													<option selected="selected" value="">陳瑛琪</option>
													<option selected="selected" value="">林曉雯</option>
													<option selected="selected" value="">陳光澄</option>
													<option selected="selected" value="">蘇啟鴻</option>
													<option selected="selected" value="">林政錦</option>
													<option selected="selected" value="">呂崇富</option>
													<option selected="selected" value="">王德華</option>
													<option selected="selected" value="">郭景致</option>
													<option selected="selected" value="">曲莉莉</option>
													<option selected="selected" value="">林裕淇</option>
													<option selected="selected" value="">潘志雄</option>
													<option selected="selected" value="">劉勇麟</option>
													<option selected="selected" value="">張翰軒</option>
													<option selected="selected" value="">張慧</option>
													<option selected="selected" value="">高楊達</option>
													<option selected="selected" value="">蔡殿偉</option>
													<option selected="selected" value="">趙士賓</option>
													<option selected="selected" value="">陳冠燁</option>
													<option selected="selected" value="">林紹胤</option>
												</select>
											</div>
											<div class="form-group">
												<label for="ClassPlace" class="col-form-label">授課地點(請選擇)</label>

												<select class="form-control" id="ClassPlace">
													<option value="">A樓</option>
													<option value="">B樓</option>
													<option value="">C樓</option>
												</select>
											</div>
											<div class="form-group">
												<label for="ClassScore" class="col-form-label">學分數</label> <select
													class="form-control" id="ClassScore">
													<option>1</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
													<option>6</option>
												</select>

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

						<!-- 新增授課老師課表 -->
						<div id="yyy" class="modal inmodal fade" tabindex="-1"
							role="dialog" aria-hidden="true" data-backdrop="static"
							data-keyboard="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title text-center" id="myModalLabel" style="">
											新增授課課表</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>

									</div>
									<div class="modal-body">
										<form>
											<div class="form-group">
												<label for="TeacherID" class="col-form-label">編號(自動帶入)</label>
												<input type="text" class="form-control" id="TeacherID">
											</div>
											<div class="form-group">
												<label for="TeacherName" class="col-form-label">授課老師名稱</label>
												<input type="text" class="form-control" id="TeacherName">
											</div>
											<div class="form-group">
												<label for="TeacherImg" class="col-form-label">圖檔名稱</label>
												<input type="file" class="form-control" id="TeacherImg">
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
							<span class="icon text-white-80"> <i class="fas fa-flag"></i>
								新增課表
							</span>
						</button>

						<button type="button" class="btn btn-primary btn-icon-split"
							data-toggle="modal" data-target="#yyy">
							<span class="icon text-white-80">新增授課老師</span>
						</button>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>編號</th>
											<th>課程名稱</th>
											<th>授課時間</th>
											<th>節次</th>
											<th>授課老師</th>
											<th>授課地點</th>
											<th>學分數</th>
											<th>操作</th>
										</tr>
									</thead>

									<tbody>
										<%
											try {
												Class.forName("com.mysql.jdbc.Driver");
												String url = "jdbc:mysql://localhost:3306/chihlee";
												Connection con = DriverManager.getConnection(url, "chihlee", "Chihlee123!");
												if (con.isClosed()) {
													out.println("連線 MySQL 失敗!!");
												} else {
													
													String query = "select * from course";

													Statement st = con.createStatement();
													ResultSet rs = st.executeQuery(query);
													out.println("Records for Database");
													while (rs.next()) {
										%>

										<tr>
											<td><%=rs.getLong("id")%></td>
											<td><%=rs.getString("courseName")%></td>
											<td>每週<%=rs.getString("weekDay")%></td>
											<td>第<%=rs.getString("number")%>節</td>
											<td><%=rs.getString("teacher")%></td>
											<td><%=rs.getString("place")%></td>
											<td>3</td>
											<td>

												<button type="button"
													class="btn btn-primary btn-circle btn-sm"
													data-toggle="modal" data-target="#editModal">
													<i class="fas fa-edit"></i>
												</button>

												<button type="button"
													class="btn btn-danger btn-circle btn-sm"
													data-toggle="modal" data-target="#deleteModal">
													<i class="fas fa-trash"></i>
												</button>
												<div id="deleteModal" class="modal fade" tabindex="-1"
													role="dialog" style="display: none;">
													<div class="modal-dialog modal-sm" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h4 class="modal-title" id="myModalLabel" style="">
																	刪除課表</h4>
																<button type="button" class="close" data-dismiss="modal"
																	aria-hidden="true">×</button>
															</div>
															<div class="modal-body">
																<form id="deleteForm" class="form-horizontal">
																	<div class="form-group">
																		<div class="col-md-12">
																			確定要刪除 <font color="red"><span id="deleteMsg"></span></font>
																			課表
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

														</div>
													</div>
												</div>
											</td>
										</tr>

										<%
											out.println(rs.getLong("id"));
														out.println(rs.getString(1));
														out.println(rs.getString(2));
													}
												}
												con.close();
											} catch (Exception sExec) {
												out.println("SQL錯誤:" + sExec.toString());
											}
										%>


										<tr>
											<td>2</td>
											<td>Accountant</td>
											<td>Tokyo</td>
											<td>63</td>
											<td>2011/07/25</td>
											<td>$170,750</td>
											<td>3</td>
											<td>

												<button type="button"
													class="btn btn-primary btn-circle btn-sm"
													data-toggle="modal" data-target="#editModal">
													<i class="fas fa-edit"></i>
												</button>

												<button type="button"
													class="btn btn-danger btn-circle btn-sm"
													data-toggle="modal" data-target="#deleteModal">
													<i class="fas fa-trash"></i>
												</button>
												<div id="deleteModal" class="modal fade" tabindex="-1"
													role="dialog" style="display: none;">
													<div class="modal-dialog modal-sm" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h4 class="modal-title" id="myModalLabel" style="">
																	刪除課表</h4>
																<button type="button" class="close" data-dismiss="modal"
																	aria-hidden="true">×</button>
															</div>
															<div class="modal-body">
																<form id="deleteForm" class="form-horizontal">
																	<div class="form-group">
																		<div class="col-md-12">
																			確定要刪除 <font color="red"><span id="deleteMsg"></span></font>
																			課表
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

														</div>
													</div>
												</div>
											</td>
										</tr>

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
						<span>Copyright &copy; Your Website 2019</span>
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
