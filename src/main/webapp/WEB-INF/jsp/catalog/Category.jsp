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

<div class="container my-4">
    <!-- Breadcrumb Navigation -->
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <stripes:link beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean">
                    <i class="fas fa-home me-1"></i>Home
                </stripes:link>
            </li>
            <li class="breadcrumb-item active" aria-current="page">
                <i class="fas fa-th-large me-1"></i>${actionBean.category.name}
            </li>
        </ol>
    </nav>

    <!-- Category Header -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="card pet-card">
                <div class="card-body text-center py-5">
                    <h1 class="display-4 mb-3">
                        <c:choose>
                            <c:when test="${actionBean.category.categoryId == 'FISH'}">
                                <i class="fas fa-fish text-info me-3"></i>
                            </c:when>
                            <c:when test="${actionBean.category.categoryId == 'DOGS'}">
                                <i class="fas fa-dog text-warning me-3"></i>
                            </c:when>
                            <c:when test="${actionBean.category.categoryId == 'CATS'}">
                                <i class="fas fa-cat text-secondary me-3"></i>
                            </c:when>
                            <c:when test="${actionBean.category.categoryId == 'REPTILES'}">
                                <i class="fas fa-dragon text-success me-3"></i>
                            </c:when>
                            <c:when test="${actionBean.category.categoryId == 'BIRDS'}">
                                <i class="fas fa-dove text-primary me-3"></i>
                            </c:when>
                        </c:choose>
                        ${actionBean.category.name}
                    </h1>
                    <p class="lead text-muted">${actionBean.category.description}</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Products Grid -->
    <div class="row">
        <div class="col-12">
            <div class="card pet-card">
                <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                    <h4 class="mb-0">
                        <i class="fas fa-list me-2"></i>Available Products
                    </h4>
                    <span class="badge bg-light text-primary">${actionBean.productList.size()} products</span>
                </div>
                <div class="card-body p-0">
                    <c:choose>
                        <c:when test="${not empty actionBean.productList}">
                            <div class="table-responsive">
                                <table class="table table-modern mb-0">
                                    <thead>
                                        <tr>
                                            <th><i class="fas fa-barcode me-2"></i>Product ID</th>
                                            <th><i class="fas fa-tag me-2"></i>Product Name</th>
                                            <th class="text-center"><i class="fas fa-eye me-2"></i>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="product" items="${actionBean.productList}" varStatus="status">
                                            <tr class="fade-in-up" style="animation-delay: ${status.index * 0.1}s;">
                                                <td>
                                                    <span class="badge badge-modern bg-primary">${product.productId}</span>
                                                </td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <div>
                                                            <h6 class="mb-1">${product.name}</h6>
                                                            <small class="text-muted">${product.description}</small>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="text-center">
                                                    <stripes:link class="btn btn-primary btn-modern btn-sm"
                                                                 beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
                                                                 event="viewProduct">
                                                        <stripes:param name="productId" value="${product.productId}" />
                                                        <i class="fas fa-eye me-1"></i>View Details
                                                    </stripes:link>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="text-center py-5">
                                <i class="fas fa-exclamation-circle fa-3x text-muted mb-3"></i>
                                <h4 class="text-muted">No Products Available</h4>
                                <p class="text-muted">Sorry, there are no products in this category at the moment.</p>
                                <stripes:link class="btn btn-primary btn-modern"
                                             beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean">
                                    <i class="fas fa-arrow-left me-1"></i>Back to Categories
                                </stripes:link>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Navigation -->
    <div class="row mt-4">
        <div class="col-12">
            <div class="card pet-card">
                <div class="card-body">
                    <h5 class="card-title mb-3">
                        <i class="fas fa-compass me-2"></i>Explore Other Categories
                    </h5>
                    <div class="row">
                        <c:if test="${actionBean.category.categoryId != 'FISH'}">
                            <div class="col-md-2 col-6 mb-2">
                                <stripes:link class="btn btn-outline-info btn-sm w-100"
                                             beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
                                             event="viewCategory">
                                    <stripes:param name="categoryId" value="FISH" />
                                    <i class="fas fa-fish me-1"></i>Fish
                                </stripes:link>
                            </div>
                        </c:if>
                        <c:if test="${actionBean.category.categoryId != 'DOGS'}">
                            <div class="col-md-2 col-6 mb-2">
                                <stripes:link class="btn btn-outline-warning btn-sm w-100"
                                             beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
                                             event="viewCategory">
                                    <stripes:param name="categoryId" value="DOGS" />
                                    <i class="fas fa-dog me-1"></i>Dogs
                                </stripes:link>
                            </div>
                        </c:if>
                        <c:if test="${actionBean.category.categoryId != 'CATS'}">
                            <div class="col-md-2 col-6 mb-2">
                                <stripes:link class="btn btn-outline-secondary btn-sm w-100"
                                             beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
                                             event="viewCategory">
                                    <stripes:param name="categoryId" value="CATS" />
                                    <i class="fas fa-cat me-1"></i>Cats
                                </stripes:link>
                            </div>
                        </c:if>
                        <c:if test="${actionBean.category.categoryId != 'REPTILES'}">
                            <div class="col-md-2 col-6 mb-2">
                                <stripes:link class="btn btn-outline-success btn-sm w-100"
                                             beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
                                             event="viewCategory">
                                    <stripes:param name="categoryId" value="REPTILES" />
                                    <i class="fas fa-dragon me-1"></i>Reptiles
                                </stripes:link>
                            </div>
                        </c:if>
                        <c:if test="${actionBean.category.categoryId != 'BIRDS'}">
                            <div class="col-md-2 col-6 mb-2">
                                <stripes:link class="btn btn-outline-primary btn-sm w-100"
                                             beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
                                             event="viewCategory">
                                    <stripes:param name="categoryId" value="BIRDS" />
                                    <i class="fas fa-dove me-1"></i>Birds
                                </stripes:link>
                            </div>
                        </c:if>
                        <div class="col-md-2 col-6 mb-2">
                            <stripes:link class="btn btn-outline-dark btn-sm w-100"
                                         beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean">
                                <i class="fas fa-home me-1"></i>Home
                            </stripes:link>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>