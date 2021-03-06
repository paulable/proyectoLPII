package net.consorcio.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.consorcio.entidad.Proveedor;
import net.consorcio.interfaces.ProveedorDAO;
import net.consorcio.utils.MySqlBDConexion;

public class MySqlProveedorDAO implements ProveedorDAO {

	@Override
	public Proveedor fin(long cod) {
		Proveedor bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlBDConexion.getConexion();
			String sql="select *from tb_proveedor where ruc_prov=?";
			pstm=cn.prepareStatement(sql);
			pstm.setLong(1, cod);
			rs=pstm.executeQuery();
			if(rs.next()) {
				bean=new Proveedor();
				bean.setCodigo(rs.getLong(1));
				bean.setNombre(rs.getString(2));
				bean.setApellido(rs.getString(3));
				bean.setTelefono(rs.getString(4));
				bean.setEmail(rs.getString(5));
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
	public List<Proveedor> listAll() {
		List<Proveedor> lista=new ArrayList<Proveedor>();
		Proveedor bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlBDConexion.getConexion();
			String sql="select *from tb_proveedor";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()) {
				bean=new Proveedor();
				bean.setCodigo(rs.getLong(1));
				bean.setNombre(rs.getString(2));
				bean.setApellido(rs.getString(3));
				bean.setTelefono(rs.getString(4));
				bean.setEmail(rs.getString(5));
				
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
	public int save(Proveedor bean) {
	
		int estado=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			cn=MySqlBDConexion.getConexion();
			String sql="insert into tb_proveedor values(?,?,?,?,?)";
			pstm=cn.prepareStatement(sql);
			pstm.setLong(1, bean.getCodigo());
			pstm.setString(2, bean.getNombre());
			pstm.setString(3, bean.getApellido());
			pstm.setString(4, bean.getTelefono());
			pstm.setString(5, bean.getEmail());
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
	public int update(Proveedor bean) {
		int estado=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			cn=MySqlBDConexion.getConexion();
			String sql="update tb_proveedor set nom_prov=?,ape_prov=?,tel_prov=?,ema_prov=? where ruc_prov=?";
			pstm=cn.prepareStatement(sql);
			pstm.setString(1, bean.getNombre());
			pstm.setString(2, bean.getApellido());
			pstm.setString(3, bean.getTelefono());
			pstm.setString(4, bean.getEmail());
			pstm.setLong(5, bean.getCodigo());
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
	public int delete(long cod) {
		int estado=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			cn=MySqlBDConexion.getConexion();
			String sql="delete from tb_proveedor where ruc_prov=?";
			pstm=cn.prepareStatement(sql);
			pstm.setLong(1,cod);
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
	public List<Proveedor> listProveedorXApellidos(String ape) {
		List<Proveedor> lista=new ArrayList<Proveedor>();
		Proveedor bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlBDConexion.getConexion();
			String sql="select *from tb_proveedor where ape_prov like ?";
			pstm=cn.prepareStatement(sql);
			pstm.setString(1, ape+"%");
			rs=pstm.executeQuery();
			while(rs.next()) {
				bean=new Proveedor();
				bean.setCodigo(rs.getLong(1));
				bean.setNombre(rs.getString(2));
				bean.setApellido(rs.getString(3));
				bean.setTelefono(rs.getString(4));
				bean.setEmail(rs.getString(5));
				
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
	

	
	

}
