<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="init.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADD a New Foo</title>

<!-- ----pour annuler -->
<portlet:renderURL var="annulerAction">
	<portlet:param name="mvcPath" value="/view.jsp" />
</portlet:renderURL>


<div style="text-align:center">
<aui:button onClick="${annulerAction}" value="annuler (retour)"></aui:button>
</div>
<!-- ------------------- -->


<portlet:actionURL name="addFoo" var="addFooURL">
</portlet:actionURL>

<aui:form action="${addFooURL}">
<aui:input name="isSingle" label="isSingle"></aui:input>
<aui:input name="town" label="town"></aui:input>
<aui:input name="age" label="age"></aui:input>
<aui:input name="birthDay" label="birthDay" placeholder="dd/mm/yyyy" inlineField="true"></aui:input>
<aui:input name="firstandLastName" label="firstandLastName" ></aui:input>


<aui:input name="" type="submit" value="Enregistrer Foo"></aui:input>
</aui:form>


</head>
<body>

</body>
</html>