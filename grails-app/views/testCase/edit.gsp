<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'testCase.label', default: 'TestCase')}" />
    <title>
        <g:message code="title.testCase.edit"/>
    </title>
</head>
<body>
<div class="nav" role="navigation">
    <ul>
        <li><g:link class="home" uri="/"><g:message code="default.home.label"/></g:link></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="edit-testCase" class="content scaffold-edit" role="main">
    <h1 style="text-align: center"><g:message code="default.edit.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.testCase}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.testCase}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form resource="${this.testCase}" method="PUT">
        <fieldset class="form">
            <div class="fieldcontain ${hasErrors(bean: testCase, field: 'caseName','error')}">
                <label>Test-case name:</label>
                <g:textField name="caseName" value="${testCase.caseName}"/>
            </div>
            <g:if test="${testCase.userCreated.id == session.user.id}">
                <div class="fieldcontain ${hasErrors(bean: testCase, field: 'typeCase','error')}">
                    <label>
                        <g:message code="testCase.typeCase.label.field"/>
                    </label>
                    <g:select name="typeCase"
                              from="${testCase.getConstrainedProperties().typeCase.inList}"
                              value="${testCase.typeCase}"
                              valueMessagePrefix="testCase.type.label" />
                </div>
            </g:if>
        </fieldset>
        <fieldset class="buttons">
            <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
