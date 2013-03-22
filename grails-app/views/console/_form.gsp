<%@ page import="br.unifor.loan.Console" %>



<div class="fieldcontain ${hasErrors(bean: consoleInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="console.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${consoleInstance?.name}"/>
</div>

