package net.consorcio.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import net.consorcio.entidad.Requerimiento;
import net.consorcio.interfaces.RequerimientoDAO;
import net.consorcio.utils.MySqlBDConexion;

public class MySqlRequerimientoDAO implements RequerimientoDAO {

	@Override
	public Requerimiento fin(int cod) {
		Requerimiento bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlBDConexion.getConexion();
			String sql="select *from tb_requerimiento where cod_req=?";
			pstm=cn.prepareStatement(sql);
			pstm.setInt(1, cod);
			rs=pstm.executeQuery();
			if(rs.next()) {
				bean=new Requerimiento();
				bean.setCodigo(rs.getInt(1));
				bean.setDescripcion(rs.getString(2));
				bean.setOrigen(rs.getString(3));
				bean.setArea(rs.getString(4));
				bean.setCriticidad(rs.getString(5));
				bean.setCodigoEstado(rs.getInt(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs!=null) rs.close();
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return bean;
	}

	@Override
	public List<Requerimiento> listAll() {
		List<Requerimiento> lista=new ArrayList<Requerimiento>();
		Requerimiento bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlBDConexion.getConexion();
			String sql="select r.cod_req, r.descripcion_req, r.origen_req, r.area_req, r.criticidad_req, e.nom_est from tb_requerimiento r inner join tb_estado e on r.cod_est=e.cod_est";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()) {
				bean=new Requerimiento();
				bean.setCodigo(rs.getInt(1));
				bean.setDescripcion(rs.getString(2));
				bean.setOrigen(rs.getString(3));
				bean.setArea(rs.getString(4));
				bean.setCriticidad(rs.getString(5));
				bean.setNombreEstado(rs.getString(6));
				
				lista.add(bean);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs!=null) rs.close();
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lista;
	}

	@Override
	public int save(Requerimiento bean) {
		
		int estado=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			cn=MySqlBDConexion.getConexion();
			String sql="insert into tb_requerimiento values(null,?,?,?,?,1,null,?)";
			pstm=cn.prepareStatement(sql);
			pstm.setString(1, bean.getDescripcion());
			pstm.setString(2, bean.getOrigen());
			pstm.setString(3, bean.getArea());
			pstm.setString(4, bean.getCriticidad());
			pstm.setInt(5, bean.getCodigoUsuario());
			estado=pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return estado;


	}

	@Override
	public int update(Requerimiento bean) {
		
		int estado=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			cn=MySqlBDConexion.getConexion();
			String sql="update tb_requerimiento set descripcion_req=?,origen_req=?,area_req=?,criticidad_req=?,cod_est=? where cod_req=?";
			pstm=cn.prepareStatement(sql);
			pstm.setString(1, bean.getDescripcion());
			pstm.setString(2, bean.getOrigen());
			pstm.setString(3, bean.getArea());
			pstm.setString(4, bean.getCriticidad());
			pstm.setInt(5, bean.getCodigoEstado());
			pstm.setLong(6, bean.getCodigo());
			estado=pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return estado;
	}

	@Override
	public int delete(int cod) {
		int estado=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			cn=MySqlBDConexion.getConexion();
			String sql="delete from tb_requerimiento where cod_req=?";
			pstm=cn.prepareStatement(sql);
			pstm.setInt(1,cod);
			estado=pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return estado;
	}

}
