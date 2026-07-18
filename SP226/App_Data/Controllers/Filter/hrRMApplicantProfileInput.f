<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vhrrmhs" code="ma_hs" order="ma_hs" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ma_dot">
      <header v="Mã đợt" e="Period Code"></header>
      <items style="AutoComplete" controller="hrRMPeriodInfoInput" reference="ten_dot%l" key="(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = hrrmdot.ma_dvcs and r.r_access=1)) and status = '1'" check="(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = hrrmdot.ma_dvcs and r.r_access=1))"/>
    </field>
    <field name="ten_dot%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_hs">
      <header v="Mã ứng viên" e="Applicant ID"></header>
      <items style="AutoComplete" controller="hrRMApplicantProfileInput" reference="ten_uv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_uv%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ten">
      <header v="Tên ứng viên" e="Applicant Name"></header>
    </field>


    <field name="ma_tt">
      <header v="Trạng thái hồ sơ" e="Status"></header>
      <items style="AutoComplete" controller="hrRMAppFormStatus" reference="ten_tt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_vtr" onDemand="true" categoryIndex="1">
      <header v="Vị trí ứng tuyển" e="Vacancy"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" onDemand="true" categoryIndex="1">
      <header v="Bộ phận ứng tuyển" e="Department Applied"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ngay_nop1" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày nộp hs từ" e="Date Applied from"></header>
      <footer v="Ngày nộp hs từ/đến" e="Date Applied from/to"></footer>
    </field>
    <field name="ngay_nop2" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày nộp hs đến" e="Date Applied to"></header>
    </field>
    <field name="cmnd_so" categoryIndex="1">
      <header v="Số CMND" e="ID Card No."></header>
    </field>
    <field name="gioi_tinh" dataFormatString="*, 1, 2" clientDefault="*" align="right" categoryIndex="1">
      <header v="Giới tính" e="Gender"></header>
      <footer v="1 - Nam, 2 - Nữ, * - Cả hai" e="1 - Male, 2 - Female, 3 - All"></footer>
      <items style="Mask"/>
    </field>
    <field name="quoc_tich" categoryIndex="1">
      <header v="Quốc tịch" e="Nationality"></header>
      <items style="AutoComplete" controller="hrNationality" reference="ten_qt%l" key="status ='1'" check="1 = 1"/>
    </field>
    <field name="ten_qt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="hon_nhan" categoryIndex="1">
      <header v="Tình trạng hôn nhân" e="Marital Status"></header>
      <items style="AutoComplete" controller="hrMaritalStatus" reference="ten_tthn%l" key="status ='1'" check="1 = 1"/>
    </field>
    <field name="ten_tthn%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ma_kenh" categoryIndex="2">
      <header v="Kênh tuyển dụng" e="Recruitment Channel"></header>
      <items style="AutoComplete" controller="hrRMChannel" reference="ten_kenh%l" key="status ='1'" check="1 = 1"/>
    </field>
    <field name="ten_kenh%l" readOnly="true" external="true" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_nguon" categoryIndex="2">
      <header v="Nguồn tuyển dụng" e="Recruitment Source"></header>
      <items style="AutoComplete" controller="hrRMSource" reference="ten_nguon%l" key="status ='1'" check="1 = 1"/>
    </field>
    <field name="ten_nguon%l" readOnly="true" external="true" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="*, 0, 1" clientDefault="0" align="right" inactivate="true" categoryIndex="2">
      <header v="Trạng thái" e="Status"></header>
      <footer v="0 - Chưa tuyển dụng, 1 - Đã tuyển dụng, * - Tất cả" e="0 - Unhired, 1 - Hired, * - All"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="184">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [ma_dot].Label, [ma_dot], [ten_dot%l]"/>
      <item value="110100: [ma_hs].Label, [ma_hs], [ten_uv%l]"/>
      <item value="11000: [ten].Label, [ten]"/>
      <item value="110100: [ma_tt].Label, [ma_tt], [ten_tt%l]"/>

      <item value="110100: [ma_vtr].Label, [ma_vtr], [ten_vtr%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>

      <item value="1101: [ngay_nop1].Description, [ngay_nop1], [ngay_nop2]"/>
      <item value="110: [cmnd_so].Label, [cmnd_so]"/>
      <item value="111000: [gioi_tinh].Label, [gioi_tinh], [gioi_tinh].Description"/>
      <item value="110100: [quoc_tich].Label, [quoc_tich], [ten_qt%l]"/>
      <item value="110100: [hon_nhan].Label, [hon_nhan], [ten_tthn%l]"/>

      <item value="110100: [ma_kenh].Label, [ma_kenh], [ten_kenh%l]"/>
      <item value="110100: [ma_nguon].Label, [ma_nguon], [ten_nguon%l]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 30, 70, 100, 100, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdJz4tVezh/v2g++gkBwyO+U842/oijbpwGPVMXqJGiJyWcii5XkuoJDbEQxh6Wr2O/oL9WXeNFA93cvo6NjgEg1s70jsHfxSiKjKCEjNzFYolAwg1YiXUW4+1QQClg/JNYqp6zWWG6RenRVkvo/eiBWurDLDNR2AP415/krr+WUi/Te8Wq+VfcBkFG/fpS6ePFgiQSF1d+1yz0x0qE5O80QaX/FJTlhW1XPdijTcR7jeXFjwCRxm+gq1BRPQtWYETqc4r8193BY9BlGImwt/E/Aj0rh36HadXVAt3Sdo6v4zKNKgZv9hx/Z99oNk/6T0+biZEoPv4l2VEo3yFjifT207RUOvPTamSN/QEaxASgW90EXyh2Pd1bR2UWLN3wIAbmykNewR8JkFWqtdH9RRBcAAPQw0e6dCV8DJ1GURLYU2c/XuKh3338Btyo3UUU7rDdlVyeccEauDH+ywzO7wcRhmpaydyK2KF8nqZm9avbbTiHvgPOdm5s04sKofBArocMKcTTEoaojZ7ZRz8MK0zmPjfLsacM0AYHNFPAMZ2KRCkLDqBonAY/23RTuXBC43KkvanFYH5iLHMvIgrUNhNNQAyTsxp/Ec4FVvH8frIYAMxCgluWMLnsGPqKbCzj14VeeDDbca0U3aK1P2KLg1/GeCTXoKKCgaq7RHkEL0r7ZiRGSwYMWRYkbQaZ94GhNFdgvusLv7FbBmChP0PHOgh2UqF3IxeAebJ1VtpCxyU4KbnYXtiUBMGTsjZTZKpW2S4EPWj14M+sOu+Cv9jKZkN6iLoM9i0s6Eaex0hRihh4M+hI7M1cZY/XmkEs8WEXMXI9gtPNUOfa3Rx1MoHsZKZyzb5JKd+sVKpu5IIs8hEEyiBFKzk4cTSan+t9CkNouV7B/cJiLsJcwgCcCoI0ZbxH4=</Encrypted>]]>
    </text>
  </script>
</dir>