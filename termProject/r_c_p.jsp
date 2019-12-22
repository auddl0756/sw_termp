<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">

<head>

<meta charset="utf-8" />

<title>exercise02</title>

<script type="text/javascript">
	function Player(p) {

		if (!p) {

			p = 0;

		}

		this.point = p;
	}

	//이부분은 오버라이딩부분

	Player.prototype.toString = function() {

		switch (this.point) {

		case 0:
			return "가위";
		case 1:
			return "바위";

		case 2:

			return "보";

		}

	};

	//이벤트핸들러여서 evt가 넘어오게 되어있다.

	function playRockScissorsPaper(evt) {

		//alert(evt);//마우스 이벤트내

		var source = getEventSource(evt);//source는 buttonElement다

		var player = new Player();

		var computer = new Player(Math.floor(Math.random() * 3));//0,1,2가 발생

		var resultElement = document.getElementById('result');//이해 완료

		switch (source.id) {//evt.target.id가 즉 buttonElement의 id가 아래와 같으면

		case 'btnScissors':

			player.point = 0;

			break;

		case 'btnRock':

			player.point = 1;

			break;

		case 'btnPaper':

			player.point = 2;

			break;

		default:

			return;

		}

		if (player.point == computer.point) {//같으면 비기고

			resultElement.innerHTML = '플레이어: ' + player + ' vs 컴퓨터: '
					+ computer + ' => 비겼습니다!!!';

		} else {//여긴 알고리즘부분

			if ((player.point + 1) % 3 == computer.point) {

				resultElement.innerHTML = '플레이어: ' + player + ' vs 컴퓨터: '
						+ computer + ' => 졌습니다!!!';

			} else {

				resultElement.innerHTML = '플레이어: ' + player + ' vs 컴퓨터: '
						+ computer + ' => 이겼습니다!!!';

			}

		}
		;

	}

	function clearResult() {

		var resultElement = document.getElementById("result");

		resultElement.innerHTML = "준비";

	}

	function init() {

		var btnRockElement = document.getElementById("btnRock");

		var btnScissorsElement = document.getElementById("btnScissors");

		var btnPaperElement = document.getElementById("btnPaper");

		var btnResetElement = document.getElementById("btnReset");

		addListener(btnRockElement, 'click', playRockScissorsPaper);

		addListener(btnScissorsElement, 'click', playRockScissorsPaper);

		addListener(btnPaperElement, 'click', playRockScissorsPaper);

		addListener(btnResetElement, 'click', clearResult);

	}

	//세번째는 call back

	function addListener(el, ev, handler) {

		//alert(el);

		//크롬 파이어폭스용

		if (el.addEventListener) {//el에 gameElement임

			el.addEventListener(ev, handler, false);

		} else {//익스플로러 8버전 이하용

			el.attachEvent('on' + ev, handler);

		}

	}
	0

	//여기 매개변수 부분 이해 잘 안됨

	function getEventSource(evt) {

		//alert(evt.target);//evt.target은 Button엘레먼트

		if (evt.target)

			return evt.target;

		else

			return window.event.srcElement;

	}
</script>

</head>

<body>

	<div id="game">

		<button id="btnScissors">가위</button>

		<button id="btnRock">바위</button>

		<button id="btnPaper">보</button>

		<button id="btnReset">리셋</button>

	</div>

	<div id="result"></div>

</body>

</html>





