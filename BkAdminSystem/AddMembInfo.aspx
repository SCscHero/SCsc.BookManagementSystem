<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMembInfo.aspx.cs" Inherits="BkAdminSystem.AddMembInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>新增会员信息 By SCscHero</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1 class="header-w3ls">
		Flight Booking Form</h1>
	<div class="appointment-w3">
		<form action="#" method="post">
			<div class="personal">
				<h2>Personal Details</h2>
				<div class="main">
					<div class="form-left-w3l">

						<input type="text" class="top-up" name="name" placeholder="Name" required="">
					</div>
					<div class="form-right-w3ls ">

						<input type="text" class="top-up" name="last name" placeholder="Last Name" required="">
						<div class="clearfix"></div>
					</div>

				</div>
				<div class="main">
					<div class="form-left-w3l">

						<input type="email" name="email" placeholder="Email" required="">
					</div>
					<div class="form-right-w3ls ">

						<input class="buttom" type="text" name="phone number" placeholder="Phone Number" required="">
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<div class="information">
				<h3>Trip Information</h3>
				<div class="main">

					<div class="form-left-w3l">
						<select class="form-control">
					<option value="">Type Of Trip</option>
						<option>One Way</option>
						<option>Round Way</option>
						<option>Hourly</option>
					</select>
					</div>
					<div class="form-right-w3ls">
						<select class="form-control">
					<option value="">Tavel Class</option>
						<option>Economy Class</option>
						<option>First Class</option>
						<option>Business Class</option>
						<option>Premium Class</option>
					</select>
					</div>
				</div>
				<div class="main">

					<div class="form-left-w3l">
						<select class="form-control">
					<option value="">Departure Country</option>
						<option value="category2">Oman</option>
													<option value="category1">Australia</option>
													<option value="category3">America</option>
													<option value="category3">London</option>
													<option value="category3">Goa</option>
													<option value="category3">Canada</option>
													<option value="category3">Srilanka</option>
					</select>
					</div>
					<div class="form-right-w3ls">
						<select class="form-control">
					<option value="">Destination Country</option>
						<option value="category2">Oman</option>
													<option value="category1">Australia</option>
													<option value="category3">America</option>
													<option value="category3">London</option>
													<option value="category3">Goa</option>
													<option value="category3">Canada</option>
													<option value="category3">Srilanka</option>
					</select>
					</div>
				</div>
				<div class="main">
					<div class="form-left-w3l">
						<input id="datepicker" name="text" type="text" placeholder="Departure Date &" required="">
						<input type="text" id="timepicker" name="Time" class="timepicker form-control hasWickedpicker" placeholder="Time" required=""
						 onkeypress="return false;">
						<div class="clear"></div>
					</div>
					<div class="form-right-w3ls">
						<input id="datepicker1" name="Text" type="text" placeholder="Return Date &" required="">

						<input type="text" id="timepicker1" name="Time" class="timepicker1 form-control hasWickedpicker" placeholder="Time" required=""
						 onkeypress="return false;">
						<div class="clear"></div>
					</div>
				</div>
				<div class="main">

					<div class="form-left-w3l">
						<select class="form-control">
					<option value="">Airport</option>
						<option value="category2">A Airport</option>
													<option value="category1">B Airport</option>
													<option value="category3">C Airport</option>
													<option value="category3">D Airport</option>
													<option value="category3">E Airport</option>
													<option value="category3">and other</option>
					</select>
					</div>
					<div class="form-right-w3ls">
						<select class="form-control">
					<option value="">Number Of Luggage</option>
													<option value="category3">1</option>
													<option value="category3">2</option>
													<option value="category3">3</option>
													<option value="category3">4</option>
													<option value="category3">5</option>
													<option value="category3">and more</option>
					</select>
					</div>
				</div>
				<div class="main">
					<div class="form-left-w3l">

						<input type="text" name="name" placeholder="AirLine" required="">
					</div>
					<div class="form-right-w3ls ">

						<input type="text" name="number" placeholder="Flight Number" required="">
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="main">

					<div class="form-left-w3l">
						<select class="form-control">
					<option value="">Number of Adults</option>
						<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>and more</option>
					</select>
					</div>
					<div class="form-right-w3ls">
						<select class="form-control">
					<option value="">Number of Children</option>
						<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>and more</option>
					</select>
					</div>
				</div>
				<div class="main">

					<div class="form-left-w3l">
						<select class="form-control">
					<option value="">Preferred Hotel brand</option>
						<option value="category2">A Hotel</option>
													<option value="category1">B Hotel</option>
													<option value="category3">C Hotel</option>
													<option value="category3">D Hotel</option>
													<option value="category3">E Hotel</option>
													<option value="category3">and other</option>
					</select>
					</div>
					<div class="form-right-w3ls">
						<select class="form-control">
					<option value="">How will you Pickup</option>
													<option value="category1">Car</option>
													<option value="category3">Auto</option>
													<option value="category3">Cab</option>
													<option value="category3">Other </option>
					</select>
					</div>
				</div>
			</div>
			<div class="passport">
				<h3>Traveler's Details</h3>
				<div class="main">
					<div class="form-left-w3l">

						<input type="text" name="number" placeholder="Passport number" required="">
					</div>
					<div class="form-right-w3ls">
						<input id="datepicker2" class="date-width" name="text" type="text" placeholder="Passport Expiration Date" required="">
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<div class="form-control-w3l">
				<textarea name="Message" placeholder="Any Message..."></textarea>
			</div>
			<div class="btnn">
				<input type="submit" value="Submit">
			</div>
		</form>
	</div>
	<div class="copy">
		<p>&copy;2018 Flight Booking Form. All Rights Reserved | Design by <a href="http://www.W3Layouts.com" target="_blank">W3Layouts</a></p>
	</div>
	<!-- js -->
	<script type='text/javascript' src='js/jquery-2.2.3.min.js'></script>
	<!-- //js -->
	<!-- Calendar -->
	<script src="js/jquery-ui.js"></script>
	<script>
		$(function () {
			$("#datepicker,#datepicker1,#datepicker2,#datepicker3").datepicker();
		});
	</script>
	<!-- //Calendar -->
	<!-- Time -->
	<script type="text/javascript" src="js/wickedpicker.js"></script>
	<script type="text/javascript">
		$('.timepicker,.timepicker1').wickedpicker({ twentyFour: false });
	</script>
	<!-- //Time -->

    </div>
    </form>
</body>
</html>

<%--
    ASP.NET控件
        <asp:TextBox ID="tbMid" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbMname" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbMtel" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbMadres" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbMcard" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbMmoney" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbMtime" runat="server"></asp:TextBox>
        <asp:MultiView ID="mvMmark" runat="server"></asp:MultiView>--%>