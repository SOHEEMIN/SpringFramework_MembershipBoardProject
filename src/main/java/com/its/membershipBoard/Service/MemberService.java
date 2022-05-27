package com.its.membershipBoard.Service;

import com.its.membershipBoard.DTO.MemberDTO;
import com.its.membershipBoard.Repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public void saveFile(MemberDTO memberDTO) throws IOException {
        MultipartFile memberProfile = memberDTO.getMemberProfile();
        String memberProfileName = memberProfile.getOriginalFilename();
        memberProfileName = System.currentTimeMillis() + "-" + memberProfileName;
        memberDTO.setMemberProfileName(memberProfileName);
        String savePath = "D:\\spring_img\\" + memberProfileName;
        if (!memberProfile.isEmpty()) {
            memberProfile.transferTo(new File(savePath));
        }
        memberRepository.saveFile(memberDTO);
    }

    public String duplicateCheck(String memberId) {
        String checkResult = memberRepository.duplicateCheck(memberId);
        if(checkResult==null){
            return "ok";
        }else {
            return "no";
        }
    }

    public List<MemberDTO> findAll(long m_id) {
        return memberRepository.findAll(m_id);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        MemberDTO loginMember = memberRepository.login(memberDTO);
        return loginMember;
    }
}
