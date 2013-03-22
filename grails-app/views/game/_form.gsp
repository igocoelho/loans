<%@ page import="br.unifor.loan.Game" %>



<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'console', 'error')} required">
	<label for="console">
		<g:message code="game.console.label" default="Console" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="console" name="console.id" from="${br.unifor.loan.Console.list()}" optionKey="id" required="" value="${gameInstance?.console?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="game.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${gameInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="game.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${br.unifor.loan.User.list()}" optionKey="id" required="" value="${gameInstance?.user?.id}" class="many-to-one"/>
</div>

