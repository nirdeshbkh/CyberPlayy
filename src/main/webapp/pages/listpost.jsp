<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.cyberplay.model.postmodel, com.cyberplay.model.categorymodel" %>
<%
    // Grab category and posts set by ListPostController
    categorymodel categoryId = (categorymodel)request.getAttribute("category");
    @SuppressWarnings("unchecked")
    List<postmodel> posts = (List<postmodel>) request.getAttribute("posts");
    // In a real app you'd look up the category name from id; hard-code or pass name too:
    String categoryName ;
     categoryName = categoryId.getName();
%>

    <main>
        <!-- Forum Header -->
        <section class="forum-header">
            <div class="bg-element bg-purple"></div>
            <div class="forum-header-content">
                <div class="forum-category-icon bg-purple">
                    <i data-lucide="swords"></i>
                </div>
                <div class="forum-header-text">
                    <h1 class="forum-title">
                        <span class="text-cyber-purple"><%= categoryName %></span>
                    </h1>
                    <p class="forum-description">
                        <!-- Optional description passed in -->
                        <%= request.getAttribute("categoryDescription") != null 
                            ? request.getAttribute("categoryDescription") 
                            : "Discussion threads for " + categoryName %>
                    </p>
                </div>
                <div class="forum-actions">
                    <a href="<%=request.getContextPath()%>/createpost?category=<%=categoryId%>" 
                       class="cyber-button purple-glow">
                        <i data-lucide="plus"></i> Create New Post
                    </a>
                </div>
            </div>
        </section>

        <!-- Forum Navigation (unchanged) -->
        <section class="forum-navigation">…</section>

        <!-- Threads List -->
        <section class="threads-section">
            <div class="threads-header">
                <div class="col-topic">Topic</div>
                <div class="col-author">Author</div>
                <div class="col-replies">Replies</div>
                <div class="col-views">Views</div>
                <div class="col-activity">Last Activity</div>
            </div>
            <div class="threads-list">
              <%
                if (posts != null && !posts.isEmpty()) {
                    for (postmodel post : posts) {
              %>
                <a href="<%=request.getContextPath()%>/viewpost?id=<%=post.getId()%>" 
                   class="thread-item">
                  <div class="thread-topic">
                    <div class="thread-icon">
                      <i data-lucide="message-square"></i>
                    </div>
                    <div class="thread-content">
                      <h3 class="thread-title"><%= post.getTitle() %></h3>
                      <p class="thread-excerpt">
                        <%= post.getContent().length() > 100 
                              ? post.getContent().substring(0,100) + "…" 
                              : post.getContent() %>
                      </p>
                    </div>
                  </div>
                  <div class="thread-author">
                    <span class="author-name"><%= post.getusername() %></span>
                  </div>
                  <div class="thread-replies">—</div>
                  <div class="thread-views">—</div>
                  <div class="thread-activity">
                    <span class="activity-time">—</span>
                  </div>
                </a>
              <%
                    }
                } else {
              %>
                <p class="no-threads">No posts found in this forum.</p>
              <%
                }
              %>
            </div>

            <!-- Pagination (static or dynamic) -->
            <div class="pagination">…</div>
        </section>

        <!-- Call to Action -->
        <section class="forum-cta">…</section>
    </main>


<script>lucide.createIcons();</script>