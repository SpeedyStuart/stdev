function hidetext(d) { document.getElementById(d).style.display = "none"; }
function displaytext(d) { document.getElementById(d).style.display = "block"; }
if (document.images) {image_off= new Image(617,501);image_off.src="assets/images/homepage/kevan-off.png"; image2= new Image(617,501); image2.src="assets/images/homepage/kevan-on2.png"; image3= new Image(617,501); image3.src="assets/images/homepage/kevan-on.png"; }
function change1(picName,imgName) {if (document.images) {imgOn=eval(imgName + ".src");document[picName].src= imgOn;}}
function runImage() {change1('pic1','image3');}
window.setTimeout("runImage()", 3000);