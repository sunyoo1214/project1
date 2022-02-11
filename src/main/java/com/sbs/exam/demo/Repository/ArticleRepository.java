package com.sbs.exam.demo.Repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.sbs.exam.demo.vo.Article;

@Mapper
public interface ArticleRepository {
	
	// INSERT INTO article SET regDate=NOW(), updateDate=NOW(), title= ?, `body` = ?;
	public Article writeArticle(String title, String body);

	// SELECT * FROM article WHERE id = ?
	@Select("select * from article where id = #{id}")
	public Article getArticle(@Param("id") int id);
	
	// DELETE FROME article WHERE id = ?
	public void deleteArticle(int id);
	
	// UPDATE article SET title = ?, `body`= ?, updateDate=NOW() WHERE id = ?
	public void modifyArticle(int id, String title, String body);
	
	// SELECT * FROM article ORDER BY id DESC;
	public List<Article> getArticles();
}
