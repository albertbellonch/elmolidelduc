// Tab names
tabNames = ["moli", "farinera", "galeria"];
currentTab = "moli";

// Show tab function
function showTab(tab){
  if($.inArray(tab, tabNames) == -1) tab = tabNames[0];
  currentTab = tab;

  // Show only one, hide the other ones
  $.each(tabNames, function(index, value){
    showOrHideTab(value, tab == value);
  });
}

function showOrHideTab(tab, show){
  $("#" + tab + "-content").attr("style", "display: " + (show ? "block;" : "none;"));
  var link = $("#" + tab + "-link");
  if(show){
    link.addClass("current");
  }else{
    link.removeClass("current");
  }
}

// Bind click to show tab
$("#menu a").click(function(){
  //showTab($(this).attr("id").split("-")[0]);
});

// Show a specific tab when loading
function tabToLoad(){
  var hash = location.hash;
  if(hash == "") return hash;
  return hash.split("#")[1];
}

//showTab("moli");

// Facebox
$(document).ready(function(){
  $("a[rel*=facebox]").facebox();
});

// Flexslider
$(document).ready(function(){
  setTimeout("goFlex();", 2000);
});

function goFlex(){
  $('#loading').remove();
  $('.flexslider').flexslider({
    directionNav: false,
    controlNav: false
  });
}

// Hustle
hustleOn = false;

function goHustle(){
  var faceboxVisible = ($("#facebox:visible").length == 1);

  if(hustleOn && !faceboxVisible){
    i = $.inArray(currentTab, tabNames);
    i = (i+1)%3;
    showTab(tabNames[i]);
  }

  setTimeout("goHustle();", 60000);
}

function changeHustle(){
  hustleOn = !hustleOn;
  $("#play").attr("style", "display:" + (hustleOn ? "none" : "inline") );
  $("#pause").attr("style", "display:" + (hustleOn ? "inline" : "none") );
}

goHustle();

// Reveal and hide
function hide(){
  var l = $("#loading");
  if(l){
    l.animate({
      opacity: 0.0
    }, 500, function(){
      setTimeout("reveal();", 500);
    });
  }
}

function reveal(){
  var l = $("#loading");
  if(l){
    l.animate({
      opacity: 1.0
    }, 500, function(){
      setTimeout("hide();", 500);
    });
  }
}

hide();
