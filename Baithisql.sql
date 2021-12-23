create database baithighksql
use baithighksql
create table Linhkien(
	Malk char(4),
	Tenlk nvarchar(10),
	Giasx numeric(6,1),
	primary key(Malk)
)
go
create table Sudunglk(
	Malk char(4),
	Masp char(3),
	Soluong int,
	primary key(Malk,Masp)
)
go
create table Loaisp(
	Maloai char(2),
	Tensp Nvarchar(10),
	primary key(Maloai)
)
create table Sanpham(
	Masp char(3),
	Maloai char(2),
	Tensp nvarchar(20),
	Giasp numeric(8,1),
	primary key(Masp)
)
go
create table Chitietdathang(
	Sohoadon char(4),
	Masp char(3),
	Soluong int,
	primary key(Sohoadon,Masp)
)
go
create table Hoadonnhap(
	Sohoadon char(4),
	Ngaygiaohang date,
	Ngaydathang date,
	Macuahang char(2),
	Manv char(2),
	primary key(Sohoadon)
)
go
create table Kho(
	Masp char(3),
	Macuahang char(2),
	Soluong int,
	primary key(Masp,Macuahang)
)
go
create table Cuahang(
	Macuahang char(2),
	Sofax char(5),
	Diadiem nvarchar(35),
	Tencuahang nvarchar(20),
	primary key(Macuahang)
)
go
create table Nhanvien(
	Manv char(2),
	Hoten nvarchar(30),
	Phai nvarchar(4) CHECK(Phai IN (N'NAM',N'NỮ')),
	Sdt char(11),
	Diachi nvarchar(35),
	Luongcb numeric(7,1),
	Macuahang char(2),
	primary key(Manv)
)
go
create table Chitietbanhang(
	Sohoadon char(4),
	Masp char(3),
	Soluong int,
	primary key(Sohoadon,Masp)
)
go
create table Hoadonban(
	Sohoadon char(4),
	Macuahang char(2),
	Manv char(2),
	Makh char(4),
	Ngaymua date,
	primary key(Sohoadon)
)
go
create table Khachhang(
	Makh char(4),
	Tenkh nvarchar(10),
	Diachi nvarchar(35),
	Sdt char(11),
	primary key(Makh)
)
go

ALTER TABLE Sudunglk
ADD CONSTRAINT ketnoi
FOREIGN KEY  (Malk)
REFERENCES  Linhkien(Malk)
GO
ALTER TABLE Sudunglk
ADD CONSTRAINT ketnoi1
FOREIGN KEY  (Masp)
REFERENCES  Sanpham(Masp)
GO
ALTER TABLE Chitietdathang
ADD CONSTRAINT ketnoi2
FOREIGN KEY  (Masp)
REFERENCES  Sanpham(Masp)
GO
ALTER TABLE Chitietdathang
ADD CONSTRAINT ketnoi3
FOREIGN KEY  (Sohoadon)
REFERENCES  Hoadonnhap(Sohoadon)
GO

ALTER TABLE Hoadonnhap
ADD CONSTRAINT ketnoi4
FOREIGN KEY  (Manv)
REFERENCES  Nhanvien(Manv)
GO

ALTER TABLE Hoadonnhap
ADD CONSTRAINT ketnoi5
FOREIGN KEY  (Macuahang)
REFERENCES  Cuahang(Macuahang)
GO

ALTER TABLE Nhanvien
ADD CONSTRAINT ketnoi6
FOREIGN KEY  (Macuahang)
REFERENCES  Cuahang(Macuahang)
GO

ALTER TABLE Hoadonban
ADD CONSTRAINT ketnoi7
FOREIGN KEY  (Manv)
REFERENCES  Nhanvien(Manv)
GO

ALTER TABLE Hoadonban
ADD CONSTRAINT ketnoi8
FOREIGN KEY  (Makh)
REFERENCES  Khachhang(Makh)
GO
ALTER TABLE Chitietbanhang
ADD CONSTRAINT ketnoi9
FOREIGN KEY  (Sohoadon)
REFERENCES  Hoadonban(Sohoadon)
GO
ALTER TABLE Chitietbanhang
ADD CONSTRAINT ketnoi10
FOREIGN KEY  (Masp)
REFERENCES  Sanpham(Masp)
GO
ALTER TABLE Kho
ADD CONSTRAINT ketnoi11
FOREIGN KEY  (Masp)
REFERENCES  Sanpham(Masp)
GO
ALTER TABLE Kho
ADD CONSTRAINT ketnoi12
FOREIGN KEY  (Macuahang)
REFERENCES  Cuahang(Macuahang)
GO
ALTER TABLE Sanpham
ADD CONSTRAINT ketnoi13
FOREIGN KEY  (Maloai)
REFERENCES  Loaisp(Maloai)
GO
--Nhập loại sp
insert into Loaisp
values('01',N'Bàn'),
	  ('02',N'Ghế'),
	  ('03',N'Tủ'),
	  ('04',N'Giường')
	  go
--Nhập sp
insert into Sanpham
values('001',NULL,N'Bàn bốn chân',1000000),
	 ('002',NULL,N'Bàn ba chân',2000000),
	 ('003',NULL,N'Bàn ăn',3000000),
	 ('004',NULL,N'Bàn uống trà',1500000),
	 ('005',NULL,N'Ghế sofa',2000000),
	 ('006',NULL,N'Ghế gỗ',2500000),
	 ('007',NULL,N'Tủ gỗ',3000000),
	 ('008',NULL,N'Tủ điêu khắc',5000000),
	 ('009',NULL,N'Giường ',4000000)
	 go
--Nhập lk
insert into Linhkien
values('001',N'Đinh',10000),
	  ('002',N'Vít',15000),
	  ('003',N'Óc',5000),
	  ('004',N'Con tán',20000)
	  go
--Nhập Sử dụng lk
insert into Sudunglk
values('001','001',20),
	  ('002','002',25),
	  ('004','003',22),
	  ('002','003',21),
	  ('001','004',27),
	  ('001','005',29),
	  ('001','006',28),
	  ('003','007',30),
	  ('002','009',35),
	  ('001','009',30),
	  ('003','009',35),
	  ('002','005',35)
	  go
--Nhập Cửa hàng
insert into Cuahang
values('01','03058',N'HỒ CHÍ MINH',N'MT'),
	  ('02','03158',N'HÀ NỘI',N'MT2'),
	  ('03','03258',N'CẦN THƠ ',N'MT3'),
	  ('04','03358',N'HẬU GIANG',N'MT4'),
	  ('05','03458',N'TIỀN GIANG',N'MT5'),
	  ('06','03558',N'CÀ MAU',N'MT6')
go
--Nhập Kho
insert into Kho
values('001','01',20),
	  ('002','02',22),
	  ('003','01',35),
	  ('004','03',50),
	  ('005','04',25),
	  ('006','04',22),
	  ('007','05',29),
	  ('008','05',30),
	  ('009','06',33)
	  GO
--Nhập Nhân viên
insert into Nhanvien
values('01',N'Nguyễn Hùng',N'Nam','0881321043',N'25 Lạc Long Quân,Q.10,TPHCM',200000,'01'),
	  ('02',N'Nguyễn Ánh',N'Nữ','0781381043',N'2 Nguyễn Trãi,Q5,TPHCM',450000,'04'),
	  ('03',N'Bùi Nguyên',N'Nam','0781671043',N'23 Trần Não,An Phú,TPHCM',400000,'03'),
	  ('04',N'Trần Hương',N'Nữ','0785521043',N'221 Hùng Vương,Q.5,TPHCM',100000,'05'),
	  ('05',N'Trọng Trường',N'Nam','0734321043',N'22 Lý Thường Kiệt,TPMỹ Tho',500000,'05'),
	  ('06',N'Trần Hoàng',N'Nam','0781241043',N'25 Nguyễn Xí,Q.Bình Thạnh,TPHCM',250000,'02'),
	  ('07',N'Nguyễn An',N'Nam','0781421043',N'23 Trần Hưng Đạo,Q5,TPHCM',300000,'06')
	  go
--Nhập Hóa đơn nhập
insert into Hoadonnhap
values('0001','11/1/2020','10/1/2020','01','01'),
	  ('0002','12/5/2020','11/5/2020','02','02'),
	  ('0003','05/1/2020','04/1/2020','03','06'),
	  ('0004','02/20/2020','01/20/2020','04','04'),
	  ('0005','01/11/2020','01/11/2020','05','05'),
	  ('0006','10/22/2020','10/22/2020','06','07'),
	  ('0007','05/05/2020','04/05/2020','01','01')
	  go
--Nhập Chi tiết đặt hàng( nhập)
insert into Chitietdathang
values('0001','001',20),
	  ('0002','003',21),
	  ('0003','004',10),
	  ('0004','005',15),
	  ('0005','006',1),
	  ('0006','009',5),
	  ('0007','001',10)
	  go
--Nhập Khách hàng 
insert into Khachhang
values('001',N'Hùng',N'TPHCM','0892552409'),
	  ('002',N'Hiếu',N'TPHCM','0892412979'),
	  ('003',N'Hậu',N'TP HẬU Giang','0892412809'),
	  ('004',N'Thiện',N'TP VĨNH LONG','0892232409'),
	  ('005',N'Nhiên',N'TP CÀ MAU','0892467409'),
	  ('006',N'Hải',N'TP HÀ NỘI','0892445409')
	  go
--Nhập Hóa đơn bán
insert into Hoadonban
values('0001','01','07','001','05/15/2020'),
	  ('0002','01','06','002','06/10/2020'),
	  ('0003','02','05','003','09/11/2020'),
	  ('0004','04','04','004','08/02/2020'),
	  ('0005','05','04','005','06/04/2020'),
	  ('0006','06','02','006','07/05/2020'),
	  ('0007','01','01','001','09/05/2020'),
	  ('0008','02','05','004','07/05/2020'),
	  ('0009','05','05','006','07/05/2020')
	  go
--Nhập Chi tiết bán hàng 
insert into Chitietbanhang
values('0001','001',1),
	  ('0002','003',2),
	  ('0003','002',3),
	  ('0004','005',5),
	  ('0005','007',1),
	  ('0006','009',7),
	  ('0007','001',2),
	  ('0008','002',7),
	  ('0009','008',3)
	  go
--update Sanpham
update Sanpham
set Maloai='01' where  Masp='001'
go
update Sanpham
set Maloai='01' where  Masp='002'
go
update Sanpham
set Maloai='01' where  Masp='003'
go
update Sanpham
set Maloai='01' where  Masp='004'
go
update Sanpham
set Maloai='02' where  Masp='005'
go
update Sanpham
set Maloai='02' where  Masp='006'
go
update Sanpham
set Maloai='03' where  Masp='007'
go
update Sanpham
set Maloai='03' where  Masp='008'
go
update Sanpham
set Maloai='04' where  Masp='009'
go
--Chọn Bảng
select * from Kho
select * from Sanpham
select * from Sudunglk
select * from Hoadonban
select * from Hoadonnhap
select * from Linhkien
select * from Loaisp
select * from Cuahang
select * from Khachhang
select * from Nhanvien
select * from Chitietbanhang
select * from Chitietdathang

--30 câu sql

--Câu 1: Cho biết tất cả nhân viên là Nam
select Hoten,Phai
from Nhanvien
where Phai = N'Nam'
go
--Câu 2: Cho biết tên nhân viên có họ Nguyễn và có lương cơ bản trên 200000
select Hoten
from Nhanvien
where  (Hoten like N'Nguyễn%') and (Luongcb>200000) 
go
--Câu 3: Cho biết các loại bàn và giá sx từng loại bàn
select sp.Tensp,sp.Giasp
from Sanpham sp,Loaisp lsp
where sp.Maloai=lsp.Maloai and lsp.Tensp=N'Bàn'
go
--Câu 4: Cho biết tổng số nhân viên và tổng lương cơ bản của tất cả nhân viên và lương trung bình
select COUNT(Hoten) Soluongnv, SUM(Luongcb) Tongluong, AVG(Luongcb) Luongtb
from Nhanvien
go
--Câu 5: Cho biết thông tin các nhân viên làm ở cửa hàng MT5
select nv.*
from Nhanvien nv,Cuahang ch
where nv.Macuahang=ch.Macuahang and Tencuahang=N'MT5'
--Câu 6: Cho biết tên các loại sản phẩm và số lượng sản phẩm thuộc loại đó
select lsp.Tensp,COUNT(sp.Tensp) Soluongsp
from Sanpham sp, Loaisp lsp
where sp.Maloai=lsp.Maloai
group by lsp.Tensp
--Câu 7: Cho biết loại sản phẩm nào có trên 3 sp
select lsp.Tensp
from Loaisp lsp
where 3<
(
	select COUNT(sp.Tensp)
	from Sanpham sp
	where lsp.Maloai=sp.Maloai
)
--Câu 8: Cho biết tổng cộng có bao nhiêu linh kiện
select COUNT(lk.Tenlk) Tonglk
from Linhkien lk
--Câu 9: Cho biết mức lương cao nhất trong nhân viên
select MAX(Luongcb) Luongcaonhat
from Nhanvien 
--Câu 10: Cho biết thông tin nhân viên đang quản lý cửa hàng nào
select nv.*,ch.Tencuahang
from Nhanvien nv, Cuahang ch
where nv.Macuahang = ch.Macuahang
--Câu 11: Cho biết nhân viên nào có lương lớn hơn Nguyễn Ánh
select nv1.Hoten,nv1.Luongcb
from Nhanvien nv1, Nhanvien nv2
where nv1.Luongcb>nv2.Luongcb and nv2.Hoten=N'Nguyễn Ánh' and nv1.Manv!=nv2.Manv
--Câu 12: Cho biết những nhân viên không quản lý hóa đơn nhập nào cả
select nv.Hoten,nv.Manv
from Nhanvien nv
where nv.Manv Not in 
(
	select hdn.Manv
	from Hoadonnhap hdn
)
--Câu 13: Cho biết ngày đặt hàng, giao hàng tới của từng cửa hàng 
select ch.Tencuahang,hdn.Ngaydathang,hdn.Ngaygiaohang
from Hoadonnhap hdn, Cuahang ch
where hdn.Macuahang=ch.Macuahang
--Câu 14: Cho biết tổng số lượng sản phẩm có trong kho 
select SUM(Soluong) as "Tong so sp"
from Kho
--Câu 15: Cho biết các loại sản phẩm có trong kho và số lượng từng sản phẩm tại cửa hàng có địa điểm là Hồ Chí Minh
select sp.Tensp, k.Soluong
from Kho k,Sanpham sp
where k.Masp=sp.Masp and k.Macuahang=
(
	select ch.Macuahang
	from Cuahang ch
	where ch.Diadiem=N'HỒ CHÍ MINH'
)
--Câu 16: Cho biết khách hàng Hùng mua sản phẩm nào và số lượng là bao nhiêu
select sp.Tensp,ctbh.Soluong
from Sanpham sp,Chitietbanhang ctbh
where sp.Masp=ctbh.Masp and ctbh.Sohoadon in
(
	select hdb.Sohoadon
	from Hoadonban hdb,Khachhang kh
	where hdb.Makh=kh.Makh and kh.Tenkh=N'Hùng'
)
--Câu 17: Cho biết tên cửa hàng bán sản phẩm cho khách hàng tên là Hải
select ch.Tencuahang
from Cuahang ch,Kho k
where ch.Macuahang=k.Macuahang and k.Masp in
(
	select sp.Masp
	from Sanpham sp,Chitietbanhang ctbh
	where sp.Masp=ctbh.Masp and ctbh.Sohoadon in
	(
		select hdb.Sohoadon
		from Hoadonban hdb,Khachhang kh
		where  hdb.Makh=kh.Makh and kh.Tenkh=N'Hải'
	)
)
--Câu 18: Cho biết tên sản phẩm và sản phẩm đó sử dụng loại linh kiện nào
select sp.Tensp,lk.Tenlk
from Sanpham sp,Linhkien lk,Sudunglk sdlk
where lk.Malk=sdlk.Malk and sdlk.Masp=sp.Masp
--Câu 19: Cho biết những linh kiện để sản xuất ra được 1 cái bàn
select distinct lk.Tenlk, lk.Malk,slk.Soluong
from Linhkien lk,Sudunglk slk
where lk.Malk=slk.Malk and slk.Masp in
(
	select  sp.Masp
	from Sanpham sp,Loaisp lsp
	where sp.Maloai=lsp.Maloai and lsp.Tensp=N'Bàn'
)
--Câu 20: Cho biết tổng giá sản phẩm của loại sản phẩm là bàn 
select SUM(sp.Giasp) 'Tong gia san pham'
from Sanpham sp, Loaisp lsp
where sp.Maloai=lsp.Maloai and lsp.Tensp=N'Bàn'
--Câu 21: Cho biết những sản phẩm mà cửa hàng đã đặt vào trong khoảng thời gian 01/01/2020 cho tới 01/31/2020
select sp.Tensp
from Sanpham sp,Chitietdathang ctdh
where sp.Masp=ctdh.Masp and ctdh.Sohoadon in
(
	select hdn.Sohoadon
	from Cuahang ch,Hoadonnhap hdn
	where hdn.Macuahang=ch.Macuahang and hdn.Ngaydathang between '01/01/2020' and '01/31/2020'
)
--Câu 22: Cho biết Thông tin các nhân viên quản lý hóa đơn nhập hàng 
select nv.* ,hdn.Sohoadon
from Nhanvien nv
inner join Hoadonnhap hdn 
on nv.Manv=hdn.Manv
--Câu 22: Sắp xếp lương cơ bản theo mức giảm dần của nhân viên 
select * from Nhanvien
order by Luongcb desc
--Câu 23: Cho biết nhân viên nào phụ trách quản lý bán loại sản phẩm là bàn và nhân viên đó đã bán hàng cho khách hàng nào
select nv.Hoten 'Tên nv',kh.Tenkh
from Nhanvien nv,Cuahang ch,Khachhang kh,Hoadonban hdb
where nv.Manv=hdb.Manv and hdb.Makh=kh.Makh and nv.Macuahang=ch.Macuahang and ch.Macuahang in
(
	select k.Macuahang
	from Kho k,Sanpham sp
	where k.Masp=sp.Masp and sp.Maloai =
	(
		select lsp.Maloai
		from Loaisp lsp
		where lsp.Tensp=N'Bàn'
	)
)
--Câu 24: Cho biết tổng giá trị của các linh kiện và tổng số lượng các linh kiện của sản phẩm mà khách hàng Hải đã mua
select SUM(lk.Giasx) 'Tong gia sx lk',SUM(slk.Soluong) 'Tong sl lk '
from Linhkien lk,Sudunglk slk
where lk.Malk=slk.Malk and slk.Masp in
(
	select sp.Masp
	from Sanpham sp,Chitietbanhang ctbh
	where sp.Masp=ctbh.Masp and ctbh.Sohoadon in
	(
		select hdb.Sohoadon
		from Hoadonban hdb,Khachhang kh
		where hdb.Makh=kh.Makh and kh.Tenkh=N'Hải'
	)
)
--Câu 25: Đơn đặt hàng nào có số lượng hàng được mua ít nhất
select hdb.Sohoadon,SUM(Soluong) 'Số lượng đặt hàng'
from Hoadonban hdb inner join Chitietbanhang ctbh
on hdb.Sohoadon=ctbh.Sohoadon
group by hdb.Sohoadon
having SUM(Soluong)<=all
(
	select SUM(Soluong)
	from Hoadonban hdb inner join Chitietbanhang ctbh
	on hdb.Sohoadon=ctbh.Sohoadon
	group by hdb.Sohoadon
) 
--Câu 26: Cho biết thông tin nhân viên quản lý đơn hàng của khách hàng nào
select nv.Manv, nv.Hoten,kh.Tenkh
from Nhanvien nv,Hoadonban hdb,Khachhang kh
where nv.Manv=hdb.Manv and hdb.Makh=kh.Makh
order by nv.Manv asc
--Câu 27: Cho biết số lượng linh kiện nào được sử dụng nhiều nhất
select top 1 lk.Tenlk
from Linhkien lk,Sudunglk slk
where lk.Malk=slk.Malk
--Câu 28: Những sản phẩm nào chưa từng được khách hàng đặt mua
select sp.Masp,sp.Tensp
from Sanpham sp
where not exists 
(
	select ctbh.Masp
	from Chitietbanhang ctbh
	where sp.Masp=ctbh.Masp
)
--Câu 29: Giảm 10%lương nhân viên nào không bán được đơn nào cả
update Nhanvien 
set Luongcb=Luongcb *0.1
where not exists 
(
	select Manv
	from Hoadonban
	where Manv=Nhanvien.Manv
)
select*from Nhanvien
--Câu 30: Cho biêt số lượng của những sản phẩm sau khi được khách hàng mua(chỉ những sản phẩm khách hàng đặt mua)
select k.Masp,sp.Tensp,Soluong=k.Soluong-
(
	select SUM(ctbh.Soluong)
	from Chitietbanhang ctbh
	where ctbh.Masp=k.Masp and k.Macuahang =
	(
		select hdb.Macuahang
		from Hoadonban hdb
		where ctbh.Sohoadon=hdb.Sohoadon
	)
)
from Kho k,Sanpham sp
where k.Masp=sp.Masp

