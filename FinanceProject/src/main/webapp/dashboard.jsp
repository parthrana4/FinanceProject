<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    
       <link rel="stylesheet" type="text/css" media="screen" href="cssfiles/dashbooard.css">
       <link rel="stylesheet" type="text/css" media="screen" href="fonts.css">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
       
       <script>

        function display1(){
            document.getElementById('th').setAttribute('style', 'display:block');
            document.getElementById('ui').setAttribute('style', 'display:none');
        }
        function display2(){
            document.getElementById('th').setAttribute('style', 'display:none');
            document.getElementById('ui').setAttribute('style', 'display:block');
        }
       
       
       </script>

    </head>
    <body>

          <!--Header-->
  <div id="header-wrapper">
        <div id="header" class="container">
          <div id="logo">
        <h1 style="color:white;">EMI Finance</h1>
          </div>
          <div id="menu">
            <ul>
              <li class="current_page_item"><a href="home.lti" accesskey="1" title="">Home</a></li>
              <li><a href="getProduct.lti" accesskey="4" title="">Products</a></li>
            </ul>
          </div>
        </div>
      </div>
      
      
    <div id="outer" style="border: 2px solid black;top:35em;width:99.7%;" >
        <div class="pos-center">
            <div id="logo1">
                <h3>DASHBOARD</h3>
            </div>
        </div>
        <div style="height:25em;">
            <c:set var="dateParts" value="${fn:split(user.emiCard.expiryDate, '-')}" />
            <div class="card container" style="top:4em;left:13em;float:left;">
                <img id="a" src="images/cardimg.png" style="border:1px solid black;">
                <div class="pos-no"><text style="font-size:20px">${user.emiCard.cardNo}</text></div> 
                <div class="pos-expiry"><text style="color:silver;font-size:10px" >EXPIRY :${dateParts[1]}/${dateParts[0]} </div>
                <div class="pos-name">${user.firstName} ${user.lastName}</div>
                <div class="pos-cardtype">${user.emiCard.cardType}</div>  
                <div class="pos-bankname">EMI Finance</div>
        </div>

        <div style="font-size:22px;float:right;padding-top: 3em;padding-right: 14em; font-family: cursive;">
            <p>TOTAL CREDIT:${user.emiCard.cardLimit}</p>
            <p>CREDIT USED:${user.emiCard.creditUsed}</p>
            <p>REMAINING CREDIT:${(user.emiCard.cardLimit)-(user.emiCard.creditUsed)}</p>
            <p>CARD STATUS:${user.emiCard.cardstatus}</p>
            <p>COMMENTS:${user.emiCard.comments}</p>
        </div>
        <br>
        <div>
            <div style="float:left; padding-top:3em;padding-left:10em;    margin-left: 6em;">
                    <button onclick="return display1()" >TRANSACTION HISTORY</button>
            </div>
            <div style="float:right;padding-left: 1em;padding-right: 19em;margin-top: -0.5em;">
                    <button onclick="return display2()">UPCOMING INSTALLMENTS</button>
            </div>
        </div>
        </div>
        <hr>

       

        <div  id="th" class="pos-center" style="display:none;">
        <div>
            <h3 class="heading">TRANSACTION HISTORY</h3>
        </div>
        <div  class="table">
                <table style="width: 80%;">
                    <tr>
                        <th>TRANSACTION NO</th>
                        <th>PRODUCT NAME</th>
                         <th>PRODUCT PRICE</th>
                        <th>PURCHASE DATE</th>
                        <th>EMI SCHEME</th>
                        <th>PAID AMT</th>
                        <th>BALANCE AMT</th>   
                    </tr>
                    <c:forEach var="transaction" items="${user.transaction}">
                        <c:set var = "count"  value = "${0}"/>
                        <tr>
                            <td>${transaction.transactionId}</td>
                            <td>${transaction.product.productName}</td>
                            <td>${transaction.product.productPrice}</td>
                            <td>${transaction.emi.startDate}</td>
                            <td>${transaction.scheme}</td>
                            <c:forEach var="installment" items="${transaction.emi.installment}">
                             <c:if test = "${installment.datePaid != null}">
                           			<c:set var="count" value="${count + 1}"/>
                                </c:if>
                              </c:forEach>
                            <td>${(transaction.emi.installmentAmount)*count}</td>
                            <td>${(transaction.product.productPrice)-((transaction.emi.installmentAmount)*count)}</td>
                        </tr>
                        </c:forEach>
                 </table>
        </div>
        
    </div>
        
        <div   id="ui"  class="pos-center" style="display:none;">
            <div>
                <h3 class="heading">UPCOMING INSTALLMENTS</h3>
            </div>
            <div  class="table">
                    <table style="width: 80%;">
                        <tr>
                        	<th>EMI NO</th>
                            <th>INSTALLMENT NO</th>
                             <th>PRODUCT NAME</th>
                            <th>DUE DATE </th>
                            <th>STATUS</th>
                            <th>PAY EMI</th>
                        </tr>
                        <c:forEach var="transaction" items="${user.transaction}">
                            <c:set var = "status"  value = "pending"/>
                            <c:forEach var="installment" items="${transaction.emi.installment}">
                            <tr>	
                                <td>${transaction.emi.emiNo}</td>
                                <td>${installment.installmentId}</td>
                                <td>${transaction.product.productName}</td>
                                <td>${installment.dueDate}</td>
                                
                                <c:choose>
                                       <c:when test="${installment.datePaid!=null}">
                                            <c:set var = "status"  value = "paid"/>
                                       </c:when>
                                       <c:otherwise>
                                         <c:set var = "status"  value = "pending"/>	 
                                    </c:otherwise>
                                </c:choose>
                                <td>${status}</td>
                                <c:choose>
                                       <c:when test="${installment.datePaid!=null}">
                                            <c:set var = "status"  value = "paid"/>
                                            <td>${status}</td>
                                       </c:when>
                                       <c:otherwise>
                                         <c:set var = "status"  value = "pending"/>	 
                                        <td>
                                         <form action="emiPayment.lti" method="post">
                                        <input type="hidden" name="emiNo" value="${transaction.emi.emiNo}"/>
                                          <input type="hidden" name="installmentNo" value="${installment.installmentId}"/>
                                          
                                        <button type="submit">pay</button>
                                          </form>
                                        </td>
                                    </c:otherwise>
                                    </c:choose>
                                </tr>
                                </c:forEach>
                            </c:forEach>
                     </table>
            </div>
        </div>


        
    </div>
    </body>
</html>
