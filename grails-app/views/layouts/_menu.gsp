<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-menu-navbar-items">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<g:link uri="/" class="navbar-brand"><g:img dir="images" file="cykel-logo.png" /></g:link>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-menu-navbar-items">
				<nav:menu scope="menu" class="nav navbar-nav"></nav:menu>
				<ul class="nav navbar-nav navbar-right">
						<li><g:link controller="rules" action="help">Help</g:link></li>
					<n:isNotLoggedIn>
						<li><g:link class="brand" uri="/login">Sign in</g:link></li>
					</n:isNotLoggedIn>
					<n:isLoggedIn>
						<li><g:link class="brand" controller="auth" action="logout">Log out</g:link></li>
					</n:isLoggedIn>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
	</div>
</nav>