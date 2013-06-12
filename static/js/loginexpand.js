// JavaScript Document
function loginexpand(){  
        	    var login= document.getElementById("login");
				var popupmask= document.getElementById("popupmask"); 
				login.style.height="300px";
				login.style.width="350px";
				login.style.background="#fff";
				login.style.color="#fff";
				popupmask.style.visibility="visible";
				popupmask.style.opacity="0.75";
				popupmask.style.transition="visibility 0s ease 0s, opacity .5s ease"
				}
function loginhide(){  
        	    var login= document.getElementById("login"); 
				var popupmask= document.getElementById("popupmask"); 
				login.style.height="55px";
				login.style.width="45px";
				login.style.background="";
				login.style.color="";
				popupmask.style.visibility="hidden";
				popupmask.style.opacity="0";
				popupmask.style.transition="visibility 0s ease .5s, opacity .5s ease"
				}