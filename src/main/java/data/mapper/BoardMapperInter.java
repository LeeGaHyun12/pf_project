package data.mapper;

import data.dto.BoardDto;
import data.dto.MemberDto;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

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
	BoardDto getPortfolioByNum(int num);
}