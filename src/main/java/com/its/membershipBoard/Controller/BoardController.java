package com.its.membershipBoard.Controller;

import com.its.membershipBoard.DTO.BoardDTO;
import com.its.membershipBoard.DTO.CommentDTO;
import com.its.membershipBoard.DTO.PageDTO;
import com.its.membershipBoard.Service.BoardService;
import com.its.membershipBoard.Service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private CommentService commentService;

    @GetMapping("/findAll")
    public String findAll(Model model) {
        long b_id = 0;
        List<BoardDTO> boardDTOList = boardService.findAll(b_id);
        model.addAttribute("boardList", boardDTOList);
        return "/boardPage/pagingList";
    }
    @GetMapping("/saveFile")
    public String saveFileForm(HttpSession session){
        return "/boardPage/saveFile";
    }

    //파일첨부 글작성 처리
    @PostMapping("/saveFile")
    public String saveFile(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.saveFile(boardDTO);
        return "redirect:/board/paging";
    }
    @GetMapping("/paging")
    public String page(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model){
        List<BoardDTO> boardList=boardService.pagingList(page);
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
        List<CommentDTO> commentDTOList = commentService.findAll(b_id);
        model.addAttribute("commentList", commentDTOList);
        return "/boardPage/detail";
    }
    @GetMapping("/update")
    public String updateForm(@RequestParam("b_id") long b_id, Model model){
        BoardDTO boardDTO = boardService.findById((b_id));
        model.addAttribute("boardUpdate", boardDTO);
            return "/boardPage/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO){
        boardService.update(boardDTO);
        return "redirect:/board/detail?b_id="+boardDTO.getB_id();
    }
    @GetMapping("/delete")
    public String deleteForm(@RequestParam("b_id")long b_id){
        boardService.delete(b_id);
        return "redirect:/board/paging";
    }
    @GetMapping("/search")
    public String search(@RequestParam("searchType") String searchType,@RequestParam ("q") String q, Model model){
        List<BoardDTO> searchList = boardService.search(searchType,q);
        model.addAttribute("boardList", searchList);
        return "boardPage/pagingList";
    }
}
