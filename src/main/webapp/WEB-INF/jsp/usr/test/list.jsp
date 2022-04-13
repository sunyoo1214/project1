<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="${board.name} 회원 리스트" />
<%@ include file="../common/head.jspf"%>

<section class="mt-5">
  <div class="container mx-auto px-3">
    <div class="flex">
    <div>
      회원 수 : <span class="badge badge-primary">${articlesCount}</span>개
    </div>
    <div class="flex-grow"></div>
    <form class="flex">
      <input type="hidden" name="boardId" value="${param.boardId}" />
      
      <select name="searchKeywordTypeCode" class="select select-bordered">
        <option value="disabled">권한레벨</option>
        <option value="3">사용자</option>
        <option value="7">관리자</option>
        <option value="3, 7">사용자, 관리자</option>
      </select>
      
      <input name="searchKeyword" type="text" class="ml-2 w-72 input input-bordered" placeholder="회원명" maxlength="20" />
      
      <button type="submit" class="ml-2 btn btn-primary">검색</button>
    </form>
    </div>
    <div class="mt-3">
      <table class="table table-fixed w-full">
        <colgroup>
          <col width="50" />
          <col width="150" />
          <col width="150" />
          <col width="150" />
          <col width="150" />
          <col width="150" />
          <col />
        </colgroup>
        <thead>
          <tr>
            <th>번호</th>
            <th>회원명</th>
            <th>생성일</th>
            <th>아이디</th>
            <th>권한레벨</th>
            <th>전화번호</th>
            <th>이메일</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="member" items="${members}">
            <tr>
              <th>${member.id}</th>
              <td>${member.name}</td>
              <td>${member.forPrintType1RegDate}</td>
              <td>${member.loginId}</td>
              <td>${member.authLevel}</td>
              <td>${member.cellphoneNo}</td>
              <td>${member.email}</td>
              <td>
                <a class="btn-text-link block w-full truncate" href="../member/modify?id=${member.name}">${member.name}</a>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>

    <div class="page-menu mt-3">
      <div class="btn-group justify-center">
      <c:set var="pageMenuArmLen" value="6" />  
      <c:set var="startPage" value="${page - pageMenuArmLen >= 1 ? page - pageMenuArmLen : 1}" />
      <c:set var="endPage" value="${page + pageMenuArmLen <= pagesCount ? page + pageMenuArmLen : pagesCount}" />
      
      <c:if test="${startPage > 1}">
        <a class="btn btn-sm" href="?page=1&boardId=${boardId}">1</a>
        <c:if test="${startPage > 2 }">
          <a class="btn btn-sm btn-disabled">...</a>
        </c:if>
      </c:if>  
      <c:forEach begin="${startPage}" end="${endPage}" var="i">
        <a class="btn btn-sm ${page == i ? 'btn-active' : ''}" href="?page=${i}&boardId=${boardId}">${i}</a>          
      </c:forEach>
      <c:if test="${endPage < pagesCount}">
        <c:if test="${endPage < pagesCount - 1}">
          <a class="btn btn-sm btn-disabled">...</a>
        </c:if>
        <a class="btn btn-sm" href="?page=${pagesCount}&boardId=${boardId}">${pagesCount}</a>
      </c:if>  
     </div>
   </div>
   
  </div>
</section>

<%@ include file="../common/foot.jspf"%>