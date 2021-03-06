<jsp:include page="menu.jsp"/>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<c:if test="${requestScope.MENSAJE!=null}">
		<div class="alert alert-warning alert-dismissible fade show" role="alert">
		  <strong>${requestScope.MENSAJE}</strong>
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
	</c:if>
	<div class="container">
  		<form method="post" action="ServletProveedor?accion=REGISTRAR" method="post" id="id_registrar">
		  <div class="form-group">
			    <label for="exampleFormControlTextarea1">Ruc</label>
			    <input type="text" class="form-control" id="exampleFormControlTextarea1" name="codigo" placeholder="Ingresar ruc" rows="3">
			  </div>
			  <div class="form-group">
			    <label for="exampleFormControlTextarea1">Nombre</label>
			    <input type="text" class="form-control" id="exampleFormControlTextarea1" name="nombre" placeholder="Ingresar nombre" rows="3">
			  </div>
			  <div class="form-group">
			    <label for="exampleFormControlTextarea1">Apellido</label>
			    <input type="text" class="form-control" id="exampleFormControlTextarea1" name="apellido" placeholder="Ingresar apellido" rows="3">
			  </div>
			   <div class="form-group">
			    <label for="exampleFormControlTextarea1">Telefono</label>
			    <input type="text" class="form-control" id="exampleFormControlTextarea1" name="telefono" placeholder="Ingresar telefono" rows="3">
			  </div>
			   <div class="form-group">
			    <label for="exampleFormControlTextarea1">Email</label>
			    <input type="text" class="form-control" id="exampleFormControlTextarea1" name="email" placeholder="Ingresar email" rows="3">
			  </div>
				
		  <button type="submit" class="btn btn-primary">Grabar</button>
		  <button type="button" class="btn btn-success">Listar</button>
		</form>
	</div>	
	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 
 	<!-- jQuery validate -->
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/additional-methods.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/additional-methods.min.js"></script>
	
	<script>
	$(".btn-success").click(function(){
		window.location.href='listaProveedor.jsp';
	})
	</script>
  	
  	<script>    
	  $('#id_registrar').validate({
	    rules: {
	    	codigo:{
	    		required:true,
	    		digits:true,
	    		pattern:'[\\d]{11}'
	    	},
	    	nombre:{
	    		required:true,
	    		pattern:'[a-zA-Z\\s\\�\\�]{1,25}'
	    	},
	    	apellido:{
	    		required:true,
	    		pattern:'[a-zA-Z\\s\\�\\�]{1,25}'
	    	},
	    	telefono:{
	    		required:true,
	    		digits:true,
	    		pattern:'[\\d]{7}||[\\d]{9}'
	    	},
	    	email:{
	    		required:true,
	    		pattern:'^[_a-z0-9-]+(\\.[_a-z0-9-]+)*@' +
	    		      '[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,4})$'
	    		
	    	}
	    },
	    messages:{
	    	codigo:{
	    		required:'Ingresar RUC',
	    		digits:'Solo digitos',
	    		pattern:'Campo RUC con 11 digitos'
	    	},
	    	nombre:{
	    		required:'Ingresar nombre',
	    		pattern:'Campo nombre solo letras con un maximo de 25 caracteres'
	    	},
	    	apellido:{
	    		required:'Ingresar apellido',
	    		pattern:'Campo apellido solo letras con un maximo de 25 caracteres'
	    	
	    	},
	    	telefono:{
	    		required:'Ingresar telefono',
	    		digits:'Solo digitos',
	    		pattern:'Campo telefono con 7 o 9 digitos'
	    		
	    	},
	    	email:{
	    		required:'Ingresar email',
	    		pattern:'Campo email en min�scula, respetando el formato de un correo electronico'
	    	}
	    },
	    errorElement: 'span',
	    errorPlacement: function (error, element) {
	        error.addClass('invalid-feedback');
	        element.closest('.form-group').append(error);
	    },
	    highlight: function (element, errorClass, validClass) {
	        $(element).addClass('is-invalid');
	    },
	    unhighlight: function (element, errorClass, validClass) {
	        $(element).removeClass('is-invalid');
	    },
	})
	</script>		
</body>
</html>