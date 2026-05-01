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

<!-- Welcome Hero Section -->
<c:if test="${sessionScope.accountBean != null && sessionScope.accountBean.authenticated}">
    <div class="welcome-section">
        <div class="container">
            <div class="welcome-content fade-in-up">
                <h1><i class="fas fa-heart text-danger"></i> Welcome back, ${sessionScope.accountBean.account.firstName}!</h1>
                <p class="lead">Discover amazing pets and supplies for your beloved companions</p>
            </div>
        </div>
    </div>
</c:if>

<div class="container my-5">
    <div class="row">
        <!-- Categories Sidebar -->
        <div class="col-lg-4 mb-4">
            <div class="card pet-card">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0"><i class="fas fa-th-large me-2"></i>Pet Categories</h4>
                </div>
                <div class="card-body p-0">
                    <div class="list-group list-group-flush">
                        <stripes:link class="list-group-item list-group-item-action d-flex align-items-center py-3"
                                     beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
                                     event="viewCategory">
                            <stripes:param name="categoryId" value="FISH" />
                            <img src="../images/fish1.gif" class="category-icon me-3" alt="Fish" />
                            <div>
                                <h5 class="mb-1 text-info"><i class="fas fa-fish me-2"></i>Fish</h5>
                                <p class="mb-0 text-muted">Saltwater & Freshwater varieties</p>
                            </div>
                        </stripes:link>

                        <stripes:link class="list-group-item list-group-item-action d-flex align-items-center py-3"
                                     beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
                                     event="viewCategory">
                            <stripes:param name="categoryId" value="DOGS" />
                            <img src="../images/dog2.gif" class="category-icon me-3" alt="Dogs" />
                            <div>
                                <h5 class="mb-1 text-warning"><i class="fas fa-dog me-2"></i>Dogs</h5>
                                <p class="mb-0 text-muted">Various breeds & sizes</p>
                            </div>
                        </stripes:link>

                        <stripes:link class="list-group-item list-group-item-action d-flex align-items-center py-3"
                                     beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
                                     event="viewCategory">
                            <stripes:param name="categoryId" value="CATS" />
                            <img src="../images/cat2.gif" class="category-icon me-3" alt="Cats" />
                            <div>
                                <h5 class="mb-1 text-secondary"><i class="fas fa-cat me-2"></i>Cats</h5>
                                <p class="mb-0 text-muted">Various breeds & exotic varieties</p>
                            </div>
                        </stripes:link>

                        <stripes:link class="list-group-item list-group-item-action d-flex align-items-center py-3"
                                     beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
                                     event="viewCategory">
                            <stripes:param name="categoryId" value="REPTILES" />
                            <img src="../images/snake1.gif" class="category-icon me-3" alt="Reptiles" />
                            <div>
                                <h5 class="mb-1 text-success"><i class="fas fa-dragon me-2"></i>Reptiles</h5>
                                <p class="mb-0 text-muted">Lizards, turtles & snakes</p>
                            </div>
                        </stripes:link>

                        <stripes:link class="list-group-item list-group-item-action d-flex align-items-center py-3"
                                     beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
                                     event="viewCategory">
                            <stripes:param name="categoryId" value="BIRDS" />
                            <img src="../images/bird2.gif" class="category-icon me-3" alt="Birds" />
                            <div>
                                <h5 class="mb-1 text-primary"><i class="fas fa-dove me-2"></i>Birds</h5>
                                <p class="mb-0 text-muted">Exotic & domestic varieties</p>
                            </div>
                        </stripes:link>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content Area -->
        <div class="col-lg-8">
            <div class="main-image-container fade-in-up">
                <h2 class="mb-4"><i class="fas fa-store me-2 text-primary"></i>Welcome to JPetStore</h2>
                <p class="lead text-muted mb-4">Your one-stop destination for all your pet needs</p>

                <!-- Interactive Pet Store Image -->
                <div class="position-relative">
                    <img src="../images/splash.gif" class="img-fluid rounded-3 shadow-lg"
                         alt="Pet Store" style="max-width: 500px;" />

                    <!-- Interactive Overlay Buttons -->
					<div class="position-relative">
						<div class="position-absolute top-50 start-50 translate-middle w-100 d-flex flex-wrap justify-content-center align-items-center" style="pointer-events: none;">
							<div class="d-flex flex-wrap justify-content-center gap-3" style="pointer-events: auto;">
								<stripes:link class="btn btn-primary btn-modern"
											beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
											event="viewCategory">
									<stripes:param name="categoryId" value="BIRDS" />
									<i class="fas fa-dove me-1"></i>Birds
								</stripes:link>
								<stripes:link class="btn btn-info btn-modern"
											beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
											event="viewCategory">
									<stripes:param name="categoryId" value="FISH" />
									<i class="fas fa-fish me-1"></i>Fish
								</stripes:link>
								<stripes:link class="btn btn-warning btn-modern"
											beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
											event="viewCategory">
									<stripes:param name="categoryId" value="DOGS" />
									<i class="fas fa-dog me-1"></i>Dogs
								</stripes:link>
								<stripes:link class="btn btn-success btn-modern"
											beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
											event="viewCategory">
									<stripes:param name="categoryId" value="REPTILES" />
									<i class="fas fa-dragon me-1"></i>Reptiles
								</stripes:link>
								<stripes:link class="btn btn-secondary btn-modern"
											beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
											event="viewCategory">
									<stripes:param name="categoryId" value="CATS" />
									<i class="fas fa-cat me-1"></i>Cats
								</stripes:link>
							</div>
						</div>
					</div>
                </div>

                <div class="mt-4">
                    <div class="row text-center">
                        <div class="col-md-4 mb-3">
                            <div class="p-3">
                                <i class="fas fa-shipping-fast fa-2x text-primary mb-2"></i>
                                <h5>Fast Delivery</h5>
                                <p class="text-muted small">Quick & safe delivery to your door</p>
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <div class="p-3">
                                <i class="fas fa-heart fa-2x text-danger mb-2"></i>
                                <h5>Pet Care</h5>
                                <p class="text-muted small">Expert advice & quality products</p>
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <div class="p-3">
                                <i class="fas fa-shield-alt fa-2x text-success mb-2"></i>
                                <h5>Guaranteed</h5>
                                <p class="text-muted small">100% satisfaction guarantee</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>
