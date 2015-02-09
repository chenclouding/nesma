function showTip(){
			var objs = document.getElementsByTagName("*");
			for(var i = 0 ;i < objs.length ; i ++){
				var obj = objs[i];
				if(obj.getAttribute("tip")){
					obj.onmousemove = Tips.showTips;
				}
			}
		}
		
		var Tips = {
			mousePos : function(e) {
				var x, y;
				var e = e || window.event;
				return {
					x : e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft,
					y : e.clientY + document.body.scrollTop + document.documentElement.scrollTop
				};
			},			
			showTips : function(event){
				event = event || window.event;
				var target = event.srcElement || event.target;
				var tipsDiv = document.getElementById("tipsDiv");
				if(typeof tipsDiv == undefined || tipsDiv == null){
					tipsDiv = document.createElement("div");
					tipsDiv.id = "tipsDiv";
					document.body.appendChild(tipsDiv);
				}
				var mouse = Tips.mousePos(event);
				tipsDiv.style.position = "absolute";
				//tipsDiv.style.width = "100px";
				//tipsDiv.style.height = "100px";
				//tipsDiv.style.backgroundColor = "gray";
				tipsDiv.style.color = "black";
				tipsDiv.style.top = mouse.y + 10 + 'px';
				tipsDiv.style.left = mouse.x + 10 + 'px';
				tipsDiv.innerHTML = target.getAttribute("tip");
				tipsDiv.style.display = "";	
				target.onmouseout = function(){
					tipsDiv.style.display = "none";	
				}
			} 
		}