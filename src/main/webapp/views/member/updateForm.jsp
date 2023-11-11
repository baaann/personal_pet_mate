<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Latest compiled and minified CSS -->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 <!-- jQuery library -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
 <!-- Popper JS -->
 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
 <!-- Latest compiled JavaScript -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>

  /*기본정보 css영역*/
  .basicInfo{

    border: 2px black;  /* 네모칸이 안생김 */
    
    width: 1300px;
  }
  .basicInfo tr{
    height: 70px;
  }
  .basicInfo td, .addInfo td {
    width: 1300px;
    padding-left: 20px;
  }
  
  /*추가정보 css영역*/
  .addInfo{
     width: 1300px;
  }
  .addInfo tr{
  	height: 70px;
  }
  #coreName{
    width: 300px;
    background-color: #F0F0F0;
  }
  .basicInfo>table>tr, .addInfo>table>tr{   /* 테이블 tr마다 구분지어주기 */
    border: 1px black;
  }

 /*회원탈퇴 버튼 위치*/
 	#deleteButton{
 	margin left: 600px;
 }

</style>


</head>
<body>
      <%@include file="../common/menubar.jsp"%>
	<!-- 내정보 나타낸후에 form태그를 이용해서 수정서블렛으로 보내주기 -->
  <div class="wrap" > 
  <form action="<%=contextPath%>/pet.updateInfo" method="post">  
    <fieldset id="update-form">
      <h2>PERSONAL PET-MATE <br> 회원 정보 수정</h2>
      <br>

    
    <div class="basicInfo">
      <h3>기본정보</h3>
    <table class="" border="1">
    
      <tbody>
      <tr>
        <th id="coreName">아이디 </th>
      	<td><input type="text" class="input-area" id="userId" name="userId" value="${loginUser.userId }" readonly> </td> <!-- 메뉴바에있는 loginUser를 이용해서 기존정보나타내기 -->	   
      </tr>

     <tr>
   		<th id="coreName">비밀번호</th>
 	 	<td>
 	 		<input type="password" class="input-area" id="userPwd" name="userPwd" value="${loginUser.userPwd }" readonly>
 	 		
 	 	</td> 
 	 	
    </tr>
    
     <tr>
   	   <th id="coreName">이름</th>
  	   <td><input type="text" class="input-area" id="userName" name="userName" value="${loginUser.userName }" required></td>
    </tr>

    <tr>
      <th id="coreName">성별</th>
  	<td>
   		<input type="radio" name="gender" id="gen" value="남"><label for="gen">남</label> 
   		<input type="radio" name="gender" id="gen" value="여"><label for="gen">여</label> 
  	</td>
  </tr>

  <tr>
  	 <th id="coreName">휴대전화</th>
 	 <td>
  		<input type="text" class="input-area" id="phone" name="phone" value="${loginUser.phone}"> 
 	 </td>
  </tr>
  
			 	<!-- 이메일 @를 기준으로 나눠주기 -->
			 	<c:set var="parts" value ="${fn:split(loginUser.email,'@')}"></c:set>
			 	
			 	<tr>
                 	 <th id="coreName">이메일</th>
               	 		  <td class="rest" colspan="4">    
                  			  <c:choose>
						            <c:when test="${loginUser.email != null}">
						                <input type="text" id="emailId" name="emailId" style="width: 120px;" value="${parts[0] }">
						                @
						                <input type="text" id="domain" name="domain" style="width: 110px;" value="${parts[1] }">
						            </c:when>
						            <c:otherwise>
						                <input type="text" id="emailId" name="emailId" style="width: 120px;">
						                @
						                <input type="text" id="domain" name="domain" style="width: 110px;">
						            </c:otherwise>
					        </c:choose>
                   			  <select name="emailSelect" id="emailSelect" style="width: 80px;">
	                 			    <option value="selec" selected>선택</option>
	                    			<option value="self">직접입력</option>
				                    <option value="naver.com">naver.com</option>
				                    <option value="gmail.com">gmail.com</option>
				                    <option value="daum.com">daum.com</option>
				                    <option value="nate.com">nate.com</option>
				                    <option value="hanmail.com">hanmail.com</option>
                 			   </select>
                		  </td>              		
                </tr>
			 	
			 	
			 	
			 	<%-- 
				<tr>
                 	 <th id="coreName">이메일</th>
               	 		  <td class="rest" colspan="4">    
                  			  <c:choose>
						            <c:when test="${loginUser.email != null}">
						                <input type="text" id="emailId" name="emailId" style="width: 120px;" value="<%=emailId%>">
						                @
						                <input type="text" id="domain" name="domain" style="width: 110px;" value="<%=domain%>">
						            </c:when>
						            <c:otherwise>
						                <input type="text" id="emailId" name="emailId" style="width: 120px;">
						                @
						                <input type="text" id="domain" name="domain" style="width: 110px;">
						            </c:otherwise>
					        </c:choose>
                   			  <select name="emailSelect" id="emailSelect" style="width: 80px;">
	                 			    <option value="selec" selected>선택</option>
	                    			<option value="self">직접입력</option>
				                    <option value="naver.com">naver.com</option>
				                    <option value="gmail.com">gmail.com</option>
				                    <option value="daum.com">daum.com</option>
				                    <option value="nate.com">nate.com</option>
				                    <option value="hanmail.com">hanmail.com</option>
                 			   </select>
                		  </td>              		
                </tr>
                
                --%>


  <tr>
     <th id="coreName">주소 </th>
 	 <td>
   		 <input type="text" class="input-area" id="address" name="address" value="${loginUser.address}"> 
  	</td>
  </tr>
</tbody>
  </table>
</div>
	
      
      
      
      <script>  //회원정보수정폼 안에서 script작성 폼안에서 제이쿼리를 이용해서 정보를 띄워줘야하니깐
      	
      		$(function(){
      		  //성별 체크박스 체크해주기
      		  
      		    //로그인유저의 성별value값을 문자열로 새로운 변수에 저장한후  성별(남여)박스의 value값을 새로운 변수에 저장해서
      			//만약 로그인유저의 성별값을 저장한 변수에 성별박스value값이 포함되어이있으면 성별박스의 현재 이 요소에 checked하라는 기능 수행하기
      	
      			var chooseGender = "${loginUser.gender}"
      			//console.log(chooseGender);
      			//확인결과 user01의 성별이 여로 잘확인됨
      			
      			$("input[name=gender]").each(function(){   
      				var value1 = $(this).val();     
      				if(chooseGender.includes(value1)) {  
      					$(this).attr("checked",true);
      				}
      			});
    	
      			
      			
      			//반려견 음식 관심분야
      			var chooseFoodInterest = "${loginUser.foodInter}"   //'건식,습식,영양제' 나 '빈 문자열'로 저장됨
      			
      			$("input[name=foodInterest]").each(function(){
      				var value2 = $(this).val();
      				if(chooseFoodInterest.includes(value2)) {
      					$(this).attr("checked",true)
      				}
      			});
      			
      			
      			
      			
      			
      		 	//반려견 목욕 관심분야
      			var cleanInterest = "${loginUser.cleanInter}"  //'트린트먼트,샴푸' 나 '빈 문자열'로 저장됨
      			
      			$("input[name=cleanInterest]").each(function(){
      				var value3 = $(this).val();
      				if(cleanInterest.includes(value3)) {
      					$(this).attr("checked",true)
      				}
      			});
      			
      			
      			
      			
      			
      		});
 	
      
    
      
      </script>
      
      
       <script>
      //==================이메일 선택
      var domain = $("#emailSelect");
       $(domain).change(function(){
            if($(this).val()=="selec"){
               $("#domain").attr("readonly", true).attr("placeholder", "선택해주세요.");
          
            }
            if($(this).val() == "naver.com" || $(this).val() == "gmail.com" || 
              $(this).val() == "daum.com" ||$(this).val() == "nate.com" || $(this).val() == "hanmail.com"){

              $("#domain").val( $(domain).val()).attr("readonly", true);

            }else if($(this).val() == "self"){
               $("#domain").val("").attr("placeholder", "입력해주세요.").attr("readonly", false).focus();
            }
            
            });
       </script>
      
    
      <br><br>
     
      <div>
        <button type="submit"  class="btn btn-success">수정하기</button>
        
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#deleteForm" id="deleteButton"> 회원탈퇴</button>
       
        
      </div>
    
    
    </fieldset>
  </form>
 <button onclick="location.href='<%=contextPath%>/pet.myPage'">취소</button>
</div>
  
  <!-- 회원탈퇴 모달 -->
<div class="modal" id="deleteForm" align="center">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">회원탈퇴</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body"> 
      	<img alt="탈퇴이미지" src="./resources/icons/회원탈퇴 아이콘.png" width="70px" height="70px"> <br> <br>
        <b>정말 탈퇴하시겠어요?</b> <br> <br>
        탈퇴 버튼 선택 시, 계정은 <br>
        삭제되며 복구되지 않습니다. <br>
        
        <form action="${contextPath }/pet.delete" method="post">
       <input type="hidden" name="userNo" value="${loginUser.getUserNo()}">    <!-- 로그인유저의 회원번호를 숨겨서보내줌 -> 서블렛에서회원번호와 비밀번호를 이용해서 회원삭제하기-->
        	<table>  	
        		<tr>
        			<td> <input type="password" name="userPwd" placeholder="비밀번호를 입력해주세요." required> </td>
        		</tr>
        	</table>
        	<br>
        	<button type="submit" style="width: 150px; height: 40px; border-radius: 7px; background-color: #66CC00; color:white; border: 1px white;" >탈퇴</button> <br>
        	<button style="width: 150px; height: 40px; border-radius: 7px; background-color: white; color:grey; border: 1px white;" >취소</button>
        </form>
      </div>

    	
    
    

    </div>
  </div>
</div>
  
 </div>

</body>
</html>