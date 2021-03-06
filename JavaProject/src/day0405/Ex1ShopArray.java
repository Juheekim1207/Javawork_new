package day0405;

public class Ex1ShopArray {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//shop을 배열에 담고자 할 경우 
		Shop[] shop = new Shop[3]; //메모리 할당 
		shop[0] = new Shop();
		shop[1] = new Shop("딸기");
		shop[2] = new Shop("복숭아", 5, 2000);

		//두번째 방법
		Shop[] shop2 = {
				new Shop(), new Shop("딸기우유"),new Shop("쵸코렛"),
				new Shop("브라보콘", 3, 1200)
		};
		
		//출력방법1
		System.out.println("shop은 총 " + shop.length + "개");
		for(int i=0; i<shop.length;i++)
		{
			System.out.println(shop[i].getSangpum() + "\t"+
					shop[i].getSu() + "\t" + shop[i].getDan() 
					+ "\t" + shop[i].getResult());
		}
		
		System.out.println();
		
		//출력방법2
		System.out.println("shop2는 총 " + shop2.length + "개");
		for(Shop s:shop2)
		{
			System.out.println(s.getSangpum() + "\t"+
					s.getSu() + "\t" + s.getDan() 
					+ "\t" + s.getResult());
		}
		
		System.out.println("shop2의 2번 배열 값을 수정");
		shop2[2].setData("알사탕", 5, 900); //setter는 중간에 값을 변경할 때 사용하는 메서드
		for(Shop s:shop2)
		{
			System.out.println(s.getSangpum() + "\t"+
					s.getSu() + "\t" + s.getDan() 
					+ "\t" + s.getResult());
		}
	}

}
