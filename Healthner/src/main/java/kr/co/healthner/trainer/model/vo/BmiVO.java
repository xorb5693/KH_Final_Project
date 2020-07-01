package kr.co.healthner.trainer.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BmiVO {

	private int inbodyNo;
	private int memberNo;
	private Date measureDate;
	private float weight;
	private float bone;
	private float bodyfat;
	private float bodywater;
	private float protein;
	private float mineral;
	private float bmi;
	private float bodyfatPer;
	private float abfatPer;
	private float metabolism;
	private String memberName;
}
