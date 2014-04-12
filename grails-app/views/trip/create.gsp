<!doctype html>
<html>
   <head>
      <meta name="layout" content="app" />
   </head>
   <body>
            <g:form action="save" name="trip-create-form" method="post">
               <div class="form-input">
                  <div class="control-group">
                     <div class="controls ">                         
                     	<g:datePicker id="date" name="date" precision="day" value="${new Date() }" noSelection="['':'-Choose-']" />
                     </div>
                  </div>
                  <div class="control-group">
                     <div class="controls">
                        <input type="text" id="distanceKm" name="distanceKm" value="${fieldValue(bean: trip, field: 'distanceKm')}"/> 
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