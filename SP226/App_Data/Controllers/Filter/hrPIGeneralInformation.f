<?xml version="1.0" encoding="utf-8" ?>

<dir table="hrnv" code="stt_rec" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ma_nv">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_nv">
      <header v="Tên nhân viên" e="Employee Name"></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_vao1" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày vào từ" e="Date in from"></header>
      <footer v="Ngày vào từ/đến" e="Date in from/to"></footer>
    </field>
    <field name="ngay_vao2" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày vào đến" e="Date in to"></header>
    </field>
    <field name="cmnd_so" categoryIndex="1">
      <header v="Số CMND" e="ID Card Number"></header>
    </field>
    <field name="gioi_tinh" dataFormatString="*, 1, 2" clientDefault="*" align="right" categoryIndex="1">
      <header v="Giới tính" e="Gender"></header>
      <footer v="1 - Nam, 2 - Nữ, * - Cả hai" e="1 - Male, 2 - Female, * - Show all"></footer>
      <items style="Mask"/>
    </field>
    <field name="quoc_tich" categoryIndex="1">
      <header v="Quốc tịch" e="Nationality"></header>
      <items style="AutoComplete" controller="hrNationality" reference="ten_qt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_qt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bac" categoryIndex="1">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bac%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nv_ql" categoryIndex="1">
      <header v="Người quản lý" e="Manager"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nql" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nql" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr1" categoryIndex="1">
      <header v="Nhóm vị trí 1" e="Position Group 1"></header>
      <footer v="Nhóm vị trí công việc" e="Position Group"></footer>
      <items style="AutoComplete" controller="hrPositionGroup" key="status ='1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="nh_vtr2" categoryIndex="1">
      <header v="Nhóm vị trí 2" e="Position Group 2"></header>
      <items style="AutoComplete" controller="hrPositionGroup" key="status ='1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="nh_vtr3" categoryIndex="1">
      <header v="Nhóm vị trí 3" e="Position Group 3"></header>
      <items style="AutoComplete" controller="hrPositionGroup" key="status ='1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="hon_nhan" categoryIndex="9">
      <header v="Tình trạng hôn nhân" e="Marital Status"></header>
      <items style="AutoComplete" controller="hrMaritalStatus" reference="ten_tthn%l" key="status ='1'" check="1 = 1"/>
    </field>
    <field name="ten_tthn%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_tdhv" categoryIndex="9">
      <header v="Trình độ học vấn" e="Education Level"></header>
      <items style="AutoComplete" controller="hrAcademicStandard" reference="ten_tdhv%l" key="status ='1'" check="1 = 1"/>
    </field>
    <field name="ten_tdhv%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nn" categoryIndex="9">
      <header v="Ngoại ngữ" e="Foreign Language"></header>
      <items style="AutoComplete" controller="hrLanguage" reference="ten_nn%l" key="status ='1'" check="1 = 1"/>
    </field>
    <field name="ten_nn%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nv_cd_yn" dataFormatString="1, 0" clientDefault="1" align="right" categoryIndex="9">
      <header v="Hiển thị cấp dưới" e="With Sub-department"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="status" dataFormatString="1, 0, *" clientDefault="1" align="right" categoryIndex="9">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Đang làm việc, 0 - Đã nghỉ việc, * - Tất cả" e="1 - Working, 0 - Left, * - All"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="182">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="110: [ten_nv].Label, [ten_nv]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [vi_tri].Label, [vi_tri], [ten_vtr%l]"/>

      <item value="1101: [ngay_vao1].Description, [ngay_vao1], [ngay_vao2]"/>
      <item value="110: [cmnd_so].Label, [cmnd_so]"/>
      <item value="1110: [gioi_tinh].Label, [gioi_tinh], [gioi_tinh].Description"/>
      <item value="110100: [quoc_tich].Label, [quoc_tich], [ten_qt%l]"/>
      <item value="110100: [ma_bac].Label, [ma_bac], [ten_bac%l]"/>
      <item value="110100: [nv_ql].Label, [nv_ql], [ten_nql]"/>
      <item value="11011: [nh_vtr1].Description, [nh_vtr1], [nh_vtr2], [nh_vtr3]"/>

      <item value="110100: [hon_nhan].Label, [hon_nhan], [ten_tthn%l]"/>
      <item value="110100: [ma_tdhv].Label, [ma_tdhv], [ten_tdhv%l]"/>
      <item value="110100: [ma_nn].Label, [ma_nn], [ten_nn%l]"/>
      <item value="11100: [nv_cd_yn].Label, [nv_cd_yn], [nv_cd_yn].Description"/>
      <item value="11100: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General Information"/>
        </category>
        <category index="9" columns="120, 30, 70, 100, 100, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHj+qpqrYi1uSk2p6sLvrQKwjmxbR8r606Z4y3QhcRhtAAw/WXpYWb3HC6t7IyzpQYG+5ewXeeXK8uanH4ueTWE=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAnfmKSAJtKy5hx6O7sHsw4od26QL3CmoFBnyl3ItzcLN+kdubz0u8/PjTzkwYTj2PlRemf1i2Z14Jx6GM8tZxs=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdGrLLxWN/lgDhii4A3dYju8B7ScibeqmNcMSiZWNjY2iT6NsdTaqdG8udRsVBVX0L3xf4fCDXYmROQN8ImBLIXNn4aSbXiSUqoe2rWoFxx2gdwed7cCgSTLeUpCisghihIS6MqJxzGk7rqCXxqR3mcCdoaBqzCDh/iNw+kmoiaowHe7B13lyPBjlXLoR2gStFGegXrGsf9LdxL4r+w+pmV/4mEX8Yiv5wMFb2nmqOtWxwrjfKa3yfYRocWQRhvtHkdvqe99pC6KxBkf3haASMrIflw9MyKn+dO24ONErImXuHx2JP3jfsBJoqEGXA8TJehurFBcTwUKg0njbHxOf2QvrxKhI+6m87PoVrxYUs3hT8Pp2++x2oDYCKUnJyhRgezXupmW1h1wTzO7rnfwmrYqW/jdoGBmxudX/kor4W53LO5ZxZJtGzVLEoPso413dOKfk/wLWMzRjtGeuvp+bGGUUoQ86T+PfpGDud2L4niRGZFmgFGbS8FS7S/jf5I/LeFbxeb0H5gthEtvRqoMOa/Xf2j7GXnwYBXqx8RbixhE3q5xJjfFJAnhRqM03F+7JfFpno2+tVq7Kc05vG+w/4c=</Encrypted>]]>
    </text>
  </script>

</dir>