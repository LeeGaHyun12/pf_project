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
			insert into portfolio (port_Id,subject,userId,port_photo,content,count,like_count,category,date)
			values (#{port_Id},#{subject},#{userId},#{port_photo},#{content},#{count},#{like_count},#{category},now())
			""")
    public void insertBoard(BoardDto dto);
}