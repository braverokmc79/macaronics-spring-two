package com.macaronics.www.util.proguard;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.macaronics.www.util.fileupload.UploadPath;

import java.io.*;

@Controller
@RequestMapping("/proguardgui")
public class ProguardController {

	@ResponseBody
	@RequestMapping("exe.do")
	public static void main(String a[], HttpServletRequest request) {
		
		ProcessBuilder pb = new ProcessBuilder("java", "-jar", "proguardgui.jar");
		
		
		UploadPath.attach_path="resources/lib/proguard5.3.2/lib/";
		String path =UploadPath.path(request);
		
		pb.directory(new File(path));
		try {
			Process p = pb.start();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
	
	

	




