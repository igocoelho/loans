
<%@ page import="br.unifor.loan.Loan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'loan.label', default: 'Loan')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-loan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-loan" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="loan.fucker.label" default="Fucker" /></th>
					
						<g:sortableColumn property="loanDate" title="${message(code: 'loan.loanDate.label', default: 'Loan Date')}" />
					
						<g:sortableColumn property="returnDate" title="${message(code: 'loan.returnDate.label', default: 'Return Date')}" />
					
						<th><g:message code="loan.sucker.label" default="Sucker" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${loanInstanceList}" status="i" var="loanInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${loanInstance.id}">${fieldValue(bean: loanInstance, field: "fucker")}</g:link></td>
					
						<td><g:formatDate date="${loanInstance.loanDate}" /></td>
					
						<td><g:formatDate date="${loanInstance.returnDate}" /></td>
					
						<td>${fieldValue(bean: loanInstance, field: "sucker")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${loanInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
