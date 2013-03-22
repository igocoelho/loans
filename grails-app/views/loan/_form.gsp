<%@ page import="br.unifor.loan.Loan" %>



<div class="fieldcontain ${hasErrors(bean: loanInstance, field: 'fucker', 'error')} required">
	<label for="fucker">
		<g:message code="loan.fucker.label" default="Fucker" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="fucker" name="fucker.id" from="${br.unifor.loan.User.list()}" optionKey="id" required="" value="${loanInstance?.fucker?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: loanInstance, field: 'games', 'error')} ">
	<label for="games">
		<g:message code="loan.games.label" default="Games" />
		
	</label>
	<g:select name="games" from="${br.unifor.loan.Game.list()}" multiple="multiple" optionKey="id" size="5" value="${loanInstance?.games*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: loanInstance, field: 'loanDate', 'error')} required">
	<label for="loanDate">
		<g:message code="loan.loanDate.label" default="Loan Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="loanDate" precision="day"  value="${loanInstance?.loanDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanInstance, field: 'returnDate', 'error')} required">
	<label for="returnDate">
		<g:message code="loan.returnDate.label" default="Return Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="returnDate" precision="day"  value="${loanInstance?.returnDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanInstance, field: 'sucker', 'error')} required">
	<label for="sucker">
		<g:message code="loan.sucker.label" default="Sucker" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sucker" name="sucker.id" from="${br.unifor.loan.User.list()}" optionKey="id" required="" value="${loanInstance?.sucker?.id}" class="many-to-one"/>
</div>

