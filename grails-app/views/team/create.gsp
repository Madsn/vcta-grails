<!doctype html>
<html>
   <head>
      <meta name="layout" content="app" />
   </head>
   <body>
            <g:form action="save" name="team-create-form" method="post">
               <div class="form-input">
                  <div class="control-group">
                     <div class="controls">
                        <input type="text" id="name" name="name" value="${fieldValue(bean: team, field: 'name')}"/> 
                     </div>
                  </div>
               <div class="form-actions">
                  <span class="pull-right clearfix">
                     <button type="submit" class="btn btn-primary">
                        Submit
                     </button>
                  </span>
               </div>
            </g:form>
         </div>
      </div>
   </body>
</html>