package data.service;

import data.dto.MemberDto;
import data.mapper.MemberMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MemberService {

    @Autowired
    private MemberMapperInter memInter;
    public int getTotalCount(){
        return memInter.getTotalCount();
    }

    public int getIdCheckCount(String port_Id){
        return memInter.getIdCheckCount(port_Id);
    }

    public void insertMember(MemberDto dto){
        memInter.insertMember(dto);
    }

    public List<MemberDto> getAllMembers(){
        return memInter.getAllMembers();
    }

    public MemberDto getData(int num)
    {
        return memInter.getData(num);
    }
    public MemberDto getDataById(String myid)
    {
        return memInter.getDataById(myid);
    }

    public boolean isEqualPassCheck(int num,String passwd)
    {
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("num", num);
        map.put("passwd", passwd);
        int n=memInter.isEqualPassCheck(map);
        return n==1?true:false;
    }

    public boolean isLoginCheck(String user_Id,String pass)
    {
        return memInter.isLoginCheck(user_Id, pass)==1?true:false;
    }
}
