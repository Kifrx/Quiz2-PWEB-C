<div class="offcanvas offcanvas-start text-bg-dark" tabindex="-1" id="sidebarMenu">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title fw-bold">Menu Options</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas"></button>
    </div>
    <div class="offcanvas-body">
        <div class="list-group list-group-flush">
            
            <a href="${pageContext.request.contextPath}/favorites" 
               class="list-group-item list-group-item-action list-group-item-dark bg-transparent text-white border-secondary">
               <i class="bi bi-heart me-2"></i> My Favorites
            </a>

            <a href="${pageContext.request.contextPath}/latest" 
               class="list-group-item list-group-item-action list-group-item-dark bg-transparent text-white border-secondary">
               <i class="bi bi-film me-2"></i> Latest Releases
            </a>

            <a href="${pageContext.request.contextPath}/top10" 
   class="list-group-item list-group-item-action list-group-item-dark bg-transparent text-white border-secondary">
   <i class="bi bi-trophy me-2"></i> Top 10 Movies
</a>
            
        </div>
    </div>
    
</div>