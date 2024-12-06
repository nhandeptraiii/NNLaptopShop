<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- Navbar start -->
        <style>
            .navbar {
                padding: 0.7rem 1rem;
                /* Giảm padding */
            }

            .navbar-brand h1 {
                font-size: 1.5rem;
                /* Giảm kích thước font chữ */
            }

            .nav-item {
                font-size: 0.9rem;
                /* Giảm kích thước font chữ cho các mục nav */
            }

            .fa {
                font-size: 1.5rem;
                /* Giảm kích thước icon */
            }

            .top-info small {
                font-size: 0.8rem;
                /* Giảm kích thước font chữ cho thông tin trên cùng */
            }
        </style>
        <div class="container-fluid fixed-top ">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#"
                                class="text-white">Ninh Kiều, Cần Thơ</a></small>
                        <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#"
                                class="text-white">nhanb2105554@student.ctu.edu.vn</a></small>
                    </div>

                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="/" class="navbar-brand">
                        <h1 class="text-primary display-6">NNLaptopShop</h1>
                    </a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white justify-content-between mx-5" id="navbarCollapse">
                        <div class="navbar-nav">
                            <a href="/" class="nav-item nav-link active">Trang Chủ</a>
                            <a href="/products" class="nav-item nav-link">Sản Phẩm</a>
                            <!-- <sec:authorize access="hasRole('ADMIN')">
                                <a href="/admin" class="nav-item nav-link active">
                                    Quản lý
                                </a>
                            </sec:authorize> -->
                        </div>
                        <div class="d-flex m-3 me-0">
                            <c:if test="${not empty pageContext.request.userPrincipal}">

                                <a href="/cart" class="position-relative me-4 my-auto">
                                    <i class="fa fa-shopping-bag fa-2x"></i>
                                    <span
                                        class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                                        style="top: -5px; left: 15px; height: 20px; min-width: 20px;">
                                        ${sessionScope.sum}
                                    </span>
                                </a>
                                <div class="dropdown my-auto">
                                    <a href="#" class="dropdown" role="button" id="dropdownMenuLink"
                                        data-bs-toggle="dropdown" aria-expanded="false" data-bs-toggle="dropdown"
                                        aria-expanded="false">
                                        <i class="fas fa-user fa-2x"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end p-4" aria-labelledby="dropdownMenuLink">
                                        <li class="d-flex align-items-center flex-column" style="min-width: 300px;">
                                            <img style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden;"
                                                src="/images/avatar/${sessionScope.avatar}" />
                                            <div class="text-center my-3">
                                                <c:out value="${sessionScope.fullName}" />
                                            </div>
                                        </li>
                                        <li><a class="dropdown-item" href="/admin">Quản lý tài khoản</a></li>
                                        <li><a class="dropdown-item" href="/order-history">Lịch sử mua hàng</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li>
                                            <form method="post" action="/logout">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <button class="dropdown-item">Đăng xuất</button>
                                            </form>
                                        </li>
                                    </ul>
                                </div>
                            </c:if>
                            <c:if test="${empty pageContext.request.userPrincipal}">
                                <a href="#" class="position-relative me-4 my-auto">
                                    <a href="/login" class="position-relative me-4 my-auto">
                                        Đăng Nhập
                                    </a>
                                </a>
                            </c:if>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->