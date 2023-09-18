Create database quanlybanhang;
use quanlybanhang;
create table KhachHang (
	MaKH varchar(4) primary key not null,
    TenKH varchar(30) not null,
    DiaChi varchar(50) null,
    NgaySinh datetime    null,
    Sdt varchar(15) null
);

create table NhanVien (
	MaNV varchar(4) primary key not null ,
    HoTen  varchar(30) not null,
    GioiTinh  bit not null,
    DiaChi varchar(50) not null,
    NgaySinh datetime not null,
    DienThoai varchar(15) null,
    Email text null,
    NoiSinh varchar(20) not null,
    NgayVaoLam datetime null,
    MaNQL varchar(4) null
);
create table NhaCungCap(
	MaNCC varchar(5) primary key not null,
    TenNCC varchar(30) not null,
    DiaChi varchar(50) not null,
    Sdt varchar(15) not null,
    Email varchar(30) not null,
    Webside varchar(30) null
);
create table LoaiSP(
    MaLoaiSP  varchar(4) primary key not null,
    TenLoaiSP varchar(30) not null,
    GhiChu varchar(100) not null
);
create table SanPham(
    MaSP varchar(4) primary key  not null,
    MaLoaiSP  varchar(4)  not null,
    TenSP varchar(50)  not null,
    DonViTinh varchar(10)  not null,
    GhiChu varchar(100) null,
    constraint SanPham_LoaiSP_MaloaiSP_fk
        foreign key (MaLoaiSP) references LoaiSP (MaLoaiSP)
);
create table PhieuNhap(
	SoPN varchar(5) primary key not null,
    MaNV varchar(4) not null,
    MaNCC varchar(5) not null,
    NgayNhap datetime not null,
    GhiChu varchar(100) null
);
create table CTPhieuNhap(
    MaSP varchar(4) not null,
    SoPN varchar(5) not null,
    SoLuong smallint  not null,
    GiaNhap double not null
);
create table PhieuXuat(
	SoPX varchar(5) primary key not null,
    MaNV varchar(4) not null,
    MaKH varchar(4) not null,
    NgayBan datetime not null,
    GhiChu text null
);
create table CTPhieuXuat(
    SoPX varchar(5) not null,
    MaSP varchar(4) not null,
    SoLuong smallint not null,
    GiaBan double not null
);

-- Bài 2 : Liên kết khoá ngoại
alter table SanPham
	add foreign key (MaLoaiSP) references LoaiSP (MaLoaiSP);
alter table PhieuNhap
	add foreign key (MaNCC) references NhaCungCap(MaNCC);
alter table PhieuNhap
	add foreign key (MaNV) references NhanVien(MaNV);
alter table CTPhieuNhap
	add foreign key (MaSP) references SanPham(MaSP);
alter table CTPhieuNhap
	add foreign key (SoPN) references PhieuNhap(SoPN);
alter table PhieuXuat
	add foreign key (MaNV) references NhanVien(MaNV);
alter table PhieuXuat
	add foreign key (MaKH) references KhachHang(MaKH);
alter table CTPhieuXuat
	add foreign key (MaSP) references SanPham(MaSP);
alter table CTPhieuXuat
	add foreign key (SoPX) references PhieuXuat(SoPX);

-- Bài 3 :  Dùng lệnh INSERT thêm dữ liệu vào các bảng        
-- Nhập dữ liệu khách hàng
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, NgaySinh, Sdt)
VALUES ('1', 'Lý Anh Võ', 'Biên Hoà', '1995-12-25 08:30:15', '07040667925');
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, NgaySinh, Sdt)
VALUES ('2', 'Nguyễn Thuỳ Linh', 'Hà Nội', '1997-03-24 12:10:05', '0977032155');
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, NgaySinh, Sdt)
VALUES ('3', 'Nguyễn Lan', 'Hà Nội', '1992-10-31 12:10:05', '0977032155');
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, NgaySinh, Sdt)
VALUES ('4', 'Trần Minh Duyên', 'Hà Nội', '1994-09-20 12:10:05', '0977032155');
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, NgaySinh, Sdt)
VALUES ('KH10', 'Phạm Phương Trang', 'Huế', '1997-08-11 06:00:15', '09771456298');

-- Nhập dữ liệu nhân viên
INSERT INTO NhanVien (MaNV, HoTen, GioiTinh, DiaChi, NgaySinh, DienThoai, Email, NoiSinh, NgayVaoLam, MaNQL)
VALUES ('1', 'Lý Thảo Vy', false, 'Thanh Xuân,HN', '2004-06-01 06:02:32', '0901234567', 'thaovy@gmail.com', 'VietNam','2023-09-15 06:23:05', '1');
INSERT INTO NhanVien (MaNV, HoTen, GioiTinh, DiaChi, NgaySinh, DienThoai, Email, NoiSinh, NgayVaoLam, MaNQL)
VALUES ('2', 'Bùi Tường Van', false, 'Đống Đa, HN', '2003-05-13 04:50:18', '0834567891', 'tuongvan@gmail.com', 'VietNam', '2022-02-14 07:23:05', null);
INSERT INTO NhanVien (MaNV, HoTen, GioiTinh, DiaChi, NgaySinh, DienThoai, Email, NoiSinh, NgayVaoLam, MaNQL)
VALUES ('NV05', 'Nguyễn Tiến Đạt', true, 'Long Biên, HN', '1999-09-29 09:09:09', '09798765432', 'tiendat@gmail.com', 'VietNam',null, '1');
 
-- Nhập dữ liệu nhà cung cấp
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, Sdt, Email, Webside)
VALUES ('1', 'CT TNHH Fresta', 'Hà Nội', '03999999', 'fresta@email.com', 'http://web.com');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, Sdt, Email, Webside)
VALUES ('2', 'CT TNHH Health', 'Hồ Chí Minh', '03888888', 'tnhh_lotte@email.com', 'http://web.com');

-- Nhập dữ liệu loại sản phẩm
INSERT INTO LoaiSP (MaloaiSP, TenloaiSP, GhiChu)
VALUES ('1', 'Thực phẩm chức năng', 'Sản Phẩm của DHC');
INSERT INTO LoaiSP (MaloaiSP, TenloaiSP, GhiChu)
VALUES ('2', 'Trái cây', 'Hàng nhập khẩu');

-- Nhập dữ liệu sản phẩm
INSERT INTO SanPham (MaSP, MaLoaiSP, TenSP, DonViTinh, GhiChu)
VALUES ('1', '1', 'Canxi', 'thùng', '30 ngày');
INSERT INTO SanPham (MaSP, MaLoaiSP, TenSP, DonViTinh, GhiChu)
VALUES ('2', '1', 'Collagen', 'thùng', '20 ngày');
INSERT INTO SanPham (MaSP, MaLoaiSP, TenSP, DonViTinh, GhiChu)
VALUES ('3', '2', 'Xoài', 'thùng', 'Nhập khẩu từ Thái Lan');
INSERT INTO SanPham (MaSP, MaLoaiSP, TenSP, DonViTinh, GhiChu)
VALUES ('4', '2', 'Nho', 'thùng', 'Nhập khẩu từ Mỹ');
INSERT INTO SanPham (MaSP, MaLoaiSP, TenSP, DonViTinh, GhiChu)
VALUES ('5', '1', 'Compucha', 'chai', 'Nhập khẩu từ NB');
INSERT INTO SanPham (MaSP, MaLoaiSP, TenSP, DonViTinh, GhiChu)
VALUES ('SP15', '2', 'Táo', 'thùng', 'Nhập khẩu từ NewZeland');

-- Nhập dữ liệu phiếu nhập
INSERT INTO PhieuNhap (SoPN, MaNV, MaNCC, NgayNhap, GhiChu)
VALUES ('1', '2', '1', '2023-09-14 16:20:05', 'none');
INSERT INTO PhieuNhap (SoPN, MaNV, MaNCC, NgayNhap, GhiChu)
VALUES ('2', '1', '2', '2023-09-14 16:20:06', 'none');
INSERT INTO PhieuNhap (SoPN, MaNV, MaNCC, NgayNhap, GhiChu)
VALUES ('3', '1', '2', '2018-06-01 16:20:06', 'none');

-- Nhập dữ liệt CT phiếu nhập
INSERT INTO CTPhieuNhap (MaSP, SoPN, SoLuong, GiaNhap)
VALUES ('1', '1', 2, 1000000);
INSERT INTO CTPhieuNhap (MaSP, SoPN, SoLuong, GiaNhap)
VALUES ('4', '2', 2, 6000000);


-- Nhập dữ liệu phiếu xuẩt
INSERT INTO PhieuXuat (SoPX, MaNV, MaKH, NgayBan, GhiChu)
VALUES ('1', '2', '2', '2023-09-15 16:54:33', 'Không có');
INSERT INTO PhieuXuat (SoPX, MaNV, MaKH, NgayBan, GhiChu)
VALUES ('2', '1', '1', '2023-09-15 16:54:34', 'Không có');
INSERT INTO PhieuXuat (SoPX, MaNV, MaKH, NgayBan, GhiChu)
VALUES ('3', '1', '4', '2023-09-15 16:57:38', 'Không có');

-- Nhập dữ liệu Ct phiếu xuất
INSERT INTO CTPhieuXuat (SoPX, MaSP, Soluong, GiaBan)
VALUES ('1', '1', 3, 15000000);
INSERT INTO CTPhieuXuat (SoPX, MaSP, Soluong, GiaBan)
VALUES ('2', '4', 3, 7000000);

-- Bài 4: Dùng lệnh UPDATE cập nhật dữ liệu các bảng
-- 1.Cập nhật lại số điện thoại mới cho khách hàng mã KH10.
UPDATE KhachHang
SET Sdt = '0971234567'
WHERE MaKH = 'KH10';

-- 2. Cập nhật lại địa chỉ mới của nhân viên mã NV05
UPDATE NhanVien
SET DiaChi = 'Bắc Từ Liêm, HN'
WHERE MaNV = 'NV05';

-- Bài 5: Dùng lệnh DELETE xóa dữ liệu các bảng
-- 1.Xóa nhân viên mới vừa thêm tại yêu cầu C.3
DELETE
FROM NhanVien
WHERE MaNV = 'NV05';
-- 2. Xóa sản phẩm mã SP15
DELETE
FROM SanPham
WHERE MaSP = 'SP15';

--  Bài6: Dùng lệnh SELECT lấy dữ liệu từ các bảng

-- 6.1: Liệt kê thông tin về nhân viên trong cửa hàng, gồm: mã nhân viên, họ tên, nhân viên, giới tính, ngày sinh, địa chỉ, số điện thoại, tuổi. Kết quả sắp xếp theo tuổi.
SELECT MaNV, HoTen,
       GioiTinh, DiaChi,
       TIMESTAMPDIFF(YEAR, NgaySinh, CURDATE()) AS NgaySinh,
       DienThoai, Email,
       NoiSinh, NgayVaoLam, MaNQL
FROM NhanVien
ORDER BY NgaySinh;

-- 6.2: Liệt kê các hóa đơn nhập hàng trong tháng 6/2018, gồm thông tin SoPN, MaNV nhập hàng, họ tên NV, họ tên NCC, ngày nhập hàng, ghi chú.
SELECT SoPN, NhanVien.MaNV, NhanVien.HoTen, NhacungCap.TenNCC, NgayNhap, GhiChu
FROM PhieuNhap
         JOIN NhanVien ON PhieuNhap.MaNV = NhanVien.MaNV
         JOIN NhaCungCap On PhieuNhap.MaNCC = NhaCungCap.MaNCC
WHERE MONTH(Ngaynhap) = 6
	  AND YEAR(Ngaynhap) = 2018;
      
-- 6.3: Liệt kê tất cả sản phẩm có đơn vị tính là chai, gồm tất cả thông tin về SP
SELECT MaSP, MaloaiSP, TenSP, DonViTinh, GhiChu
FROM SanPham
WHERE Donvitinh = 'chai';

-- 6.4: Liệt kê chi tiết nhập hàng trong tháng hiện hành gồm thông tin: SoPN, MaSP, TenSP, LoaiSP, DonViTinh, SL, giá nhập, thành tiền.
select CTPhieuNhap.SoPN, CTPhieuNhap.MaSP, TenSP, TenloaiSP, DonViTinh, SoLuong, GiaNhap, (CTPhieuNhap.Soluong*CTphieuNhap.GiaNhap) as ThanhTien
from CTPhieuNhap
JOIN SanPham ON CTPhieuNhap.MaSP = SanPham.MaSP
         JOIN LoaiSP ON SanPham.MaLoaiSP = LoaiSp.MaLoaiSP
         JOIN PhieuNhap ON CTPhieuNhap.SoPN = PhieuNhap.SoPN
where MONTH(PhieuNhap.NgayNhap) = MONTH(CURDATE())
  AND YEAR(PhieuNhap.Ngaynhap) = YEAR(CURDATE());
  
-- 6.5 : Liệt kê các nhà cung cấp có giao dịch mua bán trong tháng hiện hành, gồm thông tin: MaNCC, họ tên NCC, địa chỉ, sdt, email, SoPN, ngày nhập. Sắp xếp thứ tự theo ngày nhập hàng.
SELECT PhieuNhap.MaNCC, TenNCC, DiaChi, Sdt, Email, PhieuNhap.SoPN, PhieuNhap.NgayNhap
FROM NhaCungCap
         JOIN PhieuNhap ON NhaCungCap.MaNCC = PhieuNhap.MaNCC
WHERE MONTH(PhieuNhap.NgayNhap) = MONTH(CURDATE())
  AND YEAR(PhieuNhap.NgayNhap) = YEAR(CURDATE())
ORDER BY PhieuNhap.NgayNhap;

-- 6.6 : Liệt kê chi tiết hóa đơn bán hàng trong 6 tháng đầu năm 2018 gồm thông tin: SoPX, NV, ngày bán, MaSP, tên SP,đơn vị tính, số lượng, giá bán, doanh thu.
SELECT CTPhieuXuat.SoPX, NhanVien.HoTen,
       NgayBan, CTPhieuXuat.MaSP,
       TenSP, DonViTinh,
       SoLuong, GiaBan,
       (SoLuong * GiaBan) as DoanhThu
FROM CTPhieuXuat
         JOIN PhieuXuat ON CTPhieuXuat.SoPX = PhieuXuat.SoPX
         JOIN NhanVien ON PhieuXuat.MaNV = NhanVien.MaNV
         JOIN SanPham ON CTPhieuXuat.MaSP = SanPham.MaSP
WHERE MONTH(PhieuXuat.NgayBan) BETWEEN 1 AND 6
      AND YEAR(PhieuXuat.NgayBan) = 2018;
      
-- 6.7: Hãy in danh sách khách hàng có ngày sinh nhật trong tháng hiện hành (gồm tất cả thông tin của khách hàng)
SELECT MaKH, TenKH, DiaChi, NgaySinh, Sdt
FROM KhachHang
WHERE MONTH(NgaySinh) = MONTH(CURDATE());
  
-- 6.8 : Liệt kê các hóa đơn bán hàng từ ngày 15/04/2018 đến 15/05/2018: SoPXt, NV, ngày bán, mã sản phẩm, tên sản phẩm, đơn vị tính, số lượng, giá bán, doanh thu.
SELECT CTPhieuXuat.SoPX, NhanVien.HoTen,
       NgayBan, CTPhieuXuat.MaSP,
       TenSP, DonViTinh,
       SoLuong, GiaBan,
       (SoLuong * GiaBan) as DoanhThu
FROM CTPhieuXuat
         JOIN PhieuXuat ON CTPhieuXuat.SoPX = PhieuXuat.SoPX
         JOIN NhanVien ON PhieuXuat.MaNV = NhanVien.MaNV
         JOIN SanPham ON CTPhieuXuat.MaSP = SanPham.MaSP
WHERE DAY(PhieuXuat.NgayBan) = 15
  AND MONTH(PhieuXuat.NgayBan) BETWEEN 4 AND 5
  AND YEAR(PhieuXuat.NgayBan) = 2018;
  
-- 6.9: Liệt kê các hóa đơn mua hàng theo từng khách hàng, gồm các thông tin: SoPX , ngày bán, mã khách hàng, tên khách hàng, trị giá.
SELECT CTPhieuXuat.SoPX, PhieuXuat.NgayBan,
       KhachHang.MaKH, KhachHang.TenKH,
       (CTPhieuXuat.SoLuong * CTPhieuXuat.GiaBan) AS TriGia
FROM CTPhieuXuat
         JOIN PhieuXuat ON PhieuXuat.SoPX = CTPhieuXuat.SoPX
         JOIN KHACHHANG ON PhieuXuat.MaKH = PhieuXuat.MaKH;
         
-- 6.10 : Cho biết tổng số chai nước xả vải Comfort đã bán trong 6 tháng đầu năm 2018. Thông tin hiển thị: tổng số lượng
SELECT SoLuong
FROM CTPhieuXuat
         JOIN SanPham ON SanPham.MaSP = CTPhieuXuat.MaSP
WHERE TenSP = 'nước xả vải Comfort';

-- 6.11 : Tổng kết doanh thu theo từng khách hàng theo tháng, gồm các thông tin: tháng, mã khách hàng, tên khách hàng, địa chỉ, tổng tiền.
SELECT MONTH(NgayBan) AS NgayBan,
       PhieuXuat.MaKH, TenKH,DiaChi,
       SUM((CTPhieuXuat.SoLuong * CTPhieuXuat.GiaBan)) AS TongTien
FROM CTPhieuXuat
         JOIN PhieuXuat ON CTPhieuXuat.SoPX = PhieuXuat.SoPX
         JOIN KhachHang ON PhieuXuat.MaKH = KhachHang.MaKH
GROUP BY MONTH(NgayBan), PhieuXuat.MaKH;

-- 6.12 : Thống kê tổng số lượng sản phẩm đã bán theo từng tháng trong năm, gồm thông tin: năm, tháng, mã sản phẩm, tên sản phẩm, đơn vị tính, tổng SL
SELECT YEAR(NgayBan) AS Nam, MONTH(NgayBan) AS Thang, SanPham.MaSP, TenSP, DonViTinh, (SoLuong) AS SoLuong
FROM CTPhieuXuat
         JOIN SanPham ON SanPham.MaSP = CTPhieuXuat.MaSP
         JOIN PhieuXuat ON PhieuXuat.SoPX = CTPhieuXuat.SoPX;
         
-- 6.13 : .Thống kê doanh thu bán hàng trong trong 6 tháng đầu năm 2018, thông tin hiển thị gồm: tháng, doanh thu         
SELECT MONTH(NgayBan) AS Thang, SUM((GiaBan * CTPhieuXuat.SoLuong - GiaNhap * CTPhieuNhap.Soluong)) AS DoanhThu
FROM CTPhieuXuat
         join PhieuXuat ON PhieuXuat.SoPX = CTPhieuXuat.SoPX
         join SanPham ON SanPham.MaSP = CTPhieuXuat.MaSP
         join CTPhieuNhap ON SanPham.MaSP = CTPhieuNhap.MaSP
GROUP BY MONTH(NgayBan); 

-- 6.14: .Liệt kê các hóa đơn bán hàng của tháng 5 và tháng 6 năm 2018, gồm các thông tin: số phiếu, ngày bán, họ tên nhân viên bán hàng, họ tên khách hàng,tổng trị giá.   
SELECT CTPhieuXuat.SoPX, NgayBan, HoTen, TenKH, (SoLuong * GiaBan) AS TongTriGia
FROM CTPhieuXuat
         JOIN PhieuXuat ON CTPhieuXuat.SoPX = PhieuXuat.SoPX
         JOIN NhanVien ON NhanVien.MaNV = PhieuXuat.MaNV
         JOIN KhachHang ON KhachHang.MaKH = PhieuXuat.MaKH
WHERE YEAR(NgayBan) = 2018
      AND MONTH(NgayBan) BETWEEN 5 AND 6;
      
-- 6.15 : .Cuối ngày, nhân viên tổng kết các hóa đơn bán hàng trong ngày, thông tin gồm: số phiếu xuất, mã khách hàng, tên khách hàng, họ tên nhân viên bán hàng, ngày bán, trị giá.   
SELECT CTPhieuXuat.SoPX, NgayBan, HoTen, TenKH, (Soluong * GiaBan) AS TriGia
FROM CTPhieuXuat
         JOIN PhieuXuat ON CTPhieuXuat.SoPX = PhieuXuat.SoPX
         JOIN NhanVien ON NhanVien.MaNV = PhieuXuat.MaNV
         JOIN KhachHang ON KhachHang.MaKH = PhieuXuat.MaKH
WHERE YEAR(NgayBan) = YEAR(CURDATE())
      and TIMESTAMP(DATE_ADD(CURDATE(), INTERVAL 1 DAY) - INTERVAL 1 SECOND);
      
-- 6.16 : .Thống kê doanh số bán hàng theo từng nhân viên, gồm thông tin: mã nhân viên, họ tên nhân viên, mã sản phẩm, tên sản phẩm, đơn vị tính, tổng số lượng.  
SELECT NhanVien.MaNV,
       NhanVien.HoTen,
       SanPham.MaSp,
       SanPham.TenSP,
       SanPham.DonViTinh,
       SUM(CTPhieuXuat.SoLuong) AS TongSoLuong
FROM NhanVien
INNER JOIN PhieuXuat ON PhieuXuat.MaNV = NhanVien.MaNV
INNER JOIN CTPhieuXuat ON CTPhieuXuat.SoPX = PhieuXuat.SoPX
INNER JOIN SanPham ON SanPham.MaSp = CTPhieuXuat.MaSP
GROUP BY MaNV, HoTen, MaSP, TenSP, DonViTinh
ORDER BY MaNV, MaSP; 

-- 6.17: Liệt kê các hóa đơn bán hàng cho khách vãng lai (KH01) trong quý 2/2018, thông tin gồm số phiếu xuất, ngày bán, mã sản phẩm, tên sản phẩm, đơn vị tính, số lượng, đơn giá, thành tiền.
select PhieuXuat.SoPX, PhieuXuat.NgayBan,
       SanPham.MaSP, SanPham.TenSP,
       SanPham.DonViTinh,
       CTPhieuXuat.SoLuong, CTPhieuXuat.GiaBan,
       (CTPhieuXuat.SoLuong * CTPhieuXuat.GiaBan) as ThanhTien
from PhieuXuat
inner join CTPhieuXuat on CTPhieuXuat.SoPX = PhieuXuat.SoPX
inner join SanPham on SanPham.MaSP = CTPhieuXuat.MaSP
inner join KhachHang on KhachHang.MaKH = PhieuXuat.MaKH 
where KhachHang.MaKH = 'KH01'and
      Year(NgayBan) = 2018 and
      quarter(NgayBan) = 2;
      
-- 6.18: Liệt kê các sản phẩm chưa bán được trong 6 tháng đầu năm 2018, thông tin gồm: mã sản phẩm, tên sản phẩm, loại sản phẩm, đơn vị tính. 
select SanPham.MaSp,
       SanPham.TenSP,
       LoaiSP.TenLoaiSP,
       SanPham.DonViTinh
from SanPham
inner join LoaiSP on LoaiSP.MaLoaiSP = SanPham.MaLoaiSP
where SanPham.MaSP not in (
select distinct CTPhieuXuat.SoPX as SoPhieuXuat
from CTPhieuXuat
inner join PhieuXuat on PhieuXuat.SoPX = PhieuXuat.SoPX
where year(PhieuXuat.NgayBan) = 2018 
	  and month(PhieuXuat.NgayBan) BETWEEN 1 AND 6
);

-- 6.19 : Liệt kê danh sách nhà cung cấp không giao dịch mua bán với cửa hàng trong quý 2/2018, gồm thông tin: mã nhà cung cấp, tên nhà cung cấp, địa chỉ, số điện thoại. 
select NhaCungCap.MaNCC,
       NhaCungCap.TenNCC,
       NhaCungCap.DiaChi,
       NhaCungCap.Sdt
from NhaCungCap
inner join PhieuNhap on PhieuNhap.MaNCC = NhaCungCap.MaNCC
where NhaCungCap.MaNCC not in (
select distinct PhieuNhap.SoPN
from PhieuNhap 
where year(PhieuNhap.NgayNhap) = 2018 
	  and quarter(PhieuNhap.NgayNhap) = 2
)
order by MaNCC;

-- 6.20 : Cho biết khách hàng có tổng trị giá đơn hàng lớn nhất trong 6 tháng đầu năm 2018. 
