package kr.co.healthner.admin.model.vo;

import java.util.ArrayList;

import kr.co.healthner.member.model.vo.Member;
import lombok.Data;

@Data
public class TotalpageList {
	private ArrayList<Member> list;
	private int totalCount;
}
