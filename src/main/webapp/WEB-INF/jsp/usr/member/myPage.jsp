<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="마이페이지" />
<%@ include file="../common/head.jspf"%>

<section class="mt-5">
  <div class="container mx-auto px-3">
    <div class="table-box-type-1" >
      <table>
        <colgroup>
          <col width="200" />
        </colgroup>
        <tbody>
          <tr>
            <th>로그인아이디</th>
            <td>
              ${rq.loginedMember.loginId}
            </td>
          </tr>
          <tr>
            <th>이름</th>
            <td>
              ${rq.loginedMember.name}
            </td>
          </tr>
          <tr>
            <th>별명</th>
            <td>
              ${rq.loginedMember.nickname}
            </td>
          </tr>
          <tr>
            <th>이메일</th>
            <td>
              ${rq.loginedMember.eamil}
            </td>
          </tr>
          <tr>
            <th>번호</th>
             <td>
              ${rq.loginedMember.cellphoneNo}
             </td>
          </tr>
          <tr>
            <th>비고</th>
            <td>
            
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</section>

<%@ include file="../common/foot.jspf"%> 