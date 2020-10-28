<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="init.jsp"%>
    
<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>

<portlet:defineObjects/>

<portlet:actionURL name="updateFoo" var="editFooAction">
</portlet:actionURL>

<%
 String firstandLastName = renderRequest.getParameter("firstandLastName");
 String age = renderRequest.getParameter("age");
 String birthDay = renderRequest.getParameter("birthDay");
 String isSingle = renderRequest.getParameter("isSingle");
 String fooId = renderRequest.getParameter("fooId");
 String town = renderRequest.getParameter("town");
%>
<%

DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
%>
<div style="text-align:center">
<h3>Editer Foo: <%= firstandLastName%></h3>
<!-- ----pour annuler -->
<portlet:renderURL var="annulerAction">
	<portlet:param name="mvcPath" value="/view.jsp" />
</portlet:renderURL>



<aui:button onClick="${annulerAction}" value="annuler (retour)"></aui:button>
</div>
<!-- ------------------- -->

<aui:form action="<%=editFooAction %>" method="post" name="name">
 <aui:input name="firstandLastName" type="text" value="<%=firstandLastName%>"/>
 <aui:input name="town" type="text" value="<%=town %>"/>
 <aui:input name="age" type="number" value="<%=Integer.parseInt(age) %>"/>
 <aui:input name="isSingle" type="boolean" value="<%=String.valueOf(isSingle) %>" />
 <aui:input name="birthDay" placeholder="dd/mm/yyyy" inlineField="true" value="<%=birthDay%>" />
 <aui:input name="fooId" type="hidden" value="<%=Long.parseLong(fooId) %>"/> 
 <aui:input type="submit" value="Update" name="update"></aui:input>
</aui:form>