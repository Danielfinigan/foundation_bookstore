<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Iterator" %>
<%@page import="com.qa.models.Book" %>
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
		String query = (String) session.getAttribute("searchQuery");
	%>

    <h1>Search Results for <%=query %></h1>
    
    <section class="row">
	<div class="large-12 column text-center">

      

 
    <%
    Iterable<Book> books = (Iterable<Book>) session.getAttribute("books");
    Iterator<Book> bookIter = books.iterator();
   	int i=0;
    while(bookIter.hasNext()) { 
    
    	Book book = bookIter.next();
    	%>
    	<div class="column large-3 medium-6 small-12 <% if (!bookIter.hasNext()) %>end <%;%>">
      
        <a href="/bookDetails?bookId=<%=book.getBookId()%>"><img class="thumbnail" src="<%=book.getBookImage()%>" style="width:450px;height:375px;"></a>
        <!--  a href="/addToCart?bookId=" class="button expanded">Add to Cart</a>-->
      	
      	</div>
      
    <%
    	i = i+1;
    }
    switch (i){
    case 3:
    	%>
    	<div class="column large-3 medium-6 small-12">
    	</div>
    	<%
    	break;
    case 2:
    	%>
    	<div class="column large-3 medium-6 small-12">
    	</div>
    	<div class="column large-3 medium-6 small-12">
    	</div>
    	<%
    	break;
    case 1:
    	%>
    	<div class="column large-3 medium-6 small-12">
    	</div>
    	<div class="column large-3 medium-6 small-12">
    	</div>
    	<div class="column large-3 medium-6 small-12">
    	</div>
    	<%
    	break;
    }
    %>  
    
    </div>
	
	

	<!--  Footer markup -->
    <%@include file="html/footer.jsp" %>
  </body>
</html>
