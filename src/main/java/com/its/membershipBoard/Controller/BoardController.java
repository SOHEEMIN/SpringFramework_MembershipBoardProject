package com.its.membershipBoard.Controller;

import com.its.membershipBoard.DTO.BoardDTO;
import com.its.membershipBoard.DTO.PageDTO;
import com.its.membershipBoard.Service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;

    @GetMapping("/findAll")
    public String findAll(Model model) {
        long b_id = 0;
        List<BoardDTO> boardDTOList = boardService.findAll(b_id);
        model.addAttribute("boardList", boardDTOList);
        return "/boardPage/pagingList";
    }
    @GetMapping("/saveFile")
    public String saveFileForm(){
        return "boardPage/saveFile";
    }

    //파일첨부 글작성 처리
    @PostMapping("/saveFile")
    public String saveFile(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.saveFile(boardDTO);
        return "redirect:/board/paging";
    }
    @GetMapping("/paging")
    public String page(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model){
        System.out.println("ㅠㅠ");
        List<BoardDTO>boardList=boardService.pagingList(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardList", boardList);
        model.addAttribute("paging", paging);
        return "/boardPage/pagingList";
    }
    @GetMapping("/detail")
    public String findById(@RequestParam("b_id")long b_id, Model model,
                           @RequestParam(value = "page", required = false,defaultValue = "1")int page){
        model.addAttribute("board", boardService.findById(b_id));
        model.addAttribute("Page", page);
        return "/boardPage/detail";
    }
}
