<!doctype html>
<html>
   <head>
      <title>
         <g:message code="nimble.view.account.registeraccount.initiate.title" />
      </title>
      <r:require modules="login-css"/>
      <r:require modules="bootstrap3" />
      <r:layoutResources/>
       <meta name="layout" content="app" />
</head>
<body>
<g:render template="/layouts/menu" />
      <div class="login-container">
         <div class="login-content">
            <h2 class="border-bottom">
               <g:message code="nimble.view.account.registeraccount.initiate.heading" />
            </h2>
            <n:flashembed/>
            <n:errors bean="${user}"/>
            <g:form action="saveuser" name="signup-form" method="post">
               <div class="login-input">
                  <div class="form-group">
                     <div class="controls ">                         
                        <label for="email">Please use your employee initials</label>
                        <input type="text" id="username" name="username" value="${fieldValue(bean: user, field: 'username')}" placeholder="username"/>                                                  
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="controls">
                        <input type="password" size="30" id="pass" name="pass" value="${user.pass?.encodeAsHTML()}" placeholder="password"/> 
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="controls">
                        <input type="password" size="30" id="passConfirm" name="passConfirm" value="${user.passConfirm?.encodeAsHTML()}" placeholder="confirm password"/> 						                   
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="controls">
                        <input type="text" size="30" id="fullName" name="fullName" value="${user.profile?.fullName?.encodeAsHTML()}" placeholder="full name"]> 						                   
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="controls">
                        <label for="email">'@systematic.com' addresses only</label>
                        <input type="text" size="30" id="email" name="email" value="${user.profile?.email?.encodeAsHTML()}" placeholder="email"/> 						                   
                     </div>
                  </div>
               </div>
               <div class="login-actions">
                  <span class="pull-right clearfix">
                     <button type="submit" class="btn btn-primary">
                        <g:message code="nimble.link.registeraccount" />
                     </button>
                  </span>
               </div>
            </g:form>
         </div>
      </div>
      <r:layoutResources/>
   </body>
</html>