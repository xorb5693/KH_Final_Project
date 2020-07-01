package kr.co.healthner.trainer.model.vo;

import java.util.List;

import lombok.Data;

@Data
public class CustomerData {
	private List<MemberMappingInfoVO> list;
	private String pageNavi;
	private String memberName;
}
