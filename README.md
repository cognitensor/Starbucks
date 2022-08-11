# LifeCycle & TableView & CollectionView Practice
> 2022.07.05 ~ 2022.07.18 (2주간) <br/>
> '스타벅스' App


<br/>

<img width="1517" alt="image" src="https://user-images.githubusercontent.com/74815957/183981378-43a16838-9a86-461c-b42c-6a176aadb540.png">


## 📌 Project Goal
- autolayout 구현<br/>
- 실제 앱과 최대한 유사하게 구현 <br/>
- 데이터 전달을 통한 주문 로직 구현 <br/>
- App Switcher 상태에서 화면 blur 처리 <br/>
- TableView Cell 안에 CollectionView 구현 <br/>
- CRUD 로직 구현 : 장바구니 조회, 추가, 수정, 삭제 기능 구현<br/>
- 바텀시트 구현 (PanModal라이브러리 사용) 


<br/><br/>
## 📌 사용된 UI 컴포넌트들
- Label
- Button, Filled Button
- View, ScrollView, StackView, ImageView
- Tabbar, Navigation
- TableView, CollectionView


<br/><br/>
## 📌 알게된 점
- 상단에 고정시키는 StickyHeader 구현 <br/>
  → 뷰높이의 constant를 이용하여 스크롤할 때의 위치를 받아 헤더의 위치를 이동시킴 
- Navigation 의 Large Title <br/>
  → Inspector 에서 Prefers Large Titles 선택 → 스크롤하면 다시 작아지게 설정
- 테이블뷰안에 컬렉션뷰를 넣었을 때 컬렉션뷰 너비 건들이지 않고 간격 주기 <br/>
  → 컬렉션뷰.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20) → 컬렉션뷰 안에 있는 아이템의 위치를 조절해줌
- 테이블뷰안에 컬렉션뷰를 넣었을 때 컬렉션뷰 너비 건들이지 않고 간격 주기 <br/>
  → 원본이미지의 가로세로 비율을 구하여 테이블뷰의 너비에 나누어주어 높이를 할당



<br/><br/>
## 📌 아쉬운 점
- 상단탭바 구현<br/>
- 장바구니로 바로 가기


<br/><br/>
## 📌 미리보기


https://user-images.githubusercontent.com/74815957/183986310-fe978fc8-fdb6-4848-aae4-1de85f7daf73.mov



https://user-images.githubusercontent.com/74815957/183987142-7ff935dc-a7ba-4697-ab86-ef7065bd728d.mov



https://user-images.githubusercontent.com/74815957/183986133-a5ef9b39-e6b5-498d-9279-46a2b340deaa.mov


https://user-images.githubusercontent.com/74815957/183986096-5a482afc-88bd-4c03-871a-a7ebc656c5fc.mov







 <br/>
  <br/>
