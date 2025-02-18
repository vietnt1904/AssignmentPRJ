<%-- 
    Document   : home
    Created on : Feb 14, 2025, 2:11:57 PM
    Author     : VIET
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%
    User user = (User) request.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Citizen Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #2980b9;
            color: white;
            padding: 10px 0;
            text-align: center;
            position: relative;
        }
        .logout-btn {
            position: absolute;
            top: 10px;
            right: 20px;
            background-color: #333;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }
        .logout-btn:hover {
            background-color: #ddd;
            color: black;
        }
        .navbar {
            overflow: hidden;
            background-color: #333;
            display: flex;
            justify-content: center;
        }
        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .container {
            padding: 20px;
        }
        .welcome {
            margin-bottom: 20px;
        }
        .citizen-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .citizen-actions a {
            flex: 1 1 calc(33.333% - 20px);
            background-color: #2980b9;
            color: white;
            padding: 20px;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .citizen-actions a:hover {
            background-color: #1f618d;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Citizen Dashboard</h1>
        <a href="logout" class="logout-btn">Đăng xuất</a>
    </div>
    <div class="navbar">
        <a href="citizenDashboard.jsp">Trang chủ</a>
        <a href="citizen.jsp">Quản lý công dân</a>
        <a href="registerTemporaryResidence.jsp">Đăng ký tạm trú</a>
        <a href="registerTemporaryAbsence.jsp">Đăng ký tạm vắng</a>
        <a href="citizenApplications.jsp">Hồ sơ của tôi</a>
        <a href="notifications.jsp">Thông báo</a>
        <a href="support.jsp">Hỗ trợ</a>
    </div>
    <div class="container">
        <div class="welcome">
            <h2>Chào mừng, <%= (user != null) ? user.getFullName() : "Công dân" %>!</h2>
            <p>Quản lý thông tin tạm trú, tạm vắng và cập nhật trạng thái hồ sơ của bạn tại đây.</p>
        </div>
        <div class="citizen-actions">
            <a href="citizen.jsp">Quản lý công dân</a>
            <a href="registerTemporaryResidence.jsp">Đăng ký tạm trú</a>
            <a href="registerTemporaryAbsence.jsp">Đăng ký tạm vắng</a>
            <a href="citizenApplications.jsp">Theo dõi hồ sơ</a>
            <a href="notifications.jsp">Xem thông báo</a>
            <a href="support.jsp">Liên hệ hỗ trợ</a>
        </div>
    </div>
</body>
</html>
