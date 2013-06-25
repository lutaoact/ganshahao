// JavaScript Document
var Placeholder1 = function(element) {
    var placeholder = '';
    if (element && !("placeholder" in document.createElement("input")) && (placeholder = element.getAttribute("placeholder"))) {
        element.onfocus = function() {
            if (this.value === placeholder) {
                this.value = "";
            }
            this.style.color = '';
        };
        element.onblur = function() {
            if (this.value === "") {
                this.value = placeholder;
                this.style.color = 'graytext';    
            }
        };
        
        //样式初始化
        if (element.value === "") {
            element.value = placeholder;
            element.style.color = 'graytext';    
        }
    }
};

Placeholder1(document.getElementById("user_email"));

var Placeholder2 = function(element) {
    var placeholder = '';
    if (element && !("placeholder" in document.createElement("input")) && (placeholder = element.getAttribute("placeholder"))) {
        element.onfocus = function() {
            if (this.value === placeholder) {
                this.value = "";
            }
            this.style.color = '';
        };
        element.onblur = function() {
            if (this.value === "") {
                this.value = placeholder;
                this.style.color = 'graytext';    
            }
        };
        
        //样式初始化
        if (element.value === "") {
            element.value = placeholder;
            element.style.color = 'graytext';    
        }
    }
};

Placeholder2(document.getElementById("user_password"));

var Placeholder5 = function(element) {
    var placeholder = '';
    if (element && !("placeholder" in document.createElement("input")) && (placeholder = element.getAttribute("placeholder"))) {
        element.onfocus = function() {
            if (this.value === placeholder) {
                this.value = "";
            }
            this.style.color = '';
        };
        element.onblur = function() {
            if (this.value === "") {
                this.value = placeholder;
                this.style.color = 'graytext';    
            }
        };
        
        //样式初始化
        if (element.value === "") {
            element.value = placeholder;
            element.style.color = 'graytext';    
        }
    }
};

Placeholder5(document.getElementById("user_password2"));