Program tiket;
const
     max=16;
var
   c,c1,c2,unk,uk,cnk,n,k:integer;
   ulog:real;
   naziv: array [1..max] of string;
   br: array [0..max] of integer;
   kota,kot: array [0..max] of real;

procedure prazan_red(i:integer);
var
   j:integer;
begin
     for j:=1 to i do
         writeln;
end;

procedure razmak(i:integer);
var
   j:integer;
begin
     for j:=1 to i do
         write(' ');
end;

procedure unos_;
var
   i:integer;
begin
     n:=0;
     while (n<=0) or (n>max) do
        begin
             writeln;
             write('Unesi broj parova: ');
             readln(n);
             if (n<=0) or (n>max) then
                begin
                     writeln;
                     writeln('Ponovi unos!');
                     writeln;
                end;
        end;
      for i:=0 to n do
         kota[i]:=1;
     writeln;
     writeln('Unesi nazive parova: ');
     for i:=1 to n do
         begin
              write(i,'. ');
              readln(naziv[i]);
         end;
     writeln;
     writeln('Unesi kvote parova: ');
     for i:=1 to n do
          while (kota[i]<=1) do
                begin
                     write(i,'. ',naziv[i],' ');
                     razmak(30-length(naziv[i]));
                     readln(kota[i]);
                     if kota[i]<=1 then
                        begin
                             writeln;
                             writeln('Ponovi unos!');
                             writeln;
                        end;
                end;
     prazan_red(4);
     unk:=1;
     uk:=0;
end;

procedure unos_kote;
var
   i:integer;
begin
     n:=0;
     while (n<=0) or (n>max) do
        begin
             writeln;
             write('Unesi broj parova: ');
             readln(n);
             if (n<=0) or (n>max) then
                begin
                     writeln;
                     writeln('Ponovi unos!');
                     writeln;
                end;
        end;
     for i:=0 to n do
         kota[i]:=1;
     writeln;
     writeln('Unesi kvote parova: ');
     for i:=1 to n do
          while (kota[i]<=1) do
                begin
                     write(i,'. ');
                     readln(kota[i]);
                     if kota[i]<=1 then
                        begin
                             writeln;
                             writeln('Ponovi unos!');
                             writeln;
                        end;
                end;
     prazan_red(4);
     uk:=1;
     unk:=0;
end;

procedure kombinacija(n_:integer; k_:integer);
var
   i_,br,im:integer;
begin
    if k_>(n_ div 2) then
       k_:=n_-k_;
    br:=1;
    im:=1;
    for i_:=n_-k_+1 to n_ do
        br:=br*i_;
    for i_:=1 to k_ do
        im:=im*i_;
    cnk:=br div im;
end;

procedure ispis;
var
   i:integer;
begin
     writeln;
     if unk=1 then
        for i:=1 to n do
            begin
                 write(i,'. ',naziv[i]);
                 razmak(30-length(naziv[i]));
                 writeln(trunc(kota[i]),'.',trunc(frac(kota[i])*100));
            end;
     if uk=1 then
        for i:=1 to n do
            writeln(i,'. ',trunc(kota[i]),'.',trunc(frac(kota[i])*100));
     prazan_red(4);
end;

procedure broj_kombinacija;
begin
     k:=0;
     while (k<=0) or (k>n) do
           begin
                writeln;
                write('Unesi na koliko se od ',n,' parova kladis: ');
                readln(k);
                if (k<=0) or (k>n) then
                   begin
                        writeln;
                        writeln('Ponovi unos!');
                        writeln;
                   end else
                       begin
                            kombinacija(n,k);
                            writeln;
                            writeln('Broj kombinacija je ',cnk,'.');
                       end;
           end;
     writeln;
     writeln('Da bi bio/la u dobitku u bilo kom slucaju kad si pogodio/la bar jednu ',k,'-torku');
     write('minimalna kvota koju treba da uneses je ',trunc(exp((1/k)*ln(cnk))),'.');
     writeln(round(frac(exp((1/k)*ln(cnk)))*100),'.');
     prazan_red(4);
end;

function koeficijent(l1:integer; l2:integer; l3:integer; l:integer):real;
var
   i:integer;
   hi:array [1..max] of integer;
begin
     if l3=0 then
        koeficijent:=1 else
                       if l1=k+1 then
                          koeficijent:=kota[br[l2]] else
                                         begin
                                              for i:=1 to max do
                                                  hi[i]:=0;
                                              if l2+1<=l-(k-l1) then
                                                 for i:=l2+1 to l-(k-l1) do
                                                     hi[i]:=1;
                                              koeficijent:=kota[br[l2]]*( hi[1]*koeficijent(l1+1,1,hi[1],l)+
                                                                          hi[2]*koeficijent(l1+1,2,hi[2],l)+
                                                                          hi[3]*koeficijent(l1+1,3,hi[3],l)+
                                                                          hi[4]*koeficijent(l1+1,4,hi[4],l)+
                                                                          hi[5]*koeficijent(l1+1,5,hi[5],l)+
                                                                          hi[6]*koeficijent(l1+1,6,hi[6],l)+
                                                                          hi[7]*koeficijent(l1+1,7,hi[7],l)+
                                                                          hi[8]*koeficijent(l1+1,8,hi[8],l)+
                                                                          hi[9]*koeficijent(l1+1,9,hi[9],l)+
                                                                          hi[10]*koeficijent(l1+1,10,hi[10],l)+
                                                                          hi[11]*koeficijent(l1+1,11,hi[11],l)+
                                                                          hi[12]*koeficijent(l1+1,12,hi[12],l)+
                                                                          hi[13]*koeficijent(l1+1,13,hi[13],l)+
                                                                          hi[14]*koeficijent(l1+1,14,hi[14],l)+
                                                                          hi[15]*koeficijent(l1+1,15,hi[15],l)+
                                                                          hi[16]*koeficijent(l1+1,16,hi[16],l));
                                         end;
end;

procedure zamjena(i:integer; j:integer);
var
   t:real;
begin
     t:=kot[i];
     kot[i]:=kot[j];
     kot[j]:=t;
end;

procedure ulog_u_KM;
begin
     ulog:=0;
     while ulog<=0 do
           begin
                writeln;
                write('Unesi ulog u KM: ');
                readln(ulog);
                if ulog<=0 then
                   begin
                        writeln;
                        writeln('Ponovi unos!');
                        writeln;
                   end;
           end;
     prazan_red(4);
end;

procedure dobitak;
var
   i:integer;
   p:real;
begin
     p:=ulog;
     for i:=1 to n do
         p:=p*kota[i];
     writeln;
     if ulog<>0 then
        begin
             write('Dobitak na ulog ',trunc(ulog),' KM i ',round(frac(ulog)*100),' pf je ');
             writeln(trunc(p),' KM i ',round(frac(p)*100),' pf.');
        end;
     if p<ulog then
        begin
             writeln;
             writeln('U gubitku si ',trunc(ulog-p),' KM i ',round(frac(ulog-p)*100),' pf!');
             writeln;
        end;
     prazan_red(4);
end;

procedure min_dobitak;
var
   i,j:integer;
   p:real;
begin
     for i:=1 to n do
         kot[i]:=kota[i];
     for i:=1 to n-1 do
         for j:=i to n do
             if kot[i]>kot[j] then
                zamjena(i,j);
     p:=ulog/cnk;
     for i:=1 to k do
         p:=p*kot[i];
     writeln;
     write('Minimalan dobitak na ulog ',trunc(ulog),' KM i ',round(frac(ulog)*100),' pf je ',trunc(p),' KM i ');
     writeln(round(frac(p)*100),' pf.');
     if p<ulog then
        begin
             writeln;
             writeln('U gubitku si ',trunc(ulog-p),' KM i ',round(frac(ulog-p)*100),' pf!');
             writeln;
        end;
     prazan_red(4);
end;

procedure max_dobitak;
var
   i,j:integer;
   s:real;
begin
     for i:=0 to n do
         br[i]:=i;
     s:=koeficijent(1,0,1,n)*(ulog/cnk);
     writeln;
     write('Maksimalan dobitak na ulog ',trunc(ulog),' KM i ',round(frac(ulog)*100));
     writeln(' pf je ',trunc(s),' KM i ',round(frac(s)*100),' pf.');
     if s<ulog then
        begin
             writeln;
             writeln('U gubitku si ',trunc(ulog-s),' KM i ',round(frac(ulog-s)*100),' pf!');
             writeln;
        end;
     prazan_red(4);
end;

procedure eventualni_dobitak;
var
   i,j,pom,pom1:integer;
   s:real;
begin
     writeln;
     writeln('Unesi brojeve parova za koje pretpostavljas da si pogodio/la');
     writeln('( unesi 0 za kraj unosa ):');
     writeln;
     pom:=0;
     pom1:=0;
     br[0]:=0;
     for i:=1 to n do
         br[i]:=-1;
     i:=1;
     while i<>0 do
           begin
                while ((br[i]<0) or (br[i]>n)) and (i<>0) do
                      begin
                           write(i,'. ');
                           readln(br[i]);
                           j:=i;
                           if (br[i]<0) or (br[i]>n) then
                              begin
                                   writeln;
                                   writeln('Ponovi unos!');
                                   writeln;
                                   i:=i-1;
                              end;
                           pom1:=i;
                           if j>1 then
                              for i:=1 to j-1 do
                                  if br[i]=br[j] then
                                     begin
                                          writeln;
                                          writeln('Ponovi unos!');
                                          writeln;
                                          br[j]:=-1;
                                          pom:=1;
                                     end;
                           i:=pom1;
                           pom1:=0;
                           if pom=1 then
                              i:=i-1;
                           pom:=0;
                           i:=i+1;
                           if i>n then
                              i:=0;
                           if br[j]=0 then
                              begin
                                   i:=0;
                                   j:=j-1;
                              end;
                      end;
           end;
     if j>=k then
        s:=koeficijent(1,0,1,j)*(ulog/cnk) else
                                           s:=0;
     writeln;
     write('U tom slucaju dobitak na ulog ',trunc(ulog),' KM i ',round(frac(ulog)*100));
     writeln(' pf je ',trunc(s),' KM i ',round(frac(s)*100),' pf.');
     if s<ulog then
        begin
             writeln;
             writeln('U gubitku si ',trunc(ulog-s),' KM i ',round(frac(ulog-s)*100),' pf!');
             writeln;
        end;
     prazan_red(4);
end;

procedure unos;
begin
     c1:=0;
     while (c1<>3) do
           begin
                writeln;
                writeln('    1. UNOS');
                writeln('    2. UNOS KVOTA');
                writeln('    3. NAZAD');
                prazan_red(7);
                write('Izaberi opciju: ');
                read(c1);
                prazan_red(45);
                if c1=1 then
                   unos_;
                if c1=2 then
                   unos_kote;
           end;
end;

procedure sistemi;
begin
     c2:=0;
     while c2<>5 do
           begin
                writeln;
                writeln('    1. BROJ KOMBINACIJA');
                writeln('    2. MINIMALAN DOBITAK');
                writeln('    3. MAKSIMALAN DOBITAK');
                writeln('    4. EVENTUALNI DOBITAK');
                writeln('    5. NAZAD');
                prazan_red(5);
                write('Izaberi opciju: ');
                read(c2);
                prazan_red(45);
                if c2=1 then
                   broj_kombinacija;
                if (c2=2) and (k<>0) and (ulog<>0) then
                   min_dobitak else
                           if (c2=2) and (k=0) then writeln('Nije izvrsen unos klase kombinacija!') else
                              if (c2=2) and (ulog=0) then writeln('Nije unesen ulog!');
                if (c2=3) and (k<>0) and (ulog<>0) then
                   max_dobitak else
                           if (c2=3) and (k=0) then writeln('Nije izvrsen unos klase kombinacija!') else
                              if (c2=3) and (ulog=0) then writeln('Nije unesen ulog!');
                if (c2=4) and (k<>0) and (ulog<>0) then
                   eventualni_dobitak else
                           if (c2=4) and (k=0) then writeln('Nije izvrsen unos klase kombinacija!') else
                              if (c2=4) and (ulog=0) then writeln('Nije unesen ulog!');
           end;
end;

procedure tiket_;
begin
     unk:=0;
     uk:=0;
     ulog:=0;
     n:=0;
     k:=0;
     c:=0;
     while (c<>6) do
           begin
                writeln;
                writeln('    1. UNOS');
                writeln('    2. ULOG');
                writeln('    3. DOBITAK');
                writeln('    4. SISTEMI');
                writeln('    5. ISPIS');
                writeln('    6. KRAJ PROGRAMA');
                prazan_red(4);
                write('Izaberi opciju: ');
                read(c);
                prazan_red(45);
                if c=1 then
                   unos;
                if c=2 then
                   ulog_u_KM;
                if (c=3) and (n<>0) and (ulog<>0) then
                   dobitak else
                           if (c=3) and (n=0) then writeln('Nije izvrsen unos!')
                              else if (c=3) and (n<>0) and (ulog=0) then
                                   writeln('Nije unesen ulog!');
                if (c=4) and (n<>0) then
                   sistemi else
                           if (c=4) and (n=0) then writeln('Nije izvrsen unos!');
                if (c=5) and (n<>0) then
                   ispis else
                           if (c=5) and (n=0) then writeln('Nije izvrsen unos!');
           end;
end;

begin
        tiket_;
end.
