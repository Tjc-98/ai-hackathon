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

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="card pet-card">
                <div class="card-header bg-primary text-white text-center py-4">
                    <h3 class="mb-0">
                        <i class="fas fa-sign-in-alt me-2"></i>Sign In
                    </h3>
                    <p class="mb-0 mt-2 opacity-75">Welcome back to JPetStore</p>
                </div>
                <div class="card-body p-4">
                    <stripes:form beanclass="org.mybatis.jpetstore.web.actions.AccountActionBean"
                                 class="form-modern" focus="">

                        <div class="text-center mb-4">
                            <i class="fas fa-paw fa-3x text-primary mb-3"></i>
                            <p class="text-muted">Please enter your credentials to continue</p>
                        </div>

                        <!-- Username Field -->
                        <div class="mb-3">
                            <label for="username" class="form-label">
                                <i class="fas fa-user me-2"></i>Username
                            </label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-user text-muted"></i>
                                </span>
                                <input type="text"
                                    name="username"
                                    value="j2ee"
                                    class="form-control"
                                    id="username"
                                    placeholder="Enter your username" />
                            </div>
                        </div>

                        <!-- Password Field -->
                        <div class="mb-4">
                            <label for="password" class="form-label">
                                <i class="fas fa-lock me-2"></i>Password
                            </label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-lock text-muted"></i>
                                </span>
                                <input type="text"
                                    name="username"
                                    value="j2ee"
                                    class="form-control"
                                    id="username"
                                    placeholder="Enter your username" />
                            </div>
                        </div>

                        <!-- Login Button -->
                        <div class="d-grid mb-3">
                            <button type="submit"
                                    name="signon"
                                    class="btn btn-primary btn-modern btn-lg"
                                    value="Sign In">
                                <i class="fas fa-sign-in-alt me-2"></i>Sign In
                            </button>
                        </div>

                    </stripes:form>

                    <!-- Registration Link -->
                    <div class="text-center">
                        <hr class="my-4">
                        <p class="text-muted mb-2">Don't have an account?</p>
                        <stripes:link class="btn btn-outline-success btn-modern"
                                     beanclass="org.mybatis.jpetstore.web.actions.AccountActionBean"
                                     event="newAccountForm">
                            <i class="fas fa-user-plus me-2"></i>Create New Account
                        </stripes:link>
                    </div>
                </div>

                <!-- Demo Credentials Info -->
                <div class="card-footer bg-light text-center">
                    <small class="text-muted">
                        <i class="fas fa-info-circle me-1"></i>
                        Demo credentials: Username: <strong>j2ee</strong>, Password: <strong>j2ee</strong>
                    </small>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="text-center mt-4">
                <stripes:link class="btn btn-outline-secondary"
                             beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean">
                    <i class="fas fa-arrow-left me-2"></i>Back to Store
                </stripes:link>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>
