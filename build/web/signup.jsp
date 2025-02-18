<%-- 
    Document   : signup
    Created on : Feb 14, 2025, 2:10:35 PM
    Author     : VIET
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Boolean statusObj = (Boolean) request.getAttribute("status");
    String message = "";
    
    if(statusObj != null ){
        message = (String) request.getAttribute("message");
    }
    
    boolean status = (statusObj != null && statusObj); 
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký tài khoản</title>
        <link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css"/>
    </head>
    <body class="bg-gray-100 min-h-screen flex items-center justify-center">
        <div class="bg-white p-8 rounded-lg shadow-md w-96">
            <%
            if (status) { %>
            <p class="text-green-500"><%=message%></p> <a href="login.jsp">Sign in</a>
            <% } else { %> 
            <p class="text-red-500"><%=message%></p> 
            <% }
            %>
            <h2 class="text-2xl font-bold mb-6 text-center">Register</h2>

            <form class="space-y-4" action="signup" method="POST">
                <div>
                    <label for="name" class="block text-sm font-medium text-gray-700">Full name</label>
                    <input type="text" id="name" name="name" required 
                           placeholder="Nguyen Van A"
                           class="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400
                           focus:outline-none focus:border-sky-500 focus:ring-1 focus:ring-sky-500">
                </div>
                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                    <input type="email" id="email" name="email" required 
                           placeholder="abc@gmail.com"
                           class="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400
                           focus:outline-none focus:border-sky-500 focus:ring-1 focus:ring-sky-500">
                </div>
                <div>
                    <label for="roll" class="block text-sm font-medium text-gray-700">Roll</label>
                    <input type="text" id="roll" name="roll" required 
                           placeholder="123-456-7890"
                           class="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400
                           focus:outline-none focus:border-sky-500 focus:ring-1 focus:ring-sky-500">
                </div>
                <div>
                    <label for="address" class="block text-sm font-medium text-gray-700">Address</label>
                    <textarea id="address" name="address" rows="3" required 
                              placeholder="123 Main St, City, Country"
                              class="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400
                              focus:outline-none focus:border-sky-500 focus:ring-1 focus:ring-sky-500"></textarea>
                </div>
                <div>
                    <label for="userName" class="block text-sm font-medium text-gray-700">User name</label>
                    <input type="text" id="userName" name="userName" required 
                           placeholder="abc123"
                           class="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400
                           focus:outline-none focus:border-sky-500 focus:ring-1 focus:ring-sky-500">
                </div>
                <div>
                    <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                    <input type="password" id="password" name="password" required 
                           placeholder="Enter your password"
                           class="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400
                           focus:outline-none focus:border-sky-500 focus:ring-1 focus:ring-sky-500">
                </div>
                <div>
                    <label for="repassword" class="block text-sm font-medium text-gray-700">Re-enter Password</label>
                    <input type="password" id="repassword" name="repassword" required 
                           placeholder="Re-enter your password"
                           class="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400
                           focus:outline-none focus:border-sky-500 focus:ring-1 focus:ring-sky-500">
                </div>
                <div>
                    <button type="submit"
                            class="w-full px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 dark:bg-blue-500 dark:hover:bg-blue-600">
                        Sign up
                    </button>
                </div>
                <div class="text-sm text-center text-gray-500 dark:text-gray-400">
                    Have an account?
                    <a href="login.jsp" class="font-medium text-blue-600 hover:underline dark:text-blue-400">Sign in</a>
                </div>
            </form>
        </div>
    </body>
</html>