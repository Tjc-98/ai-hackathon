<%--

       Copyright 2010-2022 the original author or authors.

       Licensed under the Apache License, Version 2.0 (the "License");
       you may not use this file except in compliance with the License.
       You may obtain a copy of the License at

          https://www.apache.org/licenses/LICENSE-2.0

       Unless required by applicable law or agreed to in writing, software
       distributed under the License is distributed on an "AS IS" BASIS,
       WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
       See the License for the specific language governing permissions and
       limitations under the License.

--%>
<%@ include file="../common/IncludeTop.jsp"%>

<jsp:useBean id="catalog" class="org.mybatis.jpetstore.web.actions.CatalogActionBean" />

<div class="container my-4">
    <!-- Breadcrumb Navigation -->
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <stripes:link beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean">
                    <i class="fas fa-home me-1"></i>Home
                </stripes:link>
            </li>
            <li class="breadcrumb-item">
                <stripes:link beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
                             event="viewCategory">
                    <stripes:param name="categoryId" value="${actionBean.product.categoryId}" />
                    <i class="fas fa-th-large me-1"></i>${actionBean.product.categoryId}
                </stripes:link>
            </li>
            <li class="breadcrumb-item active" aria-current="page">
                <i class="fas fa-box me-1"></i>${actionBean.product.name}
            </li>
        </ol>
    </nav>

    <!-- Product Header -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="card pet-card">
                <div class="card-body text-center py-5">
                    <h1 class="display-4 mb-3">
                        <c:choose>
                            <c:when test="${actionBean.product.categoryId == 'FISH'}">
                                <i class="fas fa-fish text-info me-3"></i>
                            </c:when>
                            <c:when test="${actionBean.product.categoryId == 'DOGS'}">
                                <i class="fas fa-dog text-warning me-3"></i>
                            </c:when>
                            <c:when test="${actionBean.product.categoryId == 'CATS'}">
                                <i class="fas fa-cat text-secondary me-3"></i>
                            </c:when>
                            <c:when test="${actionBean.product.categoryId == 'REPTILES'}">
                                <i class="fas fa-dragon text-success me-3"></i>
                            </c:when>
                            <c:when test="${actionBean.product.categoryId == 'BIRDS'}">
                                <i class="fas fa-dove text-primary me-3"></i>
                            </c:when>
                        </c:choose>
                        ${actionBean.product.name}
                    </h1>
                    <p class="lead text-muted">${actionBean.product.description}</p>
                    <span class="badge bg-primary badge-modern">Product ID: ${actionBean.product.productId}</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Available Items -->
    <div class="row">
        <div class="col-12">
            <div class="card pet-card">
                <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                    <h4 class="mb-0">
                        <i class="fas fa-shopping-bag me-2"></i>Available Items
                    </h4>
                    <span class="badge bg-light text-primary">${actionBean.itemList.size()} items</span>
                </div>
                <div class="card-body p-0">
                    <c:choose>
                        <c:when test="${not empty actionBean.itemList}">
                            <div class="row g-0">
                                <c:forEach var="item" items="${actionBean.itemList}" varStatus="status">
                                    <div class="col-lg-6 col-xl-4">
                                        <div class="card border-0 h-100 fade-in-up" style="animation-delay: ${status.index * 0.1}s;">
                                            <div class="card-body p-4">
                                                <!-- Item Image -->
                                                <div class="text-center mb-3">
                                                    <c:choose>
                                                        <c:when test="${not empty item.attribute1}">
                                                            <img src="../images/${item.itemId}.gif"
                                                                 class="product-image"
                                                                 alt="${item.attribute1} ${item.attribute2}"
                                                                 onerror="this.src='../images/fish1.gif';" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="product-image d-flex align-items-center justify-content-center bg-light">
                                                                <i class="fas fa-image fa-3x text-muted"></i>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>

                                                <!-- Item Details -->
                                                <div class="text-center">
                                                    <h5 class="card-title mb-2">
                                                        <stripes:link class="text-decoration-none"
                                                                     beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
                                                                     event="viewItem">
                                                            <stripes:param name="itemId" value="${item.itemId}" />
                                                            ${item.itemId}
                                                        </stripes:link>
                                                    </h5>

                                                    <p class="card-text text-muted mb-3">
                                                        ${item.attribute1} ${item.attribute2} ${item.attribute3}
                                                        ${item.attribute4} ${item.attribute5}
                                                    </p>

                                                    <div class="mb-3">
                                                        <span class="h4 text-success">
                                                            <fmt:formatNumber value="${item.listPrice}" pattern="$#,##0.00" />
                                                        </span>
                                                    </div>

                                                    <!-- Action Buttons -->
                                                    <div class="d-grid gap-2">
                                                        <stripes:link class="btn btn-success btn-modern"
                                                                     beanclass="org.mybatis.jpetstore.web.actions.CartActionBean"
                                                                     event="addItemToCart">
                                                            <stripes:param name="workingItemId" value="${item.itemId}" />
                                                            <i class="fas fa-cart-plus me-2"></i>Add to Cart
                                                        </stripes:link>

                                                        <stripes:link class="btn btn-outline-primary btn-sm"
                                                                     beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
                                                                     event="viewItem">
                                                            <stripes:param name="itemId" value="${item.itemId}" />
                                                            <i class="fas fa-eye me-1"></i>View Details
                                                        </stripes:link>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="text-center py-5">
                                <i class="fas fa-exclamation-circle fa-3x text-muted mb-3"></i>
                                <h4 class="text-muted">No Items Available</h4>
                                <p class="text-muted">Sorry, there are no items for this product at the moment.</p>
                                <stripes:link class="btn btn-primary btn-modern"
                                             beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
                                             event="viewCategory">
                                    <stripes:param name="categoryId" value="${actionBean.product.categoryId}" />
                                    <i class="fas fa-arrow-left me-1"></i>Back to ${actionBean.product.categoryId}
                                </stripes:link>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Actions -->
    <div class="row mt-4">
        <div class="col-12">
            <div class="card pet-card">
                <div class="card-body text-center">
                    <h5 class="card-title mb-3">
                        <i class="fas fa-compass me-2"></i>Quick Actions
                    </h5>
                    <div class="btn-group" role="group">
                        <stripes:link class="btn btn-outline-primary"
                                     beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
                                     event="viewCategory">
                            <stripes:param name="categoryId" value="${actionBean.product.categoryId}" />
                            <i class="fas fa-arrow-left me-1"></i>Back to ${actionBean.product.categoryId}
                        </stripes:link>

                        <stripes:link class="btn btn-outline-secondary"
                                     beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean">
                            <i class="fas fa-home me-1"></i>Home
                        </stripes:link>

                        <stripes:link class="btn btn-outline-success"
                                     beanclass="org.mybatis.jpetstore.web.actions.CartActionBean"
                                     event="viewCart">
                            <i class="fas fa-shopping-cart me-1"></i>View Cart
                        </stripes:link>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>
