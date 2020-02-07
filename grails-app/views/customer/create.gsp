<!DOCTYPE html>
<html>
<head>
    <title>Simple CRM - Customer Management made Simple</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css" rel="stylesheet"
          crossorigin="anonymous">

</head>
<body>
<nav class="navbar navbar-dark bg-dark fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">Simple CRM</a>
        </div>
    </div>
</nav>
<div class="container" style="margin-top:80px">

    <h1 class="pb-2 border-bottom row">
        <span class="col-sm pb-4">New Customer Details</span>
    </h1>


    <div class="mt-5 card card-body bg-light">

        <form action="/customer/save" class="form" method="post">

            <g:hasErrors bean="${this.customer}">
                <div class="alert alert-danger">
                <ul>
                    <g:eachError bean="${this.customer}" var="error">
                        <li><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
                </div>
            </g:hasErrors>

            <div class="row">
                <div class="form-group col-6">
                    <label>First Name</label>
                    <input class="form-control" name="firstName" value="${customer?.firstName}"/>
                </div>
                <div class="form-group col-6">
                    <label>Last Name</label>
                    <input class="form-control" name="lastName" value="${customer?.lastName}"/>
                </div>
            </div>

            <div class="row">
                <div class="form-group col-6">
                    <label>Email Address</label>
                    <input class="form-control" name="emailAddress" value="${customer?.emailAddress}"/>
                </div>
                <div class="form-group col-6">
                    <label>Phone Number</label>
                    <input class="form-control" name="phoneNumber" value="${customer?.phoneNumber}"/>
                </div>
            </div>

            <div class="row">
                <div class="form-group col">
                    <label>Address</label>
                    <input class="form-control" name="address" value="${customer?.address}"/>
                </div>
            </div>

            <div class="row">
                <div class="form-group col-6">
                    <label>City</label>
                    <input class="form-control" name="city" value="${customer?.city}"/>
                </div>
                <div class="form-group col-6">
                    <label>Country</label>
                    <input class="form-control" name="country" value="${customer?.country}"/>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <button type="submit" class="btn btn-success btn-block">Create Customer</button>
                </div>
            </div>
        </form>
    </div>
</div>
<footer class="footer navbar-dark bg-dark fixed-bottom">
    <div class="container">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <p class="text-center text-muted">&copy;
                    <span>${formatDate(date: new Date(), format:'yyyy')}</span>
                    <a href="https://tucanoo.com">Tucanoo Solutions Ltd.</a>
                </p>
            </div>
        </div>
    </div>
</footer>
</body>
</html>