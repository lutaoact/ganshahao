// JavaScript Document
function loginexpand(){  
        	    var popup= document.getElementById("popup");
				var popupmask= document.getElementById("popupmask"); 
				popup.style.visibility="visible";
				popup.style.opacity="1";
				popup.style.transition="visibility 0s ease 0s, opacity .5s ease"
				popupmask.style.visibility="visible";
				popupmask.style.opacity="0.75";
				popupmask.style.transition="visibility 0s ease 0s, opacity .5s ease"
				}
function loginhide(){  
        	    var popup= document.getElementById("popup"); 
				var popupmask= document.getElementById("popupmask"); 
				popup.style.visibility="hidden";
				popup.style.opacity="0";
				popup.style.transition="visibility 0s ease .5s, opacity .5s ease"
				popupmask.style.visibility="hidden";
				popupmask.style.opacity="0";
				popupmask.style.transition="visibility 0s ease .5s, opacity .5s ease"
				}