<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- TODO: Replace with controller-driven forward; temporary direct forward to home.jsp --%>
<%
    request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
%>
