<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">

    <title>Carrello</title>

    <!--== Google Fonts ==-->
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i,700,700i"/>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Montserrat:400,700"/>
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i"/>

    <!--=== Bootstrap CSS ===-->
    <link href="assets/css/vendor/bootstrap.min.css" rel="stylesheet">
    <!--=== Font-Awesome CSS ===-->
    <link href="assets/css/vendor/font-awesome.css" rel="stylesheet">
    <!--=== Plugins CSS ===-->
    <link href="assets/css/plugins.css" rel="stylesheet">
    <!--=== Main Style CSS ===-->
    <link href="assets/css/style.css" rel="stylesheet">

    <!-- Modernizer JS -->
    <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>


    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>


<jsp:include page="fragments/header.jsp" />


<!--== Page Content Wrapper Start ==-->
<div id="page-content-wrapper" class="p-9">
    <div class="container">
        <!-- Cart Page Content Start -->
        <div class="row">
            <div class="col-lg-12">
                <!-- Cart Table Area -->
                <div class="cart-table table-responsive">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th class="pro-thumbnail">Thumbnail</th>
                            <th class="pro-title">Product</th>
                            <th class="pro-price">Price</th>
                            <th class="pro-quantity">Quantity</th>
                            <th class="pro-subtotal">Total</th>
                            <th class="pro-remove">Remove</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="pro-thumbnail"><a href="#"><img class="img-fluid" src="assets/img/product-1.jpg"
                                                                       alt="Product"/></a></td>
                            <td class="pro-title"><a href="#">Zeon Zen 4 Pro</a></td>
                            <td class="pro-price"><span>$295.00</span></td>
                            <td class="pro-quantity">
                                <div class="pro-qty"><input type="text" value="1"></div>
                            </td>
                            <td class="pro-subtotal"><span>$295.00</span></td>
                            <td class="pro-remove"><a href="#"><i class="fa fa-trash-o"></i></a></td>
                        </tr>
                        <tr>
                            <td class="pro-thumbnail"><a href="#"><img class="img-fluid" src="assets/img/product-2.jpg"
                                                                       alt="Product"/></a></td>
                            <td class="pro-title"><a href="#">Aquet Drone D 420</a></td>
                            <td class="pro-price"><span>$275.00</span></td>
                            <td class="pro-quantity">
                                <div class="pro-qty"><input type="text" value="2"></div>
                            </td>
                            <td class="pro-subtotal"><span>$550.00</span></td>
                            <td class="pro-remove"><a href="#"><i class="fa fa-trash-o"></i></a></td>
                        </tr>
                        <tr>
                            <td class="pro-thumbnail"><a href="#"><img class="img-fluid" src="assets/img/product-3.jpg"
                                                                       alt="Product"/></a></td>
                            <td class="pro-title"><a href="#">Game Station X 22</a></td>
                            <td class="pro-price"><span>$295.00</span></td>
                            <td class="pro-quantity">
                                <div class="pro-qty"><input type="text" value="1"></div>
                            </td>
                            <td class="pro-subtotal"><span>$295.00</span></td>
                            <td class="pro-remove"><a href="#"><i class="fa fa-trash-o"></i></a></td>
                        </tr>
                        <tr>
                            <td class="pro-thumbnail"><a href="#"><img class="img-fluid" src="assets/img/product-4.jpg"
                                                                       alt="Product"/></a></td>
                            <td class="pro-title"><a href="#">Roxxe Headphone Z 75 </a></td>
                            <td class="pro-price"><span>$110.00</span></td>
                            <td class="pro-quantity">
                                <div class="pro-qty"><input type="text" value="1"></div>
                            </td>
                            <td class="pro-subtotal"><span>$110.00</span></td>
                            <td class="pro-remove"><a href="#"><i class="fa fa-trash-o"></i></a></td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Cart Update Option -->
                <div class="cart-update-option d-block d-lg-flex">
                    <div class="apply-coupon-wrapper">
                        <form action="#" method="post" class=" d-block d-md-flex">
                            <input type="text" placeholder="Enter Your Coupon Code"/>
                            <button class="btn-add-to-cart">Apply Coupon</button>
                        </form>
                    </div>
                    <div class="cart-update">
                        <a href="#" class="btn-add-to-cart">Update Cart</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-6 ml-auto">
                <!-- Cart Calculation Area -->
                <div class="cart-calculator-wrapper">
                    <h3>Cart Totals</h3>
                    <div class="cart-calculate-items">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <tr>
                                    <td>Sub Total</td>
                                    <td>$230</td>
                                </tr>
                                <tr>
                                    <td>Shipping</td>
                                    <td>$70</td>
                                </tr>
                                <tr>
                                    <td>Total</td>
                                    <td class="total-amount">$300</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <a href="checkout.html" class="btn-add-to-cart">Proceed To Checkout</a>
                </div>
            </div>
        </div>
        <!-- Cart Page Content End -->
    </div>
</div>
 
<jsp:include page="fragments/footer.jsp" />
 

<!-- Scroll to Top Start -->
<a href="#" class="scrolltotop"><i class="fa fa-angle-up"></i></a>
<!-- Scroll to Top End -->


<!--=======================Javascript============================-->
<!--=== Jquery Min Js ===-->
<script src="assets/js/vendor/jquery-3.3.1.min.js"></script>
<!--=== Jquery Migrate Min Js ===-->
<script src="assets/js/vendor/jquery-migrate-1.4.1.min.js"></script>
<!--=== Popper Min Js ===-->
<script src="assets/js/vendor/popper.min.js"></script>
<!--=== Bootstrap Min Js ===-->
<script src="assets/js/vendor/bootstrap.min.js"></script>
<!--=== Plugins Min Js ===-->
<script src="assets/js/plugins.js"></script>

<!--=== Active Js ===-->
<script src="assets/js/active.js"></script>
</body>

</html>