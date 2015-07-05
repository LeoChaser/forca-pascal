program forca;
uses crt;
var
  cmd,chute:char;
  dfc,modo,nome,palavra,chutes,chuteerr,dia,mes,ano:string;
  aleatorio,tamanho,erros,acertos,chutemax,i:integer;
  tinicio,exec,venceu,acertou:boolean;
  //arrays de palavras
  dicafa,dicama,dicada,dicaff,dicamf,dicadf,dicafc,dicamc,dicadc:array[1..5]of string;
  pfa,pma,pda,pff,pmf,pdf,pfc,pmc,pdc:array[1..5]of string;
  //variaveis desafio
  dicadesa,dicadesf,dicadesc,desa,desf,desc:string;

procedure inicio; forward;
procedure boot; forward;
procedure menu; forward;

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
writeln('                 |                  ',nome);
writeln('                 |_____.-.______              ____/|________|');
writeln('                                | * ',dia,'/',mes,'/',ano[3]+ano[4],' |');
writeln('                                | + 04/06/15 |');
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
    //tecla 's' pressionada; volta pro boot
    #83,#115 : boot;
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

//mostra uma tela comemorativa se vencer ou a lápide se perder
procedure fim;
begin
  if venceu=true then
   begin
    clrscr;
    writeln('A resposta esta certa: ',palavra,'!');
    writeln;
    writeln(' =============================');
    writeln('|                     \O/     |');
    writeln('|      Voce venceu!!!  |      |');
    writeln('|                     / \     |');
    writeln(' =============================');
    venceu:=false;
    //se o modo desafio foi vencido, altera pro padrao
    if (dfc='desafio') then
      dfc:='moderada';
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
    delay(4000);
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

//mostra uma dica caso erre uma determinada quantidade de vezes
procedure showdica;
begin
  writeln('==== Dica ====');
  case modo of
    'animais':
      begin
       case dfc of
        'facil':writeln(dicafa[aleatorio]);
        'moderada':writeln(dicama[aleatorio]);
        'dificil':writeln(dicada[aleatorio]);
        'desafio':writeln(dicadesa);
       end;
      end;
    'frutas':
      begin
       case dfc of
        'facil':writeln(dicaff[aleatorio]);
        'moderada':writeln(dicamf[aleatorio]);
        'dificil':writeln(dicadf[aleatorio]);
        'desafio':writeln(dicadesf);
       end;
      end;
    'caes':
      begin
       case dfc of
        'facil':writeln(dicafc[aleatorio]);
        'moderada':writeln(dicamc[aleatorio]);
        'dificil':writeln(dicadc[aleatorio]);
        'desafio':writeln(dicadesc);
       end;
      end;
  end;
  writeln;
end;

//mostra os chutes certos e errados
procedure showchutes;
begin
  writeln('Chute uma letra:');
  writeln;
  write('  ',chutes[1]);
  for i:=2 to tamanho do
   write('  -  ',chutes[i]);
  writeln;
  writeln('Chutes errados:');
  writeln;
  write('  ',chuteerr[1]);
  //mostra com um chute a menos (automaticamente perde no ultimo chute errado)
  for i:=2 to (chutemax-1) do
   write('  -  ',chuteerr[i]);
  writeln;
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
     erros:=erros+1;
     if(erros=1)then
      chuteerr[1]:=chute
     else
      if(erros>1)then
       chuteerr[erros]:=chute;
    end;
end;

//captura a palavra na array e armazena na variavel
procedure getpalavra;
begin
  case modo of
    'animais':
      begin
       case dfc of
        'facil':palavra:=pfa[aleatorio];
        'moderada':palavra:=pma[aleatorio];
        'dificil':palavra:=pda[aleatorio];
        'desafio':palavra:=desa;
       end;
      end;
    'frutas':
      begin
       case dfc of
        'facil':palavra:=pff[aleatorio];
        'moderada':palavra:=pmf[aleatorio];
        'dificil':palavra:=pdf[aleatorio];
        'desafio':palavra:=desf;
       end;
      end;
    'caes':
      begin
       case dfc of
        'facil':palavra:=pfc[aleatorio];
        'moderada':palavra:=pmc[aleatorio];
        'dificil':palavra:=pdc[aleatorio];
        'desafio':palavra:=desc;
       end;
      end;
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
  //define o valor de cada caractere para nao ficar vazio
  for i:=1 to tamanho do
   chutes[i]:='_';
  case dfc of
   'moderada':chutemax:=5;
   'dificil':chutemax:=6;
   else chutemax:=4;
  end;
  setlength(chuteerr, chutemax);
  for i:=1 to chutemax do
   chuteerr[i]:='_';
end;

procedure statusjogo;
begin
  writeln('Difc: ',dfc,' Modo: ',modo);
  writeln('"/"     - sair.');
  writeln;
end;

//codigo base do jogo
procedure forca;
begin
  gerador;
  while(acertos<>tamanho)do
   begin
    if erros=0 then
     begin
      clrscr;
      titulojogo;
      statusjogo;
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
      statusjogo;
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
      statusjogo;
      if dfc='facil' then
       begin
        estagio3;
        showdica;
       end
      else if dfc='dificil' then
       begin
        estagio2;
        writeln;
        writeln;
        writeln;
       end
      else
       begin
        estagio3;
        writeln;
        writeln;
        writeln;
       end;
      showchutes;
      getchute;
     end
    else if erros=3 then
     begin
      clrscr;
      titulojogo;
      statusjogo;
      if dfc='dificil' then
       begin
        estagio3;
        writeln;
        writeln;
        writeln;
       end
      else if dfc='moderado' then
       begin
        estagio4;
        showdica;
       end
      else
       begin
        estagio6;
        showdica;
       end;
      showchutes;
      getchute;
     end
    else if erros=4 then
     begin
      if not(dfc='moderado') and not(dfc='dificil') then
       begin
        venceu:=false;
        fim;
       end;
      clrscr;
      titulojogo;
      statusjogo;
      if dfc='dificil' then
       estagio4
      else
       estagio6;
      showdica;
      showchutes;
      getchute;
     end
    else if erros=5 then
     begin
      if dfc='moderado' then
       begin
        venceu:=false;
        fim;
       end;
      clrscr;
      titulojogo;
      statusjogo;
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

procedure menumodo;
begin
  while(exec)do
   begin
    clrscr;
    writeln('========== Modos ==========');
    writeln;
    writeln('Atual: ',modo);
    writeln;
    writeln('"a"     - animais');
    writeln('"f"     - frutas');
    writeln('"c"     - caes');
    writeln('"ESC"   - voltar');
    cmd:=readkey;
    case cmd of
     #65,#97:   begin modo:='animais'; menu; end;
     #70,#102:  begin modo:='frutas'; menu; end;
     #67,#99:   begin modo:='caes'; menu; end;
     #27 : menu;
     else
      begin
       writeln('Opcao invalida!');
       writeln('Modo anterior mantido.');
       delay(2000);
       menumodo;
      end;
    end;
    exit;
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
    writeln('Atual: ',dfc);
    writeln;
    writeln('"d"     - dificil');
    writeln('"m"     - moderada');
    writeln('"f"     - facil');
    writeln('"x"     - desafio');
    writeln('"ESC"   - voltar');
    cmd:=readkey;
    case cmd of
     #68,#100 : begin dfc:='dificil'; menu; end;
     #77,#109 : begin dfc:='moderada'; menu; end;
     #70,#102 : begin dfc:='facil'; menu; end;
     #88,#120 : begin dfc:='desafio'; menu; end;
     #27 : menu;
     else
      begin
       writeln('Opcao invalida!');
       writeln('Dificuldade anterior mantida.');
       delay(2000);
       menudfc;
      end;
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
    aleatorio:=random(5)+1;
    clrscr;
    writeln('========== Menu ===========');
    writeln;
    writeln('"c"     - comecar');
    writeln('"m"     - modo         (atual: ',modo,')');
    writeln('"d"     - dificuldades (atual: ',dfc,')');
    writeln('"ESC"   - voltar');
    cmd:=readkey;
    case cmd of
      //tecla ESC pressionada; sai da execucao atual
      #27 : exec:=false;
      //tecla 'c' pressionada; chama o jogo
      #67,#99 : forca;
      //tecla 'd' pressionada; chama o menu de dificuldade
      #68,#100 : menudfc;
      //tecla 'x' pressionada; chama o menu de modos
      #77,#109 : menumodo;
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

procedure leitura;
begin
  clrscr;
  titulojogo;
  write('Digite seu primeiro nome: ');
  readln(nome);
  write('Digite o dia em que nasceu (DD): ');
  readln(dia);
  write('Digite o mes em que nasceu (MM): ');
  readln(mes);
  write('Digite o ano em que nasceu (AAAA): ');
  readln(ano);
  writeln;
  writeln;
  delay(1000);
  writeln('Obrigado pelos dados!');
  delay(2000);
end;

procedure boot;
begin
  if(nome='')then
   leitura
  else
   begin
    writeln('Novo desafiante? S/N');
    cmd:=readkey;
    case cmd of
      //tecla 's' pressionada;
      #83,#115 : leitura;
      //tecla 'n' pressionada;
      #78,#110 : inicio;
      else
       begin
        writeln('Opcao invalida!');
        delay(1000);
        boot;
       end;
    end;
   end;
  inicio;
end;

{$R *.res}

begin
  //palavras e suas dicas correspondentes
  //animais
  pfa[1]:='gato';         dicafa[1]:='domestico';
  pfa[2]:='vaca';         dicafa[2]:='fazenda';
  pfa[3]:='anta';         dicafa[3]:='floresta';
  pfa[4]:='iguana';       dicafa[4]:='reptil';
  pfa[5]:='abelha';       dicafa[5]:='mel';
  pma[1]:='capivara';     dicama[1]:='roedor';
  pma[2]:='lagarto';      dicama[2]:='reptil';
  pma[3]:='tamandua';     dicama[3]:='lingua';
  pma[4]:='lemure';       dicama[4]:='Madagascar';
  pma[5]:='borboleta';    dicama[5]:='fragil, delicada';
  pda[1]:='ornitorrinco'; dicada[1]:='evolucao';
  pda[2]:='rinoceronte';  dicada[2]:='chifre';
  pda[3]:='equidna';      dicada[3]:='espinhos';
  pda[4]:='salamandra';   dicada[4]:='reptil';
  pda[5]:='uirapuru';     dicada[5]:='ave';
  desa:='gnu';            dicadesa:='Richard Stallman';

  //frutas
  pff[1]:='banana';       dicaff[1]:='pintas';
  pff[2]:='pequi';        dicaff[2]:='espinhos';
  pff[3]:='manga';        dicaff[3]:='a queridinha do DF';
  pff[4]:='figo';         dicaff[4]:='comido em calda ou seco';
  pff[5]:='jambo';        dicaff[5]:='moreno';
  pmf[1]:='tomate';       dicamf[1]:='molhos';
  pmf[2]:='graviola';     dicamf[2]:='jaca do Para';
  pmf[3]:='pitaia';       dicamf[3]:='cacto';
  pmf[4]:='carambola';    dicamf[4]:='estrela';
  pmf[5]:='damasco';      dicamf[5]:='comido "in natura" ou seco';
  pdf[1]:='lichia';       dicadf[1]:='exotica';
  pdf[2]:='feijoa';       dicadf[2]:='"goiaba-serrana"';
  pdf[3]:='jenipapo';     dicadf[3]:='da em arvores que chegam a 20m de altura';
  pdf[4]:='maracuja';     dicadf[4]:='azedo';
  pdf[5]:='jabuticaba';   dicadf[5]:='vinho';
  desf:='marula';         dicadesf:='o espirito da Africa, canhoeiro';

  //caes
  pfc[1]:='poodle';       dicafc[1]:='madame';
  pfc[2]:='dalmata';      dicafc[2]:='101';
  pfc[3]:='collie';       dicafc[3]:='Lassie';
  pfc[4]:='fila';         dicafc[4]:='brasileiro';
  pfc[5]:='maltes';       dicafc[5]:='Malta';
  pmc[1]:='shiba';        dicamc[1]:='japones';
  pmc[2]:='basset';       dicamc[2]:='salsicha';
  pmc[3]:='buldogue';     dicamc[3]:='toureiro';
  pmc[4]:='schnauzer';    dicamc[4]:='cavanhaque';
  pmc[5]:='labrador';     dicamc[5]:='guia';
  pdc[1]:='pinscher';     dicadc[1]:='pequeno';
  pdc[2]:='canaa';        dicadc[2]:='da terra santa';
  pdc[3]:='weimaraner';   dicadc[3]:='pelo curto cinza e olhos claros';
  pdc[4]:='shihtzu';      dicadc[4]:='Tibete';
  pdc[5]:='rottweiler';   dicadc[5]:='forte, de guarda e pastoreio';
  desc:='corgi';          dicadesc:='o cao da realeza';

  //dificuldade padrao: moderada
  dfc:='moderada';
  //modo padrao: animais
  modo:='animais';
  boot;
end.
