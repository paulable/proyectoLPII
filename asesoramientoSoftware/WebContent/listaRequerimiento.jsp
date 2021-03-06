<jsp:include page="menu.jsp"/>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" />
</head>
<body>
	<div class="container">
		<h1>Listado</h1>
	
			<table id="table_id" class="table-bordered">
			    <thead>
			        <tr>
			            <th>C�digo</th>
			            <th>Descripcion</th>
			            <th>Origen</th>
			            <th>Area</th>
			            <th>Criticidad</th>
			            <th>Estado</th>
			            <th></th>
			            <th></th>
			            <th></th>
			        </tr>
			    </thead>
			    <tbody>
			    
			        
			    </tbody>
			</table>

			
	</div>
    
   
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	tabla();
	//$('#table_id').DataTable();
});
$(".btn-primary").click(function() {
	window.location.href = "informeTecnico.jsp";
})

function tabla(){
		$.getJSON("ServletRequerimiento",{accion:"LISTAR"},function(response){
			//bucle para realizar recorrido sobre response
			$.each(response,function(index,item){
				
					
				var editar= "<a href='ServletRequerimiento?accion=BUSCAR&codigo="+item.codigo+"'>Actualizar</a>"
				var consultar= "<a href='ServletRequerimiento?accion=CONSULTAR&codigo="+item.codigo+"' target='_blank'>Ver PDF</a>"
				var nuevo= "<a href='ServletInforme?accion=NUEVO&codigo="+item.codigo+"'>Nuevo</a>"
				
				$("#table_id").append("<tr><td>"+item.codigo +"</td><td>"+
												item.descripcion+"</td><td>"+
												item.origen +"</td><td>"+
												item.area +"</td><td>"+
												item.criticidad +"</td><td>"+
												item.nombreEstado +"</td><td>"+
												editar+"</td><td>"+
												consultar+"</td><td>"+
												nuevo+"</td></tr>")
			});
		
			
			$('#table_id').DataTable();
		})		
	}

</script>
</body>
</html>