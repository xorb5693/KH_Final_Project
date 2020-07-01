package kr.co.healthner.board.model.vo;

import java.util.ArrayList;

import kr.co.healthner.vo.BoardVO;
import lombok.Data;
@Data
public class BoardPageDate {
	private ArrayList<BoardVO>list;
	private String pageNavi;

}
