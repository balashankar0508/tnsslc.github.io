document.addEventListener('DOMContentLoaded', function() {
	const roll = document.getElementById('roll');
	const dob = document.getElementById('dob');
	const form = document.getElementById('form');
	
	roll.innerText="";
	dob.innerText="";
	
	form.addEventListener('submit', (e)=>{
		let c=0;
		
		if(roll.value==""||roll.value==null){
			alert("Enter Roll Number");
			c++;
		}
		else if(roll.value.length>7||roll.value.length<7){
			alert("Roll number must be 7 digits");
			c++;
		}
		
		else if(dob.value==""||roll.value==null){
			alert("Enter DOB");
			c++;
		}
		
		else if(dob.value.length>10||dob.value.length<10){
			alert("Enter DOB Correctly");
			c++;
		}
		
		if(c>0){
			event.preventDefault();
		}
	})
})
