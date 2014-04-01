<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <title>Systematic Cykler Til Arbejde</title>

    <meta name="layout" content="app"/>

    <link rel="stylesheet" href=""/>

    <link href="/vcta-grails2/static/bundle-bundle_bootstrap_head.css" type="text/css" rel="stylesheet" media="screen, projection" />
    <script src="/vcta-grails2/static/plugins/jquery-1.9.0/js/jquery/jquery-1.9.0.min.js" type="text/javascript" ></script>
    <link href="/vcta-grails2/static/plugins/nimble-0.7/css/nimble-login.css" type="text/css" rel="stylesheet" media="screen, projection" />

</head>
<body>

<div id="doc">
    <div id="hd">
        <div class="navbar">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="brand" href="#">Systematic cykler til arbejde</a>
                </div>
            </div>
        </div>
    </div>

    <div id="bd" class="clear">


        <div id="main-welcome">



        </div>


    </div>

    <div id="ft"> </div>
</div>


<div class="modal hide fade in" id="sessionterminateddialog">
    <div class="modal-header">
        <h3 id="confirmationtitle">Session terminated</h3>
    </div>
    <div class="modal-body">
        <p>Unfortunately your session has expired. This usually happens when a page is left open for long periods of time without performing any action. If you're experiencing this problem often contact your helpdesk for assistance.</p>
    </div>
    <div class="modal-footer">
        <a href="#" class="btn btn-primary" id="confirmaccept"  onClick="window.location.reload();return false;">Sign in</a>
    </div>
</div>

</body>
</html>
