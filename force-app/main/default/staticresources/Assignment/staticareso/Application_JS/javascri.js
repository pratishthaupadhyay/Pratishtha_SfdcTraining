<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
    function validate()  {
        var a = document.getElementById("candypg:frm:sal").value;
           
        var b = document.getElementById("candypg:frm:first").value; 
       
var c = document.getElementById("candypg:frm:email").value; 
var d = document.getElementById("candypg:frm:dob").value; 
var e = document.getElementById("candypg:frm:coun").value; 
var f = document.getElementById("candypg:frm:stat").value; 
var g = document.getElementById("candypg:frm:job").value; 
var h = document.getElementById("candypg:frm:app").value; 
var i = document.getElementById("candypg:frm:expect").value; 
var j = document.getElementById("candypg:frm:stat").value; 
var k = document.getElementById("candypg:frm:last").value; 
       if(a == '' || a == NULL && b == '' || b == NULL && c == '' || c == NULL && d == '' || d == NULL
          && e == '' || e == NULL && f == '' || f == NULL &&
         g == '' || g == NULL && h == '' || h == NULL && i == '' || i == 0 && j == '' || j == NULL && k == '' || k == NULL )

  {
            alert("All fields are mandatory");            
        }      
        else  {            
            alert("record  sucessfully inserted");          
        }
    }
</script>
</head>
<body>
</body>
</html>