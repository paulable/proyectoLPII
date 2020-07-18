package net.consorcio.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.consorcio.entidad.Informe;
import net.consorcio.service.InformeService;


@WebServlet("/ServletInforme")
public class ServletInforme extends HttpServlet {
	private static final long serialVersionUID = 1L;
       //
	private InformeService servicioInforme;
	
   
    public ServletInforme() {
        super();
       servicioInforme=new InformeService();
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tipo=request.getParameter("accion");
		
		if(tipo.equals("REGISTRAR"))
			registrar(request,response);
		else if(tipo.equals("ACTUALIZAR"))
			actualizar(request,response);
		else if(tipo.equals("ELIMINAR"))
			eliminar(request,response);
		else if(tipo.equals("BUSCAR"))
			buscar(request,response); 
		else if(tipo.equals("LISTAR"))
			listar(request,response);
	}


	private void listar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//crear un objeto de tipo arreglo de objeto de la clase Distrito
				List<Informe> lista=servicioInforme.listar();
				//crear un objeto que contenga todo el JSON
				JsonArrayBuilder arreglo=Json.createArrayBuilder();
				//bucle
				for(Informe bean: lista) {
					//crear cada fila
					JsonObject obj=Json.createObjectBuilder().add("codigo", bean.getCodigo()).
															  add("introduccion", bean.getIntroduccion()).
															  add("antecedentes", bean.getAntecedentes()).
															  add("analisis", bean.getAnalisis()).
															  add("conclusiones", bean.getConclusiones()).
															  add("recomendaciones", bean.getRecomendaciones()).
															  add("estado", bean.getEstado()) .build();
					//enviar el objeto "obj" al arreglo
					arreglo.add(obj);
				}
				response.setContentType("application/json;charset=UTF-8");
				PrintWriter salida=response.getWriter();
				salida.println(arreglo.build());
		
	}


	private void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Informe bean;
		String cod;
		cod=request.getParameter("codigo");
		bean=servicioInforme.buscar(Integer.parseInt(cod));
		request.setAttribute("informe", bean);
<<<<<<< HEAD
		//direccionar a la p�gina docente.jsp y enviar el atributo MENSAJE 
=======
		//direccionar a la p�gina docente.jsp y enviar el atributo MENSAJE 
>>>>>>> 0e7b5ac78a7a07be9c22679d060ca3be0601144d
		request.getRequestDispatcher("/actualizarInforme.jsp").forward(request, response);
		
	}


	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cod;
		cod=request.getParameter("codigo");
		
		int salida=servicioInforme.eliminar(Integer.parseInt(cod));
		
		if(salida!=-1)
			request.setAttribute("MENSAJE", "Registro eliminado correctamente");
		else
			request.setAttribute("MENSAJE", "Error en la eliminacionr del registro");
<<<<<<< HEAD
		//direccionar a la p�gina docente.jsp y enviar el atributo MENSAJE 
=======
		//direccionar a la p�gina docente.jsp y enviar el atributo MENSAJE 
>>>>>>> 0e7b5ac78a7a07be9c22679d060ca3be0601144d
		request.getRequestDispatcher("/actualizarInforme.jsp").forward(request, response);
		
	}


	private void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//variables para alacenar los valores de la cajas, utilizar la propiedad name de cada control
				String cod,intr,ant,ana,con,rec,est;
				cod=request.getParameter("codigo");
				intr=request.getParameter("introduccion");
				ant=request.getParameter("antecedentes");
				ana=request.getParameter("analisis");
				con=request.getParameter("conclusiones");
				rec=request.getParameter("recomendaciones");
				est=request.getParameter("estado");
				//crear un objeto de la clase Docente
				Informe bean=new Informe();
				//setear los atributos del objeto "bean"
				bean.setCodigo(Integer.parseInt(cod));
				bean.setIntroduccion(intr);
				bean.setAntecedentes(ant);
				bean.setAnalisis(ana);
				bean.setConclusiones(con);
				bean.setRecomendaciones(rec);
				bean.setEstado(est);
				
<<<<<<< HEAD
				//invocar al m�todo registrarDocente
=======
				//invocar al m�todo registrarDocente
>>>>>>> 0e7b5ac78a7a07be9c22679d060ca3be0601144d
				int salida=servicioInforme.actualizar(bean);
				if(salida!=-1)
					request.setAttribute("MENSAJE", "Registro actualizado correctamente");
				else
					request.setAttribute("MENSAJE", "Error al actualizar el registro");
<<<<<<< HEAD
				//direccionar a la p�gina docente.jsp y enviar el atributo MENSAJE 
=======
				//direccionar a la p�gina docente.jsp y enviar el atributo MENSAJE 
>>>>>>> 0e7b5ac78a7a07be9c22679d060ca3be0601144d
				request.getRequestDispatcher("/actualizarInforme.jsp").forward(request, response);
				
		
	}


	private void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//variables para alacenar los valores de la cajas, utilizar la propiedad name de cada control
		String intr,ant,ana,con,rec,est;
		intr=request.getParameter("introduccion");
		ant=request.getParameter("antecedentes");
		ana=request.getParameter("analisis");
		con=request.getParameter("conclusiones");
		rec=request.getParameter("recomendaciones");
		est=request.getParameter("estado");
<<<<<<< HEAD
=======
		
>>>>>>> 0e7b5ac78a7a07be9c22679d060ca3be0601144d
		//crear un objeto de la clase Docente
		Informe bean=new Informe();
		//setear los atributos del objeto "bean"
		bean.setIntroduccion(intr);
		bean.setAntecedentes(ant);
		bean.setAnalisis(ana);
		bean.setConclusiones(con);
		bean.setRecomendaciones(rec);
		bean.setEstado(est);
		
<<<<<<< HEAD
		//invocar al m�todo registrarDocente
=======
		//invocar al m�todo registrarDocente
>>>>>>> 0e7b5ac78a7a07be9c22679d060ca3be0601144d
		int salida=servicioInforme.registrar(bean);
		if(salida!=-1)
			request.setAttribute("MENSAJE", "Se registro correctamente");
		else
			request.setAttribute("MENSAJE", "Error en el registro");
<<<<<<< HEAD
		//direccionar a la p�gina docente.jsp y enviar el atributo MENSAJE 
=======
		//direccionar a la p�gina docente.jsp y enviar el atributo MENSAJE 
>>>>>>> 0e7b5ac78a7a07be9c22679d060ca3be0601144d
		request.getRequestDispatcher("/informe.jsp").forward(request, response);
		
	}

}
