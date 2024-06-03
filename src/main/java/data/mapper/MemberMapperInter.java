package data.mapper;

import data.dto.MemberDto;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface MemberMapperInter {
    @Select("select count(*) from user")
    public int getTotalCount();

    @Select("select count(*) from user where userId=#{port_Id}")
    public int getIdCheckCount(String port_Id);

    @Insert("""
			insert into user (userId,name,passwd,prof_photo,email,category) values (#{userId},#{name},#{passwd},#{prof_photo},
			#{email},#{category})
			""")
    public void insertMember(MemberDto dto);

    @Select("select * from user order by num desc")
    public List<MemberDto> getAllMembers();

    @Select("select * from user where num=#{num}")
    public MemberDto getData(int num);

    @Select("select * from user where userId=#{userId}")
    public MemberDto getDataById(String userId);

    @Select("select count(*) from user where num=#{num} and passwd=#{passwd}")
    public int isEqualPassCheck(Map<String, Object> map);

    @Select("""
			select count(*) from user where userId=#{userId} and passwd=#{passwd}
			""")
    public int isLoginCheck(String userId,String passwd);
}