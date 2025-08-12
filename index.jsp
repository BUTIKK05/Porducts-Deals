<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${param.lang != null ? param.lang : 'en'}" />
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
    <h2><b>${currentTime}</b></h2>
    <h2><b>${surname}</b></h2>

    <table>
        <tr>
            <th><fmt:message key="column.id" /></th>
            <th><fmt:message key="column.type" /></th>
            <th><fmt:message key="column.to" /></th>
            <th><fmt:message key="column.from" /></th>
            <th><fmt:message key="column.address" /></th>
            <th><fmt:message key="column.date" /></th>
            <th><fmt:message key="column.amount" /></th>
        </tr>
        <c:forEach var="deal" items="${deals}" varStatus="loop">
            <tr class="${loop.index % 2 == 0 ? 'even' : 'odd'}">
                <td>${deal.id}</td>
                <td>${deal.type}</td>
                <td>${deal.toName}</td>
                <td>${deal.fromName}</td>
                <td>${deal.address}</td>
                <td><fmt:formatDate value="${deal.date}" pattern="yyyy-MM-dd" /></td>
                <td>${deal.amount}</td>
            </tr>
        </c:forEach>
    </table>

    <div class="stats">
        <p><fmt:message key="stats.barter2024" /> ${barterCount}</p>
        <p><fmt:message key="stats.saleavg" /> ${avgSale}</p>
    </div>

    <hr>
    <h3><fmt:message key="form.title" /></h3>
    <form method="post" action="add">
        <label><fmt:message key="form.type" />: <input type="text" name="type" required></label><br>
        <label><fmt:message key="form.to" />: <input type="text" name="to_name" required></label><br>
        <label><fmt:message key="form.from" />: <input type="text" name="from_name" required></label><br>
        <label><fmt:message key="form.address" />: <input type="text" name="address" required></label><br>
        <label><fmt:message key="form.date" />: <input type="date" name="date" required></label><br>
        <label><fmt:message key="form.amount" />: <input type="number" step="0.01" name="amount" required></label><br>
        <input type="submit" value="<fmt:message key='form.submit' />">
    </form>
</body>
</html>
