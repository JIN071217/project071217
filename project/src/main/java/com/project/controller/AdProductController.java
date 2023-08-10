package com.project.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.CategoryVO;
import com.project.domain.ProductVO;
import com.project.dto.Criteria;
import com.project.dto.PageDTO;
import com.project.service.AdProductService;
import com.project.util.FileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin/product/*")
public class AdProductController {
	
	@Setter(onMethod_ = {@Autowired})
	private AdProductService adProductService;
	
	//업로드 폴더 주입
	@Resource(name = "uploadPath") // servlet-context.xml 참조
	private String uploadPath; // C:\\dev\\upload\\pds\\
	
	//CK에디터 폴더 주입
	@Resource(name = "uploadCkEditorPath") // servlet-context.xml 참조
	private String uploadCkEditorPath; // C:\\dev\\upload\\ckeditor\\
	
	//1.상품 등록 폼
	@GetMapping("pro_insert")
	public void pro_insert(Model model) {
		// 필요한 정보를 Model객체를 통해 jsp에 전달한다.
		model.addAttribute("categoryList", adProductService.getCategoryList());
	}
	
	//2.[카테고리] 작업 
	@ResponseBody // 매핑경로변수를 통해 해당 코드로 받는다.
	@GetMapping("/subCategory/{cat_code}")				
	public ResponseEntity<List<CategoryVO>> subCategory(@PathVariable("cat_code") Integer cat_code){
		
		ResponseEntity<List<CategoryVO>> entity = null;
		
		// 카테고리 서비스를 통해 특정 상위 카테고리에 속하는 하위 카테고리 목록을 조회한다.
		entity = new ResponseEntity<List<CategoryVO>>(adProductService.subCategoryList(cat_code), HttpStatus.OK);
		
		return entity;
	}
	
	// 3. 상품정보 저장 CKEditor, FileUtils 작업후 스코프 완성
	@PostMapping("/pro_insert")
	public String pro_insert(ProductVO vo, RedirectAttributes rttr) {
		
		log.info("상품정보: " + vo);
		
		// 파일 업로드 날짜 폴더 생성 및 업로드 파일 처리
		String uploadDateFolder = FileUtils.getFolder();
		String saveImageName = FileUtils.uploadFile(uploadPath, uploadDateFolder, vo.getUploadFile());
		
		vo.setPro_img(saveImageName); // 실제 업로드 파일명
		vo.setPro_up_folder(uploadDateFolder); // 날짜 폴더명
		
		log.info("상품정보: " + vo);
		
		// 상품 정보를 DB에 저장
		adProductService.pro_insert(vo);
		
		// 상품 등록이 완료되면, 상품 리스트 페이지로 리다이렉트한다.
		return "redirect:/admin/product/pro_list";
	}
	
	// CKEditor
	@PostMapping("/imageUpload")
	public void imageUpload(HttpServletRequest req, HttpServletResponse res, MultipartFile upload) {
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		// 클라이언트에게 보내는 정보 설명
		// 서버에서 클라이언트에게 정보를 보낼때, 브라우저에 설명의 의미로 해당 인코딩과 타입을 입력해야 한다.
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		
		try {
			// 업로드 작업
			String fileName = upload.getOriginalFilename(); // 클라이언트에서 서버로 보내는 파일이름
			byte[] bytes = upload.getBytes(); // 클라이언트에서 보낸 업로드 파일을 바이트 배열로 확보
			
			String uploadPath = uploadCkEditorPath + fileName;
			
			log.info("파일업로드: " + uploadPath);
			
			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			out.flush();
			
			// 업로드된 파일 정보를 CKEditor에 보내는 작업 - 클라이언트에서 서버측에 객체를 보냄
			printWriter = res.getWriter();
			
			// 톰캣 환경설정 Context Path에서 경로와 업로드될 브라우저를 설정
			String fileUrl = "/upload/" + fileName;
			// 업로드된 파일 정보를 JSON형식으로 작성, 클라이언트에게 반환한다.
			printWriter.println("{\"filename\":\"" + fileName + "\", \"uploaded\":1,\"url\":\"" + fileUrl + "\"}");
			
			printWriter.flush();
			
		}catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(out != null) {
				try {
					out.close();
				}catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			if(printWriter != null) printWriter.close();
		}
	}
	
	//페이징, 검색기능
	@GetMapping("/pro_list")
	public void pro_list(@ModelAttribute("cri")Criteria cri, Integer cat_code, Model model) {
		
		log.info("파라미터: " + cri);
		
		// 검색 기능 사용 후, 검색 파라미터 초기화.
		if(cat_code != null) {
			cri = new Criteria();
		}
		
		model.addAttribute("categoryList", adProductService.getCategoryList());
		
		// Model객체 - 목록데이터
		List<ProductVO> pro_list = adProductService.getListWithPaging(cri, cat_code);
		
		// 파일 경로를 슬래시로 변경하여 모델에 추가
		pro_list.forEach(vo -> {
			vo.setPro_up_folder(vo.getPro_up_folder().replace("\\", "/"));
		});
		
		model.addAttribute("pro_list", pro_list); 
		
		// 전체 상품 수를 조회하여 페이징 정보를 생성하고 모델에 추가
		int totalCount = adProductService.getTotalCount(cri, cat_code);
		model.addAttribute("pageMaker", new PageDTO(totalCount, cri));
	}
	
	// 이미지 매핑주소 
	@ResponseBody
	@GetMapping("/displayImage")
	public ResponseEntity<byte[]> displayFile(String folderName, String fileName) throws IOException {
		
		// 업로드된 이미지 파일을 읽어와서 이미지 데이터를 배열로 변환하여 반환한다.
		return FileUtils.getFile(uploadPath + folderName,fileName);
	}
	
	@GetMapping("pro_modify")
	public void modify(Integer pro_num, int cat_code, @ModelAttribute("cri") Criteria cri, Model model) {
		
		//상품수정 폼
		ProductVO productVO = adProductService.modify(pro_num);
		productVO.setPro_up_folder(productVO.getPro_up_folder().replace("\\", "/"));
		
		//2차 카테고리 정보
		model.addAttribute("productVO", productVO);
		
		//1차 카테고리 정보
		CategoryVO categoryVO = adProductService.get(cat_code);
		model.addAttribute("CategoryVO", categoryVO);
		
		//1차 카테고리 목록 
		model.addAttribute("categoryList", adProductService.getCategoryList());
		
		//2차 카테고리 목록 - 1차 카테고리 참조
		model.addAttribute("subCategoryList", adProductService.subCategoryList(categoryVO.getCat_code()));
	}
	
	@PostMapping("/pro_modify")
	public String modify(ProductVO vo, RedirectAttributes rttr) {
		
		//상품이미지 업로드(변경)시, * keypoint : " ! "
		if(!vo.getUploadFile().isEmpty()) {
			
			// 기본 이미지 삭제
			FileUtils.deleteFile(uploadPath, vo.getPro_up_folder(), vo.getPro_img());
			
			// 변경 상품 이미지 업로드 작업
			String uploadDateFolder = FileUtils.getFolder();
			String saveImageName = FileUtils.uploadFile(uploadPath, uploadDateFolder, vo.getUploadFile());
			
			vo.setPro_img(saveImageName); // 업로드된 파일명
			vo.setPro_up_folder(uploadDateFolder); // 날짜 폴더명	
		}
		
		//공통 : 상품 수정 작업
		adProductService.update(vo);
		
		rttr.addFlashAttribute("msg", "modify");
		
		return "redirect:/admin/product/pro_list";
	}
	
	//상품삭제
	@PostMapping("/pro_delete")
	public String pro_delete(Integer pro_num, Criteria cri, RedirectAttributes rttr) {
		
		// 상품 삭제를 처리하는 메서드 호출
		adProductService.delete(pro_num);
		
		rttr.addFlashAttribute("msg", "delete");
		
		return "redirect:/admin/product/pro_list";
	}
	
	//선택상품 수정, JSP전달받을 Parameter데이터가 배열 성격이므로 배열설정
	@ResponseBody
	@PostMapping("/pro_checked_modify")
	public ResponseEntity<String> pro_checked_modify(
			@RequestParam("pro_num_arr[]")List<Integer> pro_num_arr,
			@RequestParam("pro_price_arr[]")List<Integer> pro_price_arr,
			@RequestParam("pro_discount_arr[]")List<Integer> pro_discount_arr,
			@RequestParam("pro_buy_arr[]")List<String> pro_buy_arr){
		
		ResponseEntity<String> entity = null;
		
		log.info("수정상품코드: " + pro_num_arr);
		log.info("수정상품가격: " + pro_price_arr);
		log.info("수정상품할인율" + pro_discount_arr);
		log.info("수정상품판매여부: " + pro_buy_arr);
		
		// 여러 상품들의 정보를 저장
		List<ProductVO> pro_list = new ArrayList<ProductVO>();
		
		// 반복문을 이용해, 각 상품에 대한 정보를 순차적으로 처리
		for(int i = 0; i< pro_num_arr.size(); i++) {
			
			ProductVO productVO = new ProductVO();
			productVO.setPro_num(pro_num_arr.get(i));
			productVO.setPro_price(pro_price_arr.get(i));
			productVO.setPro_discount(pro_discount_arr.get(i));
			productVO.setPro_buy(pro_buy_arr.get(i));
			
			pro_list.add(productVO);
		}
		
		// 수정 상품 정보를 DB에 업데이트
		adProductService.pro_checked_modify(pro_list);
		
		// 상품 수정 완료시, 메시지와 상태코드 200 반환
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
				
		return entity;
	}
	
	//선택상품 삭제, JSP전달받을 Parameter데이터가 배열 성격이므로 배열설정
	@ResponseBody
	@PostMapping("/pro_checked_delete")
	public ResponseEntity<String> pro_checked_delete(@RequestParam("pro_num_arr[]") List<Integer> pro_num_arr){
		
		ResponseEntity<String> entity = null;
		
		//리스트 파라미터를 전달하여, 선택된 상품들을 DB에서 삭제
		adProductService.pro_checked_delete(pro_num_arr);
		
		// 상품 삭제 완료시, 메시지와 상태코드 200 반환
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		log.info("삭제상품코드: " + pro_num_arr);
		
		return entity;
	}
	
	
}
