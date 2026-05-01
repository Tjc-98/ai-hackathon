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
    </div>

    <!-- Modern Footer -->
    <footer class="bg-dark text-light py-4 mt-5">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5><i class="fas fa-paw me-2"></i>JPetStore</h5>
                    <p class="text-muted">Your trusted online pet store</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <p class="mb-1">
                        <i class="fas fa-code me-1"></i>
                        Powered by <a href="http://www.mybatis.org" class="text-info text-decoration-none">MyBatis</a>
                    </p>
                    <c:if test="${sessionScope.accountBean != null && sessionScope.accountBean.authenticated}">
                        <c:if test="${sessionScope.accountBean.account.bannerOption}">
                            <small class="text-muted">${sessionScope.accountBean.account.bannerName}</small>
                        </c:if>
                    </c:if>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
