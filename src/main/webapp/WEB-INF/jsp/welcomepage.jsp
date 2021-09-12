<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns:c="http://www.w3.org/1999/XSL/Transform" xmlns:overflow="http://www.w3.org/1999/xhtml"
      xmlns:margin-top="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="sat, 01 Dec 2022 00:00:00 GMT">
    <title>CMS | home</title>
<!--    <link href="{{ asset('static/css/bootstrap.css') }}" rel="stylesheet" media="all">-->
    <link href="/static/css/style.css" rel="stylesheet" media="all">
    <script src="{{asset('~static/css/bootstrap.css')}}" />
    <script src="{{asset('~static/js/jquery-3.5.1.min.js')}}"></script>
    <script src="{{asset('~static/js/bootstrap.js')}}"></script>
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>-->
<!--    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>-->
<!--    <![endif]&ndash;&gt;-->
<style>
    body {
        background-color: white;
        margin: 0;
                }
ul.topnav {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

ul.topnav li {float: left;}

ul.topnav li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

ul.topnav li a:hover:not(.active) {background-color: #111;}

ul.topnav li a.active {background-color: #4CAF50;}

ul.topnav li.right {float: right;}

@media screen and (max-width: 600px) {
  ul.topnav li.right,
  ul.topnav li {float: none;}
}
     h1 {
        color: black;
         text-align: center;
        }
        h3 {
        color: black;
         text-align: center;
        }
input {
  width: 40%;
  height: 40px;
  padding: 10px 10px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  background-color: #f8f8f8;
  padding-left: 8px;
<!--  text-align: center;-->
  resize: none;
}

<!--table-->
table {
				width:100%;
				overflow: auto
				}
				table, th, td {
				border: 2px solid black;
				border-collapse: collapse;
				}
				th, td {
				padding: 15px;
				text-align: left;
				}
				#t01 tr:nth-child(even) {
				background-color: #eee;
				}
				#t01 tr:nth-child(odd) {
				background-color: #fff;
				}
				#t01 th {
				background-color: #eee;
				color: black;
				}
.login_button{  margin-bottom: 100px;}
</style>
</head>
<body>
<div role="navigation">
    <div class="navbar navbar-inverse">
        <div class="navbar">
            <ul class="topnav">
                <li><a href="/welcome">Home</a></li>
<!--                <a href="/welcome" class="navbar-brand">Home</a>-->
                <li><a href="/login">Hospital Staff Login</a></li>
                <li><a href="/register">New Registration</a></li>
                <li><a href="/show-users">All Users</a></li>
                <li><a href="/availability">Check bed availability</a></li>
            </ul>
        </div>
    </div>
</div>

    <c:choose>
        <c:when test="${mode=='MODE_HOME' }">
            <div class="container" id="homediv">
                <div class="jumbotron text-center">
                    <h1>Welcome to CMS</h1>
<!--                    <h3>Subscribe my channel to support me</h3>-->
                </div>
            </div>
        </c:when>

<c:when test="${mode=='MODE_REGISTER' }">
<div style="text-align:center" >
    <h3>New Registration</h3>
    <hr>
    <form class="form-horizontal" method="POST" action="save-user">
        <input type="hidden" name="id" value="${user.id }" />
        <div class="form-group">
            <label class="control-label col-md-3">Username</label>
            <div class="col-md-7">
                <input type="text" class="form-control" name="username"
                       value="${user.username }" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">First Name</label>
            <div class="col-md-7">
                <input type="text" class="form-control" name="firstname"
                       value="${user.firstname }" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">Last Name</label>
            <div class="col-md-7">
                <input type="text" class="form-control" name="lastname"
                       value="${user.lastname }" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">Age </label>
            <div class="col-md-3">
                <input type="text" class="form-control" name="age"
                       value="${user.age }" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">Password</label>
            <div class="col-md-7">
                <input type="password" class="form-control" name="password"
                       value="${user.password }" />
            </div>
        </div>
        <div class="form-group ">
            <input type="submit" class="btn btn-primary" value="Register" />
        </div>
    </form>
</div>
</c:when>

        <c:when test="${mode=='ALL_USERS' }">
            <div class="container text-center" id="tasksDiv" >
                <h3>All Users</h3>
                <hr>
                <div class="table-responsive">
                    <table id="t01" align="center">
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>UserName</th>
                            <th>First Name</th>
                            <th>LastName</th>
                            <th>Age</th>
                            <th>Delete</th>
                            <th>Edit</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.username}</td>
                                <td>${user.firstname}</td>
                                <td>${user.lastname}</td>
                                <td>${user.age}</td>
                                <td><a href="/delete-user?id=${user.id }"><span
                                        class="glyphicon glyphicon-trash"></span></a></td>
                                <td><a href="/edit-user?id=${user.id }"><span
                                        class="glyphicon glyphicon-pencil"></span></a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:when>

        <c:when test="${mode=='LOGIN' }">

            <div style="text-align:center" >
                <h3>Login</h3>
                <hr>
                <form class="form-horizontal" method="POST" action="/login-user">

                    <input type="hidden" name="id" value="${user.id }" />
                    <div class="form-group">
                        <label class="control-label col-md-3">Username</label>
                        <div class="col-md-7">
                            <input type="text" class="form-control" name="username"
                                   value="${user.username }" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Password</label>
                        <div class="col-md-7">
                            <input type="text" class="form-control" name="password"
                                   value="${user.password }" required/>
                        </div>
                    </div>
                    <div class="form-group" margin-top="100px">
                        <input type="submit" class="btn btn-primary" value="Login" />
                        <br/>
                    </div>
                </form>
            </div>

        </c:when>



    </c:choose>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->

</body>
</html>