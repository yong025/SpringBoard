<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../includes/header.jsp" %>
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
                                <input type="text" name="bno" class="form-control" id="exampleInputEmail0"
                                       value="<c:out value="${boardDTO.bno}"></c:out>" readonly>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Title</label>
                                <input type="text" name="title" class="form-control" id="exampleInputEmail1"
                                       value="<c:out value="${boardDTO.title}"></c:out>" readonly>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Writer</label>
                                <input type="text" name="writer" class="form-control" id="exampleInputEmail2"
                                       value="<c:out value="${boardDTO.writer}"></c:out>" readonly>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <!-- textarea -->
                                    <div class="form-group">
                                        <label>Textarea</label>
                                        <textarea name="content" class="form-control" rows="3" disabled><c:out
                                                value="${boardDTO.content}"></c:out></textarea>
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

                        <!-- DIRECT CHAT -->
                        <div class="card direct-chat direct-chat-primary">
                            <div class="card-header">
                                <h3 class="card-title">Replies</h3>

                                <div class="card-tools">
                                    <span title="3 New Messages" class="badge badge-primary addReplyBtn">ADD Reply</span>
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                    <button type="button" class="btn btn-tool" title="Contacts"
                                            data-widget="chat-pane-toggle">
                                        <i class="fas fa-comments"></i>
                                    </button>
                                    <button type="button" class="btn btn-tool" data-card-widget="remove">
                                        <i class="fas fa-times"></i>
                                    </button>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <!-- Conversations are loaded here -->
                                <div class="direct-chat-messages">
                                    <!-- Message. Default to the left -->  <!-- foreach안쓰고 이 자체가 template가 되야함.-->

                                        <div class="direct-chat-text">
                                            Is this template really for free? That's unbelievable!
                                        </div>
                                        <!-- /.direct-chat-text -->
                                    </div>
                                    <!-- /.direct-chat-msg -->
                                </div>
                            </div>
                            <!--/.direct-chat -->
                        </div>
                    </div>
                </div>
            </div>
    </section>
    </section>
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
               <input type="text" name="replyer">
                <input type="text" name="reply">
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary operBtn">Save changes</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div class="modal fade" id="modal-lg">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Modify/Remove</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="rno">
                <input type="text" name="replyerMod">
                <input type="text" name="replyMod">

            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-info btnModReply">Modify</button>
                <button type="button" class="btn btn-danger btnRem">Remove</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<form id="actionForm" action="/board/list" method="get">
    <input type="hidden" name="page" value="${pageRequestDTO.page}">
    <input type="hidden" name="size" value="${pageRequestDTO.size}">

    <c:if test="${pageRequestDTO.type != null}">
        <input type="hidden" name="type" value="${pageRequestDTO.type}">
        <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
    </c:if>
</form>
<%@include file="../includes/footer.jsp" %>

<script>

    const actionForm = document.querySelector("#actionForm")

    document.querySelector(".btnList").addEventListener("click", () => {
        actionForm.submit()
    }, false)

    document.querySelector(".btnMod").addEventListener("click", () => {

        const bno = '${boardDTO.bno}'

        actionForm.setAttribute("action", "/board/modify")
        actionForm.innerHTML += `<input type='hidden' name='bno' value='\${bno}'>`
        actionForm.submit()
    }, false)

</script>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/reply.js"></script>

<script>

    function after(result) {
        console.log("after.........................")
        console.log("result", result)
    }

    // doA().then(result => console.log(result)) //doA실행 후에 결과값을 매개로 콘솔(result)찍어라.
    //
    // doB(after)//after()은 객체 after은 실행 결과

    // const replyobj = {bno:211,replyer:'user00',reply:'hahahahahaha'}
    // doC(replyobj).then(result => console.log(result))

    // doD(214).then(result => console.log(result))

    // const reply = {rno:112, reply:"Update reply text"} //원하는 댓글 번호 그리고 수정 내용
    // doE(reply).then(result => console.log(result))

    function getList() {
        //즉시실행함수 사용하지 않은 이유 - 댓글 추가하는 사이 다른사람이 댓글을 추가/삭제한다면 수정된 목록을 다시 가져와야 함.(비효율)
        //모두 만들고 마지막에 목록을 가져오는것이 효율적
        const target = document.querySelector(".direct-chat-messages")

        const bno = '${boardDTO.bno}'

        function convertTemp(replyObj) {

            console.log(replyObj)

            const {rno,bno,reply,replyer,replyDate,modDate}  = {...replyObj}

            const temp =`<div class="direct-chat-msg">
                <div class="direct-chat-infos clearfix">
                    <span class="direct-chat-name float-left">\${rno}--\${replyer}</span>
                    <span class="direct-chat-timestamp float-right">\${replyDate}</span>
                </div>
                <div class="direct-chat-text" data-rno='\${rno}' data-replyer='\${replyer}' data-bno='\${bno}'>\${reply}</div>
            </div>`

            return temp

        }

        getReplyList(bno).then(data => {
            console.log(data) // array
            let str ="";

            data.forEach(reply => {
                str += convertTemp(reply)
            })
            target.innerHTML = str
        })
    }

    //최조실행만 즉시실행함수(처음 들어갈 시 댓글 리스트)
    (function () {
        getList()
    })()


    const modalDiv = $("#modal-sm")

    let oper = "";

    document.querySelector(".addReplyBtn").addEventListener("click", function (){
        oper = 'add'

        modalDiv.modal('show')

    },false)

    document.querySelector(".operBtn").addEventListener("click", function () {

        const bno = '${boardDTO.bno}'
        const replyer = document.querySelector("input[name='replyer']").value
        const reply = document.querySelector("input[name='reply']").value

        if(oper === 'add'){
            const replyObj = {bno, replyer, reply} //{bno:bno, replyer:replyer, reply:reply}
            console.log(replyObj)
            addReply(replyObj).then(result => {
                getList()
                modalDiv.modal('hide')
                document.querySelector("input[name='replyer']").value = ""
                document.querySelector("input[name='reply']").value = ""
            })
        }
    },false)


    //수정 / 삭제 DOM
    const modModal = $("#modal-lg")//Jquery 용어

    const modReplyer = document.querySelector("input[name='replyerMod']")
    const modReply = document.querySelector("input[name='replyMod']")
    const modRno = document.querySelector("input[name='rno']")

        document.querySelector(".direct-chat-messages").addEventListener("click", (e) => {

            const target = e.target
            const bno = '${boardDTO.bno}'

            if(target.matches(".direct-chat-text")){
                const rno = target.getAttribute("data-rno")
                const replyer = target.getAttribute("data-replyer")
                const  reply = target.innerHTML
                console.log(rno,replyer,reply,bno)
                modRno.value = rno
                modReply.value = reply
                modReplyer.value = replyer

                document.querySelector(".btnRem").setAttribute("data-rno", rno) //btnRem을 누를때 rno값을 함께 준다.

                modModal.modal('show')

            }
        },false)

    document.querySelector(".btnRem").addEventListener("click", (e) => {
        const rno = e.target.getAttribute("data-rno")
        // alert(rno)
        removeReply(rno).then(result => {
            getList()
            modModal.modal('hide')
        })
    },false)

    document.querySelector(".btnModReply").addEventListener("click", (e) => {
        const replyObj = { rno: modRno.value  , reply: modReply.value }

        console.log(replyObj)

        modifyReply(replyObj).then(result => {
            getList()
            modModal.modal('hide')
        })

    },false)

</script>

</body>
</html>