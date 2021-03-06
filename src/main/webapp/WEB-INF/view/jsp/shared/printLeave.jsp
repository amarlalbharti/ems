<%@page import="java.util.TimeZone"%>
<%@page import="com.ems.domain.UserDetail"%>
<%@page import="com.ems.config.DateFormats"%>
<%@page import="com.ems.domain.Registration"%>
<%@page import="com.ems.domain.LeaveDetail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="css/bootstrap.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="css/AdminLTE.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="css/blue.css">
<style type="text/css">
	.error {
		color: red;
	}
	.wd
	{
	width: 200px;
	}
</style>

</head>
<body class="hold-transition login-page">
	<a class="pull-right" style="margin-right: 100px;" href="#" onclick="PrintElem('#prnt');"><button class="btn btn-primary btn-sm"><i class="fa fa-fw fa-cloud-upload"></i> Print</button> </a>
	<div id="prnt" style="width: 750px; height: auto; border: 1px #ccc solid; margin-left: 300px; ">

			<%
			TimeZone timeZone = (TimeZone) request.getSession().getAttribute("timezone");
		   	
			LeaveDetail leaveDetail = (LeaveDetail)request.getAttribute("leaveDetail");
			Registration empReg = leaveDetail.getRegistration();
		    UserDetail userDetail = empReg.getUserDetail();
          	if(empReg != null && leaveDetail != null && userDetail != null)
          	{
          		%>
			<div>
			<center>
			<img alt="Vasonomics" src="images/logo.gif">
			<!-- <h1>Vasonomics</h1> -->
			<p style="margin: 0px; padding: 0px;">India Pvt. Ltd.</p>
			<p style="margin: 0px; padding: 0px;">Ph : +91 522 4028568</p>
			<p style="margin-top: 0px; padding-top: 0px;">Email : info@vasonomics.com</p>
		
			</center>
			
			<b>Employee Name : </b><%=empReg.getName() %>
			</div>
			<hr/>
			<table class="table" style="background-color: #FFF; width: 100%; height: auto;">
				<thead>
					
				</thead>
				<tbody>
					<tr>
						<td class="wd"></td>
						<td></td>
						<td></td>
						<td rowspan="5" align="center">
							<%	
								if(empReg.getProfileImage() != null && !empReg.getProfileImage().isEmpty())
			 					{
			 						String path = "/ems_uploads/"+empReg.getUserid()+"/Profile_Photo/" + empReg.getProfileImage();
							%>
								<img alt="Error" id="output" src="<%=path %>" style="max-height: 150px; max-width: 100px" />
							<% } else { %>
								<img alt="Image" id="output" src="images/User_Avatar.png" style="max-height: 150px; max-width: 100px" />
							<% } %>
						
						</td>
					</tr>
								
					<tr>
						<td class="wd">Email Id</td>
						<td>:</td>
						<td><%= empReg.getUserid() %></td>
					</tr>
					<tr>
						<td class="wd">Date of Birth</td>
						<td>:</td>
						<td><%= empReg.getDob() %></td>
					</tr>
					<tr>
						<td class="wd">Joining Date</td>
						<td>:</td>
						<td colspan="2"><%= DateFormats.ddMMMyyyy(timeZone).format(empReg.getJoiningDate()) %></td>
					</tr>
					<tr>
						<td class="wd">Gender</td>
						<td>:</td>
						<td colspan="2"><%= empReg.getGender() %></td>
					</tr>
					<%	
						if( empReg.getDepartment().getDepartment() != null && ! empReg.getDepartment().getDepartment().isEmpty())
	 					{
			 						
					%>
					<tr>
						<td class="wd">Department</td>
						<td>:</td>
						<td colspan="2"><%= empReg.getDepartment().getDepartment() %></td>
					</tr>
					<%
	 					}
					%>
					<%	
	 					
						if( empReg.getDesignation().getDesignation() != null && ! empReg.getDesignation().getDesignation().isEmpty())
	 					{
			 						
					%>
						<tr>
							<td class="wd">Designation</td>
							<td>:</td>
							<td colspan="2"><%= empReg.getDesignation().getDesignation() %></td>
						</tr>
					<%
					
			 			}
					%>
					<%	
	 					
						if( empReg.getBranch().getBranchName() != null && ! empReg.getBranch().getBranchName().isEmpty())
	 					{
			 						
					%>
						<tr>
							<td class="wd">Branch</td>
							<td>:</td>
							<td colspan="2"><%= empReg.getBranch().getBranchName() %></td>
						</tr>
					<%
					
			 			}
					%>
					<%	
	 					
						if( empReg.getBranch().getCountry().getCountryName() != null && ! empReg.getBranch().getCountry().getCountryName().isEmpty())
	 					{
			 						
					%>
						<tr>
							<td class="wd">Country</td>
							<td>:</td>
							<td colspan="2"><%= empReg.getBranch().getCountry().getCountryName() %></td>
						</tr>
					<%
					
			 			}
					%>
					<tr>
						<td class="wd">Mobile Number</td>
						<td>:</td>
						<td><%= userDetail.getMobileNo() %></td>
					</tr>
					<tr><td colspan="3">
					<u><b>Leave Detail</b></u>
					</td>
					</tr>
					<tr>
						<td class="wd">Send To</td>
						<td>:</td>
						<td><%= leaveDetail.getSendTo() %></td>
					</tr>
					<tr>
						<td class="wd">Cc</td>
						<td>:</td>
						<td colspan="2"><%= leaveDetail.getCc() %></td>
					</tr>
					<tr>
						<td class="wd">From Date </td>
						<td>:</td>
						<td colspan="2"><%= DateFormats.ddMMMyyyy(timeZone).format(leaveDetail.getFromDate()) %></td>
					</tr>
					<tr>
						<td class="wd">To Date</td>
						<td>:</td>
						<td colspan="2"><%= DateFormats.ddMMMyyyy(timeZone).format(leaveDetail.getToDate()) %></td>
					</tr>
					<tr>
						<td class="wd">Leave Type</td>
						<td>:</td>
						<td colspan="2"><%= leaveDetail.getLeaveType() %></td>
					</tr>
					
					<tr>
						<td class="wd">Subject</td>
						<td>:</td>
						<td colspan="2"><%= leaveDetail.getSubject() %></td>
					</tr>
					<tr>
						<td class="wd">Reason</td>
						<td>:</td>
						<td colspan="2"><%= leaveDetail.getReason() %></td>
					</tr>
					
					<tr>
						<td class="wd">Status</td>
						<td>:</td>
						<td colspan="2"><%= leaveDetail.getStatus() %></td>
					</tr>
					<%
						if(leaveDetail.getStatus() != null )
						{
							if(leaveDetail.getStatus().equalsIgnoreCase("Approved"))
							{
								%>
									<tr>
										<td class="wd">Approved By</td>
										<td>:</td>
										<td colspan="2"><%= leaveDetail.getApprovedBy() %></td>
									</tr>
								<%							
							}
							else if(leaveDetail.getStatus().equalsIgnoreCase("Reject"))
							{
								%>
									<tr>
										<td class="wd">Rejected By</td>
										<td>:</td>
										<td colspan="2"><%= leaveDetail.getApprovedBy() %></td>
									</tr>
								<%							
							}
						}
						
					
					
					%>
				</tbody>
			</table>
			<% } %>
			</div>
    <!-- /.content -->



<script src="js/jQuery-2.2.0.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="js/bootstrap.js"></script>

<script type="text/javascript">

$( document ).ready(function() {
	PrintElem('#prnt');
	if (confirm("Close Window ? "))
	{
		window.close();
	}
});

function PrintElem(elem)
{
    Popup($(elem).html());
}

function Popup(data) 
{
    var mywindow = window.open('', 'my div', 'height=400,width=600');
    mywindow.document.write('<html><head><title>Employee Leave Detail</title>');
    mywindow.document.write(data);
    mywindow.document.write('</head><body >');
    mywindow.document.write('</body></html>');

    mywindow.print();
    mywindow.close();

    return true;
}
</script>
</body>
</html>
