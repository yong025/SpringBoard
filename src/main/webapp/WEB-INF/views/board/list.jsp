<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../includes/header.jsp"%>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">List Page</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">List Page v1</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <!-- Small boxes (Stat box) -->

                <!-- Main row -->
                <div class="row">
                    <!-- Left col -->
                    <section class="col-lg-12">

                        <form class="card-header" action="/board/register">
                            <h3 class="card-title">Bordered Table</h3>
                            <div class="card-tools" action="/board/register">
                              <button type="submit" class="btn btn-primary">글쓰기</button>
                            </div>
                            </form>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th style="width: 10px">BNO</th>
                                    <th>TITLE</th>
                                    <th>WRITER</th>
                                    <th>REGDATE</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${dtoList}" var="dto">
                                <tr>
                                    <td><c:out value="${dto.bno}"></c:out></td>
                                    <td><a href="javascript:moveRead(${dto.bno})"><c:out value="${dto.title}"></c:out></a></td>
                                    <td><c:out value="${dto.writer}"></c:out></td>
                                    <td><c:out value="${dto.regDate}"></c:out></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <!--검색복사-->
                            <form action="/board/list" method="get">
                                <input type="hidden" name="page" value="1">
                                <input type="hidden" name="size" value="${pageMaker.size}">
                                <div class="col-sm-3">
                                    <!-- select -->
                                    <div class="form-group">
                                        <label>Search</label>
                                        <select name="type" class="custom-select">
                                            <option value="">------</option>
                                            <option value="T" ${pageRequestDTO.type == "T"?"select":""}>제목</option>
                                            <option value="C" ${pageRequestDTO.type == "C"?"select":""}>내용</option>
                                            <option value="TC" ${pageRequestDTO.type == "TC"?"select":""}>제목+내용</option>
                                            <option value="TCW" ${pageRequestDTO.type == "TCW"?"select":""}>제목+내용+작성자</option>
                                        </select>
                                    </div>
                                </div>
                            <div class="col-sm-9">
                            <div class="input-group input-group-sm">
                                <input type="text" class="form-control" name="keyword">
                                <span class="input-group-append">
                                     <button type="submit" class="btn btn-info btn-flat">검색</button>
                                </span>
                            </div>
                            </div>
                            </form>
                            <!--검색복사 끝-->
                        </div>
                        <!-- /.card-body -->


                        <div class="card-footer clearfix">
                            <ul class="pagination pagination-sm m-0 float-right">

                                <c:if test="${pageMaker.prev}">
                                <li class="page-item"><a class="page-link" href="javascript:movePage(${pageMaker.start - 1})")> << </a></li>
                                </c:if>
                                <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
                                <li class="page-item ${pageMaker.page == num?'active':''}"><a class="page-link" href="javascript:movePage(${num})">${num}</a></li>
                                </c:forEach>

                                <c:if test="${pageMaker.next}">
                                    <li class="page-item"><a class="page-link" href="javascript:movePage(${pageMaker.end + 1})"> >> </a></li>
                                </c:if>

                            </ul>
                        </div>
                    </section>
                </div>
            </div>
                <!-- /.card -->
                    </section>
                    <!-- /.Left col -->

                </div>
                <!-- /.row (main row) -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->



<!--modal임 -->
<div class="modal fade" id="modal-sm">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Small Modal</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>success</p>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<form id="actionForm" action="/board/list" method="get">
    <input type="hidden" name="page" value="${pageMaker.page}">
    <input type="hidden" name="size" value="${pageMaker.size}">

    <c:if test="${pageRequestDTO.type != null}">
        <input type="hidden" name="type" value="${pageRequestDTO.type}">
        <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
    </c:if>
</form>

   <%@include file="../includes/footer.jsp"%>

 <script>

     const actionForm = document.querySelector("#actionForm")

     const result = '${result}' //글작성하면 bno값 받음
         if(result && result !== ''){

             $('#modal-sm').modal('show')
             window.history.replaceState(null, '','/board/list');
         }

         function movePage(pageNum){

             actionForm.querySelector("input[name='page']").setAttribute("value", pageNum)
             actionForm.submit()

         }

         function moveRead(bno){

             actionForm.setAttribute("action", "/board/read") //actionForm이 read로 가도록 수정해야한다.
             actionForm.innerHTML += `<input type='hidden' name='bno' value='\${bno}'>`
             actionForm.submit()

         }

 </script>

</body>
</html>
