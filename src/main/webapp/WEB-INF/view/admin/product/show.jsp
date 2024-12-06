<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <!-- <meta name="description" content="" />
            <meta name="author" content="" /> -->
                <title>Manage Product</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp"></jsp:include>
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp"></jsp:include>
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Sản phẩm</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"><a href="/admin">Thống kê</a></li>
                                    <li class="breadcrumb-item active"><a href="/admin/product">Sản phẩm</a></li>
                                </ol>
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3>Bảng sản phẩm</h3>
                                                <a href="/admin/product/create" class="btn btn-primary">Tạo sản phẩm</a>

                                            </div>
                                            <hr>
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Tên</th>
                                                        <th scope="col">Giá</th>
                                                        <th scope="col">Hãng sản xuất</th>
                                                        <th scope="col">Hành động</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="product" items="${products}">
                                                        <tr>
                                                            <th>${product.id}</th>
                                                            <td>${product.name}</td>
                                                            <td>
                                                                <fmt:formatNumber type="number"
                                                                    value="${product.price}" /> đ
                                                            </td>
                                                            <td>${product.factory}</td>
                                                            <td>
                                                                <a href="/admin/product/${product.id}"
                                                                    class="btn btn-success">Xem chi tiết</a>
                                                                <a href="/admin/product/update/${product.id}"
                                                                    class="btn btn-warning">Cập nhật</a>
                                                                <a href="/admin/product/delete/${product.id}"
                                                                    class="btn btn-danger">Xóa</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination justify-content-center">
                                                    <li class="page-item">
                                                        <a class="page-link ${1 eq currentPage ? 'disabled' : ''}"
                                                            href="/admin/product?page=${currentPage-1}"
                                                            aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                        </a>
                                                    </li>
                                                    <c:forEach begin="0" end="${totalPages-1}" varStatus="loop">
                                                        <li class="page-item">
                                                            <a class="page-link ${(loop.index+1) eq currentPage ? 'active' : ''}"
                                                                href="/admin/product?page=${loop.index+1}">
                                                                ${loop.index+1}
                                                            </a>
                                                        </li>
                                                    </c:forEach>

                                                    <li class="page-item">
                                                        <a class="page-link ${totalPages eq currentPage ? 'disabled' : ''}"
                                                            href="/admin/product?page=${currentPage + 1}"
                                                            aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </nav>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp"></jsp:include>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>



            </body>

            </html>