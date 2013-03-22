<%@ page import="br.unifor.loan.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'games', 'error')} ">
	<label for="games">
		<g:message code="user.games.label" default="Games" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.games?}" var="g">
    <li><g:link controller="game" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="game" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'game.label', default: 'Game')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="user.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${userInstance?.name}"/>
</div>

