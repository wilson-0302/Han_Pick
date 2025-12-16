<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Forward directly to the home view to avoid redirect loops on root access.
    request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
%>
