<%
    request.setAttribute("pageStyle", "login");
%>
<jsp:include page="header.jsp" />


    <main>
        <!-- Signup Section -->
        <section class="auth-section">
            <div class="bg-element bg-purple"></div>
            <div class="bg-element bg-blue"></div>
            
            <div class="auth-container">
                <div class="auth-header">
                    <h1 class="auth-title">
                        <span class="text-cyber-purple">Join</span> CyberPlay
                    </h1>
                    <p class="auth-subtitle">
                        Create your account and join our gaming community
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
                
                <div class="form-separator">OR CREATE AN ACCOUNT</div>
                
                <form class="auth-form" id="signupForm" action="${pageContext.request.contextPath}/register" method="post">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="firstName" class="form-label">First Name</label>
                            <input type="text" name = "firstName" id="firstName" class="cyber-input" placeholder="First name..." value="" required>
                            <span class="form-error" id="firstNameError">First name is required</span>
                        </div>
                        
                        <div class="form-group">
                        	
                            <label for="lastName" class="form-label">Last Name</label>
                            <input type="text" name = "lastName" id="lastName" class="cyber-input" placeholder="Last name..." required>
                            <span class="form-error" id="lastNameError">Last name is required</span>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="username" class="form-label">Username</label>
                        <div style="position: relative;">
                            <span class="username-prefix"></span>
                            <input type="text" name = "username" id="username" class="cyber-input username-input" placeholder="@username" required>
                        </div>
                        <span class="form-error" id="usernameError">Username must be 3-20 characters and contain only letters, numbers, and underscores</span>
                    </div>
                    
                    <div class="form-group">
                        <label for="email" class="form-label">Email Address</label>
                        <input type="email" name = "email"  id="email" class="cyber-input" placeholder="your@email.com" required>
                        <span class="form-error" id="emailError">Please enter a valid email address</span>
                    </div>
                    
                    <div class="form-group">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" name = "password" id="password" class="cyber-input" placeholder="********" required>
                        <div class="password-strength">
                            <div class="password-strength-bar" id="passwordStrengthBar"></div>
                        </div>
                        <div class="password-text" id="passwordStrengthText"></div>
                        <span class="form-error" id="passwordError">Password must be at least 8 characters with letters, numbers and special characters</span>
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                        <input type="password" name = "confirmPassword" id="confirmPassword" class="cyber-input" placeholder="********" required>
                        <span class="form-error" id="confirmPasswordError">Passwords do not match</span>
                    </div>
                    
                    <div class="checkbox-group">
                        <input type="checkbox" id="terms" class="cyber-checkbox" required>
                        <label for="terms">I agree to the <a href="#" class="text-cyber-purple">Terms of Service</a> and <a href="#" class="text-cyber-purple">Privacy Policy</a></label>
                        <span class="form-error" id="termsError">You must accept the terms and conditions</span>
                    </div>
                    
                    <button type="submit" class="cyber-button purple-glow auth-submit">
                        <i data-lucide="user-plus"></i>
                        Create Account
                    </button>
                </form>
                
                <div class="auth-footer">
                    <p>Already have an account? <a href="login.jsp">Login instead</a></p>
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
                        <li><a href="">Forums</a></li>
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
        lucide.createIcons();
    </script>
</body>
</html>