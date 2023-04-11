		$(document).ready(function(){
		
    		$.ajax({
				url:"/headerCategory.do",
				type:"post",
				dataType: "json",
				success: function(list){

                    const category = list.category;
                    const detailCategory = list.detailCategory;

                    for(let i=0 ; i<category.length ; i++){
                        const div1 = $("<div>");
                        div1.addClass("one-category");

                        const a1 = $("<a>");
                        a1.addClass("cate-name");
                        const c = category[i];
                        a1.prop('href',c.categoryNo);
                        a1.text(c.categoryName);

                        div1.append(a1);

                        const div2 = $("<div>");
                        div2.addClass("sub");

                        for(let j=0 ; j<detailCategory.length ; j++){
                            const d = detailCategory[j];
                            
                            if(c.categoryNo==d.categoryNo){
                                const a2 = $("<a>");
                                a2.prop('href',"/productList.do?category="+d.categoryNo+d.detailCategoryNo);
                                a2.text(d.detailCategoryName);
                                div2.append(a2);
                            }
                        }//deatail for

                        div1.append(div2);
                        $(".main-category").append(div1);

                    }//전체 for

                    /*
                    <div class="one-category">
                        <a class="cate-name" href="c.categyNo">대분류 이름</a>
                        <div class="sub">
                            <a href="d.detailCategoryNo">소분류 이름</a>
                        </div>
                    </div>
                    
                    */



                    $(".menu-category").mouseenter(function(){
                        $(".category-content").fadeIn();
                    });
                    $(".menu-category").mouseleave(function(){
                        $(".category-content").fadeOut();
                        $(".sub").fadeOut();
                    });
                    
                    $(".cate-name").mouseenter(function(event){
                        event.stopPropagation();
                        $(".sub").hide();
                        $(this).next().show();
                    });
				}//success
			})//ajax
		

    	});//ready
    
    
    
		