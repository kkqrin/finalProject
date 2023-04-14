package moo.ng.san.admin.model.vo;

import java.util.ArrayList;

import org.springframework.core.annotation.Order;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminOrderPageData {
	private ArrayList<Order> orderList;
	private String pageNavi;
}
