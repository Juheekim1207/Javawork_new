package day0406;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Ex14FileReaderException {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		FileReader fr = null;
		BufferedReader br = null; //줄단위로 읽는 메서드를 가지고 있음
		
		try {
			fr = new FileReader("/Users/gimjuhui/bitjava0314/javawork/memo1.txt");
			br = new BufferedReader(fr);
			while(true)
			{
				String s = br.readLine(); //한줄읽기
				if(s == null) //마지막 줄까지 읽으면 null값 반환
					break;
				System.out.println(s);
			}
		} catch (FileNotFoundException e) {
			System.out.println("파일이 없어요:" + e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(br != null) br.close();
				if(fr != null) fr.close();
			}catch(IOException e) {
				
			}
		}
	}
}
