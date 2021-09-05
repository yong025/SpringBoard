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
                            <h3 class="card-title">Board Register</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form id="form3">
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Title</label>
                                    <input type="text" name="title" class="form-control" id="exampleInputEmail1" placeholder="Enter Title">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Writer</label>
                                    <input type="text" name="writer" class="form-control" id="exampleInputEmail2" placeholder="Enter Writer">
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <!-- textarea -->
                                        <div class="form-group">
                                            <label>Textarea</label>
                                            <textarea name="content" class="form-control" rows="3" placeholder="Enter ..."></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->

                            <div class="card-footer">
                                <button type="submit" class="btn btn-danger btnReg">Submit</button>
                                <button type="submit" class="btn btn-primary btnList">목록</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </section>
</div>
<!-- /.content-wrapper -->
<%@include file="../includes/footer.jsp"%>


<script>

    const form = document.querySelector("#form3")

    document.querySelector(".btnList").addEventListener("click",(e) => {
        e.preventDefault()
        e.stopPropagation()
        // window.location = "/board/list"
        form.setAttribute("action","/board/list")
        form.setAttribute("method","get")

        const arr = form.querySelectorAll(".form-group")

        for(let i=0; i < arr.length; i++){

            arr[i].remove()

        }

        form.submit()

    }, false)

    document.querySelector(".btnReg").addEventListener("click",(e) => {
        e.preventDefault()
        e.stopPropagation()

        form.setAttribute("action","/board/register")
        form.setAttribute("method","post")
        form.submit()

    }, false)

</script>
</body>
</html>