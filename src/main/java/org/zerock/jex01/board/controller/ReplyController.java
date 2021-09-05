package org.zerock.jex01.board.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.*;
import org.zerock.jex01.board.dto.ReplyDTO;

@Log4j2
@RestController //리턴하는 값이 모두 json처리가 되는 어노테이션
@RequestMapping("/replies")
public class ReplyController {

    @GetMapping("")
    public String[] doA(){//문자열 배열반환"

        try {
            Thread.sleep(1000);
        }catch (Exception e){}

        return new String[]{"aaa","bbb","ccc"};
    }


    @PostMapping("")
    public Long add(@RequestBody ReplyDTO replyDTO){
    //@RequestBody 어노테이션은 @RequestMapping에 의해 POST 방식으로 전송된 HTTP 요청 데이터(우리는 JSON사용)를 자바타입의 객체(여기서는 replyDTO)로 전달된다.(수신)

        try {
            Thread.sleep(1000);
        }catch (Exception e){}


        log.info("----------------------------------------");
        log.info(replyDTO);

        return 1L;
    }

    @DeleteMapping("/{rno}")//댓글 번호를 Delete방식으로 받는다
    public String remove(@PathVariable(name="rno") Long rno){//@PathVariable(name="rno")url로 받은 값을 파라미터로 자동주입
        log.info("------------------reply remove---------------------");

        log.info("rno: " + rno);

        return "success";
    }

    @PutMapping("/{rno}")
    public String modify(@PathVariable(name="rno") Long rno,
                         @RequestBody ReplyDTO replyDTO) {

        log.info("------------reply modify--------------------------" + rno);
        log.info(replyDTO);

        return "success";
    }

}
