function hidetext(d) { document.getElementById(d).style.display = "none"; }
function displaytext(d) { document.getElementById(d).style.display = "block"; }

if (document.images) {

image_off= new Image(617,501);
image_off.src="assets/images/homepage/kevan-off.png"; 
image2= new Image(617,501); 
image2.src="assets/images/homepage/kevan-on2.png"; 
image3= new Image(617,501); 
image3.src="assets/images/homepage/kevan-on.png"; 

image_virtuous_off= new Image(617,501);
image_virtuous_off.src="assets/images/virtuous/image-off.png";  

image_virtuous2= new Image(617,501);
image_virtuous2.src="assets/images/virtuous/image-on.png";
     
image_vintage_off= new Image(617,501);
image_vintage_off.src="assets/images/vintage/image-off.png";  

image_vintage2= new Image(617,501);
image_vintage2.src="assets/images/vintage/image-on.png";

image_vigilant_off= new Image(617,501);
image_vigilant_off.src="assets/images/vigilant/image-off.png";  

image_vigilant2= new Image(617,501);
image_vigilant2.src="assets/images/vigilant/image-on.png";

image_team_off= new Image(617,501);
image_team_off.src="assets/images/vitools/image-off.png";  

image_team2= new Image(617,501);
image_team2.src="assets/images/vitools/image-on.png";

image_map= new Image(617,501);
image_map.src="assets/images/virtual/map.png"; 
image_map2= new Image(617,501); 
image_map2.src="assets/images/virtual/map-america.png"; 
image_map3= new Image(617,501); 
image_map3.src="assets/images/virtual/map-emea.png"; 
image_map4= new Image(617,501); 
image_map4.src="assets/images/virtual/map-asia.png"; 
image_map5= new Image(617,501); 
image_map5.src="assets/images/virtual/map-malta.png"; 


}





function change1(picName,imgName) {if (document.images) {imgOn=eval(imgName + ".src");document.getElementById(picName).src= imgOn;}}
function runImage() {change1('pic1','image3');}

