<%@ include file="init.jsp"%>
<%@page import="com.liferay.taglib.portlet.ActionURLTag"%>
<%@page import="javax.portlet.PortletURL"%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="fooSb.model.Foo"%>
<%@page import="java.util.List"%>
<%@page import="fooSb.service.FooLocalServiceUtil"%>

<%@ page import="com.liferay.portal.kernel.dao.search.SearchEntry" %>
<%@ page import="com.liferay.portal.kernel.dao.search.ResultRow" %>

<%@ page import="com.liferay.portal.kernel.security.permission.ActionKeys" %>
<%@ page import="com.liferay.portal.kernel.util.WebKeys" %>
<%@ page import="com.liferay.docs.guestbook.service.permission.EntryPermission" %>


<p>
	<b><liferay-ui:message key="FooRegistration.caption" /></b>
</p>


<portlet:renderURL var="addFooURL">
	<portlet:param name="mvcPath" value="/addFoo.jsp" />
</portlet:renderURL>


<div style="text-align:center">
<aui:button onClick="${addFooURL}" value="inscrire un Foo"></aui:button>
</div>
<br/><br/>

<%
	List<Foo> FooList = FooLocalServiceUtil.getFoos(-1, -1);
DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
%>

<liferay-portlet:actionURL var="addFooAction" name="addFoo">
</liferay-portlet:actionURL>




<style>
.myTable {
	border: solid;
	border-width: 1px;
	width: 15%;
	text-align: center;
	"
}

.myTable1 {
	border: solid;
	border-width: 1px;
	width: 10%;
	text-align: center;
	"
}

.myTable3 {
	border: solid;
	border-width: 1px;
	width: 100%;
	text-align: center;
	"
}

.control-group .input-text-wrapper {
	margin-bottom: -1%;
}
</style>
<table class="myTable3">
	<tr class="myTable3">
		<th class="myTable">First and LastName</th>
		<th class="myTable">Age</th>
		<th class="myTable">BirthDay</th>
		<th class="myTable">Single</th>
		<th class="myTable">Town</th>
		

	
	</tr>
	<%
		for (Foo foo : FooList) {
	%>
	<tr class="myTable3">
		<td class="myTable"><%=foo.getFirstandLastName()%></td>
		<td class="myTable"><%=foo.getAge()%></td>
		<td class="myTable"><%=dateFormat.format(foo.getBirthDay())%></td>
		<td class="myTable"><%=foo.getIsSingle()%></td>
		<td class="myTable"><%=foo.getTown()%></td>
	



		<liferay-portlet:renderURL var="editFoo">
			<portlet:param name="jspPage" value="/editFoo.jsp" />
			<portlet:param name="fooId" value="<%=String.valueOf(foo.getFooId())%>" />
						
			<portlet:param name="firstandLastName" value="<%=foo.getFirstandLastName()%>" />
			<portlet:param name="age" value="<%=String.valueOf(foo.getAge())%>" />
			<portlet:param name="birthDay" value="<%=dateFormat.format(foo.getBirthDay())%>" />
			<portlet:param name="isSingle" value="<%=String.valueOf(foo.getIsSingle())%>" />
			<portlet:param name="town" value="<%=foo.getTown()%>" />
		</liferay-portlet:renderURL>

		<td class="myTable1"><aui:button name="" value="Update" onClick="<%=editFoo%>"></aui:button></td>

		<portlet:actionURL name="deleteFoo" var="deleteFoo"></portlet:actionURL>
		<aui:form action="<%=deleteFoo%>" method="post" class="myTable1">		
		<aui:input name="delFooId" type="hidden" value="<%=foo.getFooId()%>" />			
			<td class="myTable1"><aui:button name="" type="submit" value="Delete" /></td>
		</aui:form>
		
		
		
		
<%-- <liferay-ui:icon-menu>		 --%>
<%-- 		<c:if --%>
<%--         test="<%=FooPermission.contains(permissionChecker, foo.getFooId(), ActionKeys.DELETE) %>"> --%>

<%--         <portlet:actionURL name="deleteFoo" var="deleteFoo"> --%>
<%--             <portlet:param name="fooId" --%>
<%--                 value="<%= String.valueOf(foo.getFooId()) %>" /> --%>

<%--         </portlet:actionURL> --%>

<%--         <liferay-ui:icon-delete url="<%=deleteFoo.toString() %>" /> --%>
<%--     </c:if> --%>

<%-- </liferay-ui:icon-menu> --%>
	</tr>
	<%
		}
	%>
</table>
<!-- <span -->
<!-- 	style="border: solid; border-width: 1px; padding: 5px; text-align: center;"> -->
<%-- 	<h5 style="text-align: center;">Add New Foo</h5> <aui:form --%>
<%-- 		action="<%=addFooAction%>" method="post" name="firstandLastName"> --%>
		
<%-- 		    <aui:input name="firstandLastName" type="text" value="" /> --%>
<%-- 			<aui:input name="age" type="number" value="" /> --%>
<%-- 			<aui:input name="birthDay" type="date" value="" /> --%>
<%-- 			<aui:input name="isSingle" type="boolean" value="" /> --%>
<%-- 			<aui:input name="town" type="text" value="" /> --%>
		
<%-- 		<aui:input name="" type="submit" value="Add Foo" /> --%>
<%-- 	</aui:form> --%>
<!-- </span> -->