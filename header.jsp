<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="messages" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><fmt:message key="title" /></title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        th {
            color: blue;
        }

        .even {
            background-color: #f9f9f9;
        }

        .odd {
            background-color: #ffffff;
        }

        .stats {
            color: red;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #ccc;
            padding: 8px;
        }

        h2, h3 {
            margin-top: 20px;
        }
    </style>
</head>
<body>
