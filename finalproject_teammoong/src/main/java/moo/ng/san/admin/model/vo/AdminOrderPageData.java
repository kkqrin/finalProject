package moo.ng.san.admin.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import moo.ng.san.order.model.vo.Order;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminOrderPageData {
	private ArrayList<Order> orderList;
	private String pageNavi;
}
