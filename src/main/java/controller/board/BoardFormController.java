package controller.board;


import data.dto.BoardDto;
import data.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class BoardFormController {
    @Autowired
    private BoardService boardService;

    //게시물 작성
    @GetMapping("/board/writeform")
    public String form() {
        return "board/writeform";
    }

    @PostMapping("/board/upload")
    public String saveData(
            @RequestParam("subject") String subject,
            @RequestParam("content") String content,
            @RequestParam("port_Id") String port_Id,
            @RequestParam("userId") String userId,
            @RequestParam("upload")MultipartFile upload,
            HttpServletRequest request
    ) {
        //업로드될 경로
        String savePath = request.getSession().getServletContext().getRealPath("/profile");
        //업로드한 파일의 확장자 분리
        String ext = upload.getOriginalFilename().split("\\.")[1];
        //업로드할 파일명
        String photoname = UUID.randomUUID() + ext;


        BoardDto dto = BoardDto.builder()
                .subject(subject)
                .port_photo(photoname)
                .userId(userId)
                .port_Id(port_Id)
                .content(content)
                .build();

        //실제 업로드
        try {
            upload.transferTo(new File(savePath + "/" + photoname));
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }
        //db에 저장
        boardService.insertBoard(dto);

        return "redirect:/member/loginform";

    }
}
