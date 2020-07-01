package kr.co.healthner.member.model.vo;

import kr.co.healthner.trainer.model.vo.TrainerVO;
import lombok.Data;

@Data
public class MappingTrainerData {

	private TrainerVO trainer;
	private MemberMappingVO mapping;

}