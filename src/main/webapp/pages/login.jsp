<%
    request.setAttribute("pageStyle", "login");
%>
<jsp:include page="header.jsp" />

    <main>
        <!-- Login Section -->
        <section class="auth-section">
            <div class="bg-element bg-blue"></div>
            <div class="bg-element bg-purple"></div>
            
            <div class="auth-container">
                <div class="auth-header">
                    <h1 class="auth-title">
                        <span class="text-cyber-blue">Login</span> to Your Account
                    </h1>
                    <p class="auth-subtitle">
                        Enter your credentials to access your CyberPlay profile
                    </p>
                </div>
                
                <div class="social-login">
                    <a href="#" class="social-button google">
                        <i data-lucide="mail"></i>
                    </a>
                    <a href="#" class="social-button twitter">
                        <i data-lucide="twitter"></i>
                    </a>
                    <a href="#" class="social-button github">
                        <i data-lucide="github"></i>
                    </a>
                    <a href="#" class="social-button discord">
                        <i data-lucide="message-square"></i>
                    </a>
                </div>
                
                <div class="form-separator">OR CONTINUE WITH</div>
                
                <form class="auth-form" id="loginForm" method="POST" action="${pageContext.request.contextPath}/login">
                    <div class="form-group">
                        <label for="username" class="form-label">Username</label>
						<input type="text" id="username" name="username" class="cyber-input" placeholder="@username" required>
						
                        <span class="form-error" id="usernameError">Please enter a valid username</span>
                    </div>
                    
                    <div class="form-group">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" name = "password" id="password" class="cyber-input" placeholder="********" required>
                        <span class="form-error" id="passwordError">Password must be at least 6 characters</span>
                    </div>
                    
                    <div class="flex justify-between items-center">
                        <div class="checkbox-group">
                            <input type="checkbox" id="remember" class="cyber-checkbox">
                            <label for="remember">Remember me</label>
                        </div>
                        
                        <a href="#" class="text-cyber-blue">Forgot password?</a>
                    </div>
                    
                    <button type="submit" class="cyber-button blue-glow auth-submit">
                        <i data-lucide="log-in"></i>
                        Login
                    </button>
                </form>
                
                <div class="auth-footer">
                    <p>Don't have an account? <a href="/CyberPlay1/pages/signup.jsp">Sign up now</a></p>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-grid">
                <div class="footer-about">
                    <h3 class="footer-title"><span class="text-cyber-blue">Cyber</span><span class="text-cyber-purple">Play</span></h3>
                    <p class="footer-description">The ultimate gaming community for futuristic gaming enthusiasts.</p>
                    <div class="footer-socials">
                        <a href="#" class="social-icon"><i data-lucide="github"></i></a>
                        <a href="#" class="social-icon"><i data-lucide="twitter"></i></a>
                        <a href="#" class="social-icon"><i data-lucide="instagram"></i></a>
                        <a href="#" class="social-icon"><i data-lucide="mail"></i></a>
                    </div>
                </div>

                <div class="footer-links">
                    <h4 class="footer-subtitle">Quick Links</h4>
                    <ul class="footer-menu">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="simulation-forum.jsp">Forums</a></li>
                        <li><a href="#">News</a></li>
                        <li><a href="#">Events</a></li>
                        <li><a href="aboutus.jsp">About</a></li>
                    </ul>
                </div>

                <div class="footer-links">
                    <h4 class="footer-subtitle">Game Categories</h4>
                    <ul class="footer-menu">
                        <li><a href="fps-forum.jsp">FPS</a></li>
                        <li><a href="rpg-forum.jsp">RPG</a></li>
                        <li><a href="mmorpg-forum.jsp">MMORPG</a></li>
                        <li><a href="simulation-forum.jsp">Simulation</a></li>
                        <li><a href="racing-forum.jsp">Racing</a></li>
                        <li><a href="battle-royale-forum.jsp">Battle Royale</a></li>
                        <li><a href="indie-forum.jsp">Indie</a></li>
                        <li><a href="general-gaming-forum.jsp">General Gaming</a></li>
                    </ul>
                </div>

                <div class="footer-newsletter">
                    <h4 class="footer-subtitle">Join Our Newsletter</h4>
                    <p class="footer-description">Get the latest gaming news and community updates.</p>
                    <form class="newsletter-form">
                        <input type="email" placeholder="your@email.com" class="cyber-input">
                        <button type="submit" class="cyber-button">Subscribe</button>
                    </form>
                </div>
            </div>

            <div class="footer-bottom">
                <p class="copyright">
                    &copy; 2025 CyberPlay ForumScape. All rights reserved.
                </p>
                <div class="footer-links-small">
                    <a href="#">Terms</a>
                    <a href="#">Privacy</a>
                    <a href="#">Cookies</a>
                </div>
                <p class="made-with">
                    Made in the Cyberpunk Universe
                </p>
            </div>
        </div>
    </footer>

    <script>
        // Initialize Lucide icons
        lucide.createIcons();
        
      
    </script>
</body>
</html>