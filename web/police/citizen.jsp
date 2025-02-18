<%-- 
    Document   : registerTemporaryResidence
    Created on : Feb 18, 2025, 4:42:47 PM
    Author     : troqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%
    List<User> userList = (List<User>) request.getAttribute("userList");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký Tạm trú</title>
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
            /*padding: 20px;*/
        }
        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }
        .user-list {
            background-color: white;
            padding: 20px 50px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
/*            max-width: 800px;*/
            margin: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #2980b9;
            color: white;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .submit-btn {
            background-color: #2980b9;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        .submit-btn:hover {
            background-color: #1f618d;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Đăng ký Tạm trú</h1>
        <a href="logout" class="logout-btn">Đăng xuất</a>
    </div>
    <div class="navbar">
        <a href="home.jsp">Trang chủ</a>
        <a href="citizen.jsp">Quản lý công dân</a>
        <a href="registerTemporaryResidence.jsp">Đăng ký tạm trú</a>
        <a href="registerTemporaryAbsence.jsp">Đăng ký tạm vắng</a>
        <a href="citizenApplications.jsp">Hồ sơ của tôi</a>
        <a href="notifications.jsp">Thông báo</a>
        <a href="support.jsp">Hỗ trợ</a>
    </div>
    <div class="container">
        <div class="user-list">
            <h2>Danh sách Công dân</h2>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Tên đăng nhập</th>
                    <th>Họ và Tên</th>
                    <th>Email</th>
                    <th>Vai trò</th>
                    <th>Địa chỉ</th>
                </tr>
                <% if (userList != null) { %>
                    <% for (User user : userList) { %>
                        <tr>
                            <td><%= user.getUserID() %></td>
                            <td><%= user.getUserName() %></td>
                            <td><%= user.getFullName() %></td>
                            <td><%= user.getEmail() %></td>
                            <td><%= user.getRole() %></td>
                            <td><%= user.getAddress() %></td>
                        </tr>
                    <% } %>
                <% } else { %>
                    <tr><td colspan="6">Không có dữ liệu</td></tr>
                <% } %>
            </table>
        </div>
    </div>
</body>
</html>
