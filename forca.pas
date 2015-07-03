program forca;
uses crt;
var
  cmd,dfc,chute:char;
  nome,palavra,chutes,chuteerr,dia,mes,ano:string;
  aleatorio,tamanho,erros,acertos,i:integer;
  tinicio,exec,venceu,acertou:boolean;
  dicaf,dicam,dicad,pf,pm,pd:array[1..3]of string;

procedure inicio; forward;

procedure fechar;
begin
  tinicio:=false;
  exec:=false;
  halt;
end;

procedure titulojogo;
begin
  writeln('========== Forca ==========');
  writeln;
  writeln;
end;

procedure restinpeace;
begin
writeln('                                 _____  _____');
writeln('                                <     `/     |');
writeln('                                 >          (');
writeln('                                |   _     _  |');
writeln('                                |  |_) | |_) |');
writeln('                                |  | \ | |   |');
writeln('                    ___.______%_|            |_______  _____');
writeln('                  _/                                 \|     |');
writeln('                 |                ',nome);
writeln('                 |_____.-.______              ____/|________|');
writeln('                                | * ',dia,'/',mes,'/',ano[3],'',ano[4],' |');
writeln('                                | + 02/06/15 |');
writeln('                                |            |');
writeln('                                |   _        <');
writeln('                                |__/         |');
writeln('                                 / `--.      |');
writeln('                               %|            |%');
writeln('                           |/.%%|          -< @%%%');
writeln('                           `\%`@|     v      |@@%@%%    - mfj');
writeln('                         .%%%@@@|%    |    % @@@%%@%%%%');
writeln('                    _.%%%%%%@@@@@@%%_/%\_%@@%%@@@@@@@%%%%%%');
writeln;
end;

//pergunta se deseja jogar novamente apos vencer ou perder
procedure jogardenovo;
begin
  writeln('Deseja jogar novamente? S/N');
  writeln;
  cmd:=readkey;
  case cmd of
    //tecla 's' pressionada; volta pro menu principal
    #83,#115 : inicio;
    //tecla 'n' pressionada; fecha o programa
    #78,#110 : fechar;
    else
     begin
      writeln('Opcao invalida!');
      delay(1000);
      jogardenovo;
     end;
  end;
end;

procedure estagiofinal;
begin
  writeln('______');
  writeln('|    :');
  writeln('|    O');
  writeln('|   /|\');
  writeln('|   / \  _');
  writeln('|       | |  ');
  writeln('--------------');
  writeln;
end;

//mostra uma tela comemorativa se vencer ou
procedure fim;
begin
  if venceu=true then
   begin
    clrscr;
    writeln(' ===========================');
    writeln('|                     \O/   |');
    writeln('|      Voce venceu!!!  |    |');
    writeln('|                     / \   |');
    writeln(' ===========================');
    venceu:=false;
    jogardenovo;
   end
  else
   begin
    clrscr;
    titulojogo;
    writeln;
    writeln;
    estagiofinal;
    writeln;
    writeln('Voce perdeu...');
    delay(10000);
    restinpeace;
    jogardenovo;
   end;
end;

procedure estagio0;
begin
  writeln('______');
  writeln('|    :');
  writeln('|    :');
  writeln('|');
  writeln('|    _');
  writeln('|   | |  ');
  writeln('--------------');
  writeln;
end;

procedure estagio1;
begin
  writeln('______');
  writeln('|    :');
  writeln('|    O');
  writeln('|');
  writeln('|    _');
  writeln('|   | |  ');
  writeln('--------------');
  writeln;
end;

procedure estagio2;
begin
  writeln('______');
  writeln('|    :');
  writeln('|    O');
  writeln('|    |');
  writeln('|    _');
  writeln('|   | |  ');
  writeln('--------------');
  writeln;
end;

procedure estagio3;
begin
  writeln('______');
  writeln('|    :');
  writeln('|    O');
  writeln('|   /|');
  writeln('|    _');
  writeln('|   | |  ');
  writeln('--------------');
  writeln;
end;

procedure estagio4;
begin
  writeln('______');
  writeln('|    :');
  writeln('|    O');
  writeln('|   /|\');
  writeln('|    _');
  writeln('|   | |  ');
  writeln('--------------');
  writeln;
end;

procedure estagio5;
begin
  writeln('______');
  writeln('|    :');
  writeln('|    O');
  writeln('|   /|\');
  writeln('|   /_');
  writeln('|   | |  ');
  writeln('--------------');
  writeln;
end;

procedure estagio6;
begin
  writeln('______');
  writeln('|    :');
  writeln('|    O');
  writeln('|   /|\');
  writeln('|   /_\');
  writeln('|   | |  ');
  writeln('--------------');
  writeln;
end;

procedure showdica;
begin
  writeln('==== Dica ====');
  case dfc of
    'f':writeln(dicaf[aleatorio]);
    'm':writeln(dicam[aleatorio]);
    'd':writeln(dicad[aleatorio]);
  end;
  writeln;
end;

procedure showchutes;
begin
  writeln('Chute uma letra:');
  writeln;
  write('  ',chutes[1]);
  for i:=2 to tamanho do
    write('  -  ',chutes[i]);
  writeln;
  if(erros>0)then
  begin
    writeln('Chutes errados:');
    writeln;
    write('  ',chuteerr[1]);
    if(erros>1)then
     begin
      for i:=2 to erros do
       write('  -  ',chuteerr[i]);
     end;
    writeln;
  end;
end;

procedure getchute;
begin
  acertou:=false;
  readln(chute);
  if(chute='/')then
   begin
    clrscr;
    writeln('Tem certeza que deseja sair? S/N');
    cmd:=readkey;
    case cmd of
     //tecla 's' pressionada; fecha o programa
     #83,#115 : fechar;
     //tecla 'n' pressionada; cancela
     #78,#110 : exit;
     else
      begin
       writeln('Opcao invalida!');
       delay(1000);
      end;
    end;
   end;
  for i:=1 to tamanho do
   begin
    if(chute=chutes[i])then
     begin
      writeln('Chute repetido!');
      delay(2000);
      exit;
     end
    else if (chute=palavra[i]) then
     begin
      chutes[i]:=chute;
      acertos:=acertos+1;
      acertou:=true;
     end
   end;
   if acertou=false then
    begin
     if (erros=1)then
      begin
       for i:=1 to erros do
        chuteerr[erros+1]:=chute;
      end
     else
       chuteerr[1]:=chute;
     erros:=erros+1;
    end;
end;

//captura a palavra na array e armazena na variavel
procedure getpalavra;
begin
  case dfc of
    'f': palavra:=pf[aleatorio];
    'm': palavra:=pm[aleatorio];
    'd': palavra:=pd[aleatorio];
  end;
end;

//procedure que define o tamanho da palavra para mostrar dividida em caracteres
procedure gerador;
begin
  getpalavra;
  //pega a qtd de caracteres da palavra
  tamanho:=length(palavra);
  //define o tamanho da array de chutes e chutes errados
  setlength(chutes, tamanho);
  setlength(chuteerr, tamanho);

  //define o valor de cada caractere
  for i:=1 to tamanho do
   begin
    chutes[i]:='_';
   end;
end;

procedure jogofacil;
begin
  while(acertos<>tamanho)do
   begin
    if erros=0 then
     begin
      clrscr;
      titulojogo;
      writeln('"/"     - sair.');
      writeln;
      estagio0;
      writeln;
      writeln;
      writeln;
      showchutes;
      getchute;
     end
    else if erros=1 then
     begin
      clrscr;
      titulojogo;
      writeln('"/"     - sair.');
      writeln;
      estagio1;
      showdica;
      showchutes;
      getchute;
     end
    else if erros=2 then
     begin
      clrscr;
      titulojogo;
      writeln('"/"     - sair.');
      writeln;
      estagio3;
      showdica;
      showchutes;
      getchute;
     end
    else if erros=3 then
     begin
      clrscr;
      titulojogo;
      writeln('"/"     - sair.');
      writeln;
      estagio6;
      showdica;
      showchutes;
      getchute;
     end
    else if erros=4 then
     begin
      venceu:=false;
      fim;
     end;
   end;
  venceu:=true;
  fim;
end;

procedure jogomoderado;
begin
  while(acertos<>tamanho)do
   begin
    if erros=0 then
     begin
      clrscr;
      titulojogo;
      writeln('"/"     - sair.');
      writeln;
      estagio0;
      writeln;
      writeln;
      writeln;
      showchutes;
      getchute;
     end
    else if erros=1 then
     begin
      clrscr;
      titulojogo;
      writeln('"/"     - sair.');
      writeln;
      estagio1;
      writeln;
      writeln;
      writeln;
      showchutes;
      getchute;
     end
    else if erros=2 then
     begin
      clrscr;
      titulojogo;
      writeln('"/"     - sair.');
      writeln;
      estagio3;
      showdica;
      showchutes;
      getchute;
     end
    else if erros=3 then
     begin
      clrscr;
      titulojogo;
      writeln('"/"     - sair.');
      writeln;
      estagio4;
      showdica;
      showchutes;
      getchute;
     end
    else if erros=4 then
     begin
      clrscr;
      titulojogo;
      writeln('"/"     - sair.');
      writeln;
      estagio6;
      showdica;
      showchutes;
      getchute;
     end
    else if erros=5 then
     begin
      venceu:=false;
      fim;
     end;
   end;
  venceu:=true;
  fim;
end;

procedure jogodificil;
begin
  while(acertos<>tamanho)do
   begin
    if erros=0 then
     begin
      clrscr;
      titulojogo;
      writeln('"/"     - sair.');
      writeln;
      estagio0;
      writeln;
      writeln;
      writeln;
      showchutes;
      getchute;
     end
    else if erros=1 then
     begin
      clrscr;
      titulojogo;
      writeln('"/"     - sair.');
      writeln;
      estagio1;
      writeln;
      writeln;
      writeln;
      showchutes;
      getchute;
     end
    else if erros=2 then
     begin
      clrscr;
      titulojogo;
      writeln('"/"     - sair.');
      writeln;
      estagio2;
      showdica;
      showchutes;
      getchute;
     end
    else if erros=3 then
     begin
      clrscr;
      titulojogo;
      writeln('"/"     - sair.');
      writeln;
      estagio3;
      showdica;
      showchutes;
      getchute;
     end
    else if erros=4 then
     begin
      clrscr;
      titulojogo;
      writeln('"/"     - sair.');
      writeln;
      estagio4;
      showdica;
      showchutes;
      getchute;
     end
    else if erros=5 then
     begin
      clrscr;
      titulojogo;
      writeln('"/"     - sair.');
      writeln;
      estagio6;
      showdica;
      showchutes;
      getchute;
     end
    else if erros=6 then
     begin
      venceu:=false;
      fim;
     end;
   end;
  venceu:=true;
  fim;
end;

//codigo base do jogo
procedure forca;
begin
  gerador;
  case dfc of
    'f':jogofacil;
    'm':jogomoderado;
    'd':jogodificil;
  end;
end;

procedure menudfc;
begin
  //menu de dificuldades
  while(exec)do
   begin
    clrscr;
    writeln('======= Dificuldade =======');
    writeln;
    writeln('"d"     - dificil');
    writeln('"m"     - moderada');
    writeln('"f"     - facil');
    cmd:=readkey;
    case cmd of
     #68,#100 : dfc:='d';
     #77,#109 : dfc:='m';
     #70,#102 : dfc:='f';
     else dfc:='m';
    end;
    exit;
   end;
end;

procedure menu;
begin
//menu de execucao
  exec:=true;
  while(exec)do
   begin
    //inicia aleatoriedade (para escolher uma das palavras do enigma); comeca do 0
    Randomize;
    aleatorio:=random(3)+1;
    //limpa a tela
    clrscr;
    writeln('========== Menu ===========');
    writeln;
    writeln('"c"     - comecar');
    writeln('"d"     - dificuldades');
    writeln('"ESC"   - voltar');
    cmd:=readkey;
    case cmd of
      //tecla ESC pressionada; sai da execucao atual
      #27 : exec:=false;
      //tecla 'c' pressionada; chama o jogo
      #67,#99 : forca;
      //tecla 'd' pressionada; chama o menu de dificuldade
      #68,#100 : menudfc;
      else
       begin
        writeln('Opcao invalida!');
        delay(1000);
       end;
    end;
   end;
   inicio;
end;

procedure inicio;
begin
  tinicio:=true;
  while(tinicio)do
   begin
    //limpa a tela
    clrscr;
    erros:=0;
    acertos:=0;
    venceu:=false;
    //menu inicial
    titulojogo;
    writeln('"Enter"   - menu');
    writeln('"ESC"     - sair');
    //captura tecla pressionada
    cmd:=readkey;
    case cmd of
      //tecla ESC pressionada
      #27 :
        begin
         clrscr;
         writeln('Tem certeza que deseja sair? S/N');
         cmd:=readkey;
         case cmd of
           //tecla 's' pressionada
           //fecha o programa
           #83,#115 : fechar;
           //tecla 'n' pressionada
           //cancela
           #78,#110 : inicio;
           else
            begin
             writeln('Opcao invalida!');
             delay(1000);
            end;
         end;
        end;
      //tecla Enter pressionada
      //vai para o menu
      #13 :
        begin
         tinicio:=false;
         menu;
        end;
    end;
   end;
end;

{$R *.res}

begin
  pf[1]:='gato';         dicaf[1]:='domestico';
  pf[2]:='vaca';         dicaf[2]:='fazenda';
  pf[3]:='anta';         dicaf[3]:='floresta';
  pm[1]:='capivara';     dicam[1]:='roedor';
  pm[2]:='lagarto';      dicam[2]:='reptil';
  pm[3]:='tamandua';     dicam[3]:='lingua';
  pd[1]:='ornitorrinco'; dicad[1]:='evolucao';
  pd[2]:='rinoceronte';  dicad[2]:='chifre';
  pd[3]:='uirapuru';     dicad[3]:='ave';
  //dificuldade padrao: moderada
  dfc:='m';
  write('Digite seu nome: ');
  readln(nome);
  write('Digite o dia em que nasceu: ');
  readln(dia);
  write('Digite o mes em que nasceu: ');
  readln(mes);
  write('Digite o ano em que nasceu: ');
  readln(ano);
  writeln;
  writeln;
  delay(1000);
  writeln('Obrigado pelos dados!');
  delay(3000);
  inicio;
end.