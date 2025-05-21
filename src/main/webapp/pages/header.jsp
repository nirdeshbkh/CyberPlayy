<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CyberPlay ForumScape - Futuristic Gaming Community</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" >
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;600;700;800;900&family=Share+Tech+Mono&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/styles.css" />
<%
    String pageStyle = (String) request.getAttribute("pageStyle");
%>

<% if ("forum".equals(pageStyle)) { %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forum-styles.css" />
<% } %>
<% if ("login".equals(pageStyle)) { %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
<% } %>
    <script src="https://unpkg.com/lucide@latest/dist/umd/lucide.js"></script>
</head>

<body>
    <!-- Navbar -->
    <header class="navbar">
        <nav class="nav-container">
            <div class="nav-logo">
                <h1 class="logo"><span class="text-cyber-blue">Cyber</span><span class="text-cyber-purple">Play</span></h1>
            </div>
            
            <div class="nav-links desktop-menu">
                <a href="home" class="nav-link">Home</a>
                <a href="home#categories-nav" class="nav-link">Forums</a>
                <a href="#" class="nav-link">News</a>
                <a href="#" class="nav-link">Events</a>
                <a href="aboutus.jsp" class="nav-link">About</a>
            </div>
           
         	<div class="nav-actions desktop-menu">
    			<button class="nav-icon-btn">
        			<i data-lucide="search"></i>
    			</button>
    			<button class="nav-icon-btn">
        			<i data-lucide="bell"></i>
    			</button>
    			<%
        			String username = (String) session.getAttribute("username");
        			if (username == null) {
    			%>
        			<a href="login.jsp"><button class="cyber-button">Login</button></a>
    			<%
        			} else {
    			%>
        			<span class="welcome-message">Welcome, <%= username %>!</span>
        			<a href="/CyberPlay1/logout"><button class="cyber-button">Logout</button></a>
    			<%
        			}
    			%>
			</div>
            
            <div class="mobile-menu-toggle">
                <a href="login.jsp" class="cyber-button">
                    <i data-lucide="log-in"></i>
                    Login
                </a>
                
                <button class="nav-icon-btn">
                    <i data-lucide="menu"></i>
                </button>
                
            </div>
        </nav>
    </header>
