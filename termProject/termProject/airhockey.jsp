<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype <!DOCTYPE html>
<html>

<head>
    <title>  game2 0.98 -에어하키게임 (2015124147 이명륜)</title>
</head>

<body>
    <canvas id='canvas' width=700px; height=500px;>
        이 브라우저에서는 HTML5의 canvas 요소가 지원되지 않습니다.
    </canvas>

    <script>
    	var win=0,draw=0,lose=0; 
        var pen, pen2;
        var boxx =50, boxy = 20, bw = 600, bh = 300;          //bw=boxWidth,bh=boxHeight
        var margin = 20;
        var pw = 30, ph = 40;                             //pw=playerWidth,ph=playerHeight
        var px1, py1, px2, py2;

        px1 = boxx + margin, py1 = bh / 2;
        px2 = bw - margin, py2 = bh / 2;
        var ballx, bally, ballrad, ballvx, ballvy;
        ballx = (boxx + bw) / 2, bally = (boxy + bh) / 2, ballrad = 10, ballvx = 3, ballvy = 1;
        var ox1, oy1, ox2, oy2, ow, oh, ovx, ovy1, ovy2;              //o=obstacle,ow=obstaclewidth,oh=obstacleheight
        ox1 = (boxx + bw) / 4, oy1 = (boxy + bh) * 2 / 5;         //ovx=obstacleVelocityX,ovy=obstacleVelocityY
        ox2 = (boxx + bw) * 3 / 4, oy2 = (boxy + bh) * 2 / 5;
        ow = pw / 2, oh = (boxy + bh) / 6;
        ovx = 0, ovy1 = 4, ovy2 = -4;
        var ps1 = 0, ps2 = 0;                //ps1=player1's score... ps2=player2's score
        var ps1_before = 0, ps2_before = 0;
        var p1 = 0, p2 = 0;
        var trigger;
        //var ch1;
        var movextime1, moveytime1, movextime2, moveytime2;
        var keyonx1 = 0, keyony1 = 0, keyonx2 = 0, keyony2 = 0, savekeyx1, savekeyy1, savekeyx2, savekeyy2;

        pen = document.getElementById('canvas').getContext('2d');
        pen2 = document.getElementById('canvas').getContext('2d');
        function moveball() {
            pen.clearRect(ballx - ballrad-0.5, bally - ballrad-0.5, ballrad * 2+1, ballrad * 2+1);

            // drawObstacle();
            moveandcheck();
            drawBoard();
            pen.beginPath();
            pen.fillStyle = "black";
            pen.arc(ballx, bally, ballrad, 0, Math.PI * 2, true);
            pen.fill();
          
        }
        function moveandcheck() {
            var nballx = ballx + ballvx;
            var nbally = bally + ballvy;


            //박스랑 공이랑 부딪힐 때...
            if (nballx - ballrad < boxx) {      //박스 왼쪽 벽
                if (nbally > boxy + bh / 2 - pw * 5 / 2 && nbally < boxy + bh / 2 + pw * 5 / 2) {

                }
                else {
                    ballvx *= -1;
                    nballx = boxx + ballrad;
                }
            }
            else if (nballx + ballrad > boxx + bw) { //박스 오른쪽 벽
                if (nbally > boxy + bh / 2 - pw * 5 / 2 && nbally < boxy + bh / 2 + pw * 5 / 2) {

                }
                else {
                    ballvx *= -1;
                    nballx = bw + boxx - ballrad;
                }
            }
            else if (nbally - ballrad < boxy) {      //박스 윗쪽 벽
                ballvy *= -1;
                nbally = boxy + ballrad;
            }
            else if (nbally + ballrad > boxy + bh) { //박스 아랫쪽 벽
                ballvy *= -1;
                nbally = boxy + bh - ballrad;
            }
            else {

            }

            if (px1 > (boxx + (boxx + bw) / 2) / 2) {       //p1이 앞에서 공 때릴때..
                //공이랑 player1이랑 부딪힐 때...
                //p1 오른쪽 벽에 공이 부딪힐 때
                if (nbally + ballrad > py1 && nbally - ballrad < py1 + ph && nballx > px1) {
                    if (nballx - ballrad <= px1 + pw) {
                        if (Math.abs(ballvx) <= 8)
                            ballvx *= -1.5;
                        else
                            ballvx *= -1;

                        nballx = px1 + pw + ballrad;

                    }
                }
                //p1 왼쪽 벽에 공이 부딪힐 때
                else if (nbally + ballrad > py1 && nbally - ballrad < py1 + ph && nballx < px1) {
                    if (nballx + ballrad >= px1) {
                        if (Math.abs(ballvx) <= 8)
                            ballvx *= -1.5;
                        else
                            ballvx *= -1;
                        nballx = px1 - ballrad;

                    }
                }
                //p1 아랫쪽 벽에 공이 부딪힐 때
                else if (nballx > px1 && nballx < px1 + pw && nbally > py1) {
                    if (nbally - ballrad <= py1 + ph) {
                        if (Math.abs(ballvy) <= 8)
                            ballvy *= -1.5;
                        else
                            ballvy *= -1;
                        nbally = py1 + ballrad;
                    }

                }
                //p1 윗쪽 벽에 공이 부딪힐 때
                else if (nballx > px1 && nballx < px1 + pw && nbally < py1) {
                    if (nbally + ballrad >= py1) {
                        if (Math.abs(ballvy) <= 8)
                            ballvy *= -1.5;
                        else
                            ballvy *= -1;
                        nbally = py1 - ballrad;
                    }
                }
                else {
                    //p1 왼쪽 대각선 위
                    if (nballx + ballrad < px1 && nbally + ballrad < py1) {
                        if (Math.pow((px1 - nballx), 2) + Math.pow((nbally - py1), 2) <= Math.pow(ballrad, 2)) {
                         
                            if (Math.abs(ballvx) <= 8)
                                ballvx *= -1.5;
                            else
                                ballvx *= -1;
                            if (Math.abs(ballvy) <= 8)
                                ballvy *= -1.5;
                            else
                                ballvy *= -1;
                        
                            nballx = px1 - ballrad;
                            nbally = py1 - ballrad;
                        }
                    }
                    //p1 왼쪽 대각선 아래
                    else if (nballx + ballrad < px1 && nbally - ballrad > py1 + ph) {
                        if (Math.pow((px1 - nballx), 2) + Math.pow((nbally - py1 - ph), 2) <= Math.pow(ballrad, 2)) {
                            //ballvx *= -1 * (px1 - nballx) / ballrad;
                            //ballvy *= -1 * (nbally - py1 - ph) / ballrad;
                            if (Math.abs(ballvx) <= 8)
                                ballvx *= -1.5;
                            else
                                ballvx *= -1;
                            if (Math.abs(ballvy) <= 8)
                                ballvy *= -1.5;
                            else
                                ballvy *= -1;
                            nballx = nballx - (px1 - nballx);
                            nbally = nbally + (nbally - py1 - ph);
                        }
                    }
                    //p1 오른쪽 대각선 위
                    else if (nballx - ballrad > px1 + pw && nbally + ballrad < py1) {
                        if (Math.pow((nballx - px1 - pw), 2) + Math.pow((py1 - nbally), 2) < Math.pow(ballrad, 2)) {
                            //ballvx*=-1*(px1-nballx)/ballrad;
                            // ballvy*=-1*(py1-nbally)/ballrad;
                            if (Math.abs(ballvx) <= 8)
                                ballvx *= -1.5;
                            else
                                ballvx *= -1;
                            if (Math.abs(ballvy) <= 8)
                                ballvy *= -1.5;
                            else
                                ballvy *= -1;
                            nballx = nballx + (nballx - px1 - pw);
                            nbally = nbally - (py1 - nbally);
                        }

                    }
                    //p1 오른쪽 대각선 아래
                    else if (nballx - ballrad > px1 + pw && nbally - ballrad > py1 + ph) {
                        if (Math.pow((nballx - px1 - pw), 2) + Math.pow((nbally - py1 - ph), 2) < Math.pow(ballrad, 2)) {
                            // ballvx*=-1*(px1-nballx)/ballrad;
                            //ballvy*=-1*(py1-nbally)/ballrad;
                            if (Math.abs(ballvx) <= 8)
                                ballvx *= -1.5;
                            else
                                ballvx *= -1;
                            if (Math.abs(ballvy) <= 8)
                                ballvy *= -1.5;
                            else
                                ballvy *= -1;
                            nballx = nballx + (nballx - px1 - pw);
                            nbally = nbally + (nbally - py1 - ph);
                        }

                    }
                    else {

                    }
                }
            }
            else {      ///p1이 좀 뒤에서 공 때릴 때..
                //공이랑 player1이랑 부딪힐 때...
                //p1 오른쪽 벽에 공이 부딪힐 때
                if (nbally + ballrad > py1 && nbally - ballrad < py1 + ph && nballx > px1) {
                    if (nballx - ballrad <= px1 + pw) {
                        ballvx *= -1;

                        nballx = px1 + pw + ballrad;
                    }
                }
                //p1 왼쪽 벽에 공이 부딪힐 때
                else if (nbally + ballrad > py1 && nbally - ballrad < py1 + ph && nballx < px1) {
                    if (nballx + ballrad >= px1) {
                        ballvx *= -1;
                        nballx = px1 - ballrad;
                    }
                }
                //p1 아랫쪽 벽에 공이 부딪힐 때
                else if (nballx > px1 && nballx < px1 + pw && nbally > py1) {
                    if (nbally - ballrad <= py1 + ph) {
                        ballvy *= -1;
                        nbally = py1 + ballrad;
                    }

                }
                //p1 윗쪽 벽에 공이 부딪힐 때
                else if (nballx > px1 && nballx < px1 + pw && nbally < py1) {
                    if (nbally + ballrad >= py1) {
                        ballvy *= -1;
                        nbally = py1 - ballrad;
                    }
                }
                else {
                    //p1 왼쪽 대각선 위
                    if (nballx + ballrad < px1 && nbally + ballrad < py1) {
                        if (Math.pow((px1 - nballx), 2) + Math.pow((nbally - py1), 2) <= Math.pow(ballrad, 2)) {
                         
                            ballvx *= -1;
                            ballvy *= -1;
                           
                            nballx = px1 - ballrad;
                            nbally = py1 - ballrad;
                        }
                    }
                    //p1 왼쪽 대각선 아래
                    else if (nballx + ballrad < px1 && nbally - ballrad > py1 + ph) {
                        if (Math.pow((px1 - nballx), 2) + Math.pow((nbally - py1 - ph), 2) <= Math.pow(ballrad, 2)) {
                            //ballvx *= -1 * (px1 - nballx) / ballrad;
                            //ballvy *= -1 * (nbally - py1 - ph) / ballrad;
                            ballvx *= -1;
                            ballvy *= -1;
                            nballx = nballx - (px1 - nballx);
                            nbally = nbally + (nbally - py1 - ph);
                        }
                    }
                    //p1 오른쪽 대각선 위
                    else if (nballx - ballrad > px1 + pw && nbally + ballrad < py1) {
                        if (Math.pow((nballx - px1 - pw), 2) + Math.pow((py1 - nbally), 2) < Math.pow(ballrad, 2)) {
                            //ballvx*=-1*(px1-nballx)/ballrad;
                            // ballvy*=-1*(py1-nbally)/ballrad;
                            ballvx *= -1;
                            ballvy *= -1;
                            nballx = nballx + (nballx - px1 - pw);
                            nbally = nbally - (py1 - nbally);
                        }

                    }
                    //p1 오른쪽 대각선 아래
                    else if (nballx - ballrad > px1 + pw && nbally - ballrad > py1 + ph) {
                        if (Math.pow((nballx - px1 - pw), 2) + Math.pow((nbally - py1 - ph), 2) < Math.pow(ballrad, 2)) {
                            // ballvx*=-1*(px1-nballx)/ballrad;
                            //ballvy*=-1*(py1-nbally)/ballrad;
                            ballvx *= -1;
                            ballvy *= -1;
                            nballx = nballx + (nballx - px1 - pw);
                            nbally = nbally + (nbally - py1 - ph);
                        }

                    }
                    else {

                    }
                }
            }

            ///error:다가오는 공에 플레이어도 다가가서 부딪힐 때...
            ///nballx+ballrad로 갈것인가 nballx로 갈것인가..

            //공이랑 playet2랑 부딪힐 때...
            //p2 오른쪽 벽에 공이 부딪힐 때
            ///p2가 좀 앞에서 때릴때..
            if (px2 < ((boxx + bw) / 2 + (boxx + bw)) / 2) {
                if (nbally + ballrad > py2 && nbally - ballrad < py2 + ph && nballx > px2) {
                    if (nballx - ballrad <= px2 + pw) {
                        if (Math.abs(ballvx) <= 8)
                            ballvx *= -1.5;
                        else
                            ballvx *= -1;

                        nballx = px2 + pw + ballrad;
                    }
                }
                //p2 왼쪽 벽에 공이 부딪힐 때
                else if (nbally + ballrad > py2 && nbally - ballrad < py2 + ph && nballx < px2) {
                    if (nballx + ballrad >= px2) {

                        if (Math.abs(ballvx) <= 8)
                            ballvx *= -1.5;
                        else
                            ballvx *= -1;
                        nballx = px2 - ballrad;
                    }
                }
                //p2 아랫쪽 벽에 공이 부딪힐 때 ...아래,위는 폭이 작아서 ballrad 굳이 안 더했음..
                else if (nballx > px2 && nballx < px2 + pw && nbally > py2) {
                    if (nbally - ballrad <= py2 + ph) {

                        if (Math.abs(ballvy) <= 8)
                            ballvy *= -1.5;
                        else
                            ballvy *= -1;
                        nbally = py2 + ballrad;
                    }
                }
                //p2 윗쪽 벽에 공이 부딪힐 때
                else if (nballx > px2 && nballx < px2 + pw && nbally < py2) {
                    if (nbally + ballrad >= py2) {
                        if (Math.abs(ballvy) <= 8)
                            ballvy *= -1.5;
                        else
                            ballvy *= -1;
                        nbally = py2 - ballrad;
                    }
                }
                else {
                    //p2 왼쪽 대각선 위
                    if (nballx + ballrad < px2 && nbally + ballrad < py2) {
                        if (Math.pow((px2 - nballx), 2) + Math.pow((nbally - py2), 2) <= Math.pow(ballrad, 2)) {

                            if (Math.abs(ballvx) <= 8)
                                ballvx *= -1.5;
                            else
                                ballvx *= -1;
                            if (Math.abs(ballvy) <= 8)
                                ballvy *= -1.5;
                            else
                                ballvy *= -1;
                            // nballx = nballx - (px1 - nballx);
                            //nbally = nbally - (py1 - nbally);
                            nballx = px2 - ballrad;
                            nbally = py2 - ballrad;
                        }
                    }
                    //p2 왼쪽 대각선 아래
                    else if (nballx + ballrad < px2 && nbally - ballrad > py2 + ph) {
                        if (Math.pow((px2 - nballx), 2) + Math.pow((nbally - py2 - ph), 2) <= Math.pow(ballrad, 2)) {
                            //ballvx *= -1 * (px2 - nballx) / ballrad;
                            //ballvy *= -1 * (nbally - py2 - ph) / ballrad;
                            if (Math.abs(ballvx) <= 8)
                                ballvx *= -1.5;
                            else
                                ballvx *= -1;
                            if (Math.abs(ballvy) <= 8)
                                ballvy *= -1.5;
                            else
                                ballvy *= -1;
                            nballx = nballx - (px2 - nballx);
                            nbally = nbally + (nbally - py2 - ph);
                        }

                    }
                    //p2 오른쪽 대각선 위
                    else if (nballx - ballrad > px2 + pw && nbally + ballrad < py2) {
                        if (Math.pow((nballx - px2 - pw), 2) + Math.pow((py2 - nbally), 2) < Math.pow(ballrad, 2)) {
                            //ballvx*=-1*(px1-nballx)/ballrad;
                            // ballvy*=-1*(py1-nbally)/ballrad;
                            if (Math.abs(ballvx) <= 8)
                                ballvx *= -1.5;
                            else
                                ballvx *= -1;
                            if (Math.abs(ballvy) <= 8)
                                ballvy *= -1.5;
                            else
                                ballvy *= -1;
                            nballx = nballx + (nballx - px2 - pw);
                            nbally = nbally - (py2 - nbally);
                        }

                    }
                    //p2 오른쪽 대각선 아래
                    else if (nballx - ballrad > px2 + pw && nbally - ballrad > py2 + ph) {
                        if (Math.pow((nballx - px2 - pw), 2) + Math.pow((nbally - py2 - ph), 2) < Math.pow(ballrad, 2)) {
                            // ballvx*=-1*(px1-nballx)/ballrad;
                            //ballvy*=-1*(py1-nbally)/ballrad;
                            if (Math.abs(ballvx) <= 8)
                                ballvx *= -1.5;
                            else
                                ballvx *= -1;
                            if (Math.abs(ballvy) <= 8)
                                ballvy *= -1.5;
                            else
                                ballvy *= -1;
                            nballx = nballx + (nballx - px2 - pw);
                            nbally = nbally + (nbally - py2 - ph);
                        }

                    }
                    else {

                    }
                }
            }
            else {///p2가 좀 뒤에서 때릴 때...
                if (nbally + ballrad > py2 && nbally - ballrad < py2 + ph && nballx > px2) {
                    if (nballx - ballrad <= px2 + pw) {

                        ballvx *= -1;
                        nballx = px2 + pw + ballrad;
                    }
                }
                //p2 왼쪽 벽에 공이 부딪힐 때
                else if (nbally + ballrad > py2 && nbally - ballrad < py2 + ph && nballx < px2) {
                    if (nballx + ballrad >= px2) {

                        ballvx *= -1;
                        nballx = px2 - ballrad;
                    }
                }
                //p2 아랫쪽 벽에 공이 부딪힐 때 ...아래,위는 폭이 작아서 ballrad 굳이 안 더했음..
                else if (nballx > px2 && nballx < px2 + pw && nbally > py2) {
                    if (nbally - ballrad <= py2 + ph) {

                        ballvy *= -1;
                        nbally = py2 + ballrad;
                    }
                }
                //p2 윗쪽 벽에 공이 부딪힐 때
                else if (nballx > px2 && nballx < px2 + pw && nbally < py2) {
                    if (nbally + ballrad >= py2) {

                        ballvy *= -1;
                        nbally = py2 - ballrad;
                    }
                }
                else {
                    //p2 왼쪽 대각선 위
                    if (nballx + ballrad < px2 && nbally + ballrad < py2) {
                        if (Math.pow((px2 - nballx), 2) + Math.pow((nbally - py2), 2) <= Math.pow(ballrad, 2)) {
                            //if((px1-nballx)*(px1-nballx) +(py1-nbally)*(py1-nbally)<=ballrad*ballrad){
                            //ballvx *= -1 * (px1 - nballx) / ballrad;
                            //ballvy *= -1 * (py1 - nbally) / ballrad;
                            ballvx *= -1;
                            ballvy *= -1;
                            // nballx = nballx - (px1 - nballx);
                            //nbally = nbally - (py1 - nbally);
                            nballx = px2 - ballrad;
                            nbally = py2 - ballrad;
                        }
                    }
                    //p2 왼쪽 대각선 아래
                    else if (nballx + ballrad < px2 && nbally - ballrad > py2 + ph) {
                        if (Math.pow((px2 - nballx), 2) + Math.pow((nbally - py2 - ph), 2) <= Math.pow(ballrad, 2)) {
                            //ballvx *= -1 * (px2 - nballx) / ballrad;
                            //ballvy *= -1 * (nbally - py2 - ph) / ballrad;
                            ballvx *= -1;
                            ballvy *= -1;
                            nballx = nballx - (px2 - nballx);
                            nbally = nbally + (nbally - py2 - ph);
                        }

                    }
                    //p2 오른쪽 대각선 위
                    else if (nballx - ballrad > px2 + pw && nbally + ballrad < py2) {
                        if (Math.pow((nballx - px2 - pw), 2) + Math.pow((py2 - nbally), 2) < Math.pow(ballrad, 2)) {
                            //ballvx*=-1*(px1-nballx)/ballrad;
                            // ballvy*=-1*(py1-nbally)/ballrad;
                            ballvx *= -1;
                            ballvy *= -1;
                            nballx = nballx + (nballx - px2 - pw);
                            nbally = nbally - (py2 - nbally);
                        }

                    }
                    //p2 오른쪽 대각선 아래
                    else if (nballx - ballrad > px2 + pw && nbally - ballrad > py2 + ph) {
                        if (Math.pow((nballx - px2 - pw), 2) + Math.pow((nbally - py2 - ph), 2) < Math.pow(ballrad, 2)) {
                            // ballvx*=-1*(px1-nballx)/ballrad;
                            //ballvy*=-1*(py1-nbally)/ballrad;
                            ballvx *= -1;
                            ballvy *= -1;
                            nballx = nballx + (nballx - px2 - pw);
                            nbally = nbally + (nbally - py2 - ph);
                        }

                    }
                    else {

                    }
                }
            }
        

        //draw obstacle1,obstacle2 
        var nox1, noy1, nox2, noy2;
        nox1 = ox1 + ovx;
        noy1 = oy1 + ovy1;
        nox2 = ox2 + ovx;
        noy2 = oy2 + ovy2;

        pen.clearRect(nox1 - ovx - 1, noy1 - ovy1 - 1, ow + 2, oh + 2);
        pen.clearRect(nox2 - ovx - 1, noy2 - ovy2 - 1, ow + 2, oh + 2);

        if (noy1 < boxy) {
            ovy1 *= -1;
            noy1 = boxy + 1;
        }
        if (noy1 + oh > boxy + bh) {
            ovy1 *= -1;
            noy1 = boxy + bh - oh;
        }
        if (noy2 < boxy) {
            ovy2 *= -1;
            noy2 = boxy + 1;
        }
        if (noy2 + oh > boxy + bh) {
            ovy2 *= -1;
            noy2 = boxy + bh - oh;
        }

        ox1 = nox1, oy1 = noy1;
        ox2 = nox2, oy2 = noy2;

        pen.beginPath();
        pen.strokeRect(nox1, noy1, ow, oh);
        pen.strokeRect(nox2, noy2, ow, oh);

        //공이랑 obstacle1이랑 부딪힐 때...
        //o1 오른쪽 벽에 부딪힐 때
        if (nbally + ballrad > noy1 && nbally - ballrad < noy1 + oh && nballx > nox1) {
            if (nballx - ballrad <= nox1 + ow) {
                ballvx *= -1;
                nballx = nox1 + ow + ballrad;
            }
        }
        //o1 왼쪽 벽에 공이 부딪힐 때
        else if (nbally + ballrad > oy1 && nbally - ballrad < oy1 + oh && nballx < ox1) {
            if (nballx + ballrad >= ox1) {
                ballvx *= -1;
                nballx = ox1 - ballrad;
            }
        }
        //o1 아랫쪽 벽에 공이 부딪힐 때
        else if (nballx > ox1 && nballx < ox1 + ow && nbally > oy1) {
            if (nbally - ballrad <= oy1 + oh) {
                ballvy *= -1;
                nbally = oy1 + ballrad;
            }
        }
        //o1 윗쪽 벽에 공이 부딪힐 때
        else if (nballx > ox1 && nballx < ox1 + ow && nbally < oy1) {
            if (nbally + ballrad >= oy1) {
                ballvy *= -1;
                nbally = oy1 - ballrad;
            }
        }
        else {
            //o1 왼쪽 대각선 위
            if (nballx + ballrad < ox1 && nbally + ballrad < oy1) {
                if (Math.pow((ox1 - nballx), 2) + Math.pow((nbally - oy1), 2) <= Math.pow(ballrad, 2)) {
                    //if((px1-nballx)*(px1-nballx) +(py1-nbally)*(py1-nbally)<=ballrad*ballrad){
                    //ballvx *= -1 * (px1 - nballx) / ballrad;
                    //ballvy *= -1 * (py1 - nbally) / ballrad;
                    ballvx *= -1;
                    ballvy *= -1;
                   
                    nballx = ox1 - ballrad;
                    nbally = oy1 - ballrad;
                }
            }
            //o1 왼쪽 대각선 아래
            else if (nballx + ballrad < ox1 && nbally - ballrad > oy1 + oh) {
                if (Math.pow((ox1 - nballx), 2) + Math.pow((nbally - oy1 - oh), 2) <= Math.pow(ballrad, 2)) {
                    //ballvx *= -1 * (ox2 - nballx) / ballrad;
                    //ballvy *= -1 * (nbally - oy2 - oh) / ballrad;
                    ballvx *= -1;
                    ballvy *= -1;
                    nballx = nballx - (ox1 - nballx);
                    nbally = nbally + (nbally - oy1 - oh);
                }

            }
            //o1 오른쪽 대각선 위
            else if (nballx - ballrad > ox1 + ow && nbally + ballrad < oy1) {
                if (Math.pow((nballx - ox1 - ow), 2) + Math.pow((oy1 - nbally), 2) < Math.pow(ballrad, 2)) {
                    //ballvx*=-1*(px1-nballx)/ballrad;
                    // ballvy*=-1*(py1-nbally)/ballrad;
                    ballvx *= -1;
                    ballvy *= -1;
                    nballx = nballx + (nballx - ox1 - ow);
                    nbally = nbally - (oy1 - nbally);
                }

            }
            //o1 오른쪽 대각선 아래
            else if (nballx - ballrad > ox1 + ow && nbally - ballrad > oy1 + oh) {
                if (Math.pow((nballx - ox1 - ow), 2) + Math.pow((nbally - oy1 - oh), 2) < Math.pow(ballrad, 2)) {
                    // ballvx*=-1*(px1-nballx)/ballrad;
                    //ballvy*=-1*(py1-nbally)/ballrad;
                    ballvx *= -1;
                    ballvy *= -1;
                    nballx = nballx + (nballx - ox1 - ow);
                    nbally = nbally + (nbally - oy1 - oh);
                }

            }
            else {

            }
        }


        //공이랑 obstacle2이랑 부딪힐 때...
        //o2 오른쪽 벽에 부딪힐 때
        if (nbally + ballrad > noy2 && nbally - ballrad < noy2 + oh && nballx > nox2) {
            if (nballx - ballrad <= nox2 + ow) {
                ballvx *= -1;
                nballx = nox2 + ow + ballrad;
            }
        }
        //o2 왼쪽 벽에 공이 부딪힐 때
        else if (nbally + ballrad > oy2 && nbally - ballrad < oy2 + oh && nballx < ox2) {
            if (nballx + ballrad >= ox2) {
                ballvx *= -1;
                nballx = ox2 - ballrad;
            }
        }
        //o2 아랫쪽 벽에 공이 부딪힐 때
        else if (nballx > ox2 && nballx < ox2 + ow && nbally > oy2) {
            if (nbally - ballrad <= oy2 + oh) {
                ballvy *= -1;
                nbally = oy2 + ballrad;
            }
        }
        //o2 윗쪽 벽에 공이 부딪힐 때
        else if (nballx > ox2 && nballx < ox2 + ow && nbally < oy2) {
            if (nbally + ballrad >= oy2) {
                ballvy *= -1;
                nbally = oy2 - ballrad;
            }
        }
        else {
            //o2 왼쪽 대각선 위
            if (nballx + ballrad < ox2 && nbally + ballrad < oy2) {
                if (Math.pow((ox2 - nballx), 2) + Math.pow((nbally - oy2), 2) <= Math.pow(ballrad, 2)) {
                    //if((px1-nballx)*(px1-nballx) +(py1-nbally)*(py1-nbally)<=ballrad*ballrad){
                    //ballvx *= -1 * (px1 - nballx) / ballrad;
                    //ballvy *= -1 * (py1 - nbally) / ballrad;
                    ballvx *= -1;
                    ballvy *= -1;
                  
                    nballx = ox2 - ballrad;
                    nbally = oy2 - ballrad;
                }
            }
            //o2 왼쪽 대각선 아래
            else if (nballx + ballrad < ox2 && nbally - ballrad > oy2 + oh) {
                if (Math.pow((ox2 - nballx), 2) + Math.pow((nbally - oy2 - oh), 2) <= Math.pow(ballrad, 2)) {
                    //ballvx *= -1 * (ox2 - nballx) / ballrad;
                    //ballvy *= -1 * (nbally - oy2 - oh) / ballrad;
                    ballvx *= -1;
                    ballvy *= -1;
                    nballx = nballx - (ox2 - nballx);
                    nbally = nbally + (nbally - oy2 - oh);
                }

            }
            //o2 오른쪽 대각선 위
            else if (nballx - ballrad > ox2 + ow && nbally + ballrad < oy2) {
                if (Math.pow((nballx - ox2 - ow), 2) + Math.pow((oy2 - nbally), 2) < Math.pow(ballrad, 2)) {
                    //ballvx*=-1*(px1-nballx)/ballrad;
                    // ballvy*=-1*(py1-nbally)/ballrad;
                    ballvx *= -1;
                    ballvy *= -1;
                    nballx = nballx + (nballx - ox2 - ow);
                    nbally = nbally - (oy2 - nbally);
                }

            }
            //o2 오른쪽 대각선 아래
            else if (nballx - ballrad > ox2 + ow && nbally - ballrad > oy2 + oh) {
                if (Math.pow((nballx - ox2 - ow), 2) + Math.pow((nbally - oy2 - oh), 2) < Math.pow(ballrad, 2)) {
                    // ballvx*=-1*(px1-nballx)/ballrad;
                    //ballvy*=-1*(py1-nbally)/ballrad;
                    ballvx *= -1;
                    ballvy *= -1;
                    nballx = nballx + (nballx - ox2 - ow);
                    nbally = nbally + (nbally - oy2 - oh);
                }

            }
            else {

            }
        }
        //player1이랑 obstacle1이랑 부딪힐 때
        //obstacle1 왼쪽 벽에 player1이 부딪힐 때..
        if (py1 > oy1 - ph && py1 < oy1 + oh && px1 < ox1) {
            if (px1 + pw > ox1) {
                pen.clearRect(px1 - 1, py1 - 1, pw + 2, ph + 2);
                px1 = ox1 - pw;
                pen.beginPath();
                pen.strokeRect(px1, py1, pw, ph);
            }
        }
        //obstacle1 오른쪽 벽에 player1이 부딪힐 때..
        else if (py1 > oy1 - ph && py1 < oy1 + oh && px1 > ox1) {
            if (px1 < ox1 + ow) {
                pen.clearRect(px1 - 1, py1 - 1, pw + 2, ph + 2);
                px1 = ox1 + ow;
                pen.beginPath();
                pen.strokeRect(px1, py1, pw, ph);
            }

        }
        else {

        }


        //player2이랑 obstacle2이랑 부딪힐 때
        //obstacle2 왼쪽 벽에 player2이 부딪힐 때..
        if (py2 > oy2 - ph && py2 < oy2 + oh && px2 < ox2) {
            if (px2 + pw > ox2) {
                pen.clearRect(px2 - 1, py2 - 1, pw + 2, ph + 2);
                px2 = ox2 - pw;
                pen.beginPath();
                pen.strokeRect(px2, py2, pw, ph);
            }
        }
        //obstacle2 오른쪽 벽에 player2이 부딪힐 때..
        else if (py2 > oy2 - ph && py2 < oy2 + oh && px2 > ox2) {
            if (px2 < ox2 + ow) {
                pen.clearRect(px2 - 1, py2 - 1, pw + 2, ph + 2);
                px2 = ox2 + ow;
                pen.beginPath();
                pen.strokeRect(px2, py2, pw, ph);
            }

        }
        else {

        }

        ///승리 조건..
      
        //골인 판정 속도에 따라 다르게..

        if (Math.abs(ballvx) > 10) {
            if (nballx + ballrad <= boxx  && nballx + ballrad > boxx - 15 && nbally >= boxy + bh / 2 - pw * 5 / 2 && nbally < boxy + bh / 2 + pw * 5 / 2) {
                p2++;
            }
        }
        else {
            if (nballx + ballrad <= boxx + 1 && nballx + ballrad > boxx - 1 && nbally >= boxy + bh / 2 - pw * 5 / 2 && nbally < boxy + bh / 2 + pw * 5 / 2) {
                p2++;
            }
        }
        if (Math.abs(ballvx) > 10) {
            if (nballx - ballrad >= boxx + bw && nballx - ballrad <= boxx + bw + 15 && nbally > boxy + bh / 2 - pw * 5 / 2 && nbally < boxy + bh / 2 + pw * 5 / 2) {
                p1++;
            }
        }
        else {
            if (nballx - ballrad >= boxx - 1 + bw && nballx - ballrad <= boxx + bw + 1 && nbally > boxy + bh / 2 - pw * 5 / 2 && nbally < boxy + bh / 2 + pw * 5 / 2) {
                p1++;
            }
        }
        if (p1 == 2|| p2 == 2) {
            if (p1 == 2) {
                alert('player1 win');
                win=1;
                lose=0;
              	p1=5;
                //location.reload();
            }
            else {
                alert('player2 win');
                lose=1;
                win=0;
                p2=5;
                //location.reload();
            }
            location.href="gamedata_write.jsp?game="+"game1&"+"win="+win+"&draw="+draw+"&lose="+lose;
            
        }

        ballx = nballx;
        bally = nbally;
        }
      
        function initPlayer() {         //player1,player2 처음 위치,setinterval 트리거
            // pen = document.getElementById('canvas');
            pen.beginPath();
            ch1 = Math.floor(Math.random() * 2);
            if (ch1 == 0)
                ch1--;

            ballvx = 8 * ch1;
            ballvy = 6 * ch1;
            pen.strokeRect(boxx + margin, bh / 2, pw, ph);
            pen.strokeRect(bw - margin, bh / 2, pw, ph);
            // setInterval(drawObstacle, 100);
            trigger = setInterval(moveball, 30);

        }
        function drawPost(){
            pen.beginPath();
            pen.moveTo(boxx,boxy+bh/2- pw * 5 / 2);
            pen.lineTo(boxx-40,boxy+bh/2- pw * 5 / 2);
            pen.moveTo(boxx-40,boxy+bh/2- pw * 5 / 2);
            pen.lineTo(boxx-40,boxy+bh/2+ pw * 5 / 2);
            pen.moveTo(boxx-40,boxy+bh/2+ pw * 5 / 2);
            pen.lineTo(boxx,boxy+bh/2+ pw * 5 / 2);
            
            pen.moveTo(boxx+bw,boxy+bh/2- pw * 5 / 2);
            pen.lineTo(boxx+bw+40,boxy+bh/2- pw * 5 / 2);
            pen.moveTo(boxx+bw+40,boxy+bh/2- pw * 5 / 2);
            pen.lineTo(boxx+bw+40,boxy+bh/2+ pw * 5 / 2);
            pen.moveTo(boxx+bw+40,boxy+bh/2+ pw * 5 / 2);
            pen.lineTo(boxx+bw,boxy+bh/2+ pw * 5 / 2);

            pen.stroke();

        }
        function drawBoard() {          //경기장 그리는 함수
            pen.font = '30px arial';
            pen.clearRect((boxx + bw) / 4 - 5, (boxx + bw) / 2 - 5, (boxx + bw) * 3 / 4 + 10, (boxx + bw) / 2 + 10);
            pen.strokeText('player1: ' + p1 + '  player2: ' + p2, (boxx + bw) / 3, (boxy + bh) + 100);

            pen.beginPath();
            pen.lineWidth = 1;

            pen.strokeStyle = "rgb(50,200,50)";
            pen.arc((boxx + bw) / 2, (boxy + bh) / 2, 30, 0, Math.PI * 2);
            pen.strokeRect(boxx, boxy, bw, bh);
            pen.moveTo((boxx + bw) / 2, boxy);
            pen.lineTo((boxx + bw) / 2, boxy + bh);
            pen.stroke();

            pen.moveTo(boxx, boxy);
            pen.lineTo(boxx, boxy + bh / 2 - pw * 5 / 2);
            pen.moveTo(boxx, boxy + bh / 2 + pw * 5 / 2);
            pen.lineTo(boxx, boxy + bh);
            pen.moveTo(boxx + bw, boxy);
            pen.lineTo(boxx + bw, boxy + bh / 2 - pw * 5 / 2);
            pen.moveTo(boxx + bw, boxy + bh / 2 + pw * 5 / 2);
            pen.lineTo(boxx + bw, boxy + bh);
           
            pen.strokeStyle = 'black';
            pen.lineWidth = 1;
            pen.stroke();
            drawPost();
            pen.lineWidth = 1;
            pen.strokeStyle = 'black';



        }
        //function drawObstacle() {

        // }
        drawBoard();
        initPlayer();
        // drawObstacle();
        document.addEventListener('keydown', keydownfunction);
        document.addEventListener('keyup', keyupfunction);
        ///키보드 부드럽게 움직이기 참고:http://izerocom2.cafe24.com/myjava/game1.js
        function keyupfunction() {
            if (event.keyCode == 37 || event.keyCode == 39) {
                clearInterval(movextime1);
                keyonx1 = 0;
                // keyony1=0;
            }

            if (event.keyCode == 38 || event.keyCode == 40) {
                clearInterval(moveytime1);
                //keyonx1=0;
                keyony1 = 0;

            }
            if (event.keyCode == 65 || event.keyCode == 68) {
                clearInterval(movextime2);
                keyonx2 = 0;
                // keyony2=0;
            }
            if (event.keyCode == 87 || event.keyCode == 83) {
                clearInterval(moveytime2);
                // keyonx2=0;
                keyony2 = 0;
            }
        }

        function keydownfunction(event) {

            //pen.clearRect(px2,py2,pw,ph);

            //방향키 제외한 다른 키코드는 무시.
            if (event.keyCode)
                event.returnValue = false;

            //player1 왼쪽,오른쪽 방향 움직임을 정의
            if (event.keyCode == 37 || event.keyCode == 39) {
                savekeyx1 = event.keyCode;
                if (keyonx1 != 1) {
                    keyonx1 = 1;   //키 꺼짐
                    movextime1 = setInterval(keymovex1, 30);
                }

            }

            //player1 위쪽,아래쪽 방향 움직임을 정의
            if (event.keyCode == 38 || event.keyCode == 40) {
                savekeyy1 = event.keyCode;
                if (keyony1 != 1) {
                    keyony1 = 1;
                    moveytime1 = setInterval(keymovey1, 30);
                }
            }

            //player2 왼쪽,오른쪽 방향 움직임을 정의
            if (event.keyCode == 65 || event.keyCode == 68) {
                savekeyx2 = event.keyCode;
                if (keyonx2 != 1) {
                    keyonx2 = 1;
                    movextime2 = setInterval(keymovex2, 30);
                }
            }

            //player2 위쪽,아래쪽 방향 움직임을 정의
            if (event.keyCode == 87 || event.keyCode == 83) {
                savekeyy2 = event.keyCode;
                if (keyony2 != 1) {
                    keyony2 = 1;
                    moveytime2 = setInterval(keymovey2, 30);
                }
            }
            drawBoard();
        }
        function keymovex1() {
            if (savekeyx1 == 37 && px1 > boxx) {       // p1 left
                pen.clearRect(px1 - 1, py1 - 1, pw + 2, ph + 2);
                px1 -= 10;
                pen.beginPath();
                // pen.fillStyle='black';
                // pen.fill();
                pen.strokeRect(px1, py1, pw, ph);
            }

            if (savekeyx1 == 39 && px1 + pw < (bw + boxx) / 2) {       //p1 right
                pen.clearRect(px1 - 1, py1 - 1, pw + 2, ph + 2);
                px1 += 10;
                pen.beginPath();
                pen.strokeRect(px1, py1, pw, ph);
            }
        }
        function keymovey1() {
            if (savekeyy1 == 38 && py1 > boxy) {       //p1 upper
                pen.clearRect(px1 - 1, py1 - 1, pw + 2, ph + 2);
                py1 -= 10;
                pen.beginPath();
                pen.strokeRect(px1, py1, pw, ph);
            }

            if (savekeyy1 == 40 && py1 + ph < boxy + bh) {    //p1 down
                pen.clearRect(px1 - 1, py1 - 1, pw + 2, ph + 2);
                py1 += 10;
                pen.beginPath();
                pen.strokeRect(px1, py1, pw, ph);
            }
        }
        function keymovex2() {
            if (savekeyx2 == 65 && px2 > (bw + boxx) / 2) {     //p2 left
                pen.clearRect(px2 - 1, py2 - 1, pw + 2, ph + 2);
                px2 -= 10;
                pen.beginPath();
                pen.strokeRect(px2, py2, pw, ph);
            }
            if (savekeyx2 == 68 && px2 + pw < boxx + bw) {      //p2 right
                pen.clearRect(px2 - 1, py2 - 1, pw + 2, ph + 2);
                px2 += 10;
                pen.beginPath();
                pen.strokeRect(px2, py2, pw, ph);
            }

        }
        function keymovey2() {
            if (savekeyy2 == 87 && py2 > boxy) {       //p2 upper
                pen.clearRect(px2 - 1, py2 - 1, pw + 2, ph + 2);
                py2 -= 10;
                pen.beginPath();
                pen.strokeRect(px2, py2, pw, ph);
            }

            if (savekeyy2 == 83 && py2 + ph < boxy + bh) {      //p2 down
                pen.clearRect(px2 - 1, py2 - 1, pw + 2, ph + 2);
                py2 += 10;
                pen.beginPath();
                pen.strokeRect(px2, py2, pw, ph);
            }

        }


    </script>

</body>


</html>