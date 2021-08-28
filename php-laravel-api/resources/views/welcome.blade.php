<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

    <title> {{ config('app.name') }}</title>
</head>

<body>
    <nav class="navbar navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">{{ config('app.name') }}</a>
        </div>
    </nav>


    <div class="container-sm">
        <div class="bg-light p-5 rounded-lg m-3">
            <h1 class="display-4">Hello, world!</h1>
            <p>Radystems generated Applications</p>
            <hr class="my-4">
            <p class="lead">Replace with your content</p>
            <a class="btn btn-primary" href="{{ url('api/pagename') }}">Browse Api</a>
            <a class="btn btn-danger" href="{{ url('../../api-doc/redoc-static.html') }}">Browse Api Docs</a>
        </div>
        
    </div>
</body>

</html>