<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY CommandBeginTag "declare @$denyAccess nvarchar(512), @$checkVoucherUnit varchar(32)
select @$denyAccess = '$NotAuthorized', @$checkVoucherUnit = ma_dvcs from phns where ma_ns = @ma_ns
if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @$checkVoucherUnit and ">
  <!ENTITY CommandEndTag " = 1) begin
  select '' as script, @$denyAccess as message
  return
end">

  <!ENTITY CommandWhenVoucherBeforeEdit "if @@view = 0 and @@action = 'Edit' and @@admin &lt;&gt; 1 begin
  &CommandBeginTag;r_edit&CommandEndTag;
end">
  <!ENTITY CommandWhenVoucherBeforeDelete "if @@admin &lt;&gt; 1 begin
&CommandBeginTag;r_del&CommandEndTag;
end">
  <!ENTITY CheckTaxCodeCondition "@ma_so_thue &lt;&gt; ''">
  <!ENTITY CheckTaxCodeConditionExt "">
  <!ENTITY CheckTaxCodeConditionByVAT "">
  <!ENTITY CheckTaxCodeFieldValue "@ma_so_thue">
  <!ENTITY CheckTaxCodeTableValue "default">
  <!ENTITY CheckTaxCodeTableQuerySelectWarning "select @$scriptConflict = @$scriptConflict + @$taxCodeInvalidConflict">
  <!ENTITY CheckTaxCodeExt "
select line_nbr, rtrim(ma_so_thue) as ma_so_thue into #t from @d2 where ma_so_thue &lt;&gt; ''
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

<dir table="phns" code="ma_ns" order="ma_ns" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhân viên" e="Employee"></title>
  <fields>
    <field name="ma_ns" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_ns" allowNulls="false">
      <header v="Tên nhân viên" e="Employee Name"></header>
    </field>
    <field name="ten_ns2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_bp" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="TaxDepartment" reference="ten_bp%l" key="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and status = '1'" check="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}'))" information="ma_bp$txdmbp.ten_bp%l" row="1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l" row="1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>

    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày sinh" e="Date of Birth"></header>
    </field>
    <field name="ma_qt" categoryIndex="1" clientDefault="Default" allowNulls="false">
      <header v="Quốc tịch" e="Nationality"></header>
      <items style="AutoComplete" controller="Nationality" reference="ten_qt%l" key="status = '1'" check="1 = 1" information="ma_qt$dmqt.ten_qt%l" row="1"/>
    </field>
    <field name="ten_qt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cmnd" categoryIndex="1" dataFormatString="@upperCaseFormat">
      <header v="CMND/Hộ chiếu" e="ID/Passport No."></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_cap_cmnd" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày cấp" e="Date Issued"></header>
    </field>
    <field name="noi_cap_cmnd" categoryIndex="1">
      <header v="Nơi cấp" e="Place Issued"></header>
    </field>
    <field name="ngay_hh_cmnd" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày hết hạn" e="Expired Date"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>

    <field name="ma_so_thue" categoryIndex="1" dataFormatString="@upperCaseFormat">
      <header v="Mã số thuế" e="Tax Code"></header>
      <items style="Mask"/>
    </field>
    <field name="doi_tuong" dataFormatString="1, 2" defaultValue="1" clientDefault="Default" align="right" categoryIndex="1">
      <header v="Đối tượng" e="Kind"></header>
      <footer v="1 - Cư trú, 2 - Không cư trú" e="1 - Resident, 2 - Non-resident"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99AEkNGGYB+NX9Q46cb3g/qBvDuHc3Gx8NTTN4/E3jXcN4pu/LZLxoDY0RLSOlxhTkg==</Encrypted>]]></clientScript>
    </field>
    <field name="tinh_thue_yn" dataFormatString="1, 0" defaultValue="1" clientDefault="Default" align="right" categoryIndex="1">
      <header v="Tính thuế" e="Tax Assessment"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="tinh_gt_yn" dataFormatString="1, 0" defaultValue="1" clientDefault="Default" align="right" categoryIndex="1">
      <header v="Giảm trừ bản thân" e="Deduction"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="hop_dong_yn" dataFormatString="1, 0" defaultValue="1" clientDefault="Default" align="right" categoryIndex="1">
      <header v="Hợp đồng lao động" e="Labor Contract"></header>
      <footer v="1 - Từ 3 tháng trở lên, 0 - Nhỏ hơn 3 tháng" e="1 - At least three months, 0 - Less than three months"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99MLr9oZ02nASf5PC2EqNEJP3k1fJvzaAEk51uTrLArQVxvwVrZWCILLi+LTY1RMA4A==</Encrypted>]]></clientScript>
    </field>
    <field name="uy_quyen_yn" dataFormatString="1, 0" defaultValue="1" clientDefault="Default" align="right" categoryIndex="1">
      <header v="Loại" e="Authorization"></header>
      <footer v="1 - Ủy quyền quyết toán, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="bhxh_yn" type="Boolean" defaultValue="1" clientDefault="Default" categoryIndex="1">
      <header v="Đóng BHXH" e="Pay for SI"></header>
      <items style="CheckBox"/>
    </field>
    <field name="bhyt_yn" type="Boolean" defaultValue="1" clientDefault="Default" categoryIndex="1">
      <header v="Đóng BHYT" e="Pay for HI"></header>
      <items style="CheckBox"/>
    </field>
    <field name="bhtn_yn" type="Boolean" defaultValue="1" clientDefault="Default" categoryIndex="1">
      <header v="Đóng BHTN" e="Pay for UI"></header>
      <items style="CheckBox"/>
    </field>

    <field name="ngay_vao_cty" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1" allowNulls="false">
      <header v="Ngày vào công ty" e="Joining Date"></header>
    </field>
    <field name="ngay_nghi" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày nghỉ" e="Termination Date"></header>
    </field>

    <field name="d4" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="258" filterSource="Tidy" categoryIndex="6">
      <header v="" e=""></header>
      <label v="Thông tin chi tiết" e="Detail Information"/>
      <items style="Grid" controller="TaxPersonalDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_ns, ma_ns" e="String: ma_ns, ma_ns"></text>
        </item>
      </items>
    </field>

    <field name="d1" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="259" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="TaxInsurance" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_ns, ma_ns" e="String: ma_ns, ma_ns"></text>
        </item>
      </items>
    </field>

    <field name="d2" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="259" filterSource="Tidy" categoryIndex="3">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="TaxDependant" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_ns, ma_ns" e="String: ma_ns, ma_ns"></text>
        </item>
      </items>
    </field>

    <field name="d3" external="true" clientDefault="0" defaultValue="0" rows="259" filterSource="Tidy" categoryIndex="4">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="TaxIncome" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_ns, ma_ns" e="String: ma_ns, ma_ns"></text>
        </item>
      </items>
    </field>

    <field name="ghi_chu" categoryIndex="5">
      <header v="Ghi chú" e="Description"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="5">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="319" anchor="5">
      <item value="100, 30, 70, 100, 100, 3, 100, 100, 150"/>
      <item value="110-----1: [ma_ns].Label, [ma_ns], [cookie]"/>
      <item value="11000: [ten_ns].Label, [ten_ns]"/>
      <item value="11000: [ten_ns2].Label, [ten_ns2]"/>
      <item value="110100000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100000: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>

      <item value="110---110: [ngay_sinh].Label, [ngay_sinh], [ngay_vao_cty].Label, [ngay_vao_cty]"/>
      <item value="11010-110: [ma_qt].Label, [ma_qt], [ten_qt%l], [ngay_nghi].Label, [ngay_nghi]"/>
      <item value="110---11: [cmnd].Label, [cmnd], [bhxh_yn].Label, [bhxh_yn]"/>
      <item value="110---11: [ngay_cap_cmnd].Label, [ngay_cap_cmnd], [bhyt_yn].Label, [bhyt_yn]"/>
      <item value="11000-11: [noi_cap_cmnd].Label, [noi_cap_cmnd], [bhtn_yn].Label, [bhtn_yn]"/>
      <item value="110: [ngay_hh_cmnd].Label, [ngay_hh_cmnd]"/>
      <item value="10000: [ngay_hh_cmnd].Description"/>
      <item value="110: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="11100: [doi_tuong].Label, [doi_tuong], [doi_tuong].Description"/>
      <item value="11100: [hop_dong_yn].Label, [hop_dong_yn], [hop_dong_yn].Description"/>
      <item value="11100: [tinh_thue_yn].Label, [tinh_thue_yn], [tinh_thue_yn].Description"/>
      <item value="11100: [tinh_gt_yn].Label, [tinh_gt_yn], [tinh_gt_yn].Description"/>
      <item value="11100: [uy_quyen_yn].Label, [uy_quyen_yn], [uy_quyen_yn].Description"/>

      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>

      <item value="1: [d4]"/>
      <item value="1: [d1]"/>
      <item value="1: [d2]"/>
      <item value="1: [d3]"/>

      <categories>
        <category index="1" columns="100, 30, 70, 100, 100, 3, 100, 25, 75, 150" anchor="5" split="6">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="6" columns="769" anchor="1">
          <header v="Thông tin chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="769" anchor="1" split="1">
          <header v="Thông tin bảo hiểm" e="Insurance Information"/>
        </category>
        <category index="3" columns="769" anchor="1" split="1">
          <header v="Thông tin người phụ thuộc" e="Dependant Information"/>
        </category>
        <category index="4" columns="769" anchor="1">
          <header v="Thông tin thu nhập" e="Income Information"/>
        </category>
        <category index="5" columns="100, 30, 70, 200, 353" anchor="4">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandWhenVoucherBeforeEdit;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1snEZ3LakEidUn95J9J7azInKrNJdN4TSuMUDoqTafUpBS0ih8Kgxok0yYBjOYvzS/GLtR7ArcT1BeonRTYbBIWyqmK4EQ7bLbp61xjcDg8NoS4Yua3Q2NdlypnUIav5vkt1zLF/1vqyW0DKOBvSdqMMWKXE0R+jSMsOfYNrfP0fB9/yo8fQorEe/2wofcpldQjxbyiH3/tJDf86XoXSpn1tDzQaCJs5Wh9eqoCxltTdsXWhRIOaQT6o50eePLpasbaVcCZwNvN5l+Y9iq7Z/wXOgi97sMKw6z+CLcESiI1</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFLTtxwxLS0qUVnguBBCPvOv7FuNWJ76eQI3lkfGnxh6jxcb+DzGOlhxjIVzJi+PKnsvGhX66GHVMx9hmVblsKc=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandWhenVoucherBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDk7V+WCQCbTf5mLypqZov8ExIbvh3hHbsEdfg4r9wtVP8mgu1bpbmHnsgJNazUNzpWIZouaKVWJDSUVcw70R30=</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNTD8ODXg6FkOMWxkewCnkq9ncjD0ryACTAdnep6QnXFGY+p/vuYEhjNS35txAEsnWpMgurVJ24rulCgqx/A1+fHrcQa/EuwGLVyQtemkJ9zPZPOod/dMuP6nwuH+AVsAtz5+x4E2KsT/se5X10Jo2FRY+XrvdFnbytotcvlg6/HS4EuBBlq9lhoqTBaPIcV8Q==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        &CheckTaxCodeDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNI0P19JDD2G8GQW1VvSxieyN4T+/y8zkkAjBJTwnmODYvoI096s7jxbc0VI5KU4dTfyItkCNIiiDE6CbSK1I036XugHcmrpTlW57khBUymvBrav686K0pkarhVmoIQrzyy6TxyJqxJtL4XlBKWB7zlMGOdHg8d1QVRTU14lkKHcqfIvDZnE5XGyhGu66jbifnFErqz0X+HEWJpbZve4Ic/AjA0G4sgEJ+bZU2+6pBB9NmyZ/kQMm/RrJBzL1q9d3P/iY7RHVG7zFuiHIzg7+66gITsnU/FvRB9V7EQBfW4sYbJQd1Rko9kA+W75vh2gtpvLYbdDqIBv/BllNC23D7pwMSVplfIhMxP2ft2ylbVzTk=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckTaxCodeBeforeSave;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwU2kMGimMinb+E5FQJlgLc7burNlQz7TaPXiyakD1W/qlE4+Jc3zRH3Nb1qjknzD0BvwQaCgJAodsFj7ERGLsZnz3FS3j18e/jsJ99qwduuatOBlVlOoDe/YRjusuz9TLqqpsgNQX927NXuztYc03shEBvpqoauQugKBlBghAIEGQoSF7IhdG9UOnmKbPnIDJ8RK17cKnhtgr4kFTqvLQHT9AcjvyrsqoV6VVYp4wKLS3mFQ6qQVhsFOJLRHksO/YuHevcxWuck+C6QQwbdTI+Jhfnwx5qYhJKThRPQP6d3EMsIFzSFCW56S650G7azD7R</Encrypted>]]>
        &CommandListCheckTaxCodeWarning;
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNG0Rrk9j3u0Qk8OW7AHkET3RMuLH0FKUaq21u95PRLH/xA+aDUnUey/Ptf6VLFGG+Gtk3qAHHW2yAHHDM4EbpI=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandCheckTaxCodeBeforeSave;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLngl8T3P3f8rvQ//w4PwHy+0h8K4m0xceGfJvrjedZk8aG0qoEUDTNY4yKJgDW0SvBuwMBquU/yRmzXRdJL96C15roSxsItN8ynZV6V2ZWAXQw+oOaTgVfPt85F+2Ui9mbpaJ83KdnyuxCyI7rU6W2oRpeyXKEtcLovRnaw2HbbCLIwLyMd5a5zOgXwK6hBqh/HQdthNI15Y9LF5SGp4iqErDJtlbL2du61TBbP6Iv+K5HngHQMJXEp9mkw0lxKRQqrfiuidgX2g47Yex/N2AruvQI1BgGnuC/Lhme7adkzQFnUrn0mV+fh4LMTb1psZ6ivQlIrMreNWGhaDb6rXbs6dV+m22IKN0hsrR8HuwlHqWZGXYN+IAUMOx0OQJCeYn/nJd16a3bAvXl5IpBnUm3XmGSNJ/JOF7aZVyRleEC8Ar0RRKQARIjk5m7GHmKTmK1okS1LLkvfPVltPwv3Vq9g==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XVwgjUx1dSIB/D4H49gDtngX8zRShRJ28NdoXssGNlVNIs3WC2OcQ9L1iSIM8LOdxdQSRgXaZX75oCznlcSYSrPY8tS7N3m9Y+NZMzxetXkYEdD00Cl6XYB3MhJ929e7TJlko4WvmEIds2+u39jdAExinYDDzutuuctQZkv3OUj79smeKIvyEgZnnPY0G0dSF7w==</Encrypted>]]>
        &CommandListCheckTaxCodeWarning;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/Fq9FUVPdpsuHEbqO211zAEMt2YBQk71oEU0XgwpnWa6tdpZ+Zzpcizx+XTSXmKkx41g/p8UxoST10YC2AQs4U=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EWwzj42WCwF513sS6hrJwv3RbGUJnvTiccYeqhw3IleBk3bgXToxHZxc5/OiUw7CJ2Okc+TCmb2OsXGMMJnqR3cvJCoRHNcfLNQHylQ4IKUs2VvnIGFCgt4xx2QshEIQBQDxGkYrWwMESpDPHkxcGn9JVkdeSqubvN2IQpmlfjfOaKwRb1aJpz0K+xz4UzT3FJq+ZXR3wMM8KeZJ+G+/Bcfuiphg0NJQcl25b19+yxxgOprgsZkE6BAchABj08/RVA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptCheckTaxCode;
      <![CDATA[<Encrypted>&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</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1jG6VWeGAcv3M25z+vBq/YUELg3A+LaU/g+75YddH2MioYzVSZN7XIVuLwZdRmGe43KKROWWuTQdEAkAhQTXjONP71kKI9Pdmf/NmL5suGS0Rod7Nj1cdsAki5F7RbXOskQ3hJlHTERTjAiK3UXElALvsE3YUD1J338oot8nd2v7MT/XbXohgiSUXaLqoFipvk5FeXVIX3AjzPjbXXFJqSyv4BSa/BXxt5Pb6vs2nsW</Encrypted>]]>
    </text>
  </css>
</dir>