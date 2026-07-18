<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CheckTaxCodeCondition "@$ma_so_thue &lt;&gt; ''">
  <!ENTITY CheckTaxCodeConditionExt "">
  <!ENTITY CheckTaxCodeConditionByVAT "">
  <!ENTITY CheckTaxCodeFieldValue "@$ma_so_thue">
  <!ENTITY CheckTaxCodeTableValue "default">
  <!ENTITY CheckTaxCodeTableQuerySelectWarning "select @$scriptConflict = @$scriptConflict + @$taxCodeInvalidConflict">
  <!ENTITY CheckTaxCodeExt "
select line_nbr, rtrim(ma_so_thue) as ma_so_thue into #t from @hrttctpt where ma_so_thue &lt;&gt; ''
exec FastBusiness$System$CheckTaxCode 'line_nbr, ma_so_thue', @t_yn output, @col output, '#t'
if @t_yn = 0 and @$taxCodeInvalid is not null begin
  select @$taxCodeInvalidConflict = case isnull(@$taxCodeInvalid, '0') when '2' then case @@language when 'v' then N'Trường &lt;span class=&quot;Highlight&quot;&gt;Mã số thuế người phụ thuộc&lt;/span&gt; chưa nhập hoặc giá trị nhập không hợp lệ.' else N'Field &lt;span class=&quot;Highlight&quot;&gt;Dependant Tax Code&lt;/span&gt; must not be blank or has invalid value.' end when '1' then case @@language when 'v' then N'Trường &lt;span class=&quot;Highlight&quot;&gt;Mã số thuế người phụ thuộc&lt;/span&gt; không đúng.' else N'Field &lt;span class=&quot;Highlight&quot;&gt;Dependant Tax Code&lt;/span&gt; is invalid.' end else '' end
  if @$taxCodeInvalid = '2' begin
    select 'ma_so_thue' as field, @$taxCodeInvalidConflict as message
    return
  end else &CheckTaxCodeTableQuerySelectWarning;
end
">
  <!ENTITY % CheckTaxCode SYSTEM "..\Include\CheckTaxCode.ent">
  %CheckTaxCode;
]>

<dir table="hrnv" code="stt_rec" order="stt_rec" type="Voucher" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin thuế TNCN cho nhân viên" e="Employee PIT Information"></title>
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

    <field name="ma_so_thue" dataFormatString="@upperCaseFormat" external="true" defaultValue="''" categoryIndex="1" allowContain="true">
      <header v="Mã số thuế" e="Tax Code"></header>
      <items style="Mask"/>
    </field>
    <field name="doi_tuong" dataFormatString="1, 2" external="true" defaultValue="1" clientDefault="Default" align="right" categoryIndex="1" allowContain="true">
      <header v="Đối tượng" e="Kind"></header>
      <footer v="1 - Cư trú, 2 - Không cư trú" e="1 - Resident, 2 - Non-resident"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99AEkNGGYB+NX9Q46cb3g/qBvDuHc3Gx8NTTN4/E3jXcN4pu/LZLxoDY0RLSOlxhTkg==</Encrypted>]]></clientScript>
    </field>
    <field name="tinh_thue_yn" dataFormatString="1, 0" external="true" defaultValue="1" clientDefault="Default" align="right" categoryIndex="1" allowContain="true">
      <header v="Tính thuế" e="Tax Assessment"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="tinh_gt_yn" dataFormatString="1, 0" external="true" defaultValue="1" clientDefault="Default" align="right" categoryIndex="1" allowContain="true">
      <header v="Giảm trừ bản thân" e="Deduction"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="hop_dong_yn" dataFormatString="1, 0" external="true" defaultValue="1" clientDefault="Default" align="right" categoryIndex="1" allowContain="true">
      <header v="Hợp đồng lao động" e="Labor Contract"></header>
      <footer v="1 - Từ 3 tháng trở lên, 0 - Nhỏ hơn 3 tháng" e="1 - At least three months, 0 - Less than three months"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99MLr9oZ02nASf5PC2EqNEJP3k1fJvzaAEk51uTrLArQVxvwVrZWCILLi+LTY1RMA4A==</Encrypted>]]></clientScript>
    </field>
    <field name="uy_quyen_yn" dataFormatString="1, 0" external="true" defaultValue="1" clientDefault="Default" align="right" categoryIndex="1" allowContain="true">
      <header v="Loại" e="Authorization"></header>
      <footer v="1 - Ủy quyền quyết toán, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="hrtttncnct" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="258" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Thông tin chi tiết" e="Detail Information"/>
      <items style="Grid" controller="hrEmployeePITInformationDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="hrttctpt" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="258" filterSource="Tidy" categoryIndex="3">
      <header v="" e=""></header>
      <label v="Thông tin người phụ thuộc" e="Dependant Information"/>
      <items style="Grid" controller="hrEmployeePITInformationDependant" row="1">
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
      <item value="1100000--------11: [ho_ten].Label, [ho_ten], [quoc_tich], [cmnd_noi_cap]"/>
      <item value="1100000--------11: [bo_phan].Label, [ten_bp%l], [stt_rec], [bo_phan]"/>
      <item value="1100000---------1: [vi_tri].Label, [ten_vtr%l], [vi_tri]"/>
      <item value="1100000---------1: [bac_quan_ly].Label, [ten_bac_ql%l], [bac_quan_ly]"/>

      <item value="1100----110------: [ngay_sinh].Label, [ngay_sinh], [ngay_vao].Label, [ngay_vao]"/>
      <item value="1100000-110------: [quoc_tich].Label, [ten_qt%l], [ngay_nghi].Label, [ngay_nghi]"/>
      <item value="1100-------------: [cmnd_so].Label, [cmnd_so]"/>
      <item value="1100-------------: [cmnd_ngay_hl].Label, [cmnd_ngay_hl]"/>
      <item value="1100000----------: [cmnd_noi_cap].Label, [ten_tinh%l]"/>
      <item value="1100-------------: [cmnd_ngay_hh].Label, [cmnd_ngay_hh]"/>

      <item value="100000000: [cmnd_ngay_hh].Description"/>

      <item value="1100: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="11100000000000000: [doi_tuong].Label, [doi_tuong], [doi_tuong].Description"/>
      <item value="11100000000000000: [hop_dong_yn].Label, [hop_dong_yn], [hop_dong_yn].Description"/>
      <item value="11100000000000000: [tinh_thue_yn].Label, [tinh_thue_yn], [tinh_thue_yn].Description"/>
      <item value="11100000000000000: [tinh_gt_yn].Label, [tinh_gt_yn], [tinh_gt_yn].Description"/>
      <item value="11100000000000000: [uy_quyen_yn].Label, [uy_quyen_yn], [uy_quyen_yn].Description"/>

      <item value="1: [hrtttncnct]"/>
      <item value="1: [hrttctpt]"/>

      <categories>
        <category index="1" columns="100, 30, 20, 50, 100, 100, 137, 8, 108, 50, 50, 0, 0, 0, 0, 0, 0" anchor="7" split="7">
          <header v="Thông tin chung" e="Information"/>
        </category>
        <category index="2" columns="769" anchor="1">
          <header v="Thông tin chi tiết" e="Detail"/>
        </category>
        <category index="3" columns="769" anchor="1">
          <header v="Thông tin người phụ thuộc" e="Dependant Information"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        &CheckTaxCodeDeclare;
      </text>
    </command>

    <command event="Initialize">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7M9dy+n43rqdgCnSun/afZwpEjG2rY7hV5SsmhQZXATEbHZP+x0W5WsO823z2QN0p3jls95IpIAbNm6mfNh44hxHYvUtfDYHCCd4evo6ueq+rzMXXycguV6u7aDp1n/a7d69JjTlZcWk7qBadxx9sDWDlkrW1TRToaIanQE4o0YyKLs/suWOiGBxWMQJPbPJccUbmh2+xe9ppPmuvwgiCgSxn4PCBBz8VID/xzenpNPqNhevlofcnaWJ9+pb9pmjsvYlftuj06vxSjPAXH956LFMINBKTRaqC2VGJPnC0e4</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFYdV26gZh3fuc8sMEXOcRAfK8pWX6WCxSV85m6/GKCsZZkjxQXarJMQHj0+wGUkPuPPgGimYhD/dUFxy0MjIgfvpFqfGtzeey/BnMmDAiDj</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAnfmKSAJtKy5hx6O7sHsw7xYcOZtcjDOBYMic93yYFRGepPodaozUFa1ai8Dfxbcyd9EwWoWlnUGYmLElVw97kTTSV9YDCWPL/XahESEZAf</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyaVpCbdGljJ0ivNhQve8w8zDFuxpNO5/8KA02EPlrO/1Tq4EwUvo/TgE17Xlxfl8GO20RXKxAIRNuVHoT8PiosWZpoQwB1onuZ7AYPb6haOJM1sd9UP2JB2OaSmNsRbucqWDDnrWQr3C/pEs6xKsQEomewgLGzEAd8X9cBK6avJsmxziO3bwX1mHP1hwICkIQJ5Sr5VgU0+W7XTyw3+1OL30C9O4BjgLlqeGsPXaUvUVEGCVnVVmBzh6dFGU7QAqwUqXLxz7kWp9eMCH9aPeZk5sfZaXr19pysfd3q8C+5hXTD3LLg0ZRSuFhq4V76Zx8D6lfqgf0eqFG3kEIKXQ60MJTOJRy1G8kOIzEwiqX4eRm7fWFLYN2OnlsrnPSaCAehi+9ekiY6y1QIYOFQ//hZdsGLx3SktsTGY+kChWkjsOyTkRwNlc0tm/8cM7F1eHFUo8/e8qxPALdYlHSuhVCDR6++/gsMfZCsdwcFOZ+FxhY+C6rPQ9tz5eaXltaj9Td+gwk4ozqrYN+kQA6IfNqmvPMDrbE2DKtoLLfVpcJu4Lvpa4D1masDElFJ3WTIebGjL08qhzqRhKVev7mJE8hYpaYSZG9H/MZAImGXKn7TPyObJyYDU68hOdGund1lBm6K7L50o5zSUxsPngmkUr7jT4wWFi//ZxmUi1PxSH3RtxMGWeja1YAwCbVQ0Oze9cHnRsdW2uma0BE7VqRj/Xm42dp1+A7LeEA+mLb4kq2hC</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandCheckTaxCodeBeforeSave;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCCvUeh8oRF4cKdXZqR1sVjJDjuW99dYVPxWPeVCZjjEeS2QGq6H9xtOqRgQdwYKgqCBMCq+PRDRL6ygnwSh9f2KJlHaxBAyCMVEB5uSTuBplfXdpHyLnqCwkshU4yh0+lE0ZUPqQ5Js0tTmOPy+9cKZiV7yhDqM1yETUINpMKoBwGa+pG8ZTaAfjpUXh3xna8jGgk6T06miSxT9G0xWTrKfr7/Mnpg9MUPJKqOaMSQqc3ANqVKDZEEogVKUwgKYPiAWEXNkjAurLQ+6Qd5fCbKRbYGAvkSCMEK5QIDVtAHxSN62hzkpDQY5V4wc6u5H5lDlv0qZRYdwgYy+guHboFSgdf3IxWuTfjMeFmv6d9VEbs0WJrcGh5B+Y6X2Lv7ytcSKHocn8UCSHTPTL/QTaHuPdVldE0NKo7m0dNy5gKFxaZZ7iKce8oJ87tcvk14USnz1sj3ZD8yG4PaAhtHfpucR4HPGpYgWdtOVjVZrEoJeZ9tQ8nZMPdViDD2OmmMGFCdCtDRngqNeu5Np9nbk7hzqiA3btOd0VoxBTg6G+Kra</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aJY37GzVteQ+J3KJhn9LMA=</Encrypted>]]>
        &CommandListCheckTaxCodeWarning;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22eTvVfsY4Qo8MOAZHMFFWvySdCK+kDfNUFiu3z1pKL11sTdUEf3jh8HftvFSV6I5ZS2m3sxaEBIO4YmdeI9i7gTyMCfDqSZu9DqC8RcCUAfWBVA73yVh8Ge9KudOj3jxHLauST85idvHUPSWiMY6qZJXVxWPPAuiW3MA5/LNN4Px8XIpvJ4QZ5OCq7ru6QcUG7XOZ8kZCHLlG3QWrSHuv3gaTDj78FpNp62pZrk5OYfiBWVgJsbUASz6yajb9CY77Q==</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptCheckTaxCode;
      <![CDATA[<Encrypted>&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</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1jG6VWeGAcv3M25z+vBq/YUELg3A+LaU/g+75YddH2MioYzVSZN7XIVuLwZdRmGe43KKROWWuTQdEAkAhQTXjONP71kKI9Pdmf/NmL5suGS0Rod7Nj1cdsAki5F7RbXOskQ3hJlHTERTjAiK3UXElAkfOhwoBZKQU16Y3qXo5wMsVvHUCG27l/o2QwiNpFtWASOEkRMAM98cdHNRzJ5CB4=</Encrypted>]]>
    </text>
  </css>

</dir>