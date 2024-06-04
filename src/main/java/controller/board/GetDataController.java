package controller.board;

import data.dto.BoardDto;
import data.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GetDataController {

    @Autowired
    private BoardService boardService;

    @GetMapping("/getData")
    public BoardDto getData(@RequestParam("num") int num) {
        // num에 해당하는 데이터를 조회하여 반환
        return boardService.getBoardByNum(num);
    }

    @PostMapping("/likePost")
    public String likePost(@RequestParam("num") int num){
        try {
            boardService.increaseLikeCount(num);
            return "{\"success\": true}";
        } catch (Exception e) {
            return "{\"success\": false}";
        }
    }

    @PostMapping("/increaseCount")
    public String updateReadcount(@RequestParam("num") int num) {
        try {
            boardService.updateReadcount(num);
            return "{\"success\": true}";
        } catch (Exception e) {
            return "{\"success\": false}";
        }
    }



}
