opts = detectImportOptions('Real estate valuation data set.xlsx');
opts.SelectedVariableNames = [3 4 5 8]; %memilih kriteria yang diperlukan
data = readmatrix('Real estate valuation data set.xlsx',opts);

k = [0,0,1,0]; %atribut tiap kriteria,  nilai 1=atrribut benefit, dan 0= atribut cost
w = [3,5,4,1]; %bobot tiap kriteria

w = w./sum(w);  %membagi bobot per kriteria dengan jumlah total bobot


%menghitung vektor(S) per baris
for j=1:4,
    if k(j)==0, w(j)=-1*w(j);
    end;
end;
    for i=1:50,
    S(i)=prod(data(i,:).^w);
end;

V = S/sum(S); %menghitung preferensi/ perangkingan
[m, n] = max([V]); %mencari nilai tertingi (m) dan n untuk index ke berapa

%menampilkan ke command window
nilaitertingi = m
alternatifke = n 