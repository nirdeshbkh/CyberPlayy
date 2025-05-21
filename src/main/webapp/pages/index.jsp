<%
    request.setAttribute("pageStyle", "about");
%>
<jsp:include page="header.jsp" />

    <main>
        <!-- Hero Section -->
        <section class="hero-section">
            <div class="bg-element bg-blue"></div>
            <div class="bg-element bg-purple"></div>
            
            <div class="hero-content">
                <h1 class="hero-title animate-pulse-neon">
                    <span class="text-cyber-blue">CYBER</span>
                    <span class="text-white">PLAY</span>
                    <span class="text-cyber-purple">FORUMSCAPE</span>
                </h1>
                
                <p class="hero-subtitle">
                    The ultimate gaming forum for futuristic enthusiasts.
                    <br>
                    <span class="text-cyber-blue">Connect. Discuss. Dominate.</span>
                </p>
                
                <div class="hero-buttons">
                    <a href="signup.jsp" class="cyber-button yellow-glow">
                        Join Community
                    </a>
                    <a href="fps-forum.jsp"  button class="cyber-button">
                        Explore Forums
                      
                       
                    </button> </a>
                </div>
                
                <div class="hero-search">
                    <input type="text" class="cyber-input" placeholder="Search forums, topics, users...">
                    <i data-lucide="search" class="search-icon"></i>
                </div>
            </div>
        </section>

        <!-- Categories Section -->
        <section class="categories-section" id ="categories-nav">
            <div class="section-header">
                <h2 class="section-title">Game <span class="text-cyber-blue">Categories</span></h2>
                <p class="section-description">
                    Explore our vast collection of gaming forums covering every genre and platform.
                    Join discussions, share strategies, and connect with fellow gamers.
                </p>
            </div>

            <div class="categories-grid">
                <!-- 
                    Each category card links to its respective forum page.
                    The structure follows a consistent pattern:
                    1. Category icon with appropriate background color
                    2. Category title 
                    3. Short description
                    4. Topic count and explore link
                    
                    The background color classes (bg-*) are used for both the icon and the hover effect.
                -->
                
                <!-- FPS Category -->
              

<%
    @SuppressWarnings("unchecked")
    java.util.List<com.cyberplay.model.categorymodel> categories =
        (java.util.List<com.cyberplay.model.categorymodel>) request.getAttribute("categories");
    String ctx = request.getContextPath();
    if (categories != null) {
        for (com.cyberplay.model.categorymodel cat : categories) {
%>
<a href="<%= ctx %>/listpost?category=<%= cat.getId() %>" class="category-card">
    <div class="category-content">
        
        <h3 class="category-title"><%= cat.getName() %></h3>
     
        <div class="category-meta">
            
            <span class="explore-link">Explore --></span>
        </div>
    </div>
    
</a>
<%
        }
    }
%>

            </div>
        </section>

        <!-- Active Discussions Section -->
        <section class="discussions-section">
            <div class="section-header">
                <h2 class="section-title">Active <span class="text-cyber-blue">Discussions</span></h2>
                <p class="section-description">
                    Jump into the most popular conversations happening right now across the forum.
                    Share your thoughts or start your own discussion.
                </p>
            </div>

            <div class="discussions-grid">
                <!-- Discussion 1 -->
                <a href="#" class="discussion-card">
                    <div class="discussion-header">
                        <span class="discussion-category bg-purple">RPG</span>
                        <div class="discussion-tags">
                            <span class="discussion-tag hot">Hot</span>
                        </div>
                    </div>
                    <h3 class="discussion-title">Cyberpunk 2077 Next-Gen Update Performance Issues</h3>
                    <div class="discussion-meta">
                        <div class="discussion-author">
                            <img src="https://i.pravatar.cc/150?img=1" alt="V_Samurai" class="author-avatar">
                            <span class="author-name">V_Samurai</span>
                        </div>
                        <div class="discussion-stats">
                            <span class="stat"><i data-lucide="message-square"></i> 48</span>
                            <span class="stat"><i data-lucide="eye"></i> 1203</span>
                            <span class="stat"><i data-lucide="thumbs-up"></i> 32</span>
                            <span class="stat"><i data-lucide="clock"></i> 2h</span>
                        </div>
                    </div>
                </a>

                <!-- Discussion 2 -->
                <a href="#" class="discussion-card">
                    <div class="discussion-header">
                        <span class="discussion-category bg-purple">RPG</span>
                        <div class="discussion-tags">
                            <span class="discussion-tag hot">Hot</span>
                        </div>
                    </div>
                    <h3 class="discussion-title">Is Elder Scrolls 6 Finally Coming? Leak Analysis</h3>
                    <div class="discussion-meta">
                        <div class="discussion-author">
                            <img src="https://i.pravatar.cc/150?img=2" alt="Dovahkiin" class="author-avatar">
                            <span class="author-name">Dovahkiin</span>
                        </div>
                        <div class="discussion-stats">
                            <span class="stat"><i data-lucide="message-square"></i> 76</span>
                            <span class="stat"><i data-lucide="eye"></i> 2104</span>
                            <span class="stat"><i data-lucide="thumbs-up"></i> 89</span>
                            <span class="stat"><i data-lucide="clock"></i> 5h</span>
                        </div>
                    </div>
                </a>

                <!-- Additional discussions would go here - similar structure -->
                <!-- Four more discussions to match the existing 6 total -->
            </div>
        </section>

        <!-- Stats Section -->
        <section class="stats-section">
            <div class="section-header">
                <h2 class="section-title">Community <span class="text-cyber-blue">Stats</span></h2>
                <p class="section-description">
                    Join our thriving gaming community and be part of something special.
                </p>
            </div>

            <div class="stats-grid">
                <div class="stat-card border-cyber-blue">
                    <div class="stat-icon bg-cyber-blue-faded">
                        <i data-lucide="users" class="text-cyber-blue"></i>
                    </div>
                    <div class="stat-info">
                        <p class="stat-label">Active Members</p>
                        <p class="stat-value">25,647</p>
                    </div>
                </div>

                <div class="stat-card border-cyber-purple">
                    <div class="stat-icon bg-cyber-purple-faded">
                        <i data-lucide="message-square" class="text-cyber-purple"></i>
                    </div>
                    <div class="stat-info">
                        <p class="stat-label">Forum Posts</p>
                        <p class="stat-value">124,853</p>
                    </div>
                </div>

                <div class="stat-card border-cyber-green">
                    <div class="stat-icon bg-cyber-green-faded">
                        <i data-lucide="gamepad-2" class="text-cyber-green"></i>
                    </div>
                    <div class="stat-info">
                        <p class="stat-label">Games Discussed</p>
                        <p class="stat-value">3,452</p>
                    </div>
                </div>

                <div class="stat-card border-cyber-yellow">
                    <div class="stat-icon bg-cyber-yellow-faded">
                        <i data-lucide="calendar" class="text-cyber-yellow"></i>
                    </div>
                    <div class="stat-info">
                        <p class="stat-label">Events This Month</p>
                        <p class="stat-value">14</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Call to Action Section -->
        <section class="cta-section">
            <div class="cta-border top"></div>
            <div class="cta-border bottom"></div>
            <div class="cta-content">
                <h2 class="cta-title">Ready to <span class="text-cyber-blue">Join</span> the <span class="text-cyber-purple">Future</span> of Gaming?</h2>
                <p class="cta-description">
                    Create your account today and become part of our growing community of passionate gamers.
                    Share your insights, discover new games, and connect with like-minded players.
                </p>
                <div class="cta-buttons">
                    <a href="signup.jsp" class="cyber-button purple-glow">
                        <i data-lucide="user-plus"></i>
                        Create Account
                    </a>
                    <a href="login.jsp" class="cyber-button">
                        <i data-lucide="log-in"></i>
                        Sign In
                    </a>
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
                        <li><a href="#">Home</a></li>
                        <li><a href="rpg-forum.jsp">Forums</a></li>
                        <li><a href="#">News</a></li>
                        <li><a href="#">Events</a></li>
                        <li><a href="aboutus.jsp">About</a></li>
                    </ul>
                </div>

                <div class="footer-links">
                    <!-- 
                        Game Categories in the footer.
                        Each link points to the corresponding forum page.
                        This ensures consistent navigation throughout the site.
                    -->
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
    
    <!-- Random forum navigation script -->
    <script src="random-forum.js"></script>
</body>
</html>
