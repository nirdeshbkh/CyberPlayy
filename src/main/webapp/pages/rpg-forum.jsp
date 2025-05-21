<%
    request.setAttribute("pageStyle", "forum");
%>
<jsp:include page="header.jsp" />

    <main>
        <!-- Forum Header - Category-specific banner with key information -->
        <section class="forum-header">
            <!-- Background element with category-specific color -->
            <div class="bg-element bg-purple"></div>
            
            <div class="forum-header-content">
                <!-- Category icon - Changes for each forum -->
                <div class="forum-category-icon bg-purple">
                    <i data-lucide="swords"></i>
                </div>
                
                <!-- Category information -->
                <div class="forum-header-text">
                    <h1 class="forum-title">
                        <!-- Category name with stylized coloring -->
                        <span class="text-cyber-purple">RPG</span> Adventures
                    </h1>
                    
                    <!-- Category description -->
                    <p class="forum-description">
                        Role-playing games, character builds, and quest strategies. 
                        Discuss everything from fantasy to sci-fi RPGs.
                    </p>
                    
                    <!-- Stats about this forum category -->
                    <div class="forum-stats">
                        <div class="forum-stat">
                            <i data-lucide="message-square"></i>
                            <span>976 Topics</span>
                        </div>
                        <div class="forum-stat">
                            <i data-lucide="users"></i>
                            <span>5,482 Members</span>
                        </div>
                        <div class="forum-stat">
                            <i data-lucide="calendar"></i>
                            <span>Last post: 15 minutes ago</span>
                        </div>
                    </div>
                </div>
                
                <!-- Primary call-to-action for this forum -->
                <div class="forum-actions">
                    <a button href="CreateNewPost.jsp" class="cyber-button purple-glow">
                    <i data-lucide="plus"></i>
                     Create New Post
                        
                   
                </a>
                </button>
                
                
                
                
                
                
                
                </div>
            </div>
        </section>

        <!-- Forum Navigation -->
        <section class="forum-navigation">
            <div class="breadcrumbs">
                <a href="index.jsp">Home</a>
                <i data-lucide="chevron-right"></i>
                <a href="#">Forums</a>
                <i data-lucide="chevron-right"></i>
                <span>RPG Adventures</span>
            </div>
            
            <div class="forum-controls">
                <div class="forum-search">
                    <input type="text" class="cyber-input" placeholder="Search this forum...">
                    <i data-lucide="search" class="search-icon"></i>
                </div>
                
                <div class="forum-filter">
                    <select class="cyber-select">
                        <option>Sort by: Latest</option>
                        <option>Sort by: Most Popular</option>
                        <option>Sort by: Most Replies</option>
                        <option>Sort by: Most Views</option>
                    </select>
                </div>
            </div>
        </section>

        <!-- Threads List - The main content section displaying all posts -->
        <section class="threads-section">
            <!-- Column headers - Only visible on desktop -->
            <div class="threads-header">
                <div class="col-topic">Topic</div>
                <div class="col-author">Author</div>
                <div class="col-replies">Replies</div>
                <div class="col-views">Views</div>
                <div class="col-activity">Last Activity</div>
            </div>
            
            <div class="threads-list">
                <!-- 
                    Thread items structure:
                    - Each thread is a clickable card linking to the thread details
                    - Special types (pinned, hot) get special styling and icons
                    - Contains thread topic, author info, stats, and activity info
                -->
                
                <!-- Thread 1 - Pinned (Important announcement) -->
                <a href="#" class="thread-item pinned">
                    <div class="thread-topic">
                        <div class="thread-icon pinned">
                            <!-- Pin icon indicates a pinned/sticky thread -->
                            <i data-lucide="pin"></i>
                        </div>
                        <div class="thread-content">
                            <div class="thread-tags">
                                <!-- Visual indicators of thread type -->
                                <span class="thread-tag pinned">Pinned</span>
                                <span class="thread-tag announcement">Announcement</span>
                            </div>
                            <h3 class="thread-title">RPG Forum Rules & Guidelines - Read Before Posting</h3>
                        </div>
                    </div>
                    <div class="thread-author">
                        <img src="https://i.pravatar.cc/150?img=12" alt="CyberMod" class="author-avatar">
                        <span class="author-name">CyberMod</span>
                    </div>
                    <div class="thread-replies">0</div>
                    <div class="thread-views">3,456</div>
                    <div class="thread-activity">
                        <span class="activity-time">Apr 2, 2025</span>
                    </div>
                </a>
                
                <!-- Thread 2 - Hot (Popular discussion) -->
                <a href="#" class="thread-item hot">
                    <div class="thread-topic">
                        <div class="thread-icon hot">
                            <!-- Flame icon indicates a hot/trending thread -->
                            <i data-lucide="flame"></i>
                        </div>
                        <div class="thread-content">
                            <div class="thread-tags">
                                <span class="thread-tag hot">Hot</span>
                            </div>
                            <h3 class="thread-title">Is Elder Scrolls 6 Finally Coming? Leak Analysis</h3>
                        </div>
                    </div>
                    <div class="thread-author">
                        <img src="https://i.pravatar.cc/150?img=2" alt="Dovahkiin" class="author-avatar">
                        <span class="author-name">Dovahkiin</span>
                    </div>
                    <div class="thread-replies">76</div>
                    <div class="thread-views">2,104</div>
                    <div class="thread-activity">
                        <span class="activity-time">15 minutes ago</span>
                    </div>
                </a>
                
                <!-- Thread 3 - Regular thread -->
                <a href="#" class="thread-item">
                    <div class="thread-topic">
                        <div class="thread-icon">
                            <!-- Standard message icon for regular threads -->
                            <i data-lucide="message-square"></i>
                        </div>
                        <div class="thread-content">
                            <h3 class="thread-title">Cyberpunk 2077 Next-Gen Update Performance Issues</h3>
                        </div>
                    </div>
                    <div class="thread-author">
                        <img src="https://i.pravatar.cc/150?img=1" alt="V_Samurai" class="author-avatar">
                        <span class="author-name">V_Samurai</span>
                    </div>
                    <div class="thread-replies">48</div>
                    <div class="thread-views">1,203</div>
                    <div class="thread-activity">
                        <span class="activity-time">2 hours ago</span>
                    </div>
                </a>
                
                <!-- Additional threads with similar structure -->
                <!-- Thread 4 -->
                <a href="#" class="thread-item">
                    <div class="thread-topic">
                        <div class="thread-icon">
                            <i data-lucide="message-square"></i>
                        </div>
                        <div class="thread-content">
                            <h3 class="thread-title">Best Character Build for Baldur's Gate 3: Paladin Guide</h3>
                        </div>
                    </div>
                    <div class="thread-author">
                        <img src="https://i.pravatar.cc/150?img=3" alt="RollCritical" class="author-avatar">
                        <span class="author-name">RollCritical</span>
                    </div>
                    <div class="thread-replies">34</div>
                    <div class="thread-views">987</div>
                    <div class="thread-activity">
                        <span class="activity-time">6 hours ago</span>
                    </div>
                </a>
                
                <!-- Thread 5 -->
                <a href="#" class="thread-item">
                    <div class="thread-topic">
                        <div class="thread-icon">
                            <i data-lucide="message-square"></i>
                        </div>
                        <div class="thread-content">
                            <h3 class="thread-title">Starfield: Hidden Quests and Easter Eggs Megathread</h3>
                        </div>
                    </div>
                    <div class="thread-author">
                        <img src="https://i.pravatar.cc/150?img=4" alt="CosmicWanderer" class="author-avatar">
                        <span class="author-name">CosmicWanderer</span>
                    </div>
                    <div class="thread-replies">56</div>
                    <div class="thread-views">1,452</div>
                    <div class="thread-activity">
                        <span class="activity-time">Yesterday</span>
                    </div>
                </a>
                
                <!-- Remaining threads - Similar pattern continues -->
                <!-- Thread 6 -->
                <a href="#" class="thread-item">
                    <div class="thread-topic">
                        <div class="thread-icon">
                            <i data-lucide="message-square"></i>
                        </div>
                        <div class="thread-content">
                            <h3 class="thread-title">The Witcher 4: Speculation and Wishlist</h3>
                        </div>
                    </div>
                    <div class="thread-author">
                        <img src="https://i.pravatar.cc/150?img=5" alt="GeraltFan" class="author-avatar">
                        <span class="author-name">GeraltFan</span>
                    </div>
                    <div class="thread-replies">91</div>
                    <div class="thread-views">2,389</div>
                    <div class="thread-activity">
                        <span class="activity-time">2 days ago</span>
                    </div>
                </a>
                
                <!-- Thread 7 -->
                <a href="#" class="thread-item">
                    <div class="thread-topic">
                        <div class="thread-icon">
                            <i data-lucide="message-square"></i>
                        </div>
                        <div class="thread-content">
                            <h3 class="thread-title">Diablo 4 Seasonal Content: Worth It?</h3>
                        </div>
                    </div>
                    <div class="thread-author">
                        <img src="https://i.pravatar.cc/150?img=6" alt="HellsHunter" class="author-avatar">
                        <span class="author-name">HellsHunter</span>
                    </div>
                    <div class="thread-replies">27</div>
                    <div class="thread-views">876</div>
                    <div class="thread-activity">
                        <span class="activity-time">3 days ago</span>
                    </div>
                </a>
                
                <!-- Thread 8 -->
                <a href="#" class="thread-item">
                    <div class="thread-topic">
                        <div class="thread-icon">
                            <i data-lucide="message-square"></i>
                        </div>
                        <div class="thread-content">
                            <h3 class="thread-title">Final Fantasy XVI vs VII Remake: Combat System Comparison</h3>
                        </div>
                    </div>
                    <div class="thread-author">
                        <img src="https://i.pravatar.cc/150?img=7" alt="CloudStrife" class="author-avatar">
                        <span class="author-name">CloudStrife</span>
                    </div>
                    <div class="thread-replies">42</div>
                    <div class="thread-views">1,127</div>
                    <div class="thread-activity">
                        <span class="activity-time">4 days ago</span>
                    </div>
                </a>
                
                <!-- Thread 9 -->
                <a href="#" class="thread-item">
                    <div class="thread-topic">
                        <div class="thread-icon">
                            <i data-lucide="message-square"></i>
                        </div>
                        <div class="thread-content">
                            <h3 class="thread-title">Dragon Age: The Veilguard - Everything We Know So Far</h3>
                        </div>
                    </div>
                    <div class="thread-author">
                        <img src="https://i.pravatar.cc/150?img=8" alt="DreadWolf" class="author-avatar">
                        <span class="author-name">DreadWolf</span>
                    </div>
                    <div class="thread-replies">38</div>
                    <div class="thread-views">1,356</div>
                    <div class="thread-activity">
                        <span class="activity-time">5 days ago</span>
                    </div>
                </a>
                
                <!-- Thread 10 -->
                <a href="#" class="thread-item">
                    <div class="thread-topic">
                        <div class="thread-icon">
                            <i data-lucide="message-square"></i>
                        </div>
                        <div class="thread-content">
                            <h3 class="thread-title">Elden Ring DLC: Shadow of the Erdtree Difficulty Discussion</h3>
                        </div>
                    </div>
                    <div class="thread-author">
                        <img src="https://i.pravatar.cc/150?img=9" alt="TarnishedOne" class="author-avatar">
                        <span class="author-name">TarnishedOne</span>
                    </div>
                    <div class="thread-replies">63</div>
                    <div class="thread-views">1,789</div>
                    <div class="thread-activity">
                        <span class="activity-time">Last week</span>
                    </div>
                </a>
            </div>
            
            <!-- Pagination - For navigating between pages of threads -->
            <div class="pagination">
                <!-- Currently active page -->
                <button class="page-button active">1</button>
                <button class="page-button">2</button>
                <button class="page-button">3</button>
                <button class="page-button">4</button>
                <button class="page-button">5</button>
                <!-- Next page button -->
                <button class="page-button">
                    <i data-lucide="chevron-right"></i>
                </button>
            </div>
        </section>

        <!-- Call to Action -->
        <section class="forum-cta">
            <div class="cta-content">
                <h2 class="cta-title">Join the <span class="text-cyber-purple">Conversation</span></h2>
                <p class="cta-description">
                    Have a question or insight about RPG games? Share it with our community.
                </p>
             <a button href="CreateNewPost.jsp" class="cyber-button purple-glow">
                    <i data-lucide="plus"></i>
                     Create New Post
                        
                        
                       
                   
                   
                
               
                 </a>   
                </button>
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
                        <li><a href="#">Forums</a></li>
                        <li><a href="#">News</a></li>
                        <li><a href="#">Events</a></li>
                        <li><a href="#">About</a></li>
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