<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Trang chủ</title>
</head>
<body>
	<form action="temp" method="POST">

    <input type="submit" value="show"/>

    <table id="adminTable" class="detailsTable">

        <tr class="header">
            <th colspan="4">Kilowat Entry</th>
        </tr>

        <tr class="tableHeading">
            <td></td>
            <td>customer id</td>
            <td>name</td>

            <td>group</td>
            <td>kwh</td>


      

        </tr>
        <tr id="123" class="lightBlue tableRow">
            <td><input type="checkbox" name="check1" class="checker" value="123"/></td>
            <td><input type="hidden" name="id" value="123"/>123</td>
            <td><input type="hidden" name="name" value="Ivan"/>Ivan</td>
            <td><input type="hidden" name="type" value="Person"/>Person</td>

            <td><input type="hidden" name="kwh" value="54321"/>54321</td>


            

        </tr>
        <tr id="123" class="lightBlue tableRow">
            <td><input type="checkbox" name="check1" class="checker" value="1234"/></td>
            <td id="id?123" class="customerId" name ="id"><input type="hidden" name="id" value="123"/>1234</td>
            <td class="customerName" name="name"><input type="hidden" name="name" value="Ivan1"/>Ivan1</td>
            <td class="customerType" name="type"><input type="hidden" name="type" value="Person1"/>Person1</td>

            <td class="customerKWH" name="KWH"><input type="hidden" name="kwh" value="543211"/>543211</td>


            

        </tr>
    </table>
    
    
</body>
</html>