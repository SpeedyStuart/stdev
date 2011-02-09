$(function () {
    $('.squareBlock').click(function (event) { event.preventDefault(); });
    $('.squareBlock').mouseover(function () { imageHelper.moveFace(this, 1); });
    $('.squareBlock').mouseout(function () { imageHelper.moveFace(this, 0); });
    $('.personImage').click(function (event) { event.preventDefault(); });
    $('.personImage').mouseover(function () { textHelper.showText(this); });
    $('.personImage').mouseout(function () { textHelper.hideText(this); });
    $('.navLink').mouseover(function () { navHelper.navOver(this); });
    $('.navLink').mouseout(function () { navHelper.navOut(this); });
});

imageHelper = {
    moveFace: function (anchor, inorout) {
        var imageId = $(anchor).attr('rel');
        if (inorout === 1) {
            $('#' + imageId + '_up').hide();
            $('#' + imageId + '_down').show();
        }
        else {
            $('#' + imageId + '_up').show();
            $('#' + imageId + '_down').hide();
        }
    }
};

textHelper = {
    showText: function (anchor) {
        var id = $(anchor).attr('rel');
        $('#personText' + id).show();
    },
    hideText: function (anchor) {
        var id = $(anchor).attr('rel');
        $('#personText' + id).hide();
    }
}

navHelper = {
    navOver: function (anchor) {
        var id = $(anchor).attr('rel');
        hidetext('hptext1');
        displaytext('hptext' + id);
        change1('pic1', 'image2');
    },
    navOut: function (anchor) {
        var id = $(anchor).attr('rel');
        hidetext('hptext' + id);
        displaytext('hptext1');
        change1('pic1', 'image_off');
        setTimeout('runImage()', 5000);
    }
}

function hidetext(d) {
    if ($('#' + d).length > 0) {
        $('#' + d).hide();
    }
}

function displaytext(d) {
    if ($('#' + d).length > 0) {
        $('#' + d).show();
    }
}

if (document.images) {

    image_off = new Image(617, 501);
    image_off.src = "assets/images/homepage/kevan-off.png";
    image2 = new Image(617, 501);
    image2.src = "assets/images/homepage/kevan-on2.png";
    image3 = new Image(617, 501);
    image3.src = "assets/images/homepage/kevan-on.png";

    image_team_off = new Image(617, 501);
    image_team_off.src = "assets/images/vitools/image-off.png";

    image_team2 = new Image(617, 501);
    image_team2.src = "assets/images/vitools/image-on.png";

    image_map = new Image(617, 501);
    image_map.src = "assets/images/virtual/map.png";
    image_map2 = new Image(617, 501);
    image_map2.src = "assets/images/virtual/map-america.png";
    image_map3 = new Image(617, 501);
    image_map3.src = "assets/images/virtual/map-emea.png";
    image_map4 = new Image(617, 501);
    image_map4.src = "assets/images/virtual/map-asia.png";
    image_map5 = new Image(617, 501);
    image_map5.src = "assets/images/virtual/map-malta.png";

}


function change1(picName, imgName) {
    if ($('#' + picName).length > 0 && eval(imgName)!=null) {
        $('#' + picName).attr('src', eval(imgName + '.src'));
    }
}

function runImage() {change1('pic1','image3');}

