package data.service;

import data.dto.BoardDto;
import data.mapper.BoardMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardMapperInter svInter;

    public void insertBoard(BoardDto dto){
        svInter.insertBoard(dto);
    }

    public List<BoardDto> getAllPortfolios() {
        return svInter.getAllPortfolios();
    }

}
