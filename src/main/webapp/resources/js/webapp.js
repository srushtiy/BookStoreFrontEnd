$(function (){
	switch(menu){
	case 'about':
		$('#about').addClass('active');
		break;
	case 'service':
		$('#service').addClass('active');
		break;
	case 'contact':
		$('#contact').addClass('active');
		break;
	default:
		$('#home').addClass('active');
	}
}
);