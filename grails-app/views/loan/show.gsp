
<%@ page import="br.unifor.loan.Loan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'loan.label', default: 'Loan')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-loan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-loan" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list loan">
			
				<g:if test="${loanInstance?.fucker}">
				<li class="fieldcontain">
					<span id="fucker-label" class="property-label"><g:message code="loan.fucker.label" default="Fucker" /></span>
					
						<span class="property-value" aria-labelledby="fucker-label"><g:link controller="user" action="show" id="${loanInstance?.fucker?.id}">${loanInstance?.fucker?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${loanInstance?.games}">
				<li class="fieldcontain">
					<span id="games-label" class="property-label"><g:message code="loan.games.label" default="Games" /></span>
					
						<g:each in="${loanInstance.games}" var="g">
						<span class="property-value" aria-labelledby="games-label"><g:link controller="game" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${loanInstance?.loanDate}">
				<li class="fieldcontain">
					<span id="loanDate-label" class="property-label"><g:message code="loan.loanDate.label" default="Loan Date" /></span>
					
						<span class="property-value" aria-labelledby="loanDate-label"><g:formatDate date="${loanInstance?.loanDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${loanInstance?.returnDate}">
				<li class="fieldcontain">
					<span id="returnDate-label" class="property-label"><g:message code="loan.returnDate.label" default="Return Date" /></span>
					
						<span class="property-value" aria-labelledby="returnDate-label"><g:formatDate date="${loanInstance?.returnDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${loanInstance?.sucker}">
				<li class="fieldcontain">
					<span id="sucker-label" class="property-label"><g:message code="loan.sucker.label" default="Sucker" /></span>
					
						<span class="property-value" aria-labelledby="sucker-label"><g:link controller="user" action="show" id="${loanInstance?.sucker?.id}">${loanInstance?.sucker?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${loanInstance?.id}" />
					<g:link class="edit" action="edit" id="${loanInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
