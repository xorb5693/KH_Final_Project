package kr.co.healthner.trainer.model.vo;

import java.util.List;

import lombok.Data;

@Data
public class BmiData {

	private List<BmiVO> list;
	private String pageNavi;
	
}
