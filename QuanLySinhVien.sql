create database QuanLySinhVien2;
use QuanLySinhVien2;
/*=============DANH MUC KHOA==============*/
CREATE TABLE Khoa (
    MaK CHAR(10) PRIMARY KEY,
    TenK VARCHAR(50) NOT NULL
);
/*==============DANH MUC SINH VIEN============*/
CREATE TABLE SinhVien (
    MaSV CHAR(10) NOT NULL PRIMARY KEY,
    HoSV VARCHAR(15) NOT NULL,
    TenSV VARCHAR(15) NOT NULL,
    GioiTinh CHAR(5),
    NgaySinh DATETIME NOT NULL,
    NoiSinh VARCHAR(100),
    MaK CHAR(10),
    HocBong DOUBLE
);
/*===================MON HOC========================*/
CREATE TABLE MonHoc (
    MaMH CHAR(10) NOT NULL PRIMARY KEY,
    TenMH NVARCHAR(50) NOT NULL,
    SoTiet INT
);
/*=====================KET QUA===================*/
CREATE TABLE KetQua (
    MaSV CHAR(10) NOT NULL,
    MaMH CHAR(10) NOT NULL,
    LanThi TINYINT,
	PRIMARY KEY(MaSV,MaMH,LanThi),
    Diem DOUBLE
);
/*==========================TAO KHOA NGOAI==============================*/
Alter table SinhVien add foreign key (MaK) references Khoa(MaK);
Alter table KetQua add foreign key (MaSV) references SinhVien(MaSV);
Alter table KetQua add foreign key (MaMH) references MonHoc(MaMH);
/*==================NHAP DU LIEU KHOA====================*/
Insert into Khoa values
("CNTT","Công Nghệ Thông Tin"),
("NH","Ngân Hàng"),
("KT","Kiến Trúc"),
("QTKD","Quản Trị Kinh Doanh"),
("NN","Ngôn Ngữ"),
("GDDT","Giáo dục và Đào Tạo");
Insert into Khoa values
("ATTP","An Toàn Thực Phẩm"); -- query 6
delete from Khoa where MaK = "ATTP";
/*==============NHAP DU LIEU MON HOC=============*/
Insert into MonHoc values
("M1","Toán",60),
("M2","Văn",60),
("M3","Anh",45),
("M4","Lý",45),
("M5","Hóa",45),
("M6","Tin",60);
Insert into MonHoc values
("M7","Triết",20),
("M8","Sử",35);
/*==============NHAP DU LIEU SINH VIEN=============*/
Insert into SinhVien(MaSV,HoSV,TenSV,GioiTinh,NgaySinh,NoiSinh,MaK) values
("SV01","Nguyễn Thị","Hồng Nhung","Nữ","1996-04-27","Hà Nội","CNTT"),
("SV02","Trần Văn","Tuấn","Nam","1998-09-15","Hồ Chí Minh","CNTT"),
("SV03","Lê Thị","Mai Anh","Nữ","1997-02-10","Đà Nẵng","KT"),
("SV04","Ngô Hoàng","Nam","Nam","1999-07-05","Hải Phòng","KT"),
("SV05","Phạm Thị","Thu Hương","Nữ","1996-12-19","Hà Nội","QTKD"),
("SV06","Vũ Quang","Long","Nam","1998-05-02","Hà Nội","QTKD"),
("SV07","Đinh Thị","Thu Trang","Nữ","1997-08-25","Hồ Chí Minh","NN"),
("SV08","Lê Hoàng","Minh","Nam","1999-01-12","Hải Phòng","NN"),
("SV09","Trương Văn","Hùng","Nam","1997-06-30","Hà Nội","NH"),
("SV10","Phan Thị","Hương","Nữ","1998-03-08","Đà Nẵng","NH"),
("SV11","Trần Quốc","Long","Nam","1993-07-27","Hà Nội","CNTT"),
("SV12","Nguyễn Thị","Hân","Nữ","1997-11-27","Hà Nội","NH"),
("SV13","Nguyễn Thị","Hoan","Nữ","1996-10-27","Hà Nội","NH"),
("SV14","Nguyễn Hoàng","Mai","Nữ","2000-10-20","Huế","NN"),
("SV15","Nguyễn Thị","Hương Nhài","Nữ","2002-1-24","Nghệ An","NN");
/*==============NHAP DU LIEU BANG KET QUA=============*/
Insert into KetQua values
("SV01","M1",1,8.5),
("SV01","M2",1,7.9),
("SV01","M3",1,6.3),
("SV02","M1",1,9.2),
("SV02","M2",1,8.7),
("SV02","M3",1,7.1),
("SV03","M1",1,7.8),
("SV03","M2",1,6.9),
("SV03","M3",1,8.0),
("SV04","M1",1,8.3),
("SV04","M2",1,7.2),
("SV04","M3",1,6.7),
("SV05","M1",1,9.0),
("SV05","M2",1,8.5),
("SV05","M3",1,7.8),
("SV06","M1",1,7.6),
("SV06","M2",1,6.8),
("SV06","M3",1,8.2),
("SV07","M1",1,8.9),
("SV07","M2",1,7.7),
("SV07","M3",1,7.2);

-- 1. Liệt kê danh sách sinh viên, 
-- gồm các thông tin sau: Mã sinh viên, Họ sinh viên, Tên sinh viên, Học bổng.
-- Danh sách sẽ được sắp xếp theo thứ tự mã sinh viên tăng dần
select MaSV, HoSV, TenSV, Hocbong
from SinhVien
order by MaSV;
-- 2. Danh sách các sinh viên gồm thông tin sau: Mã sinh viên, họ tên sinh viên,
-- Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ.
select MaSV, HoSV, TenSV, GioiTinh, NgaySinh
from SinhVien
order by GioiTinh, HoSV, TenSV;
-- 3. Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông
-- tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
select HoSV, TenSV, NgaySinh, Hocbong
from SinhVien
order by NgaySinh desc, Hocbong desc;
-- 4. Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã
-- môn, Tên môn, Số tiết.
select *
from MonHoc
where TenMH like "T%";
-- 5. Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm
-- các thông tin: Họ tên sinh viên, Ngày sinh, Phái.
select HoSV, TenSV, NgaySinh, GioiTinh
from SinhVien
where TenSV like "%I";
-- 6. Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm
-- các thông tin: Mã khoa, Tên khoa.
select MaK, TenK
from Khoa
where TenK like "_N%";
-- 7. Liệt kê những sinh viên mà họ có chứa chữ Thị.
select * 
from SinhVien
where HoSV like "%Thị%";
-- 8. Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các
-- thông tin: Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ
-- được sắp xếp theo thứ tự Mã khoa giảm dần
select MaSV, HoSV, TenSV, MaK, HocBong
from SinhVien
order by MaK desc;
-- 9. Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm
-- các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.
select HoSV, TenSV, MaK, NoiSinh, HocBong
from SinhVien
where HocBong > 5000000 and NoiSinh = "Hà Nội"
order by TenSV;
-- 10. Danh sách các sinh viên của khoa CNTT và khoa NN, gồm các thông
-- tin: Mã sinh viên, Mã khoa, Phái.
select MaSV, MaK, GioiTinh
from SinhVien
where MaK = "CNTT" or MaK = "NN"
order by MaK;
-- 11. Cho biết những sinh viên có ngày sinh từ ngày 01/01/1996 đến ngày
-- 05/06/1997 gồm các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học bổng.
select MaSV, NgaySinh, NoiSinh, HocBong
from SinhVien
where NgaySinh between 19960101 and 19970605
order by NgaySinh;
-- 12. Danh sách những sinh viên có học bổng từ 2000000 đến 10000000, gồm các
-- thông tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa.
select MaSV, NgaySinh, GioiTinh, MaK
from SinhVien
where HocBong between 2000000 and 10000000
order by HocBong;
-- 13. Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thông
-- tin: Mã môn học, Tên môn học, Số tiết.
select *
from MonHoc
where SoTiet > 30 and SoTiet < 45;
-- 14. Liệt kê những sinh viên nam của khoa NN và khoa CNTT, gồm các
-- thông tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.
select MaSV, HoSV, TenSV, TenK, GioiTinh
from SinhVien
join Khoa on Khoa.MaK = SinhVien.MaK
where GioiTinh = "Nam" and (SinhVien.MaK = "NN" or SinhVien.MaK = "CNTT")
order by MaSV;
-- 15. Liệt kê những sinh viên nữ, tên có chứa chữ N
select *
from SinhVien
where GioiTinh = "Nu" and TenSV like "%N%"
order by TenSV;
-- 16. Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 04, gồm các
-- thông tin: Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.
select HoSV, TenSV, NoiSinh, NgaySinh
from SinhVien
where NoiSinh = "Hà Nội" and Month(NgaySinh) = 04;
-- 17. Cho biết những sinh viên có tuổi lớn hơn 25, thông tin gồm: Họ tên sinh
-- viên, Tuổi,Học bổng.
select concat(HoSV, " ", TenSV) as Ten, TIMESTAMPDIFF(YEAR, NgaySinh, CURDATE()) as Tuoi, HocBong
from SinhVien
where TIMESTAMPDIFF(YEAR, NgaySinh, CURDATE()) > 25
order by Tuoi;
-- 18. Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh
-- viên, Tuổi, Tên khoa.
select concat(HoSV, " ", TenSV) as Ten, TIMESTAMPDIFF(YEAR, NgaySinh, CURDATE()) as Tuoi, TenK
from SinhVien
join Khoa on Khoa.MaK = SinhVien.MaK
where TIMESTAMPDIFF(YEAR, NgaySinh, CURDATE()) between 20 and 25
order by Tuoi;
-- 19. Danh sách sinh viên sinh vào mùa xuân năm 1996, gồm các thông tin: Họ
-- tên sinh viên,Phái, Ngày sinh.
select HoSV, TenSV, GioiTinh, NgaySinh
from SinhVien
where NgaySinh between 19960205 and 19960505;
-- 20. Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên,
-- Phái, Mã khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học
-- bổng cao” nếu giá trị của field học bổng lớn hơn 500,000 và ngược lại hiển
-- thị là “Mức trung bình”

-- 21. Cho biết tổng số sinh viên của toàn trường
select count(*) `Tong So SV`
from SinhVien;
-- 22. Cho biết tổng số sinh viên nam/nữ.
select count(*) `Tong So SV Nam`
from SinhVien
where GioiTinh = "Nam";
select count(*) `Tong So SV Nu`
from SinhVien
where GioiTinh = "Nữ";
-- 23. Cho biết tổng số sinh viên của từng khoa.
select MaK, count(*) `Tong So SV`
from SinhVien
group by MaK
order by MaK;
-- 24. Cho biết số lượng sinh viên học từng môn.
select MonHoc.TenMH, count(*) `So SV`
from KetQua
JOIN MonHoc on KetQua.MaMH = MonHoc.MaMH
group by MonHoc.TenMH;
-- 25. Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có
-- trong bảng kq)
select MaSV, count(MaMH) `So MH`
from KetQua
group by MaSV;
-- 26. Cho biết tổng số học bổng của mỗi khoa.
select MaK, sum(HocBong) `Tong So Hoc Bong`
from SinhVien
group by MaK
order by MaK;
-- 27. Cho biết học bổng cao nhất của mỗi khoa.
select MaK, max(HocBong) `Hoc Bong Cao Nhat`
from SinhVien
group by MaK
order by MaK;
-- 28. Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa.
select MaK, count(*) `Tong So SV Nam`
from SinhVien
where GioiTinh = "Nam"
group by MaK
order by MaK;
select MaK, count(*) `Tong So SV Nữ`
from SinhVien
where GioiTinh = "Nữ"
group by MaK
order by MaK;
-- 29. Cho biết số lượng sinh viên theo từng độ tuổi.
select TIMESTAMPDIFF(YEAR, NgaySinh, CURDATE()) as Tuoi, count(*) `So luong SV`
from SinhVien
group by TIMESTAMPDIFF(YEAR, NgaySinh, CURDATE())
order by Tuoi;
-- 30. Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường.
select Year(NgaySinh) `Nam Sinh`, count(*) `So SV`
from SinhVien
group by year(NgaySinh)
having count(*) = 2;
-- 31. Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường.
select NoiSinh, count(*) `So SV`
from SinhVien
group by  NoiSinh
having count(*) > 2;
-- 32. Cho biết những môn nào có trên 3 sinh viên dự thi.
select MonHoc.TenMH, count(KetQua.MaSV) `So SV`
from KetQua
join MonHoc on KetQua.MaMH = MonHoc.MaMH
group by MonHoc.TenMH;
-- 33. Cho biết những sinh viên thi lại trên 2 lần.
select SinhVien.*
from KetQua
join SinhVien on KetQua.MaSV = SinhVien.MaSV
where KetQua.LanThi > 2;
-- 34. Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0
-- 35. Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1.
-- 36. Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nữ
select MaK, count(*) `So SV Nữ`
from SinhVien
where GioiTinh = "Nữ"
group by MaK
having count(*) > 2;
-- 37. Cho biết những khoa có 2 sinh đạt học bổng từ 200.000 đến 300.000.
select MaK
from SinhVien
where HocBong between 2000000 and 10000000
group by MaK
having count(*) = 2;
-- 38. Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn
-- trong lần thi 1.
-- 39. Cho biết sinh viên nào có học bổng cao nhất.
select max(HocBong) from SinhVien;
select *
from SinhVien
where HocBong = (select max(HocBong) from SinhVien);
-- 40. Cho biết sinh viên nào có điểm thi lần 1 môn toán cao nhất.
select max(diem) from KetQua join MonHoc on KetQua.MaMH = MonHoc.MaMH where TenMH = "Toán" and KetQua.LanThi = 1;
select SinhVien.*
from KetQua
join SinhVien on SinhVien.MaSV = KetQua.MaSV
join MonHoc on MonHoc.MaMH = KetQua.MaMH
where KetQua.Diem = (select max(diem) from KetQua join MonHoc on KetQua.MaMH = MonHoc.MaMH where TenMH = "Toán") and MonHoc.TenMH = "Toán" and KetQua.LanThi = 1;
-- 41. Cho biết sinh viên khoa NH có tuổi lớn nhất.
select *
from SinhVien
where MaK = 'NH'
order by NgaySinh limit 1;
-- 42. Cho biết khoa nào có đông sinh viên nhất.
select MaK, count(*) `Tong So SV`
from SinhVien
group by MaK
order by count(*) desc limit 1;
-- 43. Cho biết khoa nào có đông nữ nhất.
select MaK, count(*) `So SV Nữ`
from SinhVien
where GioiTinh = "Nữ"
group by MaK
order by count(*) desc limit 1;
-- 44. Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất.
-- 45. Cho biết sinh viên không học khoa anh văn có điểm thi môn phạm lớn hơn
-- điểm thi văn của sinh viên học khoa anh văn.
-- 46. Cho biết sinh viên có nơi sinh cùng với Hải.
-- 47. Cho biết những sinh viên nào có học bổng lớn hơn tất cả học bổng của
-- sinh viên thuộc khoa anh văn
-- 48. Cho biết những sinh viên có học bổng lớn hơn bất kỳ học bổng của sinh viên
-- học khóa anh văn
-- 49. Cho biết sinh viên nào có điểm thi môn cơ sở dữ liệu lần 2 lớn hơn tất cả điểm
-- thi lần 1 môn cơ sở dữ liệu của những sinh viên khác.50. Cho biết những sinh viên đạt điểm cao nhất trong từng môn.
-- 51. Cho biết những khoa không có sinh viên học.
select *
from Khoa
where MaK not in (select MaK from SinhVien);
-- 52. Cho biết sinh viên chưa thi môn cơ sở dữ liệu.
-- 53. Cho biết sinh viên nào không thi lần 1 mà có dự thi lần 2.
-- 54. Cho biết môn nào không có sinh viên khoa anh văn học.
-- 55. Cho biết những sinh viên khoa anh văn chưa học môn văn phạm.
-- 56. Cho biết những sinh viên không rớt môn nào.
-- 57. Cho biết những sinh viên học khoa anh văn có học bổng và những sinh viên
-- chưa bao giờ rớt.
-- 58. Cho biết khoa nào có đông sinh viên nhận học bổng nhất và khoa nào khoa
-- nào có ít sinh viên nhận học bổng nhất.
-- 59. Cho biết 3 sinh viên có học nhiều môn nhất.
-- 60. Cho biết những môn được tất cả các sinh viên theo học.
-- 61. Cho biết những sinh viên học những môn giống sinh viên có mã số A02 học.
-- 62. Cho biết những sinh viên học những môn bằng đúng những môn mà sinh
-- viên A02 học.

