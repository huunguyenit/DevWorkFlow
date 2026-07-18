<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CreateTicket "declare @ticket varchar(32)
select @ticket = '';select @ticket = lower(replace(newid(),'-',''));
insert into @@sysDatabaseName..ticket(ticket, user_id, data, datetime0) values(@ticket, @@userID, '@@appDatabaseName', getdate());
">

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.hrRMApplicantProfileInput;
  %Extender.Ignore;

  <!ENTITY % CheckValidEmail SYSTEM "..\Include\CheckValidEmail.ent">
  %CheckValidEmail;
  <!ENTITY CheckValidEmail.FieldName "email">
  <!ENTITY CheckValidEmail.MultiEmail "true">
]>

<dir table="hrrmhs" code="ma_hs" order="ma_hs" id="HAP" name="cookie" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hồ sơ ứng viên" e="Applicant Profile"></title>
  <fields>
    <field name="ma_dot" allowNulls="false" clientDefault="Default">
      <header v="Mã đợt" e="Period Code"></header>
      <items style="AutoComplete" controller="hrRMPeriodInfoInput" reference="ten_dot%l" key="(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = hrrmdot.ma_dvcs and r.r_access=1)) and status = '1'" check="(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = hrrmdot.ma_dvcs and r.r_access=1))" information="ma_dot$hrrmdot.ten_dot%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99MdTRN1j0ZqTmBnewZZs9WZ/CRuhRfHHmaJe3pCWNePIHo7xfwOqqTNh4Onl5UevdA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dot%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_hs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã ứng viên" e="Applicant ID"></header>
      <items style="Mask"/>
    </field>
    <field name="ho_uv" allowNulls="false">
      <header v="Họ ứng viên" e="Last Name"></header>
      <footer v="Họ và tên" e="Full Name"></footer>
    </field>
    <field name="ten_uv" allowNulls="false">
      <header v="Tên ứng viên" e="First Name"></header>
    </field>
    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày sinh" e="Date of Birth"></header>
    </field>
    <field name="noi_sinh">
      <header v="Nơi sinh" e="Place of Birth"></header>
    </field>
    <field name="gioi_tinh" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Giới tính" e="Gender"></header>
      <footer v="1 - Nam, 2 - Nữ" e="1 - Male, 2 - Female"></footer>
      <items style="Mask"/>
    </field>
    <field name="ngay_nop" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" clientDefault="Default">
      <header v="Ngày nộp hồ sơ" e="Date Applied"></header>
    </field>
    <field name="ma_tt" allowNulls="false">
      <header v="Trạng thái hồ sơ" e="Status"></header>
      <items style="AutoComplete" controller="hrRMAppFormStatus" reference="ten_tt%l" key="status = '1'" check="1=1" information="ma_tt$hrdmtths.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_vtr" allowNulls="false" categoryIndex="1">
      <header v="Vị trí ứng tuyển" e="Vacancy"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="ma_vtr in (select distinct ma_vtr from hrrmdotct where ma_dot = '{$%c[ma_dot]}') and status = '1'" check="ma_vtr in (select distinct ma_vtr from hrrmdotct where ma_dot = '{$%c[ma_dot]}')" information="ma_vtr$hrvt.ten_vtr%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99IwUFqI9JZ6T1dG1DStPyio0ekabuAP0eY2EpeHwqVor8a67bAfbhg3V1yCQ7e+S1w==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" allowNulls="false" categoryIndex="1">
      <header v="Bộ phận ứng tuyển" e="Department Applied"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="ma_bp in (select distinct ma_bp from hrrmdotct where ma_dot = '{$%c[ma_dot]}' and ma_vtr = '{$%c[ma_vtr]}') and status = '1'" check="ma_bp in (select distinct ma_bp from hrrmdotct where ma_dot = '{$%c[ma_dot]}' and ma_vtr = '{$%c[ma_vtr]}')" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="muc_luong" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" clientDefault="0" allowContain="true" categoryIndex="1" defaultValue="0">
      <header v="Mức lương đề xuất" e="Desired Salary"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_lv_dk" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày có thể làm việc" e="Start Working Date"></header>
    </field>
    <field name="ma_kenh" allowNulls="false" categoryIndex="1">
      <header v="Kênh tuyển dụng" e="Rcrt Channel"></header>
      <items style="AutoComplete" controller="hrRMChannel" reference="ten_kenh%l" key="status ='1'" check="1=1" information="ma_kenh$hrdmkenhtd.ten_kenh%l"/>
    </field>
    <field name="ten_kenh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_nguon" allowNulls="false" categoryIndex="1">
      <header v="Nguồn tuyển dụng" e="Rcrt Source"></header>
      <items style="AutoComplete" controller="hrRMSource" reference="ten_nguon%l" key="status ='1'" check="1=1" information="ma_nguon$hrdmnguontd.ten_nguon%l"/>
    </field>
    <field name="ten_nguon%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nguoi_gt" categoryIndex="1">
      <header v="Người giới thiệu" e="Refered by"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="dia_chi" categoryIndex="1">
      <header v="Địa chỉ liên hệ" e="Address"></header>
    </field>
    <field name="dien_thoai" allowNulls="false" categoryIndex="1">
      <header v="Điện thoại di động" e="Mobile Phone"></header>
    </field>
    <field name="email" categoryIndex="1">
      <header v="Thư &lt;span class=&quot;LabelDescription&quot;&gt;(Email)" e="Email Address"></header>
    </field>
    <field name="ghi_chu" categoryIndex="1">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="cmnd_so" categoryIndex="2">
      <header v="Số CMND" e="ID Card No."></header>
    </field>
    <field name="cmnd_ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="2">
      <header v="Ngày cấp" e="Date of Issue"></header>
    </field>
    <field name="cmnd_noi_cap" categoryIndex="2">
      <header v="Nơi cấp" e="Place of Issue"></header>
      <items style="AutoComplete" controller="hrProvinceCity" reference="cmnd_nc%l" key="status ='1'" check="1=1" information="ma_tinh$hrdmtinh.ten_tinh%l" new="Default"/>
    </field>
    <field name="cmnd_nc%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="cmnd_ngay_hh" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="2">
      <header v="Ngày hết hạn" e="Expiry Date"></header>
    </field>
    <field name="quoc_tich" categoryIndex="2">
      <header v="Quốc tịch" e="Nationality"></header>
      <items style="AutoComplete" controller="hrNationality" reference="ten_qt%l" key="status ='1'" check="1=1" information="ma_qt$dmqt.ten_qt%l" new="Nationality"/>
    </field>
    <field name="ten_qt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="dan_toc" categoryIndex="2">
      <header v="Dân tộc" e="Ethnic"></header>
      <items style="AutoComplete" controller="hrEthnic" reference="ten_dt%l" key="status ='1'" check="1=1" information="ma_dt$hrdmdt.ten_dt%l" new="Default"/>
    </field>
    <field name="ten_dt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ton_giao" categoryIndex="2">
      <header v="Tôn giáo" e="Religion"></header>
      <items style="AutoComplete" controller="hrReligion" reference="ten_tg%l" key="status ='1'" check="1=1" information="ma_tg$hrdmtg.ten_tg%l" new="Default"/>
    </field>
    <field name="ten_tg%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_tthn" categoryIndex="2">
      <header v="Tình trạng" e="Marital Status"></header>
      <items style="AutoComplete" controller="hrMaritalStatus" reference="ten_tthn%l" key="status ='1'" check="1=1" information="ma_tthn$hrdmtthn.ten_tthn%l" new="Default"/>
    </field>
    <field name="ten_tthn%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>

    <field name="ngay_kham" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="3">
      <header v="Ngày khám" e="Health Care Date"></header>
    </field>
    <field name="chieu_cao" type="Decimal" dataFormatString="#0.00" categoryIndex="3">
      <header v="Chiều cao" e="Height"></header>
      <items style="Numeric"/>
    </field>
    <field name="can_nang" type="Decimal" dataFormatString="#000" categoryIndex="3">
      <header v="Cân nặng" e="Weight"></header>
      <items style="Numeric"/>
    </field>
    <field name="mat_phai" categoryIndex="3">
      <header v="Mắt phải" e="Right Eye"></header>
    </field>
    <field name="mat_trai" categoryIndex="3">
      <header v="Mắt trái" e="Left Eye"></header>
    </field>
    <field name="nhom_mau" dataFormatString="A, B, AB, O, " clientDefault="" align="right" categoryIndex="3">
      <header v="Nhóm máu" e="Blood Type"></header>
      <items style="Mask"/>
    </field>
    <field name="loai_sk" categoryIndex="3">
      <header v="Loại sức khỏe" e="Health Type"></header>
    </field>
    <field name="ghi_chu_sk" rows="2" categoryIndex="3">
      <header v="Thông tin khác" e="Other Information"></header>
    </field>

    <field name="cap_dt" categoryIndex="4">
      <header v="Cấp đào tạo" e="Level"></header>
    </field>
    <field name="truong_dt" categoryIndex="4">
      <header v="Trường đào tạo" e="Training Provider"></header>
    </field>
    <field name="chuong_trinh_dt" categoryIndex="4">
      <header v="Chương trình" e="Training Program"></header>
    </field>
    <field name="ngay_dt_tu" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="4">
      <header v="Từ ngày/đến ngày" e="Date from/to"></header>
    </field>
    <field name="ngay_dt_den" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="4">
      <header v="" e=""></header>
    </field>
    <field name="ngay_cap_cc" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="4">
      <header v="Ngày cấp" e="Date of Issue"></header>
    </field>
    <field name="diem_dt" type="Decimal" dataFormatString="@markInputFormat" categoryIndex="4" clientDefault="0">
      <header v="Điểm số" e="Mark"></header>
      <items style="Numeric"/>
    </field>
    <field name="xep_loai_dt" categoryIndex="4">
      <header v="Xếp loại" e="Grade"></header>
    </field>
    <field name="ghi_chu_dt" categoryIndex="4">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="dqtlv" external="true" clientDefault="0" defaultValue="0" rows="207" filterSource="Tidy" categoryIndex="5">
      <header v="" e=""></header>
      <label v="Quá trình làm việc trước đây" e="Previous Working History"></label >
      <items style="Grid" controller="hrRMApplicantProfileInputDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_hs, ma_hs" e="String: ma_hs, ma_hs"></text>
        </item>
      </items>
    </field>

    <field name="ma_nn" categoryIndex="6">
      <header v="Ngoại ngữ" e="Foreign Language"></header>
      <items style="AutoComplete" controller="hrLanguage" reference="ten_nn%l" key="status ='1'" check="1=1" information="ma_nn$hrdmnn.ten_nn%l" new="Default"/>
    </field>
    <field name="ten_nn%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="bang_cap_nn" categoryIndex="6">
      <header v="Bằng cấp" e="Certificate"></header>
      <items style="AutoComplete" controller="hrCertificate" reference="ten_bc%l" key="status ='1'" check="1=1" information="ma_cc$hrdmcc.ten_cc%l" new="Default"/>
    </field>
    <field name="ten_bc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="diem_nn" categoryIndex="6">
      <header v="Bằng/Điểm" e="Grade/Score"></header>
    </field>
    <field name="ngay_cap_nn" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="6">
      <header v="Ngày cấp" e="Date of Issue"></header>
    </field>
    <field name="ghi_chu_nn" categoryIndex="6">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="dcc" external="true" clientDefault="0" defaultValue="0" rows="207" filterSource="Tidy" categoryIndex="7">
      <header v="" e=""></header>
      <label v="Chứng chỉ" e="Certificate"></label >
      <items style="Grid" controller="hrRMApplicantProfileInputCertificate" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_hs, ma_hs" e="String: ma_hs, ma_hs"></text>
        </item>
      </items>
    </field>

    <field name="ticket" readOnly="true" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="imageurl" readOnly="true" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="image" readOnly="true" external="true" defaultValue="''" hidden="true" inactivate="true">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;divBlank&quot; &gt;&lt;/div&gt; &lt;img id=&quot;empImage&quot; src=&quot;&quot; style=&quot;width:60px;height:80px&quot; /&gt;" e="&lt;div id=&quot;divBlank&quot; &gt;&lt;/div&gt; &lt;img id=&quot;empImage&quot; src=&quot;&quot; style=&quot;width:60px;height:80px&quot; /&gt;"></footer>
    </field>
    <field name="upload" readOnly="true" external="true" defaultValue="''" disabled="true" inactivate="true">
      <header v="" e=""></header>
      <footer v="&lt;iframe id=&quot;imageIFrame&quot; name=&quot;imageIFrame&quot; style=&quot;display: none; position: absolute; width: 0px; height: 0px&quot; src=&quot;about:blank&quot;&gt;&lt;/iframe&gt;&lt;form id=&quot;uploadForm&quot; method=&quot;post&quot; target=&quot;imageIFrame&quot; enctype=&quot;multipart/form-data&quot;&gt;&lt;div class=&quot;divUpload&quot;&gt;&lt;div align=&quot;center&quot; class=&quot;divButton&quot; &gt;Chọn...&lt;/div&gt;&lt;input type=&quot;file&quot; title=&quot;Chọn tệp&quot; name=&quot;imageupload&quot; id=&quot;imageupload&quot; tabIndex=&quot;-1&quot; class=&quot;divInput&quot; /&gt;&lt;/div&gt;&lt;/form&gt;" e="&lt;iframe id=&quot;imageIFrame&quot; name=&quot;imageIFrame&quot; style=&quot;display: none; position: absolute; width: 0px; height: 0px&quot; src=&quot;about:blank&quot;&gt;&lt;/iframe&gt;&lt;form id=&quot;uploadForm&quot; method=&quot;post&quot; target=&quot;imageIFrame&quot; enctype=&quot;multipart/form-data&quot;&gt;&lt;div class=&quot;divUpload&quot;&gt;&lt;div align=&quot;center&quot; class=&quot;divButton&quot; &gt;Sect...&lt;/div&gt;&lt;input type=&quot;file&quot; title=&quot;Select File&quot; name=&quot;imageupload&quot; id=&quot;imageupload&quot; tabIndex=&quot;-1&quot; class=&quot;divInput&quot; /&gt;&lt;/div&gt;&lt;/form&gt;"></footer>
    </field>
    <field name="rkey" readOnly="true" external="true" defaultValue="''" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ten" inactivate="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="267" anchor="8">
      <item value="100, 30, 70, 100, 8, 50, 30, 149, 8, 58, 42, 8, 33, 67"/>
      <item value="11010000-----11: [ma_dot].Label, [ma_dot], [ten_dot%l], [image].Description, [image]"/>
      <item value="110------------1: [ma_hs].Label, [ma_hs], [cookie]"/>
      <item value="1101-11100----1: [ho_uv].Description, [ho_uv], [ten_uv], [gioi_tinh].Label, [gioi_tinh], [gioi_tinh].Description, [ticket]"/>
      <item value="110-------: [ngay_sinh].Label, [ngay_sinh]"/>
      <item value="11000000-----11: [noi_sinh].Label, [noi_sinh], [upload].Description, [rkey]"/>
      <item value="110-----------1: [ngay_nop].Label, [ngay_nop], [imageurl]"/>
      <item value="11010000------11: [ma_tt].Label, [ma_tt], [ten_tt%l], [stt_rec], [ten]"/>

      <item value="1101000-: [ma_vtr].Label, [ma_vtr], [ten_vtr%l]"/>
      <item value="1101000-: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110-11--: [muc_luong].Label, [muc_luong], [ngay_lv_dk].Label, [ngay_lv_dk]"/>

      <item value="1101000-: [ma_kenh].Label, [ma_kenh], [ten_kenh%l]"/>
      <item value="1101000-: [ma_nguon].Label, [ma_nguon], [ten_nguon%l]"/>
      <item value="1100000-: [nguoi_gt].Label, [nguoi_gt]"/>

      <item value="10000000: [nguoi_gt].Description"/>

      <item value="1100000-: [dia_chi].Label, [dia_chi]"/>
      <item value="1100000-: [dien_thoai].Label, [dien_thoai]"/>
      <item value="1100000-: [email].Label, [email]"/>
      <item value="1100000-: [ghi_chu].Label, [ghi_chu]"/>

      <item value="110----: [cmnd_so].Label, [cmnd_so]"/>
      <item value="110----: [cmnd_ngay_hl].Label, [cmnd_ngay_hl]"/>
      <item value="110100-: [cmnd_noi_cap].Label, [cmnd_noi_cap], [cmnd_nc%l]"/>
      <item value="110----: [cmnd_ngay_hh].Label, [cmnd_ngay_hh]"/>
      <item value="110100-: [quoc_tich].Label, [quoc_tich], [ten_qt%l]"/>
      <item value="110100-: [dan_toc].Label, [dan_toc], [ten_dt%l]"/>
      <item value="110100-: [ton_giao].Label, [ton_giao], [ten_tg%l]"/>
      <item value="110100-: [ma_tthn].Label, [ma_tthn], [ten_tthn%l]"/>

      <item value="110----: [ngay_kham].Label, [ngay_kham]"/>
      <item value="110----: [chieu_cao].Label, [chieu_cao]"/>
      <item value="110----: [can_nang].Label, [can_nang]"/>
      <item value="110----: [mat_phai].Label, [mat_phai]"/>
      <item value="110----: [mat_trai].Label, [mat_trai]"/>
      <item value="11-----: [nhom_mau].Label, [nhom_mau]"/>
      <item value="110000-: [loai_sk].Label, [loai_sk]"/>
      <item value="110000-: [ghi_chu_sk].Label, [ghi_chu_sk]"/>

      <item value="110000-: [cap_dt].Label, [cap_dt]"/>
      <item value="110000-: [truong_dt].Label, [truong_dt]"/>
      <item value="110000-: [chuong_trinh_dt].Label, [chuong_trinh_dt]"/>
      <item value="1101---: [ngay_dt_tu].Label, [ngay_dt_tu], [ngay_dt_den]"/>
      <item value="110----: [ngay_cap_cc].Label, [ngay_cap_cc]"/>
      <item value="110----: [diem_dt].Label, [diem_dt]"/>
      <item value="110000-: [xep_loai_dt].Label, [xep_loai_dt]"/>
      <item value="110000-: [ghi_chu_dt].Label, [ghi_chu_dt]"/>

      <item value="1: [dqtlv]"/>

      <item value="110100: [ma_nn].Label, [ma_nn], [ten_nn%l]"/>
      <item value="110100: [bang_cap_nn].Label, [bang_cap_nn], [ten_bc%l]"/>
      <item value="110: [diem_nn].Label, [diem_nn]"/>
      <item value="110: [ngay_cap_nn].Label, [ngay_cap_nn]"/>
      <item value="110000: [ghi_chu_nn].Label, [ghi_chu_nn]"/>

      <item value="1: [dcc]"/>
      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="100, 30, 70, 8, 112, 100, 117, 8, 58, 50, 100" anchor="7" split="7">
          <header v="Thông tin chung" e="General Information"/>
        </category>
        <category index="2" columns="100, 30, 70, 100, 100, 137, 8, 58, 50, 100" anchor="4" split="7">
          <header v="Cá nhân" e="Personal"/>
        </category>
        <category index="3" columns="100, 30, 70, 100, 100, 137, 8, 58, 50, 100" anchor="4" split="17">
          <header v="Sức khỏe" e="Health"/>
        </category>
        <category index="4" columns="100, 30, 70, 100, 100, 137, 8, 58, 50, 100" anchor="5" split="7">
          <header v="Học vấn" e="Educational"/>
        </category>
        <category index="5" columns="769" anchor="1">
          <header v="Quá trình làm việc" e="Working History"/>
        </category>
        <category index="6" columns="100, 30, 70, 100, 100, 137, 8, 58, 50, 100" anchor="4" split="7">
          <header v="Ngoại ngữ" e="Foreign Language"/>
        </category>
        <category index="7" columns="769" anchor="1">
          <header v="Chứng chỉ" e="Certificate"/>
        </category>
        &ListCategory;
        &PostCategory;

      </categories>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ia4XDMcx1FoIIq08b4bJZpbVjAXhuAeZ8AEa5tYn3akA=</Encrypted>]]>&ListShowingMessage;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNLMq5l99RYN0OG95CXHthM+nwzaRo10lutM0Of0amuiGkeLvAQ530VlPTeeWv3RRN8rK7iYeYvIGVKMT1+b6PL2PUz3KUNWaIbkIC/o19lC</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XCo8G6lJt/XWijnE5FXTjHYLRP75XNPNGb1NNf+xPJrfs4fqMHgX8vr0NnjY5yx64xMQ9SDTdCgN/mSy2l2N5WkVSm0/vkC4DT1BNeJlO6SjFgAqKIwaLwcdNozzgJnpp6MyI9rB1opjsd8GipBeUqfoTtE3EuLveaH9cHerM/2nFDtYTFm8WSjOHr0lhwFZjjJLhGUyOxnFQsR8EIxdl0vglwWWsqAP01ZIlwyA/8Dj7tXjikVDOfEhggC7q83bkHD5iDeHX2YpPjVAuFVYC5eFEz+4XrQwkd6GdT/sauUYL2KY+6PYa2ZE8x2hncQcPmWMFiGhPNI1rt1D2D50BdiYt9xNCEFe8tG1WkKpCYUc0+jyi7IZlDN+h2dVjpYAfX33+rEK28PancgJOJAOzj4V+sSD0IsIclCJ97EJPIZemDXD7GDhwIGaBy749sOs1qpb3RvtUdIsO9l+g7u2f6vlWW5LhScO47wswhKxQ6YjF5ZqscuizW3VxLFlDb0Gx4QG4MjF6LC7yTWLuL5izQet7B9WIYF6yYsTgE8zZ+M8phJVdRVqK1YdLn7oTqBYyE7v6l0kCZ+wV1EK1Bf6vhf/Cf/qnQIvqFQP01yNXl/iWkCcB4b3YcyWOPOuRd3vQYIURJcNXSDIOgciomAFsMc9nRySaSgxTobprdScLG9</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XCo8G6lJt/XWijnE5FXTjHYLRP75XNPNGb1NNf+xPJrfs4fqMHgX8vr0NnjY5yx64xMQ9SDTdCgN/mSy2l2N5WkVSm0/vkC4DT1BNeJlO6SjFgAqKIwaLwcdNozzgJnpp6MyI9rB1opjsd8GipBeUqfoTtE3EuLveaH9cHerM/2nFDtYTFm8WSjOHr0lhwFZjjJLhGUyOxnFQsR8EIxdl0vglwWWsqAP01ZIlwyA/8Dj7tXjikVDOfEhggC7q83bvvkevJZYG7qXAFZ43e0BkupZ1smHsMsSoZO4maIUTPyEtDmbN10HfuyqCuBsDthcXzFlSSgfHsWmG4ksxDIFejx3Clg9tCiol9aUV6yo72XJMNEYAredhtqAg6Af7QAXPLJdJxamkyP8aGUdHYMGhsweHoZK7Q52i9OIfYa2gQnZ1WGrUsUp1kVLiUAqCBGpA==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDyZc39x+urkHqzmUZY+FEA0kJsI+LBhm6iea0gOUFKskfh++QNvzxFBZFPWaLZXmuQEKaQR5OISoM63GmpLmW57PUcohTr3OFyTL/c8BdZf</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3aN/7PxwrNmja2J0eINLzr7zUf/9ZOjtpNZZoZqBHdQ4eiSJFZt8UQO0xuhv1ekTUzXIULZSAnsqnPlpdgAH9eHSZT9SOL+vKYHHaiaMNTf0Nk5m/PZZnLA1RtFSRMMDfAR9+prailY0lyhY05ihId4h7EZSbXciQstCUeCm12DczyBIKwGqvNIpqon8+SrdSIERvLF/iQuJixewNH6U6tjUA/9F7Mht22J+oWbYHyDBhTdG6KroEz+f8nrhrJRPO8tq/hHIToAW50XZRGf8H3OOqUQ66DEOyqXCT2NU8P03RtkoHaGVGF6GLqa51IW777DS69qLt19eATGcFVBx4SfsHwByWkEphge7oLKJvX/vPJtgbHZOyOhOydj5cRMCxR8w5keevfN760FQJ9jKWNCo4AJdHQ8Pl9txMLvpjtOSIkx0jD12b6ZLBVsCCBmyrq0Fjpk4t9vdnwnjjdUn82zMBBX+ZPCVZzA1I3nOuaFNUUmHb0q9rw2pX03628dj/Q8/FSBy7eSjrdRU0kfqjdfllLSk5VzHiNREWaBKuS0dI=</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WtJF1Oh/s+pAZVy8P7PyYUDPpIynElV3UzGXmiEhxCHFKWMLc/xS3lV5snn/GhEdw==</Encrypted>]]>&CreateTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VCCyk8ufSTKSGAh6J9lLbNRHjMYVR2PLkqMNyIkGnzg8JLP0ygKG7ZHSG4pinIIDFul7YdIi4Fg46hONTRDs1ctZfc2mcCVKOwYd6fjz4xiKjaN9czPGV50EJdp/c3ommz4aAeDpH+9a+FHfd7zVZ7+H2HTQ+B48wF5/BqoUEusDKNVhpdMCa/RaILSuAmtwoA6RfTI1L2kmRbVQ9uyg4cjA9Beov4FYJRcusAMHO05SoarYh/mxD9T7QslErN2cU7DkzxQ1H1uu4+1jNhXObZKbFUHmMiksRsBQwV2KAcKpWmPCiLn9SQTFd8IaSbaPMd77n6wEJkDvelFa9gPGZwAxyvofc781rfcQMtDjZ4srTZsPNNlLr0cDLoXm3iaGWj8WrM5054lqJS8Bjz6qCwihapA1nO1t/yzvxM57+IcuZyYOu3kV4raB0u+iA8WBpTdQ6ZRH1aCtHBaADUjMuGAaoLYIj+iuoMzLfXspLSEqOiXxSnC8E7C/ExqvWaumcEPWAPlJpTpJvxAhXF0A7lCD4mEJuqnHuokkZQkl0RFho/JuK73S+pzjHVx8Gc++xRfS2yq0ENpbnhgb1aGHCw=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dUsFiuBX/iYGBOeR/lqE321AmxxstBZxK0vDeD1XTfXEKKhWa0P1xmSnJYGpmcJe071C1QlmmJxfParybAaMiXFzD0MUJaQrTyMrJVEUGGFx3Kb09DL2rNpvc22kbyySjnwI2EuvV8YJyGFwvLJP/lY1/yo4ioH57YgHJ8ErRtD/NNS2kjZqZoHurARC89c6486qhCbVcLpUQgnAkYm6Wmgq9oxrCHIgXO23h3pP1T2HdMnkF5oeja2Rbs7gB45o5OD4dF0XJQ06X8bFxZ4cC7j/4vPqFkIPhCud8/LggRVrhdx68UfPMBQhJp+tJf+mKZ9d6oKqS9w5MJBppBqIwC2vUcZx8EH3OqROYaTHxNzpAM4sEs4lPPdwK1nKEEMinBNa8j75RQg3ZpfLL5MY8wsTdzXWlGhosOTBwqrEdgw3Z1Om5Oa8auVOjUM3+bBiRpLz/V/9mZXmLnV8p80c8pVUGOWjlfX3payKv6Kephmjn52U5W8U0Bo2D4uc/NuOILDvbrKv+LoixKEyg/TQQo9WyDD8B+kTqoBZKEfl7yXfkBTWxQucUzGk0jHwidV53Zf0cSiAMWhYTo82guxA+3G6fmfNKi8YGmKv0gCPnMf/rUs+muJAGF2JU7BSpc9TsrJ3iaqeIHitUBGoA3237U8GlTHK3dzToy3/1vjn9viOYCWrFFL89JQXcFa0D/as4LUlBi78EH2EwLba3gNoFBy69aMaiLWkDNchOW7754iT9Z5LrKz+tMGvU5MovtW1GAACv1APE1J8pTtu/d0wcxyR7RZnutN6dzKm3PDIVLU3AQLncj6jy3bFceu/42+0ghcWoM1ihAp3kZafIt8sUgCdgbo3VZ7cANeNgJhwddfDw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+H4LscoO37qLV/zCFu5iaHelIbrn1y+f/oRRBGQn5wmDCH3+dap/ad6C6vPf7SEK3ueXgdiiXkYFmL6rV/1j/WJ4g5E8UIufrSf9PhO/vjqMJjVnqqUXac3eaaECx6zv7xBY4Gg1pvGvC7J5w5QT55NU770Ly/y4Wcu5Cn8Ku7VtQgqrX5egKoTGbzJE7JGn5nb8LLAcPKbAlHO3rhWuEcV62vwZslxdk1j0dHKiNbockvAVhsvTh1TmpBddVY6zf7lB9yzLqVpsvOFBHg06M/DScddUBQa58URf5NlfDqBjodq5Yzy2TtqS5yqpt175T41RJBJK8Z+TNGPwXqGnbHF1XvDE1KSYIM60wgy7Kt3GygW9ousvpARTmx1XVkg9iKbJM0WYDQmEENLducvOyg=</Encrypted>]]>
        &ListCommand;
        &PostInserted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOSzo8o13Gg1seRcdttXDyp2zqDhlSyIYb0X7xZ18iHexzX3Dsa2rurIPv2mWFJaSpuk+4nmIzi0/e4yl3Wp/4U=</Encrypted>]]>&ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ03ga3vxnuo3uyPjOXSpZsoX5Ei60KT1sm1EX19ZVLqyjfnCjXGxG33+w/T8rl/iIMRB3oyZ9uq/FOfbN5YxFnbmaCyw1hqVpkwh0EV852J6b4LRLH+SSnzS5B1D/+WBtCIvkSyO81AizYC8r+LofLbY=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dUsFiuBX/iYGBOeR/lqE321AmxxstBZxK0vDeD1XTfXEKKhWa0P1xmSnJYGpmcJe071C1QlmmJxfParybAaMiXFzD0MUJaQrTyMrJVEUGGFx3Kb09DL2rNpvc22kbyySjnwI2EuvV8YJyGFwvLJP/lYEvLyouMJ91QzfcO2tu6FYaBx8dLcZhMiBnHL8+S+yBBFDdgxc+jUYotAK1j/7cgxpjGQo7dKZactoScUxoxXPhKU6X8dYAK0lw6o8W+aFxDh2tOTFY3ujmUpK31X3g76b9ACs59Hw5zv0L3sec4v2iJEuy53+1ZyPP4x3vpYi838zGUHtpVIb2a6Q4sGxIkpeLuCkAoxYoF15/Wkh3ll7P26r4hCi7Wh0o9lNDKnDIt1igS2aqAr89P6h/OcISMEGPm9ae1ev1gns5VmXvw4BlPfQpIdLgakMD+4B0rX4tRq3Rbcu8DB0/HxsddqFfi5EQYlkqnWAvgegVpvkKYhTEvgzEDZ0RKFvmNObTJLw3X5fBHj4BomIIokQjE3Elbx52xt4PvnO2phPDDXTAf7n0spjQ14WKVWY/MKU0WunukKicU/rBaDm0mWMAFwOHfE3erbDjubhMs91eHUFbEpVTfuWLpKkkCx5a5KB5UJKP9sE/u67uRxLuESQ4bDPtC65flVZZPDfJ7HNg5HD/Pbv3VYTo7E7gk6rpriWFf6DPlt2VbjyHzZg7N7JdAj+0NikhXZEfuy2T1izy+Rd+ZuqJVgKWeHcMcVq9o5XCkayEdH7SHQ+J3nuw58u9eUaEx9JhmNyNP3uK6kvHkdgGJ302RvLjAj+DzaHIiCqLbev6A=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+H4LscoO37qLV/zCFu5iaHelIbrn1y+f/oRRBGQn5wmbBUTIMiAGF4Yl9JnA+wkTN8JK4xZkBio5K4b555z8Y1F5RyzW+zWO67LlsavYCOMDiuSMUHPuzdaL0E96riIEkQgADRAD5i4Uvbyo9xILjhmWEXuwMfJgtZqWkQVuRZJeK13ewAJJ5yyEB7FWKM9Sl9ZYRPBPpW6+pWmx4pJ1Aa2dX9fgw3wi6ky+BlRTwb7N0TIYOlepeMy/VKM3wzyrcoT72pSbDSPJyJrDGzbuu4eEbMZji0qd8KqGoCcsNLSZSslGTIgw15PkjqjySUyflvOvRxnRGDMFZC093ym5Ql4HjssbAVVhLssI/3KXiW7sGbMe4xdGhrv3XLq3S3FwsyKGWMwpw7OnbmpUyJlitA=</Encrypted>]]>&ListCommand;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBNMMhWXMvINzxv+0aiggxOyoJ6hAbTYVH6g4odP0n4NvRUbWmGE2bk/yRZBOuOfi8h0trzQoXqWvnfLVsq3NOw9jii/0OGybsw7XULmTc3tDBYyYX8vKek4LZ+lZX5R/GZ2L05+Zgse4Bhu9y8qyWXRAWf0SsrioIlzrufcdQ5NINx9cQXaNY4/Qf+TUnkUm29dkkVibsSqtm4EfmB8NpNZ2QXrpkTJkZNIHMUi7GeYVffesRZrqdi9ziK7xtwTJDg8B9x4BYH/jYN5qYpT6Z82LrD/Cv4fNFStsf0kq/esWWrJY3zm3eCJoIv5/+szRw==</Encrypted>]]>
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ03ga3vxnuo3uyPjOXSpZsoX5Ei60KT1sm1EX19ZVLqyjfnCjXGxG33+w/T8rl/iIMRB3oyZ9uq/FOfbN5YxFnbmaCyw1hqVpkwh0EV852J6b4LRLH+SSnzS5B1D/+WBtCIvkSyO81AizYC8r+LofLbY=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu58Q/vNOJfOJsHmrDN96W7XltYUV0hjZwEpEnT9v9lgu2yxWm2I0SgCGtYI2JKzxKg/BFbBUJd/TTnUPib0WlA0DEy/eAzzBG4pihaH7XheIWaop/Ln45+RKPI74OPj283TlLUmZ8Um4SkVTOVBQGsnnUT4jkOfeyYT4Zf17XL9lDu2pKigCdTYE2i0QF0oqmpi2dcJKBvkTbtukxqT4pqtfidqD+9s+fLr7AIHs1Nt5WhejEJnuwlVbscNWZEY/wlTgdBGaLTZySeQyBAMtGo/QIVkMkVA9wFM6wxSTPqdm9aVAWo73OZ5KYMPqKnaofs48C2CoGReBTnHqgEE5Bmy5/EznUtW+yyHvMBtYHg+iF3O7x0Z7oBplhe+OlygYWqx1vp07FZXUDPrGtqC6ET1E1nfnz1ammV+lDkXGQK9jXK2Jh4X7eGsMsKcKCGZD8nHScsvYJf+VdLsEZpEvKa1ot4c5/fSdFrAZ3F9UyNp2oBVYZ6x3tsuwETVaJm+qqo2qBTyt0WkyX/IXo8GED7A=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EUIeZL2gcJKUtpO5KzfKezEC/ndZLlpakwTZtP3eidq9WF0Zk79S+KVS0w8eaQYG8hR6RWkEHmM/NjJlcbn67MR3vwbvQB5tV2ehalwhLkiYCCk7IJiBJ75fqmJC7BsyquVGnYO+WH9nhR9ns3RiprroxafeVz3v3iAJxosSS1lpHb1m+4ZyEFSyG+GWqPnGWcwDCja6NWGXHxD41Dc/g0SabTJOnzadZABXRwFooTkjoWp1pVxHkJCPkMVBOshC19+Amtt+gP+7YV6inoSD8a0gu75f/4jnzHxHE9Mm9fjPMqjdcijDnoTzgVn4Y+evmY4Mfo1d66/7SrL4WQd9LTHF2SsktY7hgWA9GNjKqxoQdei/83u6VWqHS5JB9CdAuHibAWWt1B246EGrvCXyY9fJslBdZT/pbbphSrTcn4w+z+HP9DVZOoo04O/IZ9UZXifi9hX4QUQ2N2pXiFeNE+91JjAypcCAaAOHMQ3st1HWPivWKYaLrEHEpz928r2tCw8SMPjTbzRFjTLwuj7qbIORzAAdhITP43eReeGA94/yPVd+VI6aMfajmjtl4EexL9uMDW8OYjEssGfkIaZmNJ4=</Encrypted>]]>
        &CheckValidEmailCommandChecking;
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VBr8UWo78axyfhhmGzF05i/K/T+J21I2OZJ88w79gfBJOckNTcZUvsw9A1PeiGswaa/TSdWUER31FJPIefNBI3y8+mAQ1xL3LINAlCEdlKJS9rGMw66cjzYM1u6q3DRitYxwuHyjTzMW59km9t5WHsAyCuEsQLdKA0ybrRAtmkcDoAQyrYWHTpIg3uJLQ+UJonYcvVmcP5ab65EjevU/P265N3nX7G+RZGCew7NmBc09czvNxn6zByJLBn3JpEieg7D7+NQ2ly4L3ty7J/ueBv+IQh2nxZvCM+smE/Ot2OQgFOCckC+wmmvJ03D95YG2/UuVT3mTXjoOE4/nLICN7VczeHFgRPQrqxsDXheEzGS</Encrypted>]]>
      &ListCreate;
      &PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfo4D0qiG/GqfFRLb5qAhvHVvkJ6dbI87AFkUeIFs5bPJw709ndVdH7nGFaZvjGvBhnyaV5VBIEGYm05irN/9OZVcdSdlntjPcW8eLYkE4N1w==</Encrypted>]]>
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVo9BjlMEdz/5CSD7s9BqrwToP7zWb/xNp3BVnm9Zn/UAlCLKhwmVKzfbkHxtfF2Vz4wJ0uyGGhEW4fi1UyQlwRP701IJ10dTT2jNsx+GPA4QjGL6LT/hgFQq4ee5vaaaZuyn6EWzRMINGuXZqNYgXR9ZA75pHCYudgn12AZmJokCnWjxdQX6B8JVLqFFA4vvhEgj2zaG6uLESKHMn1x+Kb+BzStqB/UAt0kLxgkklQHepMDhHGSJEeTglysTFZ5vD3hmNoCl1SeeicubCpnL3DSEo5F53+5dpzmYC+k7p/ZJQ==</Encrypted>]]>
      &ListDispose;
      &PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGPloEKI+QSqeySJBdOBMDBx50qFPhQsUW8wjn58/2/U+pkadBWRPyOXuOV6hx/GiLgX5MJjpE1dtHK9r8J5c3nWBMM8iafqqDe4j7m3C8Uc+wzS/CW1+dBm/3Os62Vd9QOSgO7Q7XM+7ljce7/sJQzJXA2JiB7ENFNw4Rs6XxJxxpcywTwyZlqZGgeHNp77jBs=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP8tlib1OD4QSA5Sl9Qe01zs=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyrsdD87AyFdwBmZ4tDaOKMO7jk1ly45/QvB1fApYJglY8CPJncSxFSJp3R4IOG/So8vg80poxSexY5Iq6yOytgO4YsPRpaeSfb0F8qWBsE5JL+RdNnfG0epxRVyN33/DYa2xaFHRkeS6tc+qKfYygvfaU1kUZg4bv00z39+e1Eqs2GxYPKj0jv7MI3it61Cqv/gS1d6mXssGHFU73XLBRiSInuD+636APw0BI6j9k4RS0fjdBx8XpzTEFmdc2IcDdlWNi0wUbyQz/vvySjWq2i2N8Rb64MIVCqemmE/CtcPG4EoKZDB24Hsh/T5zcXdHr4nVSiJz1stf0cyG5GEc6/0=</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmNvn28T0HzGNd2ar3m+3xn+UuU4HxUyNJb5ATj6Z6nhjgV1ISycLERtcM3wpTISQSSy/U7tDhGCcGBHjDNk9ybFomJZ4KjJWM7X9HQvoVMBYq+gmw7kGIVaVdUgF7ylha1H/SKhgg2xQdxbjHxxXUEfWen/BHbNtJAjneL/fgtiyhgvm/t5XP+8Tu5f+1fXFA9wvk2H+ZPci1r0dIcAHA6ikRLXadCaV2Bjh59NEVxVANInXnBergO9TO5aKirrFDRXqBwh2lXZuJEMlymC4nGQ==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZCdbJ+U2ImncEMAOCRkzWrtT+8FihJ+PDYur3vchdp+5ZzE/0W9FibPkFGMznceS+d08vbUgCukescwu+rlotHXmp1tYoUchiTKFZs88BiCBsM2Uup6Qw1xIc/1mxxjk+2iCffoyuuRTAal2QUxBLa2SRSbXOZg99gTI8gFkEwUXO2sH/of8+iGmahp3CD40VzvDAWVB3LhRVE34o8cvxo3hbE4BVwZhHLwEHQpSb9haal4n5EVRFCQ71FFqRF3d74y3Tp/YFfnqVMQgWfZu8zffrCgyfCOUSmIp7YuHC2XIvrPf4RbMmH2g11KyMVBOb5+F/bJJwdCZ/M06Fq8jBlfM5rhkMev4cKl6OWO9/4qdgaWU+AzfjtaikRF7X5JYzaZCwe/iTqa95VcUVjLDJHmuP+KvV1eJ5tTf5Y3ggfxtGAxqtrMl5b7UONScp4l6ZI32nvyA5EMuCiUHaSEBFzsddzo829hEjoPnTGwpKUCRx3F9JKQUEmCL942WbBNoWuHfnad6fz8up9TKvvelAT0RjfGcvBcNMTQ21prA/NurcxKi3qFrMkY4wajkN5ydv7PiPE++ybleqeNLdycdlcpZs66F9bwSrOE7K1Ueo3GbI7R/zqLIl0Y1TE+ueRWbJauXMgTACKaqfPG4I7iTeE93F7/IIwBpm34N9i+OpfsUPqioHpm/461asBZQHRa7LFX3DNGl0P+XHOr/z4LK7waFSFtH7tNJQ4r9++veX2mkjk6Wi3lZTpr16OwLdgyPczbPhACq3AQnBpzMCGNkabytuTdEtaZaeEGlcadXC0V3OO2CS+MUy59dEa0Sesf7b99kVcHlg/9GgtLr0rUn9b0i9bIum1dR1BSCOaotUn/hafpQ55tXJXhQFQX6qtRn8H6uMBwRJSb0ZvhWIH0qipeRePwLY9H4mCI5oDn1NupBH/fHCaEnY9irnsSMOQ+U/7OIoM5juNigIP2heDDOiOLyxyp0ENuwBW9BM3OjJZfw3kR02aWHbwjcGv+XkrFgQluzSQnI+52K6ZceDo5i5bOIT4w6PPNboedOkOp4UD51ZPH63XAEo4RkGdBADGaLQojh49cjnkEi7piNKhbQ3gHEa/dAIcE8GC68cdmuM9EhM1dHdBcJ8SvBv8ugz83Zaayr5Rx7E81ldIhHF+LM7vWLEnqe7K+jAmYGmH4inOJqjp0nQ/D5tGow4d9Ic34LFCrThOZmSRkq33GVbt1+mYqWfJi8cUxepUJekoUvh4d+SFoRvH7qcvzGRyx9+exc12u1nUUnXEj4EjcLoQ5USs2BK7M6Hwrh7p9JYL/nAa8y0Zj5YjPM3IIc8tuuZ+9pw==</Encrypted>]]>
      &ListScript;
      &PostScript;
      &ScriptIrregular;
      &CheckValidEmailFunction;
    </text>
  </script>

  <response>
    <action id="DefautFormValue">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNYQLW2Nu3usjMlUp77GuA+6GVi7h68MhkljiCX9TdYy0+Y2s6FhrGCHMT8EJ8AT+A==</Encrypted>]]>
      </text>
    </action>

    &ListTicket;
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1jG6VWeGAcv3M25z+vBq/YUELg3A+LaU/g+75YddH2MioYzVSZN7XIVuLwZdRmGe43KKROWWuTQdEAkAhQTXjONP71kKI9Pdmf/NmL5suGS0Rod7Nj1cdsAki5F7RbXOskQ3hJlHTERTjAiK3UXElA5/NNgvRzYnXxF846/CEHxOP6E/Cuh9KVSrxywR3Ui6kNoKto7Tv5VvzyRoIUbHBDAHoyUqVwTevPUZvoVS5cftRG8MB9un4hmSjEkkCCQp7Az74aRliLXg+djR/a+WVSGA29e8R3Hpy7jPh+nsohUvcbmNXhSfhoSqHk/kCUngYqpW1RBfwrCmV9L0qnVuqc16ArUB5dbdfXyZFrxgRpeRUS0j4aHmZ9G9pFe9fbene/HoQT1mmxlRUnL4pVVqYV+WJhMb/RU51+oo8oBCEq3dklXOHnNUuIHx2yzHkOXKqjWQViBEhwkzcy3S4LyMvgKpZfbVAyh4ufI8b9WNJNu</Encrypted>]]>
    </text>
  </css>
</dir>