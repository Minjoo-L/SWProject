<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Festival Metro</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">

        <!-- Add custom CSS here -->
        <link href="css/style.css" rel="stylesheet">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
<style>
	.btn1{
  background-color: white;
  border: none;
  color: black;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 20px;
  border-radius:10px;
  width:30px;
  height:38px;
	}
</style>
    </head>

    <body>

        <%@ include file = "sidemenubar.jsp" %>
        <!-- Contact Section -->
        <div id="contact" class="container parallax">
			<table width="100%">
						<tr>
							<td><p algn="left"><a href="/message"><button type="button" class="btn1">before</button></a></p></td>
							<td><p align="right"><a href="/"><button type="button" class="btn1">next</button></a></p></td>
						</tr>
					</table>
            <div class="col-md-4 col-md-offset-4 text-center">
				
                <h2 class="main-title">Contact us</h2>
                <hr>
                <div class="divide50"></div>
            </div>
				
            <!-- Contact Inner -->
            <div class="inner contact">
                <!-- Form Area -->
                <div class="contact-form">
                    <!-- Form -->
                    <form id="contact-us" method="post" action="#">
                        <!-- Left Inputs -->
                        <div class="col-xs-6 col-xs-12 animated" data-animation="fadeInLeft" data-animation-delay="300">
                            <!-- Name -->
                            <input type="text" name="name" id="name" required="required" class="form" placeholder="Name" />
                            <!-- Email -->
                            <input type="email" name="mail" id="mail" required="required" class="form" placeholder="Email" />
                            <!-- Subject -->
                            <input type="text" name="subject" id="subject" required="required" class="form" placeholder="Subject" />
                        </div><!-- End Left Inputs -->
                        <!-- Right Inputs -->
                        <div class="col-xs-6 col-xs-12 animated" data-animation="fadeInRight" data-animation-delay="400">
                            <!-- Message -->
                            <textarea name="message" id="message" class="form textarea"  placeholder="Message"></textarea>
                        </div><!-- End Right Inputs -->
                        <!-- Bottom Submit -->
                        <div class="relative fullwidth col-xs-12">
                            <!-- Send Button -->
                            <button type="submit" id="submit" name="submit" class="form-btn semibold">Send Message</button> 
                        </div><!-- End Bottom Submit -->
                        <!-- Clear -->
                        <div class="clear"></div>
                    </form>
		</div>

                    <!-- Your Mail Message -->
                    <div class="mail-message-area">
                        <!-- Message -->
                        <div class="alert gray-bg mail-message not-visible-message">
                            <strong>Thank You !</strong> Your email has been delivered.
                        </div>
                    </div>

                </div><!-- End Contact Form Area -->
            </div><!-- End Inner -->
        </div><!-- End Contact Section -->
        
        <div class="map">
            <iframe width="100%" height="400px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3618.727010735933!2d91.837871!3d24.907291700000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2s!4v1404919738144"></iframe>
        </div>
        <!-- /Map -->

        <!-- Footer -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3 text-center">
                        <ul class="list-inline">
                            <li>
                                <i class="fa fa-facebook"></i>
                            </li>
                            <li>
                                <i class="fa fa-twitter"></i>
                            </li>
                            <li>
                                <i class="fa fa-dribbble"></i>
                            </li>
                            <li>
                                <i class="fa fa-pinterest"></i>
                            </li>
                        </ul>
                        <hr>
                        <p>Copyright &copy; <a href="https://themewagon.com/">Themewagon</a>  2014</p>
                        <div class="top-scroll">
                            <a href="#top"><i class="fa fa-arrow-circle-up scroll"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- /Footer -->

        <!-- begin:booking -->
        <div class="modal fade" id="booking" tabindex="-1" role="dialog" aria-labelledby="booking" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Online Booking Form</h4>
                    </div>
                    <div class="modal-body">
                        <form role="form">
                            <div class="form-group">
                                <label for="emailAddress">Email address</label>
                                <input id="emailAddress" type="email" class="form-control input-lg" placeholder="Enter email">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input id="password" type="password" class="form-control input-lg" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <label for="country">Which country do you want to travel?</label>
                                <select class="form-control" id="country">
                                    <option>Australia</option>
                                    <option>Bangladesh</option>
                                    <option>England</option>
                                    <option>France</option>
                                    <option>U.S.A</option>
                                </select>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn confirm-btn" value="Confirm">
                    </div>
                </div>
            </div>
        </div>
        <!-- end:booking -->

        <!-- JavaScript -->
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery.parallax-1.1.3.js"></script>

        <!-- Custom JavaScript for the Side Menu and Smooth Scrolling -->
        <script>
        $("#menu-close").click(function(e) {
            e.preventDefault();
            $("#sidebar-wrapper").toggleClass("active");
        });
        </script>
        <script>
        $("#menu-toggle").click(function(e) {
            e.preventDefault();
            $("#sidebar-wrapper").toggleClass("active");
        });
        </script>
        <script>
        $(function() {
            $('a[href*=#]:not([href=#])').click(function() {
                if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {
                    var target = $(this.hash);
                    target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                    if (target.length) {
                        $('html,body').animate({
                            scrollTop: target.offset().top
                        }, 1000);
                        return false;
                    }
                }
            });
        });
        </script>

        <!-- modal -->

        <script>
            $('.modal').on('shown.bs.modal', function () {
                var curModal = this;
                $('.modal').each(function(){
                    if(this != curModal){
                        $(this).modal('hide');
                    }
                });
            });
        </script>
		
    </body>
</html>
