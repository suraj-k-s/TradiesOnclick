<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("Cid") == null)
        {
            response.sendRedirect("../index.html");
        }
    %>