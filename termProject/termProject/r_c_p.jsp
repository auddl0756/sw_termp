<!doctype html>
<html>
<head>
<title>rock siccor paper game</title>
</head>


<script language="javascript">

var win=0;
var draw=0;
var lose=0;
function changepage(field){
    if(field.value=="back"){
      location.href="gameselectpage.jsp";
    }
 }
function gm(){
var a;
var jsy=new Array(3);
        jsy[0]="s";
        jsy[1]="r";
        jsy[2]="p";
    var bb=Math.ceil(3*Math.random());
    
    a=prompt("select: rock(r) siccor(s) paper(p) quit(q)");
    b=jsy[bb-1];
    if(a=="q"){
        //location.href="gameselectpage.jsp";
        location.href="gamedata_write.jsp?game="+"game2&"+"win="+win+"&draw="+draw+"&lose="+lose;
    }
 
    if(a=="s" || a=="r" || a=="p"){
        //document.write("you:"+a+"computer:"+b+"<br>");
        if(b==a){
        	alert("draw");
        	draw++;
        }else if(a=="s" && b=="p"){
        	alert("win");
        	win++;
        }else if(a=="s" && b=="r"){
        	alert("lose");
        	lose++;
        }else if(a=="r" && b=="s"){
        	alert("win");
        	win++;
        }else if(a=="r" && b=="p"){
        	alert("lose");
        	lose++;
        }else if(a=="p" && b=="s"){
        	alert("lose");
        	lose++;
        }else if(a=="p" && b=="r"){
        	alert("win");
        	win++;
        }
        //document.write("select: rock(r) siccor(s) paper(p)<br>");
        
    } 
}

</script>

<body>
    <Input type="button" NAME="btn1" VALUE="r c p" onclick="gm()"><br>
	<Input type="button" NAME="btn1" VALUE="back" onclick="changepage(this)"><br>



</body>

</html>