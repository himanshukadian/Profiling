package test;
import java.util.Arrays;
import java.util.List;

import org.springframework.web.bind.annotation.ResponseBody;


public class Main{	
	public static void main(String[] args) {
		System.out.println(data());
	}
	
	
	@ResponseBody
	public static List<Integer> data(){
		Integer[] integers = new Integer[10];
		Arrays.fill(integers, 0);
		List<Integer> integerList = Arrays.asList(integers);
		integerList.set(3, 5);
		return integerList;
	}
}
