


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Starter Template for Bootstrap</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.php">All Blogs</a></li>
                <li><a href="login.php">Login</a></li>
                <li><a href="signup.php">Register</a></li>
            </ul>
        </div><!--/.nav-collapse -->

    </div>
</nav>
<br>

<div class="container">
    <div class="row">
        <h1 class="page-header">
            Login
        </h1>
        <form>

            <div class="form-group">
                <label for="recipient-name" class="control-label">username :</label>
                <input type="text" class="form-control" id="recipient-name">
            </div>

            <div class="form-group">
                <label for="recipient-name" class="control-label">password:</label>
                <input type="password" class="form-control" id="recipient-name">
            </div>

                <button type="button" class="form-control" >login </button>
        </form>


    </div>
    <div class="container">
        <div class="row">
            <footer>
                <p>&copy; 2016 Company, Inc.</p>
            </footer>
        </div>
    </div>


</div> <!-- /container -->




<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
