program kombinacije;
const
     max=16;
var
   k,n,c:integer;
   cnk:longint;
   mu:real;

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

procedure kombinacija(n_:integer; k_:integer);
var
   i_:integer;
   br,im:longint;
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

procedure broj_kombinacija;
begin
     n:=0;
     while (n<=0) or (n>max) do
           begin
                writeln;
                write('Unesi broj elemenata: ');
                readln(n);
                if (n<=0) or (n>max) then
                   begin
                        writeln;
                        writeln('Ponovi unos!');
                        writeln;
                   end;
           end;
     k:=0;
     while (k<=0) or (k>n) do
           begin
                writeln;
                write('Unesi broj klase: ');
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
                            writeln('Broj kombinacija od ',n,' elemenata ',k,'-te klase je ',cnk,'.');
                       end;
           end;
     prazan_red(4);
end;

procedure min_kvota;
begin
     writeln;
     writeln('Da bi bio/la u dobitku u bilo kom slucaju kad si pogodio/la bar jednu ',k,'-torku');
     write('od ',n,' parova minimalna kvota koju treba da uneses je ',trunc(exp((1/k)*ln(cnk))),'.');
     writeln(round(frac(exp((1/k)*ln(cnk)))*100),'.');
     prazan_red(4);
end;

procedure min_ul_po_ko;
begin
     mu:=0;
     while mu<=0 do
           begin
                writeln;
                write('Unesi minimalan ulog po kombinaciji: ');
                readln(mu);
                writeln;
                if mu<=0 then
                   begin
                        writeln;
                        writeln('Ponovi unos!');
                        writeln;
                   end;
           end;
     prazan_red(4);
end;

procedure min_ulog;
begin
     writeln;
     writeln('Minimalan ulog koji treba da uneses kada se kladis na kombinacije ',k,'-te klase ');
     writeln('od ',n,' parova je ',trunc(mu*cnk),' KM i ',round(frac(mu*cnk)*100),' pf.');
     prazan_red(4);
end;

function br_cif(i:integer):integer;
var
   b,d,j:integer;
begin
     b:=0;
     d:=1;
     j:=1;
     if i=0 then
        b:=1 else
             while (j<>0) do
                   begin
                        if b<>0 then
                           d:=d*10;
                        if d<=i then
                           b:=b+1 else
                                  j:=0;
                   end;
     br_cif:=b;
end;

procedure prikaz_tabela;
var
   i,j:integer;
   mk:real;
begin
     writeln;
     write('Broj elem.');
     razmak(5);
     write('Broj klase');
     razmak(5);
     write('Broj komb.');
     razmak(5);
     write('Min. kvota');
     razmak(5);
     writeln('Min. ulog');
     writeln;
     for i:=1 to max do
         begin
              for j:=1 to i do
                  begin
                       write(i);
                       if i<10 then
                          razmak(14) else
                                     razmak(13);
                       write(j);
                       if j<10 then
                          razmak(14) else
                                     razmak(13);
                       kombinacija(i,j);
                       write(cnk);
                       razmak(15-br_cif(cnk));
                       mk:=exp((1/j )*ln(cnk));
                       write(trunc(mk),'.',round(frac(mk)*100));
                       razmak(14-br_cif(trunc(mk))-br_cif(round(frac(mk)*100)));
                       write(trunc(mu*cnk),' KM i ',round(frac(mu*cnk)*100));
                       writeln(' pf');
                       writeln;
                  end;
         writeln;
         readln;
         writeln;
         end;
     prazan_red(4);
end;

begin
     n:=0;
     mu:=0;
     while (c<>6) do
           begin
                writeln;
                writeln('    1. BROJ KOMBINACIJA');
                writeln('    2. MINIMALNA KVOTA');
                writeln('    3. MINIMALAN ULOG PO KOMBINACIJI');
                writeln('    4. MINIMALAN ULOG');
                writeln('    5. PRIKAZ TABELA');
                writeln('    6. KRAJ PROGRAMA');
                prazan_red(7);
                write('Izaberi opciju: ');
                read(c);
                prazan_red(50);
                if (c=1) then
                   broj_kombinacija;
                if (c=2) and (n<>0) then
                   min_kvota else
                             if (c=2) and (n=0) then
                                begin
                                     writeln;
                                     writeln('Nije unesen broj elemenata i broj klase kombinacija!');
                                     writeln;
                                end;
                if c=3 then
                   min_ul_po_ko;
                if (c=4) and (n<>0) then
                   min_ulog else
                             if (c=4) and (n=0) then
                                begin
                                     writeln;
                                     writeln('Nije unesen broj elemenata i broj klase kombinacija!');
                                     writeln;
                                end else
                                    if (c=4) and (mu =0) then
                                       begin
                                            writeln;
                                            writeln('Nije unesen minimalan ulog po kombinaciji!');
                                            writeln;
                                       end;
                if (c=5) and (mu<>0) then
                   prikaz_tabela else
                                 if (c=5) and (mu=0) then
                                    begin
                                         writeln;
                                         writeln('Nije unesen minimalan ulog po kombinaciji!');
                                         writeln;
                                    end;
           end;
end.