<%--

       Copyright 2010-2023 the original author or authors.

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
                <i class="fas fa-shopping-cart me-1"></i>Shopping Cart
            </li>
        </ol>
    </nav>

    <div class="row">
        <!-- Shopping Cart -->
        <div class="col-lg-8">
            <div class="card pet-card">
                <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                    <h4 class="mb-0">
                        <i class="fas fa-shopping-cart me-2"></i>Shopping Cart
                    </h4>
                    <span class="badge bg-light text-primary">${actionBean.cart.numberOfItems} items</span>
                </div>
                <div class="card-body">
                    <stripes:form beanclass="org.mybatis.jpetstore.web.actions.CartActionBean">
                        <c:choose>
                            <c:when test="${actionBean.cart.numberOfItems == 0}">
                                <div class="text-center py-5">
                                    <i class="fas fa-shopping-cart fa-4x text-muted mb-3"></i>
                                    <h4 class="text-muted">Your cart is empty</h4>
                                    <p class="text-muted mb-4">Start shopping to add items to your cart</p>
                                    <stripes:link class="btn btn-primary btn-modern"
                                                 beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean">
                                        <i class="fas fa-store me-2"></i>Continue Shopping
                                    </stripes:link>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <!-- Cart Items -->
                                <div class="cart-items">
                                    <c:forEach var="cartItem" items="${actionBean.cart.cartItems}" varStatus="status">
                                        <div class="cart-item fade-in-up" style="animation-delay: ${status.index * 0.1}s;">
                                            <div class="row align-items-center">
                                                <!-- Item Image -->
                                                <div class="col-md-2 text-center mb-3 mb-md-0">
                                                    <img src="../images/${cartItem.item.itemId}.gif"
                                                         class="img-fluid rounded"
                                                         style="max-width: 80px; max-height: 80px;"
                                                         alt="${cartItem.item.product.name}"
                                                         onerror="this.src='../images/fish1.gif';" />
                                                </div>

                                                <!-- Item Details -->
                                                <div class="col-md-4 mb-3 mb-md-0">
                                                    <h6 class="mb-1">
                                                        <stripes:link class="text-decoration-none"
                                                                     beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
                                                                     event="viewItem">
                                                            <stripes:param name="itemId" value="${cartItem.item.itemId}" />
                                                            ${cartItem.item.itemId}
                                                        </stripes:link>
                                                    </h6>
                                                    <p class="text-muted small mb-1">
                                                        ${cartItem.item.attribute1} ${cartItem.item.attribute2}
                                                        ${cartItem.item.attribute3} ${cartItem.item.attribute4}
                                                        ${cartItem.item.attribute5} ${cartItem.item.product.name}
                                                    </p>
                                                    <small class="text-muted">Product ID: ${cartItem.item.product.productId}</small>
                                                </div>

                                                <!-- Stock Status -->
                                                <div class="col-md-2 text-center mb-3 mb-md-0">
                                                    <c:choose>
                                                        <c:when test="${cartItem.inStock}">
                                                            <span class="badge bg-success">
                                                                <i class="fas fa-check me-1"></i>In Stock
                                                            </span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge bg-danger">
                                                                <i class="fas fa-times me-1"></i>Out of Stock
                                                            </span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>

                                                <!-- Quantity -->
                                                <div class="col-md-2 text-center mb-3 mb-md-0">
                                                    <div class="input-group input-group-sm">
                                                        <stripes:text name="${cartItem.item.itemId}"
                                                                     value="${cartItem.quantity}"
                                                                     class="form-control text-center"
                                                                     style="max-width: 60px;" />
                                                    </div>
                                                </div>

                                                <!-- Price -->
                                                <div class="col-md-1 text-center mb-3 mb-md-0">
                                                    <div>
                                                        <small class="text-muted">Unit Price</small><br>
                                                        <strong>$<fmt:formatNumber value="${cartItem.item.listPrice}" pattern="#,##0.00" /></strong>
                                                    </div>
                                                </div>

                                                <!-- Total & Actions -->
                                                <div class="col-md-1 text-center">
                                                    <div class="mb-2">
                                                        <small class="text-muted">Total</small><br>
                                                        <strong class="text-success">$<fmt:formatNumber value="${cartItem.total}" pattern="#,##0.00" /></strong>
                                                    </div>
                                                    <stripes:link class="btn btn-outline-danger btn-sm"
                                                                 beanclass="org.mybatis.jpetstore.web.actions.CartActionBean"
                                                                 event="removeItemFromCart">
                                                        <stripes:param name="workingItemId" value="${cartItem.item.itemId}" />
                                                        <i class="fas fa-trash"></i>
                                                    </stripes:link>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                                <!-- Cart Actions -->
                                <div class="row mt-4">
                                    <div class="col-md-6">
                                        <stripes:submit name="updateCartQuantities"
                                                       class="btn btn-outline-primary btn-modern"
                                                       value="Update Cart" />
                                    </div>
                                    <div class="col-md-6 text-end">
                                        <h4 class="mb-0">
                                            Subtotal: <span class="text-success">$<fmt:formatNumber value="${actionBean.cart.subTotal}" pattern="#,##0.00" /></span>
                                        </h4>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </stripes:form>
                </div>
            </div>
        </div>

        <!-- Cart Summary & Actions -->
        <div class="col-lg-4">
            <c:if test="${actionBean.cart.numberOfItems > 0}">
                <div class="cart-summary">
                    <h5 class="mb-3">
                        <i class="fas fa-calculator me-2"></i>Order Summary
                    </h5>

                    <div class="d-flex justify-content-between mb-2">
                        <span>Items (${actionBean.cart.numberOfItems}):</span>
                        <span>$<fmt:formatNumber value="${actionBean.cart.subTotal}" pattern="#,##0.00" /></span>
                    </div>

                    <div class="d-flex justify-content-between mb-2">
                        <span>Shipping:</span>
                        <span class="text-success">FREE</span>
                    </div>

                    <hr>

                    <div class="d-flex justify-content-between mb-3">
                        <strong>Total:</strong>
                        <strong class="text-success h5">$<fmt:formatNumber value="${actionBean.cart.subTotal}" pattern="#,##0.00" /></strong>
                    </div>

                    <div class="d-grid gap-2">
                        <stripes:link class="btn btn-success btn-modern btn-lg"
                                     beanclass="org.mybatis.jpetstore.web.actions.OrderActionBean"
                                     event="newOrderForm">
                            <i class="fas fa-credit-card me-2"></i>Proceed to Checkout
                        </stripes:link>

                        <stripes:link class="btn btn-outline-primary"
                                     beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean">
                            <i class="fas fa-arrow-left me-2"></i>Continue Shopping
                        </stripes:link>
                    </div>
                </div>
            </c:if>

            <!-- My List Section -->
            <c:if test="${sessionScope.accountBean != null && sessionScope.accountBean.authenticated}">
                <c:if test="${!empty sessionScope.accountBean.account.listOption}">
                    <div class="card pet-card mt-4">
                        <div class="card-header bg-info text-white">
                            <h6 class="mb-0">
                                <i class="fas fa-heart me-2"></i>My Favorites
                            </h6>
                        </div>
                        <div class="card-body">
                            <%@ include file="IncludeMyList.jsp"%>
                        </div>
                    </div>
                </c:if>
            </c:if>
        </div>
    </div>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>
