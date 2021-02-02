package co.team.apt.common.vo;

import java.sql.Date;
import java.util.List;

public class ListResidentDto {

	private String dong;
	private String ho;
	
	
	private List<ResidentVo> list;


	public String getDong() {
		return dong;
	}


	public void setDong(String dong) {
		this.dong = dong;
	}


	public String getHo() {
		return ho;
	}


	public void setHo(String ho) {
		this.ho = ho;
	}


	public List<ResidentVo> getList() {
		return list;
	}


	public void setList(List<ResidentVo> list) {
		this.list = list;
	}



}
