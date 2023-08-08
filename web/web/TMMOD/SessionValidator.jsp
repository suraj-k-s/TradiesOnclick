<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("Sid") == null)
        {
            response.sendRedirect("../index.html");
        }
    %>