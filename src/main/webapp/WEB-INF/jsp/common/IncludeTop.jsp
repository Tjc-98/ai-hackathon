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
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JPetStore - Modern Pet Store</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/jpetstore-modern.css">

    <meta http-equiv="Cache-Control" content="max-age=0">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="Expires" content="Tue, 01 Jan 1980 1:00:00 GMT">
    <meta http-equiv="Pragma" content="no-cache">
</head>

<body>
    <!-- Modern Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
        <div class="container">
            <stripes:link class="navbar-brand" beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean">
                <i class="fas fa-paw me-2"></i><strong>JPetStore</strong>
            </stripes:link>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <stripes:link class="nav-link" beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean" event="viewCategory">
                            <stripes:param name="categoryId" value="FISH" />
                            <i class="fas fa-fish me-1"></i>Fish
                        </stripes:link>
                    </li>
                    <li class="nav-item">
                        <stripes:link class="nav-link" beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean" event="viewCategory">
                            <stripes:param name="categoryId" value="DOGS" />
                            <i class="fas fa-dog me-1"></i>Dogs
                        </stripes:link>
                    </li>
                    <li class="nav-item">
                        <stripes:link class="nav-link" beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean" event="viewCategory">
                            <stripes:param name="categoryId" value="CATS" />
                            <i class="fas fa-cat me-1"></i>Cats
                        </stripes:link>
                    </li>
                    <li class="nav-item">
                        <stripes:link class="nav-link" beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean" event="viewCategory">
                            <stripes:param name="categoryId" value="REPTILES" />
                            <i class="fas fa-dragon me-1"></i>Reptiles
                        </stripes:link>
                    </li>
                    <li class="nav-item">
                        <stripes:link class="nav-link" beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean" event="viewCategory">
                            <stripes:param name="categoryId" value="BIRDS" />
                            <i class="fas fa-dove me-1"></i>Birds
                        </stripes:link>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="Chat.jsp">
                            <i class="fas fa-robot me-1"></i>AI Agent
                        </a>
                    </li>
                </ul>

                <!-- Search Form -->
                <stripes:form class="d-flex me-3" beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean">
                    <input type="text" name="keyword" class="form-control me-2" placeholder="Search pets..." value="${param.keyword}" />                    <stripes:submit name="searchProducts" class="btn btn-outline-light" value="Search" />
                </stripes:form>

                <!-- User Menu -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <stripes:link class="nav-link" beanclass="org.mybatis.jpetstore.web.actions.CartActionBean" event="viewCart">
                            <i class="fas fa-shopping-cart me-1"></i>Cart
                        </stripes:link>
                    </li>
                    <c:if test="${sessionScope.accountBean == null || !sessionScope.accountBean.authenticated}">
                        <li class="nav-item">
                            <stripes:link class="nav-link" beanclass="org.mybatis.jpetstore.web.actions.AccountActionBean" event="signonForm">
                                <i class="fas fa-sign-in-alt me-1"></i>Sign In
                            </stripes:link>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.accountBean != null && sessionScope.accountBean.authenticated}">
                        <li class="nav-item">
                            <stripes:link class="nav-link" beanclass="org.mybatis.jpetstore.web.actions.AccountActionBean" event="editAccountForm">
                                <i class="fas fa-user me-1"></i>My Account
                            </stripes:link>
                        </li>
                        <li class="nav-item">
                            <stripes:link class="nav-link" beanclass="org.mybatis.jpetstore.web.actions.AccountActionBean" event="signoff">
                                <i class="fas fa-sign-out-alt me-1"></i>Sign Out
                            </stripes:link>
                        </li>
                    </c:if>
                    <li class="nav-item">
                        <a class="nav-link" href="../help.html">
                            <i class="fas fa-question-circle"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <stripes:messages />
