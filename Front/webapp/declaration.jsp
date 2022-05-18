<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
<script type="text/javascript">
function check() {
   if(document.singo.reports_type.value==0){
      alert("검색어 적어라");
      return false;
   }
   if(document.singo.reports_content.value==""){
      alert("내용 적어");
      return false;
   }
}
</script>
</head>
<body>

   <form action="declarationCheck.oshi?board_writer=${article.board_writer }&reports_reporter=${sessionScope.member_code}&reports_board_no=${article.board_no}" method="post" name="singo"
                     onsubmit="return check()">
   신고하시려는 글은<input type="text" value="${article.board_title}" readonly="readonly">입니다.<br> 작성자 : <input type="text" value="${mem.member_nickname }" readonly="readonly">
   <input type="hidden" value="${article.board_no}" name="reports_board_no">
   <input type="hidden" value="${member_code}" name="reports_reporter">
   <c:out value="${member_code}"/>

   <table border="1" width="300" height="400" cellpadding="0" cellspacing="0">
      <tr>
         <td>
            <select name="reports_type">
               <option selected="selected">신고내용</option>
               <option value="1">욕설</option>
               <option value="2">광고</option>
               <option value="3">정치글</option>
               <option value="4">어그로</option>
            </select>
            <textarea rows="30" cols="63" name="reports_content"></textarea>
         </td>
      </tr>
   </table>
   <br>
   <div align="center">   
   <input type="submit" value="제출하기">
   </div>
   </form>
</body>
</html>