package org.zerock.jex01.board.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.jex01.board.dto.BoardDTO;
import org.zerock.jex01.board.service.BoardService;
import org.zerock.jex01.board.service.TimeService;
import org.zerock.jex01.common.dto.PageMaker;
import org.zerock.jex01.common.dto.PageRequestDTO;
import org.zerock.jex01.common.dto.PageResponseDTO;

@Controller
@Log4j2
@RequestMapping("/board/*")
@RequiredArgsConstructor
public class BoardController {

    private final TimeService timeService;

    private final BoardService boardService;

    @GetMapping("/time")
    public void getTime(Model model){

        log.info("==============controller getTime==================");


        model.addAttribute("time", timeService.getNow());

    }

    @GetMapping("/register")
    public void registerGet() {

    }

    @PostMapping("/register")
    public String registerPost(BoardDTO boardDTO, RedirectAttributes redirectAttributes){

        log.info("boardDTO: " + boardDTO);

        Long bno = boardService.register(boardDTO);

        log.info("================registerPost======================");
        log.info(bno);
        redirectAttributes.addFlashAttribute("result", bno); //list.jsp로 bno값 전달
        return "redirect:/board/list";
    }

    @GetMapping("/list")
    public void getList(PageRequestDTO pageRequestDTO, Model model){ //Model은 setattribute안해도 자동으로 화면까지 전달
        log.info("getList.................................." + pageRequestDTO);

        PageResponseDTO<BoardDTO> responseDTO = boardService.getDTOList(pageRequestDTO);


        model.addAttribute("dtoList", responseDTO.getDtoList()); //responseDTO를 한번 거쳐서 옴

        int total = responseDTO.getCount();
        int page = pageRequestDTO.getPage();
        int size = pageRequestDTO.getSize();

        model.addAttribute("pageMaker",new PageMaker(page,size,total));

    }

    @GetMapping({"/read","/modify"})
    public void read(Long bno,PageRequestDTO pageRequestDTO, Model model){//
        log.info("c   read:" + bno);
        log.info("c   read:" + pageRequestDTO);

        model.addAttribute("boardDTO", boardService.read(bno));

    }

    @PostMapping("/remove")
    public String remove(Long bno, RedirectAttributes redirectAttributes){

        log.info("remove...........................");
        if(boardService.remove(bno)){
            redirectAttributes.addFlashAttribute("result", "success");
        }
        return "redirect:/board/list";
    }

    @PostMapping("/modify")
    public String modify(BoardDTO boardDTO, PageRequestDTO pageRequestDTO, RedirectAttributes redirectAttributes){
        log.info("modify.....: " + boardDTO);
        if(boardService.modify(boardDTO)){
            redirectAttributes.addFlashAttribute("result", "modified");
        }
        redirectAttributes.addAttribute("bno", boardDTO.getBno());
        redirectAttributes.addAttribute("page", pageRequestDTO.getPage());
        redirectAttributes.addAttribute("size", pageRequestDTO.getSize());

        if(pageRequestDTO.getType() != null){
            redirectAttributes.addAttribute("type", pageRequestDTO.getType());
            redirectAttributes.addAttribute("keyword", pageRequestDTO.getKeyword());
        }

        return "redirect:/board/read";
    }


}
