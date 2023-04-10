package moo.ng.san.category.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ForHeaderCategory {

	private ArrayList<Category> category;
	private ArrayList<DetailCategory> detailCategory;
	
}
