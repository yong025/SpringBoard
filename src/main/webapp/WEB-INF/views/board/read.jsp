<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../includes/header.jsp"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Register Page</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Register Page v1</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <!-- left column -->
                <div class="col-md-12">
                    <!-- general form elements -->
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Board Read</h3>
                        </div>
                        <!-- /.card-header -->
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">BNO</label>
                                    <input type="text" name="bno" class="form-control" id="exampleInputEmail0" value="<c:out value="${boardDTO.bno}"></c:out>" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Title</label>
                                    <input type="text" name="title" class="form-control" id="exampleInputEmail1" value="<c:out value="${boardDTO.title}"></c:out>" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Writer</label>
                                    <input type="text" name="writer" class="form-control" id="exampleInputEmail2" value="<c:out value="${boardDTO.writer}"></c:out>" readonly>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <!-- textarea -->
                                        <div class="form-group">
                                            <label>Textarea</label>
                                            <textarea name="content" class="form-control" rows="3" disabled><c:out value="${boardDTO.content}"></c:out></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->

                            <div class="card-footer">
                                <button type="button" class="btn btn-default btnList">목록</button>
                                <button type="button" class="btn btn-info btnMod">수정/삭제</button>
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
        </div>
    </section>
</div>
<!-- /.content-wrapper -->

<form id="actionForm" action="/board/list" method="get">
    <input type="hidden" name="page" value="${pageRequestDTO.page}">
    <input type="hidden" name="size" value="${pageRequestDTO.size}">

    <c:if test="${pageRequestDTO.type != null}">
        <input type="hidden" name="type" value="${pageRequestDTO.type}">
        <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
    </c:if>
</form>
<%@include file="../includes/footer.jsp"%>

<script>

 const actionForm = document.querySelector("#actionForm")

 document.querySelector(".btnList").addEventListener("click",() => {
     actionForm.submit()
 },false)

 document.querySelector(".btnMod").addEventListener("click",() => {

     const bno = '${boardDTO.bno}'

     actionForm.setAttribute("action", "/board/modify")
     actionForm.innerHTML += `<input type='hidden' name='bno' value='\${bno}'>`
     actionForm.submit()
 },false)

</script>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script> <!-- Axios 추가 -->
<script src="/resources/js/reply.js"></script>  <!-- js파일 로딩(스크립트 파일 로딩) -->

<script>

    function after(result){
        console.log("after.....................")
        console.log("result", result)
    }

   // doA().then(result => console.log(result))

    // doB(after) //after()은 객체 after은 실행 결과

    // const reply = {bno:230, replyer:'user00', reply:'22222222222'}
    // doC(reply).then(result => console.log(result))

    // doD(112).then(result => console.log(result)) // async는 then과 함께 사용

    const reply = {rno:112, reply:"update reply text....."}
    doE(reply).then(result => console.log(result))

</script>


</body>
</html>