int[][] box=new int [4][4];
int boxc=0;
int ps1A;//要求するパスワードの数字
int ps2A;
int ps3A;
int ps4A;
int ps1=-1;//入力するパスワードの数字
int ps2=-1;
int ps3=-1;
int ps4=-1;
int ps1E=0;//欄ごとの入力の成否
int ps2E=0;
int ps3E=0;
int ps4E=0;
int psCH=0;//パスワードチェック
int psWR=0;//パスワード間違い
int psNA=0;//パスワード無し
int psD=0;//削除トリガー
int DEL=0;//削除コマンド
int psRE=0;//再生成トリガー
int Count=0;//進行カウント
int end=0;//終了処理
void setup()
{
  size(1920, 1013);
  background(171, 255, 250);
  surface.setLocation(-2, 0);
  PFont font = createFont("Meiryo", 50);
  textFont(font);
  for (int x=0; x<3; x++)
  {
    for (int y=0; y<4; y++)
    {
      box[x][y]=0;
    }
  }
  ps1A=int(random(0, 10));
  ps2A=int(random(0, 10));
  ps3A=int(random(0, 10));
  ps3A=int(random(0, 10));
}
void draw()
{
  background(171, 255, 250);
  for (int x=0; x<3; x++)//入力ボタン
  {
    for (int y=0; y<4; y++)
    {
      if (box[x][y]==0)
      {
        fill(255);
      } else if (box[x][y]==1)
      {
        if (boxc<256)
        {
          fill(255, 255, boxc);
          boxc+=1;
        }
        box[x][y]=0;
      }
      strokeWeight(1);
      rect(55+605*x, 423+145*y, 600, 140);
    }
  }
  //ボタンの数字と文字
  int xn=0; 
  int yn=0;
  for (int num=1; num<10; num++)
  {
    if (num % 3 == 1)
    {
      xn = 0; 
      yn = yn + 1;
    }
    fill(0);
    textSize(80);
    text(num, 320+xn*600, 390+yn*140);
    xn++;
  }
  text("←", 300, 960);
  text("0", 920, 960);
  text("OK", 1500, 960);

  //パスワード入力欄
  for (int x=0; x<4; x++)
  {
    strokeWeight(3);
    line(460+300*x, 310, 560+300*x, 310);
  }
  
  //パスワードの生成
  fill(0);
  textSize(50);
  text("パスワード番号：", 680, 80);
  text(ps1A, 1080, 80);
  text(ps2A, 1130, 80);
  text(ps3A, 1180, 80);
  text(ps4A, 1230, 80);
  
  //警告文
  if (psWR==1)
  {
    fill(255, 0, 0);
    text("パスワードが違います", 717, 160);
  } else if (psWR==2)
  {
    fill(255, 0, 0);
    text("パスワードを入力してください", 625, 160);
  } else if (psWR==0)
  {
  }
  if (end==1)
  {
    background(171, 255, 250);
    fill(0);
    textSize(100);
    text("テストは終了です", 570, 500);
  }
  
  //パスワードの入力
  if (ps1E==1)
  {
    fill(0);
    text(ps1, 495, 300);
  }
  if (ps2E==1)
  {
    text(ps2, 795, 300);
  }
  if (ps3E==1)
  {
    text(ps3, 1095, 300);
  }
  if (ps4E==1)
  {
    text(ps4, 1395, 300);
  }
  //入力内容の消去
  if (DEL==1)
  {
    if (ps4E==1)
    {
      fill(171, 255, 250);
      ps4=-1;
      ps4E=0;
    } else if (ps3E==1)
    {
      fill(171, 255, 250);
      ps3=-1;
      ps3E=0;
    } else if (ps2E==1)
    {
      fill(171, 255, 250);
      ps2=-1;
      ps2E=0;
    } else if (ps1E==1)
    {
      fill(171, 255, 250);
      ps1=-1;
      ps1E=0;
    } else
    {
    }
    DEL=0;
    psD=0;
  }
}

void mouseClicked()
{
  for (int x=0; x<3; x++)
  {
    for (int y=0; y<4; y++)
    {
      if (55+605*x<mouseX && mouseX<655+605*x && 423+145*y<mouseY && mouseY<568+145*y)
      {
        box[x][y]=0;
        box[x][y]=1;
        if (box[0][0]==1)//ボタン１
        {
          if (ps1E==0) 
          {
            ps1=1;
          } else if (ps2E==0) 
          {
            ps2=1;
          } else if (ps3E==0) 
          {
            ps3=1;
          } else if (ps4E==0) 
          {
            ps4=1;
          }
        }
        if (box[1][0]==1)//ボタン２
        {
          if (ps1E==0) 
          {
            ps1=2;
          } else if (ps2E==0) 
          {
            ps2=2;
          } else if (ps3E==0) 
          {
            ps3=2;
          } else if (ps4E==0) 
          {
            ps4=2;
          }
        }
        if (box[2][0]==1)//ボタン３
        {
          if (ps1E==0) 
          {
            ps1=3;
          } else if (ps2E==0) 
          {
            ps2=3;
          } else if (ps3E==0) 
          {
            ps3=3;
          } else if (ps4E==0) 
          {
            ps4=3;
          }
        }
        if (box[0][1]==1)//ボタン４
        {
          if (ps1E==0) 
          {
            ps1=4;
          } else if (ps2E==0) 
          {
            ps2=4;
          } else if (ps3E==0) 
          {
            ps3=4;
          } else if (ps4E==0) 
          {
            ps4=4;
          }
        }
        if (box[1][1]==1)//ボタン５
        {
          if (ps1E==0) 
          {
            ps1=5;
          } else if (ps2E==0) 
          {
            ps2=5;
          } else if (ps3E==0) 
          {
            ps3=5;
          } else if (ps4E==0) 
          {
            ps4=5;
          }
        }
        if (box[2][1]==1)//ボタン６
        {
          if (ps1E==0) 
          {
            ps1=6;
          } else if (ps2E==0) 
          {
            ps2=6;
          } else if (ps3E==0) 
          {
            ps3=6;
          } else if (ps4E==0) 
          {
            ps4=6;
          }
        }
        if (box[0][2]==1)//ボタン７
        {
          if (ps1E==0) 
          {
            ps1=7;
          } else if (ps2E==0) 
          {
            ps2=7;
          } else if (ps3E==0) 
          {
            ps3=7;
          } else if (ps4E==0) 
          {
            ps4=7;
          }
        }
        if (box[1][2]==1)//ボタン８
        {
          if (ps1E==0) 
          {
            ps1=8;
          } else if (ps2E==0) 
          {
            ps2=8;
          } else if (ps3E==0) 
          {
            ps3=8;
          } else if (ps4E==0) 
          {
            ps4=8;
          }
        }
        if (box[2][2]==1)//ボタン９
        {
          if (ps1E==0) 
          {
            ps1=9;
          } else if (ps2E==0) 
          {
            ps2=9;
          } else if (ps3E==0) 
          {
            ps3=9;
          } else if (ps4E==0) 
          {
            ps4=9;
          }
        }

        if (box[0][3]==1)//消去ボタン
        {
          psD=1;
        }

        if (box[1][3]==1)//ボタン０
        {
          if (ps1E==0) 
          {
            ps1=0;
          } else if (ps2E==0) 
          {
            ps2=0;
          } else if (ps3E==0) 
          {
            ps3=0;
          } else if (ps4E==0) 
          {
            ps4=0;
          }
        }
        if (box[2][3]==1)//OKボタン
        {
          psCH=1;
        }
        //それぞれの欄でパスワードが入力されているか
        if (ps1E==0 && ps1>-1)
        {
          ps1E=1;
        } else if (ps2E==0 && ps2>-1)
        {
          ps2E=1;
        } else if (ps3E==0 && ps3>-1)
        {
          ps3E=1;
        } else if (ps4E==0 && ps4>-1)
        {
          ps4E=1;
        }
        //パスワード消去処理
        if (psD==1)
        {
          DEL=1;
        }

        if (psCH==1)//パスワード成否確認
        {
          if (ps1A==ps1 && ps2A==ps2 && ps3A==ps3 && ps4A==ps4)//正解
          {
            psRE=1;
            psWR=0;
            Count++;
          } else if (ps1E==0 && ps2E==0 && ps3E==0 && ps4E==0)//未入力
          {
            psWR=2;
          } else //間違い
          {
            psWR=1;
          }
          ps1=-1;
          ps1E=0;
          ps2=-1;
          ps2E=0;
          ps3=-1;
          ps3E=0;
          ps4=-1;
          ps4E=0;

          psCH=0;
        }
        //パスワードの再生成
        if (psRE==1)
        {
          if (Count<5)
          {
            ps1A=int(random(0, 10));
            ps2A=int(random(0, 10));
            ps3A=int(random(0, 10));
            ps4A=int(random(0, 10));
            psRE=0;
            print(ps1A);
            print(ps2A);
            print(ps3A);
            println(ps4A);
          } else if (Count==5) //成功カウント
          {
            end=1;
          }
        }
      }
    }
  }
}
