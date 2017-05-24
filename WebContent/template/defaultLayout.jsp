
<%@ page contentType="text/html;charset=utf-8" language="java" %>

<head>
    <title><tiles:getAsString name="title"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="/icon/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/icon/favicon.ico">
    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">

    <link href="/css/font-awesome.css" rel="stylesheet"/>

    <link href="/css/mdb.css" rel="stylesheet"/>
    <link href="/css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet"/>
    <link href="/css/font-awesome.min.css" rel="stylesheet"/>
    <script src="/js/jquery-1.8.3.min.js"></script>


</head>
<body>

<section id="container">
    <tiles:insertAttribute name="header"/>

    <tiles:insertAttribute name="menu"/>

    <section id="main-content">
        <section class="wrapper">
            <tiles:insertAttribute name="body"/>
        </section>
    </section>

    <tiles:insertAttribute name="footer"/>

</section>


<!-- js placed at the end of the document so the pages load faster -->
<script src="/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/js/tether.min.js" type="text/javascript"></script>
<script src="/js/mdb.min.js" type="text/javascript"></script>


<!--common script for all pages-->
<script src="/js/common-scripts.js"></script>
</body>
