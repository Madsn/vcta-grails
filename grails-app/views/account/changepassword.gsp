
<html>

<head>
    <title><g:message code="nimble.view.account.changepassword.initiate.title" /></title>
      <r:require modules="login-css"/>
      <r:require modules="bootstrap3" />
      <r:layoutResources />
</head>

<body>
   	<g:render template="/layouts/menu" />

      <div class="login-container">
         <div class="login-content">
            <h2 class="border-bottom">
      <g:message code="nimble.view.account.changepassword.initiate.heading" /></h2>
            <n:flashembed />
      <p>
        <g:message code="nimble.view.account.changepassword.initiate.descriptive" />
      </p>

      <n:errors bean="${user}"/>

      <g:form action="updatepassword">
            <div class="login-input">
                  <div class="form-group">
                     <div class="controls "> 
              <label for="currentPassword"><g:message code="nimble.label.currentpassword" /></label>
                <input type="password" size="30" id="currentPassword" name="currentPassword" class="easyinput form-control"/>
                </div>
                </div>
                <div class="form-group">
              <label for="pass"><g:message code="nimble.label.newpassword" /></label>
                <input type="password" size="30" id="pass" name="pass" class="password easyinput form-control"/><a href="#" id="passwordpolicybtn" rel="passwordpolicy" class="empty icon icon_help"></a>
                </div>
                <div class="form-group">
              <label for="passConfirm"><g:message code="nimble.label.newpassword.confirmation" /></label></td>
                <input type="password" size="30" id="passConfirm" name="passConfirm" class="easyinput form-control"/>
                </div>

            <n:recaptcharequired>
                <g:message code="nimble.label.captcha" />
                  <n:recaptcha/>
            </n:recaptcharequired>


              <button class="btn btn-primary" type="submit"><g:message code="nimble.link.changepassword" /></button>
              </div>
      </g:form>
    </div>


      <r:layoutResources />
</body>

</html>