/**
 * 
 */
   function uploadevent(status,picUrl,callbackdata){
	   
     status += '';
     switch(status){
     case '1':
		var time = new Date().getTime();
		var imgfile = picUrl+'.jpg';

		document.getElementById('avatar_priview').innerHTML = "头像1 : <img src='"+imgfile+"?" + time + "'/> " ;
		window.location.reload();
	break;
     case '-1':
	  //window.location.reload();
     break;
     default:
     //window.location.reload();
    } 
   }