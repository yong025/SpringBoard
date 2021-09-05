package org.zerock.jex01.common.exception;

import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice//controller로 가기 위해서는 나를 거쳐가야함.
@Log4j2
public class CommonExceptionAdvice {

    @ExceptionHandler(Exception.class)//모든 예외는 여기서 처리한다.
    public String EXCEPTall(Exception ex, Model model){
        log.error(ex.getMessage());

        model.addAttribute("exception", ex);

        return "error_page";
    }

    @ExceptionHandler(ArithmeticException.class)//모든 산술 예외는 여기서 처리한다.
    public String EXCEPTall(ArithmeticException ex, Model model){//이런식으로 구체적인 예외 처리를 해줄 수 있다.
        log.info(ex.getClass().getName());
        log.error(ex.getMessage());

        model.addAttribute("exception", ex);

        return "error_arithmetic_page";
    }

    @ExceptionHandler(NoHandlerFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)//응답 메세지 필수는 아님.
    public String handle404(NoHandlerFoundException ex){

        return "custom404";
    }

}
