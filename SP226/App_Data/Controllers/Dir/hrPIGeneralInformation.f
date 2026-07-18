<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY XMLSuggestion SYSTEM "..\Include\XML\MaxNumber.xml">
  <!ENTITY ScriptSuggestion SYSTEM "..\Include\Javascript\Suggestion.txt">

  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY ScriptWatermark SYSTEM "..\Include\Javascript\TextboxWatermark.txt">

  
  <!ENTITY CheckOutWorkStatus "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4b0rGa8vBKURt7mg7V/CooR6PDLQ6ts2rO4sOI7RiUwXxFR0yB6fX6Z9o/ut6MRsK7QykgntcrflUSJ8I96e5pgc9YMfAt/6GhNqZ6gk8cd36TExwFrKCBr/e9+rwSP3AtY4R8lI4ruWUN9m+MNj58E0TAndiJYK4iCB53tp3a6xlVx6eLoiW2gipZ8gUy49gNf5md/giS5flqdOaVR1EgCH3tbVlYdspJ02IRhKb4y3xm9XZbZ+H6Sb6BLVdtqgLE9gdQ0MHqDE2BhL84Cgg+WRGJULSsBGCTxZJIOw4rjMGYtBnvOQrA+B+6VjhtKvnEN27/1d6OoTIHSrQVVRY70l4LAEktN+rpNJ4LDvsRug==FastBusiness.Encryption.End">
  <!ENTITY CheckDepartmentRight "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+5BxkDx7Z3VjpxFi/eb12F4mOmYlNivr9HDxc0vDjLjFZjFQl6Hud8sN7/9YkWhs3YDF1yLaaWM9JwRHB8JkAPWAdXs49fOtZiEY+xxbBD+EPLKZT2jDT4DBQ8gVyNKTjY85Ni9CXalZgvIh46GjsIZcewpF69virCCTZDU3fRJoGeMPE5pqhU+cFviPK7Gvxg==FastBusiness.Encryption.End">
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bjCQYJU7bacRymx13jbgOy5dFVkgzqsJc7pYr92LNblkU3J3ypVA0NhErEq7LBpxi7R0qEBWkC9BQtngFcUiv/4j0/fWqZdX/8X+EPnOQ7/mlm9wb85AUqpGy0XTLf1MV4Xhh3EBbNh7QaoRYRwMVepyS09ux8JODKetOcxmj/6zK0CD7VAp6yF/W8E55xsg+w6/n9ddCzJ6nuLtoz1AId6FastBusiness.Encryption.End">

  <!ENTITY CreateTicket2 "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+8GkRiLbS0UMHqzWWPPELsovSYCnFDgrsn+SH6KyvTasTcTTeJuTC+vhjNDDr2STUxTnFfoswzccdwOdJ9egasgfREuCHasLuMYkuz5oi6FZ9p52VBy00OdxgpOlCtQ5gFYs9YALmKkra4KhTl9RNQpBX2UIRNUBRnZMvKfONKwnUXS1fKJHjq8qiEZyatwhiUL4m48CnBfNboZu7KvNMja76y8IJwTlBBp0iLHC1ochFastBusiness.Encryption.End">
  

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.hrPIGeneralInformation;
  %Extender.Ignore;

  <!ENTITY % CheckValidEmail SYSTEM "..\Include\CheckValidEmail.ent">
  %CheckValidEmail;
  <!ENTITY CheckValidEmail.FieldName "email_cty,email_ca_nhan">
  <!ENTITY CheckValidEmail.MultiEmail "true">
]>

<dir table="hrnv" code="stt_rec" order="stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin nhân viên" e="Employee Information"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Mask"/>
    </field>
    <field name="status" clientDefault="1"  hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_nv" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="Mask"/>
    </field>
    <field name="ho_nv" allowNulls="false">
      <header v="Họ nhân viên" e="Last Name"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PSKtRuDqg40Vkmhr5KFxl17hlJLYypf11Y8WlFDtWRkpEMjYdvGA2RUinNRm6UWaA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nv" allowNulls="false">
      <header v="Tên nhân viên" e="First Name"></header>
      <footer v="Họ và tên" e="Employee Name"></footer>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PSKtRuDqg40Vkmhr5KFxl17hlJLYypf11Y8WlFDtWRkpEMjYdvGA2RUinNRm6UWaA==</Encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" external="true" defaultValue="''" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="bo_phan" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="gioi_tinh" clientDefault="1" dataFormatString="1, 2" align="right">
      <header v="Giới tính" e="Gender"/>
      <footer v="1 - Nam, 2 - Nữ" e="1 - Male, 2 - Female"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PSKtRuDqg40Vkmhr5KFxl1WdAiGDnmW/0QZDbAKiVz3jWNyNErFC3hI2sWqd0lbyw==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gt" readOnly="true" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="stt" type="Decimal" dataFormatString="####0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>

    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" categoryIndex="1">
      <header v="Ngày sinh" e="Date of Birth"></header>
    </field>
    <field name="noi_sinh" categoryIndex="1">
      <header v="Nơi sinh" e="Place of Birth"></header>
    </field>
    <field name="cmnd_so" categoryIndex="1">
      <header v="Số CMND" e="ID Card No"></header>
    </field>
    <field name="cmnd_ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="1">
      <header v="Ngày cấp CMND" e="Date of Issue"></header>
    </field>
    <field name="cmnd_noi_cap" categoryIndex="1">
      <header v="Nơi cấp" e="Place of Issue"></header>
      <items style="AutoComplete" controller="hrProvinceCity" reference="cmnd_nc%l" key="status = '1'" check="1 = 1" information="ma_tinh$hrdmtinh.ten_tinh%l" new="Default"/>
    </field>
    <field name="cmnd_nc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cmnd_ngay_hh" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="1">
      <header v="Ngày hết hạn CMND" e="Expiry Date"></header>
    </field>
    <field name="quoc_tich" categoryIndex="1">
      <header v="Quốc tịch" e="Nationality"></header>
      <items style="AutoComplete" controller="hrNationality" reference="ten_qt%l" key="status = '1'" check="1 = 1" information="ma_qt$dmqt.ten_qt%l" new="Nationality"/>
    </field>
    <field name="ten_qt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dan_toc" categoryIndex="1">
      <header v="Dân tộc" e="Ethnic"></header>
      <items style="AutoComplete" controller="hrEthnic" reference="ten_dt%l" key="status = '1'" check="1 = 1" information="ma_dt$hrdmdt.ten_dt%l" new="Default"/>
    </field>
    <field name="ten_dt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ton_giao" categoryIndex="1">
      <header v="Tôn giáo" e="Religion"></header>
      <items style="AutoComplete" controller="hrReligion" reference="ten_tg%l" key="status = '1'" check="1 = 1" information="ma_tg$hrdmtg.ten_tg%l" new="Default"/>
    </field>
    <field name="ten_tg%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="hon_nhan" categoryIndex="1">
      <header v="Tình trạng hôn nhân" e="Marital Status"></header>
      <items style="AutoComplete" controller="hrMaritalStatus" reference="ten_tthn%l" key="status = '1'" check="1 = 1" information="ma_tthn$hrdmtthn.ten_tthn%l" new="Default"/>
    </field>
    <field name="ten_tthn%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_thoai_dd" categoryIndex="1">
      <header v="Điện thoại di động" e="Mobile Phone"></header>
    </field>
    <field name="email_cty" categoryIndex="1">
      <header v="Thư &lt;span class=&quot;LabelDescription&quot;&gt;(Email)" e="Email Address"></header>
    </field>
    <field name="dia_chi_ht" filterSource="Ignore" inactivate="true" categoryIndex="1">
      <header v="Địa chỉ hiện tại" e="Current Address"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="dia_chi_ht_so" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="dia_chi_ht_tinh" categoryIndex="1">
      <header v="Địa chỉ hiện tại" e="Current Address"></header>
      <items style="AutoComplete" controller="hrProvinceCity" reference="ten_dcht_tinh%l" key="status = '1'" check="1 = 1" information="ma_tinh$hrdmtinh.ten_tinh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PSKtRuDqg40Vkmhr5KFxl0NeIo0q9jchGIkJqGUhP3da4bgf86DMixsmJIUz5aFJ1fDq640IM0b7cvlWDLywvI=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dcht_tinh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dia_chi_ht_quan" categoryIndex="1">
      <header v="Địa chỉ hiện tại" e="Current Address"></header>
      <items style="AutoComplete" controller="hrDistrict" reference="ten_dcht_quan%l" key="ma_tinh = '{$%c[dia_chi_ht_tinh]}' and status = '1'" check="ma_tinh = '{$%c[dia_chi_ht_tinh]}'" information="ma_quan$hrdmquan.ten_quan%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PSKtRuDqg40Vkmhr5KFxl1uJzB5qshFwQgS3RaGRMlVq2DngLcGq3Avq4Qe6XpVgks9xaGod+xsCXwht2VcF/8=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dcht_quan%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dia_chi_ht_xa" categoryIndex="1">
      <header v="Địa chỉ hiện tại" e="Current Address"></header>
      <items style="AutoComplete" controller="hrWardCommune" reference="ten_dcht_xa%l" key="ma_tinh = '{$%c[dia_chi_ht_tinh]}' and ma_quan = '{$%c[dia_chi_ht_quan]}' and status = '1'" check="ma_tinh = '{$%c[dia_chi_ht_tinh]}' and ma_quan = '{$%c[dia_chi_ht_quan]}'" information="ma_phuong$hrdmphuong.ten_phuong%l"/>
    </field>
    <field name="ten_dcht_xa%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ngay_vao" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" categoryIndex="2">
      <header v="Ngày vào công ty" e="Join Date"></header>
    </field>
    <field name="ngay_chinh_thuc" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="2">
      <header v="Ngày vào chính thức" e="Official Hire Date"></header>
    </field>
    <field name="vi_tri" categoryIndex="2">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1" information="ma_vtr$hrvt.ten_vtr%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ObYTKiU8ESSMtpvwAQEiAr3zULIiLi+Gzh9MTeXQNVNwWnEvpJ1cqN3LuE6tOXb/+4OtfBwIwIgHCHxUN7/aUc=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="bac_quan_ly" categoryIndex="2">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1" information="ma_bac$hrdmbql.ten_bac%l" new="Default"/>
    </field>
    <field name="ten_bac%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nv_ql" categoryIndex="2">
      <header v="Người quản lý trực tiếp" e="Direct Supervisor"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nql" key="status = '1'" check="1 = 1" information="ma_nv$vhrnv.ten"/>
    </field>
    <field name="ten_nql" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_tdhv" categoryIndex="3">
      <header v="Trình độ học vấn" e="Education Level"></header>
      <items style="AutoComplete" controller="hrAcademicStandard" reference="ten_tdhv%l" key="status = '1'" check="1 = 1" information="ma_tdhv$hrdmtdhv.ten_tdhv%l" new="Default"/>
    </field>
    <field name="ten_tdhv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="truong_hoc" categoryIndex="3">
      <header v="Trường tốt nghiệp" e="Graduation from"></header>
    </field>
    <field name="ma_cn" categoryIndex="3">
      <header v="Chuyên ngành" e="Education Major"></header>
      <items style="AutoComplete" controller="hrEducationMajor" reference="ten_cn%l" key="status = '1'" check="1 = 1" information="ma_cn$hrdmcn.ten_cn%l" new="Default"/>
    </field>
    <field name="ten_cn%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hoc_tu" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="3">
      <header v="Từ ngày" e="From Date"></header>
    </field>
    <field name="ngay_hoc_den" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="3">
      <header v="Đến ngày" e="To Date"></header>
    </field>
    <field name="ngay_tot_nghiep" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="3"  filterSource="Optional">
      <header v="Ngày tốt nghiệp" e="Graduation Date"></header>
    </field>
    <field name="loai_tot_nghiep" categoryIndex="3">
      <header v="Xếp loại tốt nghiệp" e="Rank of Graduation"></header>
    </field>

    <field name="ma_nn" categoryIndex="4">
      <header v="Ngoại ngữ" e="Foreign Language"></header>
      <items style="AutoComplete" controller="hrLanguage" reference="ten_nn%l" key="status = '1'" check="1 = 1" information="ma_nn$hrdmnn.ten_nn%l" new="Default"/>
    </field>
    <field name="ten_nn%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="bang_cap" categoryIndex="4">
      <header v="Bằng cấp" e="Certificate"></header>
      <items style="AutoComplete" controller="hrCertificate" reference="ten_bc%l" key="status = '1'" check="1 = 1" information="ma_cc$hrdmcc.ten_cc%l" new="Default"/>
    </field>
    <field name="ten_bc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="diem" categoryIndex="4">
      <header v="Bằng/Điểm" e="Grade/Score"></header>
    </field>
    <field name="ngay_cap_bang" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="4">
      <header v="Ngày cấp" e="Date of Issue"></header>
    </field>

    <field name="dien_thoai_cty" categoryIndex="5">
      <header v="Điện thoại công ty" e="Office Phone"></header>
    </field>
    <field name="dien_thoai_nha" categoryIndex="5">
      <header v="Điện thoại nhà riêng" e="Home Phone"></header>
    </field>
    <field name="email_ca_nhan" categoryIndex="5">
      <header v="Thư &lt;span class=&quot;LabelDescription&quot;&gt;(Email)&lt;/span&gt; cá nhân" e="Email Address"></header>
    </field>
    <field name="giam_ho" categoryIndex="5">
      <header v="Cha/mẹ hoặc giám hộ" e="Father/Mother/Guardian"></header>
    </field>
    <field name="nguoi_than" categoryIndex="5">
      <header v="Thân nhân khác" e="Others"></header>
    </field>
    <field name="dia_chi_th_tru" filterSource="Ignore" categoryIndex="5" inactivate="true">
      <header v="Địa chỉ thường trú" e="Permanent Address"></header>
    </field>
    <field name="dia_chi_th_tru_so" categoryIndex="5">
      <header v="" e=""></header>
    </field>

    <field name="dia_chi_th_tru_tinh" categoryIndex="5">
      <header v="Địa chỉ thường trú" e="Permanent Address"></header>
      <items style="AutoComplete" controller="hrProvinceCity" reference="ten_dctt_tinh%l" key="status = '1'" check="1 = 1" information="ma_tinh$hrdmtinh.ten_tinh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PSKtRuDqg40Vkmhr5KFxl3Oi1T4mk+/w2NURvFBfA/9BgMed3HoXhufF3D67crnRnEwBcRt6s7hmU41MUY6GoI=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dctt_tinh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dia_chi_th_tru_quan" categoryIndex="5">
      <header v="Địa chỉ thường trú" e="Permanent Address"></header>
      <items style="AutoComplete" controller="hrDistrict" reference="ten_dctt_quan%l" key="ma_tinh = '{$%c[dia_chi_th_tru_tinh]}' and status = '1'" check="ma_tinh = '{$%c[dia_chi_th_tru_tinh]}'" information="ma_quan$hrdmquan.ten_quan%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PSKtRuDqg40Vkmhr5KFxl1QRlD+MlBrvDhvIw3VpVfh6xw5VAIiMrK3KQH3oY43FO1UY8Fh5hLBhoFut5J8mFw=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dctt_quan%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dia_chi_th_tru_xa" categoryIndex="5">
      <header v="Địa chỉ thường trú" e="Permanent Address"></header>
      <items style="AutoComplete" controller="hrWardCommune" reference="ten_dctt_xa%l" key="ma_tinh = '{$%c[dia_chi_th_tru_tinh]}' and ma_quan = '{$%c[dia_chi_th_tru_quan]}' and status = '1'" check="ma_tinh = '{$%c[dia_chi_th_tru_tinh]}' and ma_quan = '{$%c[dia_chi_th_tru_quan]}'" information="ma_phuong$hrdmphuong.ten_phuong%l"/>
    </field>
    <field name="ten_dctt_xa%l" readOnly="true" external="true" defaultValue="''" categoryIndex="5">
      <header v="" e=""></header>
    </field>

    <field name="que_quan" filterSource="Ignore" categoryIndex="5" inactivate="true">
      <header v="Quê quán" e="Native Country"></header>
    </field>
    <field name="que_quan_so" categoryIndex="5">
      <header v="" e=""></header>
    </field>
    <field name="que_quan_phuong" categoryIndex="5">
      <header v="Quê quán" e="Native Country"></header>
    </field>
    <field name="que_quan_tinh" categoryIndex="5">
      <header v="Quê quán" e="Native Country"></header>
      <items style="AutoComplete" controller="hrProvinceCity" reference="ten_qq_tinh%l" key="status = '1'" check="1 = 1" information="ma_tinh$hrdmtinh.ten_tinh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PSKtRuDqg40Vkmhr5KFxl2nNzfLqYx1Qz+MzSduQ7Hr39KhKUoecTt3e7z8TUkzxBUzsputkAtzV86aBKVM4S0=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_qq_tinh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="que_quan_quan" categoryIndex="5">
      <header v="Quê quán" e="Native Country"></header>
      <items style="AutoComplete" controller="hrDistrict" reference="ten_qq_quan%l" key="ma_tinh = '{$%c[que_quan_tinh]}' and status = '1'" check="ma_tinh = '{$%c[que_quan_tinh]}'" information="ma_quan$hrdmquan.ten_quan%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PSKtRuDqg40Vkmhr5KFxl0OfjcwYA08qVWQbDqBchAejTkLWk9VJRr1EA8tFlGztlvzt0kq07nT7Hj3AB1ZDtg=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_qq_quan%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="que_quan_xa" categoryIndex="5">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="hrWardCommune" reference="ten_qq_xa%l" key="ma_tinh = '{$%c[que_quan_tinh]}' and ma_quan = '{$%c[que_quan_quan]}' and status = '1'" check="ma_tinh = '{$%c[que_quan_tinh]}' and ma_quan = '{$%c[que_quan_quan]}'" information="ma_phuong$hrdmphuong.ten_phuong%l"/>
    </field>
    <field name="ten_qq_xa%l" readOnly="true" external="true" defaultValue="''" categoryIndex="5">
      <header v="" e=""></header>
    </field>

    <field name="nh_nv1" categoryIndex="18">
      <header v="Nhóm nhân viên 1" e="Employee Group 1"></header>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv1%l" key="status = '1' and loai_nh = '1'" check="loai_nh = '1'" information="ma_nh$hrdmnhnv.ten_nh%l"/>
    </field>
    <field name="ten_nh_nv1%l" readOnly="true" external="true" defaultValue="''" categoryIndex="18">
      <header v="" e=""></header>
    </field>
    <field name="nh_nv2" categoryIndex="18">
      <header v="Nhóm nhân viên 2" e="Employee Group 2"></header>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv2%l" key="status = '1' and loai_nh = '2'" check="loai_nh = '2'" information="ma_nh$hrdmnhnv.ten_nh%l"/>
    </field>
    <field name="ten_nh_nv2%l" readOnly="true" external="true" defaultValue="''" categoryIndex="18">
      <header v="" e=""></header>
    </field>
    <field name="nh_nv3" categoryIndex="18">
      <header v="Nhóm nhân viên 3" e="Employee Group 3"></header>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv3%l" key="status = '1' and loai_nh = '3'" check="loai_nh = '3'" information="ma_nh$hrdmnhnv.ten_nh%l"/>
    </field>
    <field name="ten_nh_nv3%l" readOnly="true" external="true" defaultValue="''" categoryIndex="18">
      <header v="" e=""></header>
    </field>
    <field name="tinh_trang_nv" categoryIndex="18" allowNulls="false">
      <header v="Tình trạng hiện tại" e="Current Status"/>
      <items style="AutoComplete" controller="hrEmployeeStatus" reference="ten_ttnv%l" key="status = '1' and not exists(select 1 from options where name = 'm_tt_nghi_viec' and ma_ttnv = rtrim(val))" check="1 = 1" information="ma_ttnv$hrdmttnv.ten_ttnv%l" new="Default"/>
    </field>
    <field name="ten_ttnv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="d_language" categoryIndex="18">
      <header v="Ngôn ngữ ngầm định" e="Default Language"></header>
      <items style="DropDownList">
        <item value="v">
          <text v="Tiếng Việt" e="Vietnamese"/>
        </item>
        <item value="e">
          <text v="Tiếng Anh" e="English"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="ghi_chu" rows="2" categoryIndex="18">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="rights" readOnly="true" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ticket" readOnly="true" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ticket2" readOnly="true" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="imageurl" readOnly="true" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="image" readOnly="true" external="true" defaultValue="''" hidden="true" inactivate="true">
      <header v="" e=""></header>
      <footer v="&lt;img id=&quot;empImage&quot; style=&quot;width:60px;display:inline-block;&quot;&gt;&lt;iframe src=&quot;about:blank&quot; name=&quot;imageIFrame2&quot; id=&quot;imageIFrame2&quot; style=&quot;display:none;position:absolute;&quot;&gt;&lt;/iframe&gt;&lt;form id=&quot;uploadForm2&quot; target=&quot;imageIFrame2&quot; method=&quot;post&quot; enctype=&quot;multipart/form-data&quot; style=&quot;width:60px;height:80px;display:inline-block;margin-left:-60px;&quot;&gt;&lt;div style=&quot;width:60px;height:80px;overflow:hidden;position:relative;&quot;&gt;&lt;input type=&quot;file&quot; title=&quot;Chọn tệp&quot; tabindex=&quot;-1&quot; style=&quot;height:80px&quot; class=&quot;divInput&quot; name=&quot;imageupload2&quot; id=&quot;imageupload2&quot;&gt;&lt;/div&gt;&lt;/form&gt;" e="&lt;img id=&quot;empImage&quot; style=&quot;width:60px;display:inline-block;&quot;&gt;&lt;iframe src=&quot;about:blank&quot; name=&quot;imageIFrame2&quot; id=&quot;imageIFrame2&quot; style=&quot;display:none;position:absolute;&quot;&gt;&lt;/iframe&gt;&lt;form id=&quot;uploadForm2&quot; target=&quot;imageIFrame2&quot; method=&quot;post&quot; enctype=&quot;multipart/form-data&quot; style=&quot;width:60px;height:80px;display:inline-block;margin-left:-60px;&quot;&gt;&lt;div style=&quot;width:60px;height:80px;overflow:hidden;position:relative;&quot;&gt;&lt;input type=&quot;file&quot; title=&quot;Select...&quot; tabindex=&quot;-1&quot; style=&quot;height:80px&quot; class=&quot;divInput&quot; name=&quot;imageupload2&quot; id=&quot;imageupload2&quot;&gt;&lt;/div&gt;&lt;/form&gt;"></footer>
    </field>
    <field name="upload" readOnly="true" external="true" defaultValue="''" disabled="true" inactivate="true">
      <header v="" e=""></header>
      <footer v="&lt;iframe id=&quot;imageIFrame&quot; name=&quot;imageIFrame&quot; style=&quot;display: none; position: absolute; width: 0px; height: 0px&quot; src=&quot;about:blank&quot;&gt;&lt;/iframe&gt;&lt;form id=&quot;uploadForm&quot; method=&quot;post&quot; target=&quot;imageIFrame&quot; enctype=&quot;multipart/form-data&quot;&gt;&lt;div class=&quot;divUpload&quot;&gt;&lt;div align=&quot;center&quot; class=&quot;divButton&quot; &gt;Chọn...&lt;/div&gt;&lt;input type=&quot;file&quot; title=&quot;Chọn tệp&quot; name=&quot;imageupload&quot; id=&quot;imageupload&quot; tabIndex=&quot;-1&quot; class=&quot;divInput&quot; /&gt;&lt;/div&gt;&lt;/form&gt;" e="&lt;iframe id=&quot;imageIFrame&quot; name=&quot;imageIFrame&quot; style=&quot;display: none; position: absolute; width: 0px; height: 0px&quot; src=&quot;about:blank&quot;&gt;&lt;/iframe&gt;&lt;form id=&quot;uploadForm&quot; method=&quot;post&quot; target=&quot;imageIFrame&quot; enctype=&quot;multipart/form-data&quot;&gt;&lt;div class=&quot;divUpload&quot;&gt;&lt;div align=&quot;center&quot; class=&quot;divButton&quot; &gt;Select...&lt;/div&gt;&lt;input type=&quot;file&quot; title=&quot;Select File&quot; name=&quot;imageupload&quot; id=&quot;imageupload&quot; tabIndex=&quot;-1&quot; class=&quot;divInput&quot; /&gt;&lt;/div&gt;&lt;/form&gt;"></footer>
    </field>
    <field name="rkey" readOnly="true" external="true" defaultValue="''" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="rkey2" readOnly="true" external="true" defaultValue="''" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="315" anchor="8">
      <item value="120, 30, 20, 50, 110, 100, 20, 236, 47, 20, 0, 0"/>
      <item value="1100----101: [ma_nv].Label, [ma_nv], [image].Description, [image]"/>
      <item value="11001----: [ten_nv].Description, [ho_nv], [ten_nv]"/>
      <item value="11001000: [bo_phan].Label, [bo_phan], [ten_bp%l]"/>
      <item value="11100----: [gioi_tinh].Label, [gioi_tinh], [gioi_tinh].Description"/>
      <item value="1100----101: [stt].Label, [stt], [upload].Description, [ten_gt]"/>

      <item value="1100----------1: [ngay_sinh].Label, [ngay_sinh], [rights]"/>
      <item value="11000---------: [noi_sinh].Label, [noi_sinh]"/>
      <item value="1100--110-----1: [cmnd_so].Label, [cmnd_so], [cmnd_ngay_hl].Label, [cmnd_ngay_hl], [stt_rec]"/>
      <item value="110010000000001: [cmnd_noi_cap].Label, [cmnd_noi_cap], [cmnd_nc%l], [imageurl]"/>
      <item value="1100----------1: [cmnd_ngay_hh].Label, [cmnd_ngay_hh], [status]"/>
      <item value="110010000000001: [quoc_tich].Label, [quoc_tich], [ten_qt%l], [ho_ten]"/>
      <item value="110010000000001: [dan_toc].Label, [dan_toc], [ten_dt%l], [rkey]"/>
      <item value="110010000000001: [ton_giao].Label, [ton_giao], [ten_tg%l], [ticket]"/>
      <item value="110010000000001: [hon_nhan].Label, [hon_nhan], [ten_tthn%l], [ticket2]"/>

      <item value="100000000000001: [dia_chi_ht].Description, [rkey2]"/>

      <item value="1100: [ngay_vao].Label, [ngay_vao]"/>
      <item value="1100: [ngay_chinh_thuc].Label, [ngay_chinh_thuc]"/>
      <item value="11001000000: [vi_tri].Label, [vi_tri], [ten_vtr%l]"/>
      <item value="11001000000: [bac_quan_ly].Label, [bac_quan_ly], [ten_bac%l]"/>
      <item value="11001000000: [nv_ql].Label, [nv_ql], [ten_nql]"/>

      <item value="11001000000: [ma_tdhv].Label, [ma_tdhv], [ten_tdhv%l]"/>
      <item value="11000: [truong_hoc].Label, [truong_hoc]"/>
      <item value="11001000000: [ma_cn].Label, [ma_cn], [ten_cn%l]"/>
      <item value="1100: [ngay_hoc_tu].Label, [ngay_hoc_tu]"/>
      <item value="1100: [ngay_hoc_den].Label, [ngay_hoc_den]"/>
      <item value="1100: [ngay_tot_nghiep].Label, [ngay_tot_nghiep]"/>
      <item value="1100: [loai_tot_nghiep].Label, [loai_tot_nghiep]"/>

      <item value="11001000000: [ma_nn].Label, [ma_nn], [ten_nn%l]"/>
      <item value="11001000000: [bang_cap].Label, [bang_cap], [ten_bc%l]"/>
      <item value="1100: [diem].Label, [diem]"/>
      <item value="1100: [ngay_cap_bang].Label, [ngay_cap_bang]"/>

      <item value="11000-----: [dien_thoai_cty].Label, [dien_thoai_cty]"/>
      <item value="11000------: [dien_thoai_dd].Label, [dien_thoai_dd]"/>
      <item value="11000------: [email_cty].Label, [email_cty]"/>
      <item value="11000-----: [dien_thoai_nha].Label, [dien_thoai_nha]"/>
      <item value="11000-----: [email_ca_nhan].Label, [email_ca_nhan]"/>
      <item value="11000-----: [giam_ho].Label, [giam_ho]"/>
      <item value="11000-----: [nguoi_than].Label, [nguoi_than]"/>

      <item value="11000-11010---1111: [dia_chi_ht].Label, [dia_chi_ht_so], [dia_chi_ht_tinh], [dia_chi_ht_quan], [dia_chi_ht_xa], [ten_dcht_tinh%l], [ten_dcht_quan%l], [ten_dcht_xa%l], [dia_chi_ht]"/>
      <item value="11000-11001-111-1: [dia_chi_th_tru].Label, [dia_chi_th_tru_so], [dia_chi_th_tru_tinh], [dia_chi_th_tru_quan], [dia_chi_th_tru_xa], [ten_dctt_tinh%l], [ten_dctt_quan%l], [ten_dctt_xa%l], [dia_chi_th_tru]"/>
      <item value="11000-11001-111-1: [que_quan].Label, [que_quan_so], [que_quan_tinh], [que_quan_quan], [que_quan_xa], [ten_qq_tinh%l], [ten_qq_quan%l], [ten_qq_xa%l], [que_quan]"/>

      &ListView;
      &PostView;

      <item value="11001000000: [nh_nv1].Label, [nh_nv1], [ten_nh_nv1%l]"/>
      <item value="11001000000: [nh_nv2].Label, [nh_nv2], [ten_nh_nv2%l]"/>
      <item value="11001000000: [nh_nv3].Label, [nh_nv3], [ten_nh_nv3%l]"/>
      <item value="11001000000: [tinh_trang_nv].Label, [tinh_trang_nv], [ten_ttnv%l]"/>
      <item value="11000: [d_language].Label, [d_language]"/>
      <item value="1100000000: [ghi_chu].Label, [ghi_chu]"/>
      <categories>
        <category index="1" columns="120, 30, 20, 50, 100, 4, 100, 50, 50, 50, 50, 50, 50, 29, 0">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 30, 20, 50, 110, 100, 20, 30, 50, 20, 203">
          <header v="Công việc" e="Working"/>
        </category>
        <category index="3" columns="120, 30, 20, 50, 100, 100, 20, 30, 50, 30, 203">
          <header v="Trình độ học vấn" e="Education"/>
        </category>
        <category index="4" columns="120, 30, 20, 50, 110, 100, 20, 30, 50, 20, 203">
          <header v="Ngoại ngữ" e="Foreign Language"/>
        </category>
        <category index="5" columns="120, 30, 20, 50, 100, 4, 100, 20, 30, 50, 100, 129, 0, 0">
          <header v="Địa chỉ liên hệ" e="Resident Address"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="18" columns="120, 30, 20, 50, 110, 100, 20, 30, 50, 20, 203">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ia4XDMcx1FoIIq08b4bJZpbVjAXhuAeZ8AEa5tYn3akA=</Encrypted>]]>&ListShowingMessage;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNLMq5l99RYN0OG95CXHthM8RfemiRr6Oa+U63h7EFEna0+y2eo0biCGwe+SyDxY/VMFdprFTOrYnZsgejnfUgIR4IxpeG2FJyeDBOCg4SEl</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&CheckDepartmentRight;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6TFlcLRnR2E/loEO547FcCzpnszWyPoomP05UivWJTqXHnr0kp0GDXR1jJybBglSZe1fvk/gxAIX+yS4M27wvhEyqFrPX4OjARejNYZj7pVSF9s+RKjyYqMDX+maNmQDexAbnX4nKPBtzY/ltfgK5Ugl2TCUFI67kH58Abo2muSF9CicqdjNdSECI/oYyh1G/IDAE2X1dC4VzSoGuh1keV2vayfaIyIX7ZG7oAEftHtXKRtkA9dNQTrjiRRyzMrqQOWF1Az2zB8E6CXXZSKO7zba8Gv/Mf4FtVfsa+rwiDy5nhwZ3Duxxym8pvJ0T+B2/ZLwF7XE2Pe0dDHrTicWNNftzthPwrwxHFWL+Rt1wIgXoJiaE+uK1+rR5QedXbax2apiUUYmkdcmgxnlUEW7ez5a9uan1qYNkfsspKQqQY3</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLawxGCuLySN0uwaFGfgsHhhhMB5JkLFS54Z1T5jd3om+hVuvPuk2E5avmlDVN69WW8lzKJjJ4TZEb1VsHOmYZc=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAnfmKSAJtKy5hx6O7sHsw7VzWxfsbY4HVIFnNaYoNFbUZMROgtHU3g8P44fAUpcyHJQKkWtm8Em5Q40iqws6eo=</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WtJF1Oh/s+pAZVy8P7PyYUDPpIynElV3UzGXmiEhxCHFKWMLc/xS3lV5snn/GhEdw==</Encrypted>]]>&CreateTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&CreateTicket2;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VCCyk8ufSTKSGAh6J9lLbOxLBoFNAMLh2v3lOduH72PL6EyA8NCmID6CJp/yziEjxLq9QG5SjeznIFCxF7HUgJMU/5oaeoMnE88Dkfc0gKrr2TaP+V9nGfZAm4ksJP4eooZwPjRzMSTUHDedW+RR+rX/BPqDnp2CjAL12PXuWHlbWmNJJ7z8b9OdxJ02wINmQvkWvw7w5b4WF8SJmoOkuKZYgT94JC+WQfEfjToDRpOvpeO43BBvGFSzqkvrt/XbXAbbRw83LaCVraFBq8ZW7T6w/IFo0Tzkhup4zPH6OjhTfHtqCbr7DJG4zt9Z4WcTtTApibY+bHX0Qr+URwBMyFOrFOAl1cv4uufmEfrG2SHD4YBfaaUWVIb0N3ppYtvyDqiww8yv5DqnibguaQ7UNUJLmhw1MEnfjQUGH5+kopbBsB5OnBpucK8yLqA9rtJHmjCJJaUULyGVQZoVnJBwuxVn9umS2cGQwg1E1QOLrVGnENla/Jz5BNrcKl9YiEKoExPfj5VYpYCz/cN99Wk5IZJn5fI7PHJYALQWJBpouFoNbr295MBZKxIxkIFMfdNij+pR4qUMFkXvF3n8eRxflSp/UvzIyZXZ+lC410F4mfXhNerxWvqkfpUg13OJgpr9BmwKLIIsBvu5fnNnGqyj/QN0viO09qo1vrkKfwVOPPvZDLGokWW5yoKYo7xiCmuAFmcvH5/BKobKqm0jEWrp6nv1XNpnBsCEdRzHW91ggQN2rHMY/+9P6qZ+8LnFkr+IOwo+qmbIS1u33zTX4luEg3lkZEZIB57glLrCu7zZCgm3JYBx0qLLD55ofTvFc5OpA==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq3gnpu4JAx3I299W5wkMBy1Z3eFDXXRuny9HoV7fX/90xS/QKjazfarDkOSkSMkOfBwentj+3RWPxAwB6NzN8GGTa38eu0d9XoPlEUYIGHE1c3ig0Z2iuiRNAKUG9hZs1AU+5wf+fDn4/vpku4kgyUdvBnzJIaEaNPoLWNA9iYX2fjlXCyjcyV7ESXcRrNZrFfpreXe43IVaFYPl2j/Lfg27fDAxNEGyKLlCNfNYLmaAzAx4TlGr6X91rFKqxBpL0JHKmSe7ZKrD3UyPSUgnU1i3G8HV8UuHGetq8igJzqv8aNmUlT6WeJtgSDyICzQjbQRWfbzUyAYZul39XLLhrX64zq/rrzfc2KmgZrhHJZ+/MzwydMZFUO305uo3reAquKST2dGJc2nTKRqYMHNHc8s7IjEIzbgcSBxw2l5moZZ2f6miB8G4IAdnLCuK2Dl2FI=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CheckOutWorkStatus;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu57T4PcXRvMbsOHckmf6v3zdo+m7Y8Xl6wlokNn8zhIgCzVlvGvjZiHKZwNPqsBqhlldmOWm9OXPcmJ1lf3EKi2LR/rSedXNxcBBUYI/r2Y7JoycwyxJLsyaa0UPURwYwYGMnKc99el1Ucco9gjjDWMzEYTJdEooT7W+rRS0r0BNmRO/7tUc7b/mpBfedQy4gkk0k6fiHZzAb/TGKPFUFaB8IqNGwVOH3Vt+2Fx7/1q/r3CimqT/Cw+xSB6K57VmmegxY88BW8tzdf8B+1ofVX6VjcBxkvIsXjw53leZpCt3ZOsL212N4OkUVgOehaBx0xYVngvvxHGUHX5j2kUb5YUsKTPl225M23+DSyJquuCcWj1gKkKM3OXu6oJLUzswtQL53a0N7hIULN+m7jToSVQvigONoEzhJ0UK2xbZjk6orqRfpcun/VXh5+Ksg25ffnmL11ZljMfbxN+d8i0uiMM+L92Ud++J9mNrXbGDEy1SktXvw8c+0vOPbhTXGxa40I++CK8EITPkQrg39fLkTPX4kDW3BBIpRcfFgUL11pPWuI3a6RYjc6J9QODGVkIZLIVCFu1xLmIWp/cVwsx96Xg7bZDOhujeg7VGBiqKAuMBfm8j+g2QdOD/EOkp74sSt051wEAgUz1Vaq+mvncEWlUkqqjOmn6a48w2VGrute9qhNL9WIuN1voDgmqM/RvDxoA5eI+77UHlGAo6jtsferGqYOeizPtRle32OzVe7SFJhvF63QtnuTmOHAbvza8Y0jTZgqSC53j9Ht2l6Qlnb5eW+U7StR3XiiJX/cBINIHgleQd0cw3RU3kEQj4FDSLrHazCXkIb5zMwXYBV9ZV1AwiYb3LJTdcqrKmX+kBNaVUtsdkqhFaIO/hmX020xAULJC9/GSQhSi8KbG8DnkxY8URFdkIOnv0XYmGvApMzsT/DgT6IpVTHbMrQUpRT3IJK3U62QlTjDYjczYCmlA+FHgUqEfO34ZMFEo9P6eTAuqOxlodf+n0WYglpUi5K6UhF8AXf/JqkHdItLnr31tqfsZfWMHynVNaWrGARR0zFJ9wJqnZ/RyjyDl1OO7dGS3rTX/Y7NpOi4CUc8vQ+IKSuAkGV2f+lcFz/AOapRI1TEoD</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+H4LscoO37qLV/zCFu5iaHelIbrn1y+f/oRRBGQn5wmDCH3+dap/ad6C6vPf7SEK3ueXgdiiXkYFmL6rV/1j/U4qyyunPfpOR6hzfX79vCeNTH3lVgxgC4NChpZQ5mzjJX/zJP2CupOhmvfrw0lxT9FQc2CElztY+aOkGnMHUjU86T0s4Ve1NCa+aszmEUgjkerzLhmGk3c7fvxaJzaPAF9AKjxt1hMlJJ17b3arPdxuP8q5uECHQkhZD2Rq0zlI8nakk9j0yQIIZrQBFl61DO3wXHrm9QLRnYQcDuVMkBoj93ytO2cL2mdgLlOOn+aEQfb9ohV8lpSG6lP8TLdJ/PAp4DIow/NwFEeR+VHyN8kEI/0bp56xIFLSOFKDHE8OZyabP9doYlL5wdav9qvi/1yEsXw0idHvdVxgRkB3JluU9KhwW5qTXcY3uXPOx8UBmcFhi3QGfh3+AuUy8e8CEzoYE3LkQogvib3gqxzzqGp2hqlEiC2rDbAycf7ws+upZkQA9v72+0kMbPIdKCaShQvxx8dyR6sv5wFiVmrNhfV</Encrypted>]]>
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ03ga3vxnuo3uyPjOXSpZsoX5Ei60KT1sm1EX19ZVLqyjVl9rg8hmNjz/gSnk6YG+dTTP73c9erW5+S+m0Tx0tVF6mtTCsO4rRUNzkzGZ/7hi</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CheckOutWorkStatus;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7gxgle68rOpdiU60H88dR3VteLwrhSy4Bqlkz0D67zsch4/KCUQcd+eFFnxH4uf5XRYCe/4S7ovAADS2byZIY3NjsnRcPsbuMgY8fVa0uCMTBL8PgLCir47w4lLerhYwsFKL175tn8bV0gxlswV7xzlMZOgTcHAYqsByjow0acDfODaOOF1Ct1TjDbv12zAxwlLBozAXYxL1eReNuznhYMS0l7ccvPjyOGr3X1Mia1XzsyZFOKqNGC/DDdOZR6v68VBJ7REA9M1AksPiUGn9w5xDe2dYuiAroIzIrMynoBPYHVs0QEBdl+ob5J7I6RAkS2IToVtZp520apS2y6pxC2TApECyyuwvNYm/qEa1H/X+AdKJa/y6UGyjQdNfvHKF0h9YEtfQ1vnoQfYeJ45hiIKKu8LjaPsKPc9BEhWvf6XGgdClXlzQf41qQ8lPSxXQ6TjfhB9qU8bxw1viJ7EjzrfiRIy3PjBW6xajhdJ4Q21YYpG4Bm5P6AoxHWvMuom6DzNRpMQ/uOIMNxnb/pOgBvE7S/030S2erfkmd30c88l/QGFTQDi7XbU/22mLXAduULGmZv30UBcdYXF+odphKBCltU0x/wvdTTxFqMj9JZYqzIN5vqXbyzPqBE2Ft62/brC52qRrTPMraRiWYKuwwDeG4+1YG3Xpc5M6mIj9vQ+fBvgrIiPFjnxjZQl/J5LUgG/bUWiIwaf5MvbiTEayp951OCdQSUJKhob2kIa4F+avUQKFvDjGl2v5R/Ivi384Bv885xVuSpiMzFPyO8BLRgKn68aSit4GXtVMuYWcF9JAOndW1TQmiUrVeqRfpFn+sKlQ2ig3bjVtVa1fIm83ZvJa54fAv4jOXUuIR1cwvCKsS2W3dol5XwAZnhPB2CmSblJDjl+6K/wn4BlE8NUfNXyATBH2GYnBlAksowerxYPhnMYHHwFDJkqYhmMKLQwFlHE+GG2SOduCajxrJP5ymw</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5y9oFVbcggQbkHvLZBHz4Z2y4F6TxKu8r4bhRG7yRM/AAKd74KNxcpmTpjiWQ25yBaA+2JrAX7Cf5iRUY/vU0OEnedbtBaiX3wOxrKGGmL2lVCA1CPs7kZ8pusvvAJK7S3mCiTgU+BuYiIfpezRIQZGuxyxPcwq5ywXgPtwiHs1AHRa99lBcozEsChG+1sJtsCNY/rwVZKUY1cwKG5+mx0+ubkdSQN7cgXtl5hN20M1v7ubUGmBwDmL77cyHkUfil/L5SKo5AJL2ZJG4w3kb2lg2DkQO/yjRnWrsQjaxfewfYLXP2wQxygzUT5Bd7vDeCoxqbfJjIxHiNjyrjc0RD7+dUXACh3dEepX32XuBC3I2X8wXfIOrsE8uQkbWsxIbOrTST3K9vrAwjvMjSyNZk5C6+6FiR1YER+7ukkX6Ub4U4gd2zniF3DEX75SkHpLXrZwg6xz3o81DPjExD/9eUHs/kCbiXYl1k9JMLgs0pN5quGTec1Z64JlSiAwOT0kieDohDowSaViY/LlNWL+PsJd3SvK4Cx3ssORNtVNAsxXjoU4WVveBdZUgYSniwsst4yegqjh7II6/fyyoCy0G507V0LVoPVnXOTq/wN01FQXA3NOPCVvEG327Ti8YYmDaHdF3kivvsTwi9F+dGxLZgUWPGNkalBRBtN5SK5StnhkVNDTDej01wupPhqcQHp1TQaoPP8o/tH1EHEM4yJqOE+N+N5/xGs4FiR3vmGwIVgYo7DGWpm97fZBdcCLXubKDHMHpLMzgbkMU6sszdKqYF+WCE/WOXg7xFeYhXB+Oq7Y2dSqpcivm5ZAJYGGS4HNdQK/D5L4Eh3yLYVK7tWOjoh0vu2frb9hCLO0IWkQYLQpjCnwVr7P41jadufn5hdtO97tHJmGGMDD481JbgAs4AAiwkhUgM4FquW6ZJL4pXbgq4oNiNSJWcliTLAA8ho9Q3BzuNaDDDOCdKIlnlf+S88APB+jJ5p4eO9R5KpFrnu23yFsh+S/2pc6n9uBKPv+nKxgTqkiQZ5Z3SqxodNRKVNUc+eisRQHyyKqF7TNZtl/IZURXJdZHqIYVENXW2RxtIzWIx0iUNbPBO0VrKNnmQEPT4W5Qtj81j9CQzr/vxJQunf6G97144mw0u+RAbmPK9QBW1Q0XJA/J23vr/WKzxlQwbd/SF1iTUdRRcykl/Y4rA==</Encrypted>]]>
        &ListCommand;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ03ga3vxnuo3uyPjOXSpZsoX5Ei60KT1sm1EX19ZVLqyjVl9rg8hmNjz/gSnk6YG+dTTP73c9erW5+S+m0Tx0tVF6mtTCsO4rRUNzkzGZ/7hi</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxFCkeLcrWLNJ6trW0TpM2BUeotQgKkOfTZrh4W9KXNsAbJR6BgGC8zNv1EPIk6llasCStQVM6dz8oF/o60dzExcygyOuFfA0CINKLe8Sy1vzBvsB/Vch232Jwg8vYZa8kvDtl6jS4wWDd5IZm2eLdAMc1b+VCkDww2BM8/D6wd4YsqDbVUvlAVkEWa6UwleJZ0/QMuwvdVhI7pNodpMAg0BiiFxmgiF+6VISH+X8slaOBJLd+6BpK0mjWEYUMfW4tDJX7vStJomhLKrGgzQyagtrdbNu2vN2yg2ryt1/Fi5</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyRW4LhOHwxFJ+Zvue2jfg9E3QmDJsFy+Icl5uONzNcBYRB+gMUTIB/zXPZoQkeZENCNqY4IKbXec54zIOfHv453ukFXEz1bCsL1dNOsHXCiuh2wd6/hUEI4iLwIvvoTpWSQ05uyMzw0wajaYmbXi2OV1UGrAexI2WfsW40+LLZ/WgOaFpbGfIP8LCu8xTgDjCMYplHGtmn1N5tjD3o1IO9hdLo5fCb33autdwFB96+sOjXPK9qcs4C/WHkGCu5pmuU6iueVevEw5GHj5xmeDFdzu0dLaQT8gS7vUNU548/NLbeFELusqXRIDJPSrANdU9u11YBasr86kUnEq70DX0DRXU6Y0I4IewNv6e3zDFSYuFq5S6ahsJxUfjSv+ZBQOwKRAYIeFfSkfOoAWt6jjvvUo/ihVAESUoa2nqmbvHuNI0YRINUhxDtsuz1CmRh0kzELHDMellnaQl+V4Vd9ItoG58SZry9eGdJq05Pj4HY8</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>

        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EaEDdzREUg02aqGLoLn47gci+juDjGPb/mgmTHiU4nR2DNOdJmYjz4c4v/VddPUgN/TpV1Pmcz9s2zx2oebO7sUYQDG5QaKvZyGX4qTXDP1DezwH7pAwCdjw4Qkl1i7DSvhum2WcRy18wW987rK4787tXWvoEG+a8Nngek9lmbRR8qveA89RWMaw2t6Z5wF7qyvZtESjO01U6Po0sSBGY2tMGmvP09d3FZcmgpPmPmEh/aqW4rMjmjaWY1ffqVL5X5wph9WYShXiQAp7h5kuLItSji/+kUxkyoNWaMrEr0oLn4U5ZFQpwrCsFM+7rgZYHiQV8Iek9xp+vn1ZoavmVeRfAcworRvPT0GA5LVzKgFhBM0Mvt+b2f/d9SHWo0LzX2YIdmcmr0UlfsdPM/e0gIPETh983fJ0kPSf3a8bJAw2NPvTYdsWYTV1aCsXN57Gdb6F0k1rxmCpMQ9spWvakYxki5aTLjcTX2K6v1lIxRfN2HSUmVgjYHAueY6mCjPqkkUE5FMLJnYCiSZnlXd1uKpC5zdLKi+f8jOINmioATbjbxOFQ4JNH7Lz3hdNsiy+uI1xMLey+aBQ6Almr8y2555DRnYBTR6PVp2+I80TdlS1npo4WOltProRTYLw7mCVa24tk0HUPn4MV79A7SlnobaiA8Pk/vbcLciIBij6J4F0eRy3z+dSUcSTqvtV0aO5qqlDjzD8J/LgbbN0auziuh9sTkle8N0VJ2dDhF51VaHdn2TNPehmjssS1THYFar+JiX3rK5Juwh4PYnqC1Sp8Rs=</Encrypted>]]>
        &CheckValidEmailCommandChecking;
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bqI0/PrJCU/a+ee3Ue8mIj34ve0GWpNn71Vz4hVGEedY66z8LRQalTrW270vWC5wxKaFffZrSJeK3u0IUHmfCTvTfA5skNnaNPs0Z+W9BzgPq2rT3fplZ0UhJmVmsVrYZvQjyTby++If608eXIaFk6a4/HJ361OoCPclCZ3/4iJHBvYswJSYMtvRstFY12kXEsI96+0362nzo9UW7X1Af85gdzYiARZ3b2TQma3SYr2MfqM/oXNFEIX+dVofbaVXtbGfP6OWr2iv0aG7wScvOUFu9o3o6Ru3eFJMnSU8AhYKrmpKvqYU+XKv1zRwkjHBmdTZt6NDOtRCSABA8KtnMAi8XXa4SWw1k7UfEjWGjpbetbF5lYZFtYFTqI+MbB16zW+r06xwFY4iuUe2K8ljxd4RrPeiCUHuw9Zh85nOBYjvxa8aFpmuZPn/MRZyzmHeg4oJEMP8NA1KM1bRJeIW3JLN5m+L9OrygvExa8wqjXfVwpezcNvKRX14yIr+6N9gD8JmWUz9eLia4Irl6I9M7jlmAY7dksOCOahUHWn9P2nlXMrbDw8z+JKxtI6tJ1apncX0CrKe2WgPeECSXFkYNg=</Encrypted>]]>
      &ListCreate;
      &PostCreate;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTdaxH/3QfonN47GPe342jupDhewz7FHdG8fTRk0iqIUXra8ZTzy4CYx45wo0BRt9/mRkcmdckWllpwMgMS1RJRj</Encrypted>]]>
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4drvngWDtBGXPXEY5jXmr29juUpnnsoNqBCtW6+gbViYQbHAqRjwmwhWo1a4jR/I1PVzhJhPrplOZ2q7BLDsZ69SVijTHs02IDEIh8icESCD/L7seGKtqESmkol6LCuM9Q==</Encrypted>]]>
      &ListDispose;
      &PostDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4eGJU/j+6fwlrabixUOkdbVq1JNXCqDt7zqYdT4fU4iuBo5wc7VQZXC6f3lnbgK2hY8GHWPab4ZqMghIb20+tqArQti+NnAYWw3wrmX2JZKCnUB+ovyNGE5SHPKA70Vxq5S0EGw66KOoM5unb6R2nwh7qdRvbPbrg59rQWD7Ltc4I6PCmUK38Zl8ungc0vHZ8EzAacyKn1DZNOd1oaPVHB5oXCab+n3oRXpYl5O78Sk7K/yJN1TPcmxfFjM0DDIFLAZRepCtgDRsjnur+w7mNzUBb8YXbxfaivONrNNTJ/ZFNn8vxH9zUHWk+BrrJStU+38pzbaIWd2Nh9o1Hxlhtg4C0EtKNjHFDtHLLPVc8K5PBEh3VVpV+8t39PG8ZxPQ+5fLi7cWXq8qQd608BZkTfPuy9PpDLjC0VckQm6s1Nyc2WSf08hN7r/Fev3IjvbOiQ==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&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</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&g4XXL7TDkxCjibOa7OFqhRhVWH0sQnaSW+14ZtWEf1+8wHUNJKKpJETCpvm3zUkX</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyoZGEdv/qnNM7x93FQGFuUndTGqLlBgx6f5iVbrXhRLU6MXb/NNB8WezqjC9tLrCRvu81zEK4ybP6kNIU7xkEr0PvTTUpnldP2sungTpzOSHdSSaROfHgnmVxW9e2kjPAlOYZH2AP8D22HVxuzxxGBU+uBTsoLkX7rL0EjCfTa+7CW+2ev1ucBx7YAk5+m8Vdb1vZ/3GB/6+Fqrx2KY4hAxdJ6vf05Zeke0j/HUrbxasnBi22tL5HJPEorFFMINDjDCS9bAbCrFqDZM5wYOBzGw9oc67gkawu0MwPeyj3p7bZVVnNPEuPo/R6jeX1F6qpAC+tI1yMSralG+IlFdJ/R4+uVB566GmVU5DQjFo98LxdYy3x/cF3N9LU7lKBT/RHRx89pks/6DXJzxYZ5io4waHP3unXRFDtazUWDAEIr7yGKhoCK8Xh/aKYqd4SViQcZNWX6uRVBFYhk5cskRhg5qcwVc3p3aQF+WXEbYi5I3qE3RX+5RYr5yO4BqKROy7edbpSwRQQbBjibGDxYOpQ6L7duCy3JmKzi+YoxkEIY79f0Elsw3Y5kDBLLq6uMLsnPGsA4zoiDpm0OdQYPGd7h6gH2pBvwQC6TBHvX/yzTsRGIxCe0g9tRP7rbJ0MNNo7RKlPMDk9RnXNW43N2ObhlE=</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZa8L384PUkg/4jpaczSTZ5aF4A/eQkAQqWsIx+wI7joA==</Encrypted>]]>
      &ScriptSuggestion;
      &ListScript;
      &PostScript;
      &ScriptIrregular;
      &ScriptWatermark;
      &OutlineEntry;
      &CheckValidEmailFunction;
    </text>
  </script>

  <response>
    &XMLSuggestion;

    <action id="Position">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5T3IkZLmBJ6BTfbYRKeaT/r3nMMCZerHqRzT0zfL1lAg9tbvGrXUir8s4MszlsXaXeUfdrs1en7aCFnwSKcTgjULfnOX3wxxSwDGNVpfw9yxp1fO6EEXGe0hwTQ9SkEyv8HqbmQAqg3FydKuCZUxYNBtneeVIvo1dqU7IXc8ApiO+3bPzkAX2XfK3P87iDeZA=</Encrypted>]]>
      </text>
    </action>

    <action id="DefautFormValue">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&CreateTicket;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&CreateTicket2;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNC31gh6pSGBxTNK3uvX1JrCycfx/Bj49HW7wTB7bZn4shEk+EvV1X0jouTPKwd1xhhWMOrPUYSlR2IF4hEDGfg558XsZ18Tjf+H+0BNT5Qw+Ly7NjbmXDcoJxlms5H2TM2IJkIwW6F3k/67sXwHIDTReS+d/P2/HtqqEPicfmm1WFbk5YzvIjnyYm23uO+OHBDpB3UivnpXgO2M8SyzmXcSOQ1DYRKudDtKEBTOusETr9q+uxpbXCDEPbXrZpYEtS+0eJcMqHcP3kTeddjLRowdn/429cQPz+/+iyEWx4JuKZhRxnV4AJFFIqzH9qZdQWRAFTWmUxLOiiaRY8EtPsCT/rdcOIw7O74vrVCb/HjfkhkpHkQVaVPMs3LXKLzz0st4nYLWqJghYjBez2ld3ZgYZgzWeLgYehmqJpvk5Z7D3WEw0Z3G1+4oIugQi1QLxUzJ3IA1YPZyGgAZZIsKatdD4CFD32l7TXl92GRWGn2jGrMb9d7KqKbZCMmTa13Ss5qCfad5a2mTORBwyahR3g7YzWiCpoFVN+4G1Q9uUqdGrIzJdSYP8E98OKKLnHUaDaJ0AeOwrQNna9b3twi8vxvkHW3Z9OjMpcrdLZ9fQFsXdjwb++Z31A5i6bfW6oc3db96pFPQiF5FmbyjjDmnZ5yfFrMBQcr6YNs7ggFn+Tt847eI0SurLqeaUsFnHq9szD2gWmHLmfHbKfQ0hZpQ6Z20OMs+xadb1qg2ESSLOzBwGphnSHa4p1D+ncmearXfHbm9dmu7ceW6mL3lDjBZZmK2ff3kC9kmiYucncFoyxtbYV0jXY+vTwMe8uX6uf3yhF9bIZx502evO4LEs9YWbhxApxrhWrIuEI2hULO9j9tFccRYnqdBxUnV05Ysk9Jn/Vd2VtCN8+9FaQthU8Guhz0=</Encrypted>]]>
      </text>
    </action>

    &ListTicket;
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&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</Encrypted>]]>
    </text>
  </css>
</dir>