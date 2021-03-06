<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Iterator" %>
<%@page import="com.qa.models.Book" %>
<%@page import="com.qa.models.Orders" %>
<%@page import="com.qa.models.Customer" %>
<%@page import="java.text.NumberFormat" %>


<%

// Webpage title 
String title="Foundation Books"; 

// Navigation link name
String navName = "home";
%>

<!doctype html>

<html class="no-js" lang="en">

<!-- Head tags  -->
<%@include file="html/head.jsp" %>
<style>
	.row:last-child{
	float:left;}
</style>

  <body>
  	<!-- Navigation markup -->
    <%@ include file="html/nav.jsp" %>

	<!-- Content goes here -->

	<%
		Customer customer = (Customer) session.getAttribute("logged_in_customer");
		String customerName = customer.getFirstName();	

	%>
	
      

    <h1>Recently Ordered Books</h1>

    

 
    <%
    Iterable<Orders> orders = (Iterable<Orders>) session.getAttribute("orders");
    Iterator<Orders> orderIter = orders.iterator();
    String date = "";
    while(orderIter.hasNext()) { 
    
    	Orders order = orderIter.next();
    	%>
    	<div class="column large-3 medium-6 small-12 <% if (!orderIter.hasNext()) %>end <%;%>">
      
      	
        <a href="/bookDetails?bookId=<%=order.getBook_id()%>"><img class="thumbnail" src="<%=order.getBook_image()%>" style="width:450px;height:375px;"></a>
        
        <!--  a href="/addToCart?bookId=" class="button expanded">Add to Cart</a>-->
      	
      	</div>
      
    <%
    }
    %>  
    
    </div>
	
	

	<!--  Footer markup -->
    <%@include file="html/footer.jsp" %>
  </body>
</html>
