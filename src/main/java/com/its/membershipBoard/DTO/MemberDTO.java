package com.its.membershipBoard.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
    private Long m_id;
    private String memberId;
    private String memberPassword;
    private String memberName;
    private String memberEmail;
    private String memberMobile;
    private MultipartFile memberProfile;
    private String memberProfileName;
}
