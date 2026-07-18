<?xml version="1.0" encoding="utf-8"?>

<dir table="hrnv" code="stt_rec" order="stt_rec" type="Voucher" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin bảo hiểm, công đoàn" e="Employee Insurance and Union Due Information"></title>
  <partition table="hrnv" prime="hrnv" field="stt_rec" expression="''" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Mask"/>
    </field>

    <field name="ma_nv">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_nv" readOnly="true">
      <header v="Họ nhân viên" e="Last Name"></header>
    </field>
    <field name="ten_nv" readOnly="true">
      <header v="Tên nhân viên" e="First Name"></header>
      <footer v="Họ và tên" e="Employee Name"></footer>
    </field>
    <field name="ho_ten" external="true" defaultValue="rtrim(ho_nv) + space(1) + ten_nv">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>

    <field name="ngay_vao" type="DateTime" dataFormatString="@datetimeFormat" inactivate="true">
      <header v="Ngày vào công ty" e="Join Date"></header>
    </field>
    <field name="ngay_nghi" type="DateTime" dataFormatString="@datetimeFormat" inactivate="true">
      <header v="Ngày nghỉ" e="Termination Date"></header>
    </field>
    <field name="bo_phan" readOnly="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri" readOnly="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" information="ma_vtr$hrvt.ten_vtr%l" new="Default"/>
    </field>
    <field name="ten_vtr%l" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="bac_quan_ly" readOnly="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac_ql%l" information="ma_bac$hrdmbql.ten_bac%l" new="Default">
      </items>
    </field>
    <field name="ten_bac_ql%l" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày sinh" e="Date of Birth"></header>
    </field>
    <field name="quoc_tich" categoryIndex="1" readOnly="true">
      <header v="Quốc tịch" e="Nationality"></header>
      <items style="AutoComplete" controller="hrNationality" reference="ten_qt%l" key="status ='1'" check="1=1" information="ma_qt$dmqt.ten_qt%l" new="Nationality"/>
    </field>
    <field name="ten_qt%l" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cmnd_so" categoryIndex="1" dataFormatString="@upperCaseFormat">
      <header v="CMND/Hộ chiếu" e="ID/Passport No."></header>
      <items style="Mask"/>
    </field>
    <field name="cmnd_ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày cấp" e="Date Issued"></header>
    </field>
    <field name="cmnd_noi_cap" categoryIndex="1">
      <header v="Nơi cấp" e="Place Issued"></header>
    </field>
    <field name="ten_tinh%l" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cmnd_ngay_hh" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày hết hạn" e="Expired Date"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>

    <field name="ma_so_bhxh" dataFormatString="@upperCaseFormat" external="true" defaultValue="''" categoryIndex="1" allowContain="true">
      <header v="Mã số BHXH" e="SI No."></header>
      <items style="Mask"/>
    </field>
    <field name="ma_so_hgd" dataFormatString="@upperCaseFormat" external="true" defaultValue="''" categoryIndex="1" allowContain="true">
      <header v="Mã số hộ gia đình" e="Household ID"></header>
      <items style="Mask"/>
    </field>

    <field name="si_no" dataFormatString="@upperCaseFormat" external="true" defaultValue="''" categoryIndex="1" allowContain="true">
      <header v="Số sổ BHXH" e="SI Book No."></header>
      <items style="Mask"/>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="si_date" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1" external="true" defaultValue="getdate()" allowContain="true">
      <header v="Ngày cấp sổ" e="Date of Issue"></header>
    </field>
    <field name="si_date2" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1" external="true" defaultValue="getdate()" allowContain="true">
      <header v="Ngày tham gia" e="Join Date"></header>
    </field>

    <field name="hi_no" dataFormatString="@upperCaseFormat" external="true" defaultValue="''" categoryIndex="1" allowContain="true">
      <header v="Số sổ BHYT" e="HI Book No."></header>
      <items style="Mask"/>
    </field>
    <field name="hi_date" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1" external="true" defaultValue="getdate()" allowContain="true">
      <header v="Ngày cấp sổ" e="Date of HI Issue"></header>
    </field>
    <field name="hi_date2" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1" external="true" defaultValue="getdate()" allowContain="true">
      <header v="Ngày tham gia" e="Join Date"></header>
    </field>
    <field name="noi_kham" categoryIndex="1" external="true" defaultValue="''" allowContain="true">
      <header v="Nơi đăng ký KCB" e="Medical Care"></header>
      <items style="AutoComplete" controller="hrMedicalCareCenter" reference="ten_kcb%l" key="status ='1'" check="1=1" information="ma_kcb$hrdmkcb.ten_kcb%l"/>
    </field>
    <field name="ten_kcb%l" external="true" defaultValue="''" categoryIndex="1" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="quyen_loi" categoryIndex="1" external="true" defaultValue="''" allowContain="true">
      <header v="Quyền lợi" e="Benefits"></header>
    </field>
    <field name="hrttctxh" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="258" filterSource="Tidy" categoryIndex="3">
      <header v="" e=""></header>
      <items style="Grid" controller="hrEmployeeInformationSocialInsurance" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
    <field name="hrttctyt" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="258" filterSource="Tidy" categoryIndex="5">
      <header v="" e=""></header>
      <items style="Grid" controller="hrEmployeeInformationHealthInsurance" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
    <field name="hrttcttn" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="258" filterSource="Tidy" categoryIndex="6">
      <header v="" e=""></header>
      <items style="Grid" controller="hrEmployeeInformationUnemploymentInsurance" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
    <field name="hrttctcd" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="258" filterSource="Tidy" categoryIndex="7">
      <header v="" e=""></header>
      <items style="Grid" controller="hrEmployeeInformationUnionDue" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
    <field name="hrttctdtbh" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="258" filterSource="Tidy" categoryIndex="8">
      <header v="" e=""></header>
      <items style="Grid" controller="hrEmployeeInformationObject" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
    <field name="hrhgd" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="258" filterSource="Tidy" categoryIndex="9">
      <header v="" e=""></header>
      <items style="Grid" controller="hrEmployeeInformationFamily" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="stt" external="true" defaultValue="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_gt" external="true" defaultValue="''" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ten_ttnv%l" external="true" defaultValue="''" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="319" anchor="5" split="7">
      <item value="100, 30, 20, 50, 100, 100, 137, 8, 108, 50, 50, 0, 0, 0, 0, 0, 0"/>
      <item value="1100-------111111: [ma_nv].Label, [ma_nv], [cookie], [stt], [ten_gt], [ten_ttnv%l], [ho_nv], [ten_nv]"/>
      <item value="1100000----------: [ho_ten].Label, [ho_ten]"/>
      <item value="1100000--------11: [bo_phan].Label, [ten_bp%l], [stt_rec], [bo_phan]"/>
      <item value="1100000---------1: [vi_tri].Label, [ten_vtr%l], [vi_tri]"/>
      <item value="1100000---------1: [bac_quan_ly].Label, [ten_bac_ql%l], [bac_quan_ly]"/>

      <item value="1100-----110------: [ngay_sinh].Label, [ngay_sinh], [ngay_vao].Label, [ngay_vao]"/>
      <item value="11000000-110------: [quoc_tich].Label, [ten_qt%l], [ngay_nghi].Label, [ngay_nghi]"/>
      <item value="1100--------------: [cmnd_so].Label, [cmnd_so]"/>
      <item value="1100--------------: [cmnd_ngay_hl].Label, [cmnd_ngay_hl]"/>
      <item value="11000000----------: [cmnd_noi_cap].Label, [ten_tinh%l]"/>
      <item value="1100--------------: [cmnd_ngay_hh].Label, [cmnd_ngay_hh]"/>

      <item value="100000000: [si_no].Description"/>

      <item value="1100-11-----------: [ma_so_bhxh].Label, [ma_so_bhxh], [ma_so_hgd].Label, [ma_so_hgd]"/>
      <item value="1100-11--110------: [si_no].Label, [si_no], [si_date].Label, [si_date], [si_date2].Label, [si_date2]"/>
      <item value="1100-11--110------: [hi_no].Label, [hi_no], [hi_date].Label, [hi_date], [hi_date2].Label, [hi_date2]"/>
      <item value="1100100-----------: [noi_kham].Label, [noi_kham], [ten_kcb%l]"/>
      <item value="11000000----------: [quyen_loi].Label, [quyen_loi]"/>

      <item value="1: [hrttctxh]"/>
      <item value="1: [hrttctyt]"/>
      <item value="1: [hrttcttn]"/>
      <item value="1: [hrttctcd]"/>
      <item value="1: [hrttctdtbh]"/>
      <item value="1: [hrhgd]"/>
      <categories>
        <category index="1" columns="100, 30, 20, 50, 137, 102, 100, 0, 8, 108, 50, 50, 0, 0, 0, 0, 0, 0" anchor="8">
          <header v="Thông tin chung" e="Information"/>
        </category>
        <category index="3" columns="769" anchor="1">
          <header v="Bảo hiểm xã hội" e="Social Insurance"/>
        </category>
        <category index="5" columns="769" anchor="1">
          <header v="Bảo hiểm y tế" e="Health Insurance"/>
        </category>
        <category index="6" columns="769" anchor="1">
          <header v="Bảo hiểm thất nghiệp" e="Unemployment Insurance"/>
        </category>
        <category index="7" columns="769" anchor="1">
          <header v="Kinh phí công đoàn" e="Union Due"/>
        </category>
        <category index="8" columns="769" anchor="1">
          <header v="Đối tượng" e="Participant"/>
        </category>
        <category index="9" columns="769" anchor="1">
          <header v="Hộ gia đình" e="Household"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Initialize">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6dK+/v7MkHwWkHm4y5UXx3u323L5bGln1vOPvoqD6606qaSJ7slSUZ76L3zw2DTpMBYk5+v8lHD4J9WQ6MjhRbjwbuSplPJQwE6tvjz7lDbQvlmgLmk757QGjo+ZaTAmMcdFhh8b2GaarRVJed2+YY9ZDqA/G80cWl02znzO/bwmMfTOXvUY3nmiom/ikEnV6jfX6KKzp/ZgV2sBWtBh/Im860ZNXX1gstGBtwp5+0GYR4JjFmEfbdj+W9iUs3Vzr/5U82GXmnU6B4LkERNk17hj3g7L1L4mhtj6QrqUxASiLDqd9V01BDKPxkzsGG82RvyEkj+90ArX7hy/gkts3j8hv3rzMBxi1StUny9WWcA+rsgmwugn9UtEr2ZYcBHd4mi9HL1/oTId2Z6WSEv/Jus=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf659qBlmOgUuGTuYDRGLNcTgrgcO/INhg789PafANSBNfLpNdPbOawPcpJap7J6ZuTgEKsoxPvWzI8kQQh+hnCboHI9+ZdKDnpBOSJs+qzL4B6IQrSWKtrBPU8kQbTssGw==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7pzHFhXaFflgm5c+NyaPOO9HTj4NPWAoIJutF6YhpeHkMmBMg2ktoPF+GP6gogm4o+yto+P5Tu9MGrZjHDFxQ5mu1y29XV2lWSeccA5HbWk1aw3kYPyqBNCkd897Csu5A==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Ry5VjAbgrbSh0bI6OR5iYHjISt2/gelZ5OFQkybS9EitpBQBoOY0ByZYm/upD+ALl+fUeVxbozsULDUgC1dPCnkkggd8ZEfT9vJR/u3ZxWOqwu3MbT7qoY3BvqbmtG1kRutevKrqxVfxXakjyiZ11jmnPNEmIaA7VT1nEuJxVMksf3hjFgRzMEDYkKNkNc7RwEtkoeqIvej8CKbYgDwiWXMQHbBpU+tmSng/XSaga9jgNNZCuLbx759Ec8vKH5hRgZ9nBMR12X128ugHcpUYBV2HdAwT0WlZihIJHbtwhoeBYK4lLnGqd1UPl1ZHutpYoP//KCKYuP6DFwot1ZSgLiQgmZPE0fjAnO8hSL41pQefptxSKhFWoLX8oSPmLEbvO3AF4hsm0m/SHV4VMGLIhayhW9qlxwNPXfylRuw1HXe6A3WlVXfIMpndL8Q31B/iPEP8NkoQsyzpy/JKSaHwcd8IlNuO/JburoDm14ldStDjcFwWQwdX1wmGwXcEY4rsgbNf1LDy5Zd5V4b7C5eUoX01xXwN/KART7KfjUDwHJJD0f5sUD8gA/nOoc7Wzk/GKVqZHOwfY2xF70YvanBsO0vCS/e942232DhAUbwFddTXTVhE3Fme3yFju9NEIzlW6lFI5SH8IRvqXTCE3sF2ZBxWDgEQ7w4mEZmSCH91gVdAcYtfq6i/NxJM0tooMloEMe2ofcEf3He/KPfZm0nLs//w8x472SFZESJ5S3KF0MyCJBn8RHdrPp04wxLv6WEIibjUfowt+yjxBLJH8jRmXY=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3FRra9DrohIiIFbEuTaV0Hx/DFud1FF1CiVgiYNARC8Nx3sCM23g9UtJr+s3fiTXSV0R8TmbH4FkgHkxnzA/MhoEiPHhaILh7qvG5AS61je7rB6Z8dRCNzAu9mP/jPhwkXIsbcj0/TqAA9NY45h55lw6brtU0uX9roJvQ7gYd2dXRUWDLmntRG0SMYKI8vOJECJCRIR4lNUd/VLq4/cSo8y743vQmveaNM/EUI2c3k+JaIgS2rhh7AYZiA4k/mLjh4DCvzBhVcOr06nOwa8jBPNVZ5a5DINOwQC2+dKpC3NH9dIxiKqHUBUpZC4TXQQccxKLuKtfbiKMpE0jm1tzmRvoKzHUg+iRqTOtEZz03cTJz4BvWaBpOrDUEECGHG9fv33OB14/iD0+rW1xF4F7mO1ua31ovcBThB8k4+5R1p1YQhp/hQqfcnTpA+BF/I7gN4DbXg0VusWBPKuNp5Z68yvw8NFoZZuuJaUvhqhVvDHPGAYqfvzFCOEbejaHIvv+DQZ9jo7Osy4+V3CjBtL1faGKPINzE7E+e6za9ykwJaFrNmprdwV7TadBuEIydpXiNbmcFquB/QmKDW+RCo87Q/mKkADOyqQNdT5OKqnf5zQaAT5j5ang9XzXO7I4UWnIst17pDuVmCA/A3MUBscupmkA60S0kXriYfrAky27afpdhhwPNBOW/kE2lHPDjX8Me5gx4cVVpD+Z/tlVilEmya3w6W8U+AuaITrEhqZA1NG</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FIbnIBvcPJdeg7CGPVF1Lc=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70CnbzESgVgMKAFC8L0XAD6rODnR2Kt6oWY7GLo9Kc5Ulg57RfKGs91F/kSbWLMJQ9ZI9o2PxxBZA+0QIoyfpFgJc3/+pTAH2XVTtapw1yeDDbb1O3JSJHjtpyG4CBpewlaAmjfMzR7nXF1DZKXrMDOHzIw9KyRXk5ClE7jSY1SwHMXHnrN8h8EQXibVAJkFpa+RUoWbHVqlbg/1kmtH67xwKwTBErpzPyRaAtzaSdQHtrav7L6EwQip8mr004TbfbBNIoaZz82xNAKBp7YETcAxIvZVzl5i6rU54dsxBDdO9</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%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</encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5EmoK51+oL4SALxwNfONGAL8UcO4OuXwXQs5ipVDyORs=</encrypted>]]>
    </text>
  </css>

</dir>