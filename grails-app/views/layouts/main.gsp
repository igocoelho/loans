<!DOCTYPE html>
<html lang="en">
   <head>
   	  <meta charset="utf-8">
   	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
   	  <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
      <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }

      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
      </style>
      <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-responsive.min.css')}" type="text/css">
      <title><g:layoutTitle/></title>
      <g:layoutHead/>
      <r:layoutResources />
   </head>
   <body>
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">Project name</a>
          <div class="nav-collapse collapse">
            <p class="navbar-text pull-right">
              Logged in as <a href="#" class="navbar-link">Username</a>
            </p>
            <ul class="nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#about">About</a></li>
              <li><a href="#contact">Contact</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header">MENU</li>
              <li><g:link controller="console" action="list">Consoles</g:link></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
            </ul>
          </div>
        </div>
        <div class="span9">

          <g:layoutBody/>

        </div>
      </div>

      <hr>

      <footer>
        <p>&copy; NATI / UNIFOR 2013</p>
      </footer>

    </div><!--/.fluid-container-->

      <script src="${resource(dir: 'js', file: 'jquery-1.8.3.min.js')}" type="text/javascript"></script>
      <script src="${resource(dir: 'js', file: 'bootstrap.min.js')}" type="text/javascript"></script>
      <script src="${resource(dir: 'js', file: 'application.js')}" type="text/javascript"></script>
      <r:layoutResources/>
   </body>
</html>