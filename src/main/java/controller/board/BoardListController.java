package controller.board;

import data.dto.BoardDto;
import data.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class BoardListController {

    @Autowired
    private BoardService boardService;
    @GetMapping("board/boardlist")
    public String boardList(Model model) {
        List<BoardDto> boardList = boardService.getAllPortfolios();
        model.addAttribute("boardList", boardList);
        return "board/boardlist";
    }

}
