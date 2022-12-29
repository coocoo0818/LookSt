<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="prc"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SNS 댓글 입력</title>
<script type="text/javascript">
	/* 날짜 형식 포맷 */
	function formatDate(date) {
    
	    var d = new Date(date),
	    
	    month = '' + (d.getMonth() + 1) , 
	    day = '' + d.getDate(), 
	    year = d.getFullYear();
	    
	    if (month.length < 2) month = '0' + month; 
	    if (day.length < 2) day = '0' + day; 
	    
	    return [year, month, day].join('-');
    
    }

	function modalclick(e) {
		/* 모달창 오픈 */
		$('#exampleModal').modal('show')
		var post_no = $(e).children().attr("data-postNo");
		//[댓글]
		ReplyList(post_no);

	}
	
	$(document).ready(function(){	
		//댓글 게시 버튼을 눌렀을 때 그 click event를 아래처럼 jquery로 처리한다.
	    $('button.btn.btn-primary.mb-1.write_reply').on('click', function() {
	        console.log( 'post_no', $(this).attr('data-postNo') );
	        console.log( 'sns_comment_nick', '${myNickProfile.member_nick}' );
	        console.log( 'sns_comment_profile', '${myNickProfile.profile_img}' );
	        // 답글을 DB에 저장하는 함수를 호출한다. bno와 no를 같이 넘겨주어야한다.
	        WriteReply($(this).attr('data-postNo'), '${myNickProfile.member_nick}', '${myNickProfile.profile_img}' );
	    });
		
	});
	
	//게시물의 댓글 목록을 불러오는 함수입니다.
	const ReplyList = function(post_no) {
		
		$.ajax({
			url : '${contextPath}/admin/snsReplyList',
		    type : 'get',
		    data : {
		    	post_no : post_no
		    },
			success : function(data) {
				console.log("댓글 리스트 가져오기 성공");
				// 댓글 목록을 html로 담기
	            let listHtml = "";
	            for(const i in data){
	                let sns_comment_no = data[i].sns_comment_no;
	                let post_no = data[i].post_no;
	                let member_id = data[i].member_id;
	                let sns_comment_group = data[i].sns_comment_group;
	                let sns_comment_seq = data[i].sns_comment_seq;
	                let sns_comment_class = data[i].sns_comment_class;
	                let sns_comment_profile = data[i].sns_comment_profile;
	                let sns_comment_nick = data[i].sns_comment_nick;
	                let sns_comment_con = data[i].sns_comment_con;
	                let sns_comment_date = formatDate(data[i].sns_comment_date);
	                
	                console.log(data[i].sns_comment_con);
		            console.log(sns_comment_class);	// 모댓글일땐 0, 답글일땐 1
		            
		            listHtml += "<div class='row replyrow reply" + sns_comment_no + "'>";
		            
		            if(sns_comment_con == ""){		// 삭제된 댓글일때
	                    listHtml += "	<div>";
	                    listHtml += "		(삭제된 댓글입니다)";
	                    listHtml += "	</div>";
	                }else{
	                    if(sns_comment_class == 0){	// 모댓글일때
	                        listHtml += "	<div class='col-1'>";
	                        listHtml += "		<a href='${contextPath}/sns/snsProfile/?member_id="+member_id+"'> ";
	                        listHtml += "			<img class='reply_list_profileImage rounded-circle' style='width: 36px; height: 36px;' src='${contextPath}/resources/img/profile/"+ sns_comment_profile +"'/>";
	                        listHtml += "		</a> ";
	                        listHtml += "	</div>";
	                        listHtml += "	<div class='rereply-content col-8'>";
	                        listHtml += "		<div>";
	                        listHtml += "			<span>";
	                        listHtml += "				<b>"+ sns_comment_nick +"</b>";
	                        listHtml += "			</span>";
	                        listHtml += "			<span>";
	                        listHtml += 				sns_comment_con;
	                        listHtml += "			</span>";
	                        listHtml += "		</div>";
	                        // 현재 로그인 상태일때 답글작성 버튼이 나온다.
	                        if("${prc.username}" != ""){
	                            listHtml += "		<div>";
	                            // 함수에 게시글번호(bno), 모댓글번호(no), 모댓글 작성자(writer)를 인자로 담아서 넘긴다.
	                            // 이때 모댓글 작성자 writer는 string인데 string을 인자에 넣기 위해선''나""로 감싸줘야한다.
	                            // 여기선 ''와 ""가 이미 둘다 쓰이고 있는데  href를 감싸고 있는 ''와 겹치지 않는 ""를 \" 처리해서 넣어줬다.
	                            listHtml += "			<a href='#' class='write_reply_start text-decoration-none rounded' style='display: inline; color: #297dcb;' data-bs-toggle='collapse' data-bs-target='#re_reply"+ sns_comment_no +"' aria-expanded='false' aria-controls='collapseExample' sns_comment_group='"+sns_comment_group+"'>답글&nbsp;달기</a>";
	                            listHtml += "		</div>";
	                        }
	                        listHtml += "	</div>";
	
	                    }else{	// 답글일때
	                        listHtml += "	<div class='col-1'>"
	                        listHtml += "	</div>"
	                        listHtml += "	<div class='col-1'>";
	                        listHtml += "		<a href='${contextPath}/sns/snsProfile/?member_id="+member_id+"'> ";
	                        listHtml += "			<img class='reply_list_profileImage rounded-circle' style='width: 36px; height: 36px;' src='${contextPath}/resources/img/profile/"+ sns_comment_profile +"'/>";
	                        listHtml += "		</a> ";
	                        listHtml += "	</div>";
	                        listHtml += "	<div class='rereply-content"+ sns_comment_no +" col-7'>";
	                        listHtml += "		<div>";
	                        listHtml += "			<span>";
	                        listHtml += "				<b>"+ sns_comment_nick +"</b>";
	                        listHtml += "			</span>";
	                        listHtml += "			<span>";
	                        listHtml += 				sns_comment_con;
	                        listHtml += "			</span>";
	                        listHtml += "		</div>";
	
	                        listHtml += "	</div>";
	                    }
	
	                    listHtml += "	<div class='col-3 reply-right'>";
	                    listHtml += "		<div>";
	                    listHtml += 			sns_comment_date	;
	                    listHtml += "		</div>";
	                    // 책갈피
	                    // 현재 로그인 상태이고..
	                    if("${prc.username}" != ""){
	
	                        //현재 사용자가 이 댓글의 작성자일때 삭제 버튼이 나온다.
	                        if("${prc.username}" == member_id){
	                            listHtml += "		<div>";
	                            // 수정할 댓글의 no를 grpl과 함께 넘긴다. 
	                            // 모댓글 수정칸과 답글 수정칸을 화면에 다르게 나타내야하기 때문에 모댓글과 답글을 구분하는 grpl을 함께 넘겨주어야한다.
	                            //listHtml += "			<a href='javascript:' no='"+ no +"' grpl='"+ grpl +"' class='reply_modify'>수정</a>";
	                            //listHtml += "			&nbsp;|&nbsp;";
	                            // 삭제는 no만 넘겨주면 된다.
	                            listHtml += "			<a class='text-decoration-none reply_delete' href='javascript:' style='display: inline; color: #297dcb;' sns_comment_no='"+ sns_comment_no +"' sns_comment_class='"+ sns_comment_class + "' post_no='"+ post_no +"' sns_comment_group='"+ sns_comment_group +"'>삭제</a>";
	                            listHtml += "		</div>";
	                        }
	                    }
	
	                    listHtml += "	</div>";
	                    // 댓글에 답글달기를 누르면 답글입력란이 나온다.
	                    // ---- 답글입력란
	                    listHtml += "	<div class='collapse row rereply_write' id='re_reply"+ sns_comment_no +"'>";
	                    listHtml += "		<div class='col-1'>"
	                    listHtml += "		</div>"
	                    listHtml += "		<div class='col-1'>"
	                    listHtml += "			<a href='${contextPath}/sns/snsProfile/?member_id="+member_id+"'> ";
	                    listHtml += "				<img class='rounded-circle' id='write_reply_profileImage' style='width: 36px; height: 36px;' src='${contextPath}/resources/img/profile/${myNickProfile.profile_img}'/>"
	                    listHtml += "			</a> ";
	                    listHtml += "		</div>"
	                    listHtml += "		<div class='col-7'>"
	                    listHtml +=  "  		<input class='w-100 input_rereply_div form-control' id='input_rereply"+ sns_comment_no +"' type='text' placeholder='댓글입력...'>"
	                    listHtml += "		</div>"
	                    listHtml += "		<div class='col-3'>"
	                    // 답글달기 버튼이 눌리면 모댓글 번호(no)와 게시물번호(bno)를 함수에 전달한다.
	
	                    // 동적으로 넣은 html태그에서 발생하는 이벤트는 동적으로 처리해줘야한다 !!!!!
	                    // 예를들어, 동적으로 넣은 html태그에서 발생하는 click 이벤트는 html태그 안에서 onclick으로 처리하면 안되고, jquery에서 클래스명이나 id값으로 받아서 처리하도록 해야한다.
	                    // 아래코드를 보자~~~~
	                    // listHtml += "			<button onclick='javascript:WriteReReply("+ no +","+ bno +")' type='button' class='btn btn-success mb-1 write_rereply' >답글&nbsp;달기</button>"
	                    // 위 코드는 클릭되어도 값이 넘겨지지 않는다. 값이 undefined가 된다.
	                    // 아래코드처럼 짜야한다. click이벤트를 처리하지 않고 데이터(no, bno)만 속성으로 넘겨주도록 작성한다.
	                    listHtml += "			<button type='button' class='btn btn-primary mb-1 write_rereply rounded' sns_comment_no='" + sns_comment_no + "' post_no='" + post_no + "' sns_comment_nick='" + sns_comment_nick + "' sns_comment_profile='" + sns_comment_profile + "' sns_comment_group='"+ sns_comment_group +"'>답글&nbsp;달기</button>"
	                    listHtml += "		</div>";
	                    listHtml += "	</div>";
	                    // ---- 답글입력란 끝
	                }
	
	                listHtml += "</div>";
	
	            }
	          
	
	            ///////////// 동적으로 넣어준 html에 대한 이벤트 처리는 같은 함수내에서 다 해줘야한다.
	            ///////////// $(document).ready(function(){}); 안에 써주면 안된다.
	
	            // 댓글 리스트 부분에 받아온 댓글 리스트를 넣기
	            $(".reply-list"+post_no).html(listHtml);
	
	            // 답글에서 답글달기를 누르면 input란에 "@답글작성자"가 들어간다.
	            //$('.write_re_reply_start').on('click', function(){
	            //	$('#input_rereply'+ $(this).attr('no')).val("@"+$(this).attr('writer')+" ");
	            //});
	
	            //답글을 작성한 후 답글달기 버튼을 눌렀을 때 그 click event를 아래처럼 jquery로 처리한다.
	            $('button.btn.btn-primary.mb-1.write_rereply').on( 'click', function() {
	                console.log( 'sns_comment_no', $(this).attr('sns_comment_no') );
	                console.log( 'post_no', $(this).attr('post_no') );
	                console.log( 'sns_comment_nick', '${myNickProfile.member_nick}' );
	                console.log( 'sns_comment_profile', '${myNickProfile.profile_img}' );
	
	                // 답글을 DB에 저장하는 함수를 호출한다. bno와 no를 같이 넘겨주어야한다.
	                WriteRereply($(this).attr('post_no'), $(this).attr('sns_comment_no'), '${myNickProfile.member_nick}', '${myNickProfile.profile_img}', $(this).attr('sns_comment_group'));
	            });
	
	         	// 삭제버튼을 클릭했을 때
	            $('.reply_delete').on('click', function(){
	                // 모댓글 삭제일때
	                if($(this).attr('sns_comment_class') == 0){	
	                    DeleteReply($(this).attr('sns_comment_no'), $(this).attr('post_no'), $(this).attr('sns_comment_group'));

	                // 답글 삭제일때
	                }else{
	                    DeleteReReply($(this).attr('sns_comment_no'), $(this).attr('post_no'), $(this).attr('sns_comment_group'));
	                }

	            })
	
	
	        },
	     	error : function() {
	         alert('서버 에러');
	     	}
		})
	}
	
	// 답글 달기 버튼 클릭시  실행 - 답글 저장, 댓글 갯수 가져오기
	const WriteReply = function(post_no, sns_comment_nick, sns_comment_profile) {

	    console.log(post_no);
	    console.log(sns_comment_nick);
	    console.log(sns_comment_profile);

	    // 댓글 입력란의 내용을 가져온다. 
	    // ||"" 를 붙인 이유  => 앞뒤 공백을 제거한다.(띄어쓰기만 입력했을때 댓글작성안되게 처리하기위함)
	    let sns_comment_con = $("#input_reply"+post_no).val();
	    sns_comment_con = sns_comment_con.trim();
	    console.log(sns_comment_con);

	    if(sns_comment_con == ""){	// 입력된게 없을때
	        alert("글을 입력하세요!");
	    }else{	
	        // 입력란 비우기
	        $("#input_reply"+post_no).val("");

	        // reply+1 하고 그 값을 가져옴
	        $.ajax({
	            url : '${contextPath}/admin/PostWriteReply',
	            type : 'get',
	            data : {
	            	post_no : post_no,
	            	sns_comment_con : sns_comment_con,
	            	sns_comment_profile : sns_comment_profile,
	            	sns_comment_nick : sns_comment_nick
	            },
	            success : function(pto) {

	                let reply = pto.reply;
	                // 페이지, 모달창에 댓글수 갱신
	                $('#m_reply'+post_no).text(reply);//
	                $('#reply'+post_no).text(reply);

	                console.log("댓글 작성 성공");

	                // 게시물 번호(bno)에 해당하는 댓글리스트를 새로 받아오기
	                ReplyList(post_no);
	            },
	            error : function() {
	                alert('서버 에러');
	            }
	        });

	    };
	};
	
	// 답글 달기 버튼 클릭시  실행 - 답글 저장, 댓글 갯수 가져오기
	const WriteRereply = function(post_no,sns_comment_no, sns_comment_nick, sns_comment_profile, sns_comment_group) {

	    console.log(post_no);
	    console.log(sns_comment_no);
	    console.log(sns_comment_nick);
	    console.log(sns_comment_profile);
	    console.log(sns_comment_group);
	    
	    console.log($("#input_rereply" + sns_comment_no).val());

	    // 댓글 입력란의 내용을 가져온다. 
	    // ||"" 를 붙인 이유  => 앞뒤 공백을 제거한다.(띄어쓰기만 입력했을때 댓글작성안되게 처리하기위함)
	    let content = $("#input_rereply" + sns_comment_no).val();
	    sns_comment_con = content.trim();


	    if(sns_comment_con == ""){	// 입력된게 없을때
	        alert("글을 입력하세요!");
	    }else{	
	        // 입력란 비우기
	        $("#input_rereply" + sns_comment_no).val("");

	        // reply+1 하고 그 값을 가져옴
	        $.ajax({
	            url : '${contextPath}/admin/PostWriteRereply',
	            type : 'get',
	            data : {
	            	sns_comment_no : sns_comment_no,
	            	post_no : post_no,
	            	sns_comment_con : sns_comment_con,
	            	sns_comment_profile : sns_comment_profile,
	            	sns_comment_nick : sns_comment_nick,
	            	sns_comment_group : sns_comment_group
	            },
	            success : function(pto) {

	                let reply = pto.reply;
	                // 페이지, 모달창에 댓글수 갱신
	                $('#m_reply'+post_no).text(reply);//
	                $('#reply'+post_no).text(reply);

	                console.log("답글 작성 성공");

	                // 게시물 번호(bno)에 해당하는 댓글리스트를 새로 받아오기
	                ReplyList(post_no);
	            },
	            error : function() {
	                alert('서버 에러');
	            }
	        });

	    };
	};

	// 모댓글 삭제일때
	const DeleteReply = function(sns_comment_no, post_no, sns_comment_group){
		
		console.log("sns_comment_no : " + sns_comment_no);
	    // grp이 no인 댓글이 있는 경우 content에 null을 넣고 없으면 삭제한다.
	    $.ajax({
	        url : '${contextPath}/admin/postDeleteReply',
	        type : 'get',
	        data : {
	        	sns_comment_no : sns_comment_no,
	        	post_no : post_no,
	        	sns_comment_group : sns_comment_group
	        },
	        success : function(pto) {

	            let reply = pto.reply;

	            // 페이지, 모달창에 댓글수 갱신
	            $('#m_reply'+post_no).text(reply);
	            $('#reply'+post_no).text(reply);

	            console.log("모댓글 삭제 성공");

	            // 게시물 번호(post_no)에 해당하는 댓글리스트를 새로 받아오기
	            ReplyList(post_no);
	        },
	        error : function() {
	            alert('서버 에러');
	        }
	    });
	};

	// 답글 삭제일때
	const DeleteReReply = function(sns_comment_no, post_no, sns_comment_group){

	    console.log("sns_comment_group : " + sns_comment_group);

	    // 답글을 삭제한다.
	    $.ajax({
	        url : '${contextPath}/admin/postDeleteRereply',
	        type : 'get',
	        data : {
	        	sns_comment_no : sns_comment_no,
	            post_no : post_no,
	            sns_comment_group : sns_comment_group
	        },
	        success : function(pto) {

	            let reply = pto.reply;

	            // 페이지, 모달창에 댓글수 갱신
	            $('#m_reply'+post_no).text(reply);
	            $('#reply'+post_no).text(reply);

	            console.log("답글 삭제 성공");

	            // 게시물 번호(bno)에 해당하는 댓글리스트를 새로 받아오기
	            ReplyList(post_no);
	        },
	        error : function() {
	            alert('서버 에러');
	        }
	    });

	};
</script>
</head>
<body>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">댓글</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<section class="modal-section">
					<div class="modal-body">
						<!-- 댓글 목록 -->
			            <div class="reply-list reply-list${snsDetailClick.NPostDto.post_no}">
			            <!-- 댓글이 목록이 들어가는 곳 -->
			            </div>
					</div>
					
					<div class="card card-body">
			            <!-- 댓글 작성 => 로그인한 상태여야만 댓글작성 칸이 나온다. -->
			            <c:if test="${not empty prc.username}">
			                <div class="row reply_write">
			                    <div class="col-1">
			                        <a href="${contextPath}/sns/snsProfile/?member_id=${prc.username}">
			                            <img class="rounded-circle" id="write_reply_profileImage"  style="width: 36px; height: 36px;" src="${contextPath}/resources/img/profile/${myNickProfile.profile_img}" />
			                        </a>
			                    </div>
			                    <div class="col-8" class="input_reply_div">
			                        <input class="w-100 form-control" id="input_reply${snsDetailClick.NPostDto.post_no}" type="text" placeholder="댓글입력...">
			                    </div>
			                    <div class="col-3 ">
			                        <button type="button" idx="${snsDetailClick.NPostDto.post_no}" data-postNo="${snsDetailClick.NPostDto.post_no}" class="btn btn-primary mb-1 write_reply rounded">게시</button>
			                    </div>
			                </div>
			            </c:if>
			        </div>
		        </section>
			</div>
		</div>
	</div>
</body>
</html>