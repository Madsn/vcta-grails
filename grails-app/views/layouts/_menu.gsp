<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-menu-navbar-items">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">VCTA</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-menu-navbar-items">
			<nav:menu scope="menu" class="nav navbar-nav">
			<li class="active"><a href="#">Link</a></li></nav:menu>
			<ul class="nav navbar-nav navbar-right">
				<n:isLoggedIn>
					<li><g:link class="brand" uri="/logout">Log out</g:link></li>
				</n:isLoggedIn>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
</nav>