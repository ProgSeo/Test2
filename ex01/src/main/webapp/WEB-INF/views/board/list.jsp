<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Bootstrap Admin Theme</title>


<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<div id="page-wrapper">
		<%@include file="../includes/header.jsp"%>
		<script type="text/javascript">
			$(document).ready(
					function() {
						var result = '<c:out value="${result}"/>';
						
						checkModal(result);

						history.replaceState({}, null, null);
						
						console.log(history.state);
						function checkModal(result) {
							if (result == '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
							}

							$("#myModal").modal("show");
						};
						
						$("#regBtn").on("click", function(){
							self.location = "/board/register";
						});
						
						var actionForm = $("#actionForm");
						
						
						
						$(".paginate_button a").on("click", function(e){
							e.preventDefault();
							
							console.log("click");
							
							actionForm.find("input[name='pageNum']").val($(this).attr("href"));
							actionForm.submit();
						});
						
						// detail Page 
						$(".move").on("click", function(e){
							e.preventDefault();
							
							actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
							actionForm.attr("action", "/board/get");
							actionForm.submit();
						});
						
						var searchForm = $("#searchForm");
						
						$("#searchForm button").on("click", function(e){
							if(!searchForm.find("option:selected").val()){
								alert("검색종류를 선택하세요");
								return false;
							}
							
							if(!searchForm.find("input[name='keyword']").val()){
								alert("키워드를 입력하세요");
								return false;
							}
							
							searchForm.find("input[name='pageNum']").val("1");
							e.preventDefault();
							
							searchForm.submit();
						});
					})
		</script>
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Tables</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Board List Page
					<button id='regBtn' type="button" class="btn btn-xs pull-right">Register New Board</button>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<th>#번호</th>
								<th>제목</th>
								<th>내용</th>
								<th>작성일</th>
								<th>수정일</th>
							</thead>

							<c:forEach items="${list}" var="board">
								<tr>
									<td><c:out value="${board.bno }" /></td>
									<td><a class='move' href="<c:out value='${board.bno }'/>">
									<c:out value="${board.title }" /></a></td>
									<td><c:out value="${board.content }" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${board.regdate }" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${board.updatedate }" /></td>
								</tr>
							</c:forEach>
						</table>

						<!-- 검색 처리 -->
					<div class='row'>
						<div class="col-lg-12">
							<form id='seachForm' action="/board/list" method='get'>
								<select name='type'>
									<option value=""
										<c:out value="${pageMaker.cri.type == null ? 'selected':'' }"/>>--</option>
									<option value="T"
										<c:out value="${pageMaker.cri.type eq 'T' ? 'selected':'' }"/>>제목</option>
									<option value="C"
										<c:out value="${pageMaker.cri.type eq 'C' ? 'selected':'' }"/>>내용</option>
									<option value="W"
										<c:out value="${pageMaker.cri.type eq 'W' ? 'selected':'' }"/>>작성자</option>
									<option value="TC"
										<c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':'' }"/>>제목 or 내용</option>
									<option value="TW"
										<c:out value="${pageMaker.cri.type eq 'TW' ? 'selected':'' }"/>>제목 or 작성자</option>
									<option value="TWC"
										<c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected':'' }"/>>제목 or 작성자 or 내용</option>
								</select>
								<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'></input>
								<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum }"/> '></input>
								<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount }"/> '></input>
								<button class='btn btn-defalut'>Search</button>
							</form>
						</div>
					</div>
						
						<!-- 페이징 처리 -->
						<div class='pull-right'>
							<ul class="pagination">
								<c:if test="${pageMaker.prev }">
									<li class="paginate_button previous"><a href="${pageMaker.startPage - 1 }">Previous</a></li>
								</c:if>
								<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
									<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':'' }"><a href="${num }">${num }</a></li>
								</c:forEach>	
								<c:if test="${pageMaker.next }">
									<li class="paginate_button previous"><a href="${pageMaker.endPage +1 }">Next</a></li>
								</c:if>
							</ul>
						</div>
						<!-- 페이징 처리 끝 -->
						<form id="actionForm" action="/board/list" method="get">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
							<input type="hidden" name="type" value="<c:out value='${pageMaker.cri.type }'/>">
							<input type="hidden" name="keyword" value="<c:out value='${pageMaker.cri.keyword }'/>">
						</form>
						<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h4 class="modal-title" id="myModalLabel">Modal title</h4>
									</div>
									<div class="modal-body">처리가 완료되었습니다.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary">Save
											changes</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->

					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /#page-wrapper -->
	<%@include file="../includes/footer.jsp"%>
	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
	<script
		src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/resources/dist/js/sb-admin-2.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script type="text/javascript">
	$(document).ready(function(){
		var actionForm = $("#actionForm");
		
		console.log(actionForm.find("input[name='bno']"));
	})
	
	</script>
</body>

</html>
