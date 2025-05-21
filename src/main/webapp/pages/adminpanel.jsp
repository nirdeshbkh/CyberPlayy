<%
    // retrieve lists
    @SuppressWarnings("unchecked")
    java.util.List<com.cyberplay.model.categorymodel> categories =
        (java.util.List<com.cyberplay.model.categorymodel>) request.getAttribute("categories");
    @SuppressWarnings("unchecked")
    java.util.List<com.cyberplay.model.postmodel> posts =
        (java.util.List<com.cyberplay.model.postmodel>) request.getAttribute("posts");
%>
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
	href="${pageContext.request.contextPath}/css/admin.css" />
<
      <!-- === Add Category === -->
      <div id="categories" class="section">
        <div class="section-header">
          <h3 class="section-title">Add New Category</h3>
        </div>
        <form action="${pageContext.request.contextPath}/addcategory" method="post" class="admin-form">
          <label for="new-cat-name">Name</label>
          <input type="text" id="new-cat-name" name="name" required
            placeholder="Enter category name" />
          <button type="submit" class="cyber-button">Add Category</button>
        </form>
      </div>
<!-- === Manage Categories (editable) === -->
<div class="section">
  <div class="section-header">
    <h3 class="section-title">Manage Categories</h3>
  </div>
  <table class="admin-table">
    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
    <%
      if (categories != null) {
        for (com.cyberplay.model.categorymodel cat : categories) {
    %>
      <tr>
        <!-- update form -->
        <form action="<%= request.getContextPath() %>/editcategory" method="post" style="display:inline">
          <td>
            <input type="hidden" name="id" value="<%= cat.getId() %>" />
            <%= cat.getId() %>
          </td>
          <td>
            <input type="text"
                   name="name"
                   value="<%= cat.getName() %>"
                   required
                   style="width:100%;" />
          </td>
          <td>
            <button type="submit" class="table-action-btn" title="Save">
              <i data-lucide="save"></i>
            </button>
        </form>
        <!-- delete form -->
        <form action="<%= request.getContextPath() %>/deletecategory" method="post" style="display:inline">
            <input type="hidden" name="id" value="<%= cat.getId() %>" />
            <button type="submit"
                    class="table-action-btn"
                    title="Delete"
                    onclick="return confirm('Delete category &quot;<%= cat.getName() %>&quot;?');">
              <i data-lucide="trash-2"></i>
            </button>
        </form>
          </td>
      </tr>
    <%
        }
      }
    %>
    </tbody>
  </table>
</div>
<!-- === Manage Posts (editable) === -->
<div class="section">
  <div class="section-header">
    <h3 class="section-title">Manage Posts</h3>
  </div>
  <table class="admin-table">
    <thead>
      <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Content</th>
        <th>Category</th>
        <th>Author</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
    <%
      if (posts != null) {
        for (com.cyberplay.model.postmodel post : posts) {
    %>
      <tr>
        <!-- update form -->
        <form action="<%= request.getContextPath() %>/editpost" method="post" style="display:inline;">
          <td>
            <input type="hidden" name="id" value="<%= post.getId() %>" />
            <%= post.getId() %>
          </td>
          <td>
            <input type="text"
                   name="title"
                   value="<%= post.getTitle() %>"
                   required
                   style="width:100px;" />
          </td>
          <td>
            <textarea name="content"
                      required
                      style="width:200px; height:60px;"><%= post.getContent() %></textarea>
          </td>
          <td>
            <select name="category" required>
              <%
                for (com.cyberplay.model.categorymodel c : categories) {
                  String sel = (c.getId() == post.getCategory()) ? "selected" : "";
              %>
                <option value="<%= c.getId() %>" <%= sel %>>
                  <%= c.getName() %>
                </option>
              <%
                }
              %>
            </select>
          </td>
          <td><%= post.getusername() %></td>
          <td>
            <button type="submit" class="table-action-btn" title="Save">
              <i data-lucide="save"></i> Save
            </button>
        </form>
        <!-- delete form -->
        <form action="<%= request.getContextPath() %>/deletepost" method="post" style="display:inline;">
            <input type="hidden" name="id" value="<%= post.getId() %>" />
            <button type="submit"
                    class="table-action-btn"
                    title="Delete"
                    onclick="return confirm('Delete post &quot;<%= post.getTitle() %>&quot;?');">
              <i data-lucide="trash-2"></i> Delete
            </button>
        </form>
          </td>
      </tr>
    <%
        }
      }
    %>
    </tbody>
  </table>
</div>