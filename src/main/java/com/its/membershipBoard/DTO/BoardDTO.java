package com.its.membershipBoard.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardDTO {
    private Long b_id;
    private String boardTitle;
    private String memberId;
    private String boardContents;
    private int boardHits;
    private String boardCreatedDate;
    private MultipartFile boardFile;
    private String boardFileName;
}
