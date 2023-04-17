package moo.ng.san.coupon.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import moo.ng.san.dayCheck.model.vo.Point;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PointPageData {
	private ArrayList<Point> pointList;
	private String pageNavi;
}
