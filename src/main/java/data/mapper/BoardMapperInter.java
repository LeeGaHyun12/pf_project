package data.mapper;

import data.dto.BoardDto;
import data.dto.MemberDto;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardMapperInter {
    @Insert("""
			insert into portfolio (subject,userId,port_Id,port_photo,content,count,like_count,category,date)
			values (#{subject},#{userId},#{port_Id},#{port_photo},#{content},#{count},#{like_count},#{category},now())
			""")
    public void insertBoard(BoardDto dto);

	@Select("select * from portfolio")
	List<BoardDto> getAllPortfolios();

	@Select("select * from portfolio where num = #{num}")
	BoardDto getBoardByNum(int num);


	@Select("select * from portfolio where category = #{category}")
	List<BoardDto> getBoardByCategory(String category);

	@Select("select * from portfolio where category = #{keyword} OR subject LIKE CONCAT('%', #{keyword}, '%') OR category LIKE CONCAT('%', #{keyword}, '%')")
	List<BoardDto> findKeyword(@Param("keyword") String keyword);

	@Update("UPDATE portfolio SET like_count = like_count + 1 WHERE num = #{num}")
	public void updateLikeCount(@Param("num") int num);

	@Update("update portfolio set count=count+1 where num=#{num}")
	public void updateReadcount(@Param("num") int num);

	@Select("select * from user where num")
	public void getUserData(@Param("num") int num);

	@Select("SELECT * FROM portfolio WHERE userId = #{userId}")
	List<BoardDto> getBoardByUserId(String userId);





}