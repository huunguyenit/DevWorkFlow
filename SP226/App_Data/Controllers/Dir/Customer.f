<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identification "Customer">
  <!ENTITY XMLSuggestion SYSTEM "..\Include\XML\Suggestion.xml">
  <!ENTITY ScriptSuggestion SYSTEM "..\Include\Javascript\Suggestion.txt">

  <!ENTITY CheckTaxCodeBeginTag "select @$typeConflict = rtrim(val) from options where name = 'm_kt_mst_trung' and val &lt;&gt; '0'
if @ma_so_thue &lt;&gt; '' and @$typeConflict is not null and exists(select 1 from @@table where ma_so_thue = @ma_so_thue">

  <!ENTITY CheckTaxCodeEndTag ") begin
  if @$typeConflict = '2' begin
    select 'ma_so_thue' as field, replace(@$taxCodeConflict, '&#37;s', replace(replace(replace(rtrim(@ma_so_thue), '&amp;', '&amp;' + 'amp;'), '&lt;', '&amp;' + 'lt;'), '&gt;', '&amp;' + 'gt;')) as message
    return
  end else select @$scriptConflict = @$scriptConflict + replace(@$taxCodeConflict, '&#37;s', replace(replace(replace(rtrim(@ma_so_thue), '&amp;', '&amp;' + 'amp;'), '&lt;', '&amp;' + 'lt;'), '&gt;', '&amp;' + 'gt;'))
end">

  <!ENTITY % EIOptions SYSTEM "..\Include\EIOptions.ent">
  %EIOptions;

  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Customer;
  %Control.Unit.Ignore;
  <!ENTITY c "CustomerUnitDetail">
  <!ENTITY h1 "566">
  <!ENTITY h2 "214">
  <!ENTITY k "ma_kh">
  <!ENTITY i "8">
  <!ENTITY Tag "dmkh">

  <!ENTITY % Nested SYSTEM "..\Include\Nested.ent">
  %Nested;

  <!ENTITY CheckTaxCodeCondition "@ma_so_thue &lt;&gt; ''">
  <!ENTITY CheckTaxCodeConditionExt "select @tax_check_yn = @khong_kt_mst">
  <!ENTITY CheckTaxCodeConditionByVAT "">
  <!ENTITY CheckTaxCodeFieldValue "@ma_so_thue">
  <!ENTITY CheckTaxCodeTableValue "default">
  <!ENTITY CheckTaxCodeTableQuerySelectWarning "select @$scriptConflict = @$scriptConflict + case when @$scriptConflict &lt;&gt; '' then space(1) else '' end + @$taxCodeInvalidConflict">
  <!ENTITY % CheckTaxCode SYSTEM "..\Include\CheckTaxCode.ent">
  %CheckTaxCode;

  <!ENTITY % APICompanyInformation SYSTEM "..\Include\APICompanyInformation.ent">
  %APICompanyInformation;

  <!ENTITY % CheckValidEmail SYSTEM "..\Include\CheckValidEmail.ent">
  %CheckValidEmail;
  <!ENTITY CheckValidEmail.FieldName "e_mail">
  <!ENTITY CheckValidEmail.MultiEmail "true">
]>

<dir table="dmkh" code="ma_kh" order="ma_kh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin khách hàng" e="Customer"></title>
  <fields>
    <field name="ma_kh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" clientDefault="&ClientDefault;" allowNulls="false">
      <header v="Mã khách" e="Customer ID"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_kh" allowNulls="false">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="ten_kh2" categoryIndex="9">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="dia_chi">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="ma_so_thue" dataFormatString="@upperCaseFormat">
      <header v="Mã số thuế" e="Tax Code"></header>
      <footer v="Mã số &lt;u&gt;t&lt;/u&gt;huế" e="&lt;u&gt;T&lt;/u&gt;ax Code"></footer>
      <clientScript>&APICompanyInformationClientScript;</clientScript>
      <items style="Mask"/>
    </field>

    <field name="ma_nvbh" categoryIndex="2">
      <header v="Nv bán hàng" e="Sales Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1=1" information="ma_nvbh$dmnvbh.ten_nvbh%l"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="doi_tac" categoryIndex="1">
      <header v="Đối tác" e="Partner"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="tk" clientDefault="Default" categoryIndex="1">
      <header v="Tài khoản ngầm định" e="Default Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="tk_dc" clientDefault="Default" categoryIndex="1">
      <header v="Tài khoản nhập mua" e="Purchase Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dc%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_dc%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_tt" clientDefault="Default" categoryIndex="2">
      <header v="Mã thanh toán" e="Default Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="t_tien_cn" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="2">
      <header v="Giới hạn tiền nợ" e="Credit Limit"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_gh" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="2">
      <header v="Đến ngày" e="To Date"></header>
    </field>
    <field name="kh_yn" type="Boolean" clientDefault="Default" defaultValue="true" categoryIndex="1">
      <header v="Khách hàng" e="Customer"></header>
    </field>
    <field name="cc_yn" type="Boolean" clientDefault="Default" defaultValue="true" categoryIndex="1">
      <header v="Nhà cung cấp" e="Supplier"></header>
    </field>
    <field name="nv_yn" type="Boolean" align="" clientDefault="Default" defaultValue="true" categoryIndex="1">
      <header v="Nhân viên" e="Employee"></header>
    </field>
    <field name="nh_kh1" clientDefault="Default" categoryIndex="1">
      <header v="Nhóm khách hàng 1" e="Customer Group 1"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1" information="ma_nh$dmnhkh.ten_nh%l"/>
      <footer v="Nhóm 1, 2, 3" e="Group 1, 2, 3"></footer>
    </field>
    <field name="ten_nh_kh1%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh2" clientDefault="Default" categoryIndex="1">
      <header v="Nhóm khách hàng 2" e="Customer Group 2"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2" information="ma_nh$dmnhkh.ten_nh%l"/>
    </field>
    <field name="ten_nh_kh2%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh3" clientDefault="Default" categoryIndex="1">
      <header v="Nhóm khách hàng 3" e="Customer Group 3"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3" information="ma_nh$dmnhkh.ten_nh%l"/>
    </field>
    <field name="ten_nh_kh3%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh9" clientDefault="Default" categoryIndex="2">
      <header v="Nhóm khách tính giá" e="Customer Price Class"></header>
      <items style="AutoComplete" controller="CustomerPriceClass" reference="ten_nh_kh9%l" key="status = '1'" check="1 = 1" information="ma_nh$dmnhkh2.ten_nh%l"/>
    </field>
    <field name="ten_nh_kh9%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="dien_thoai" categoryIndex="1">
      <header v="Điện thoại" e="Phone Number"></header>
    </field>
    <field name="fax" categoryIndex="1">
      <header v="Số gửi bản sao &lt;span class=&quot;LabelDescription&quot;&gt;(Fax)&lt;/span&gt;" e="Fax Number"></header>
    </field>
    <field name="e_mail" categoryIndex="1">
      <header v="Thư &lt;span class=&quot;LabelDescription&quot;&gt;(Email)&lt;/span&gt;" e="Email"></header>
      <footer v="Thư &lt;span class=&quot;LabelDescription&quot;&gt;(Email)&lt;/span&gt;, trang chủ" e="Email and Home Page"></footer>
    </field>
    <field name="home_page" categoryIndex="1">
      <header v="Trang chủ" e="Home Page"></header>
    </field>
    <field name="tk_nh" dataFormatString="@upperCaseFormat" categoryIndex="2">
      <header v="Tài khoản ngân hàng" e="Bank Account"></header>
      <items style="Mask"/>
    </field>
    <field name="ngan_hang" categoryIndex="2">
      <header v="Tên ngân hàng" e="Bank Name"></header>
    </field>
    <field name="tinh_thanh" categoryIndex="2">
      <header v="Tỉnh thành" e="Province/City"></header>
    </field>
    <field name="ghi_chu" rows="2" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="khong_kt_mst" type="Boolean" inactivate="true" categoryIndex="9">
      <header v="Không kiểm tra mã số thuế" e="Not Check Tax Code"></header>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

    &UnitFields;
  </fields>

  <views>
    <view id="Dir" height="274" anchor="&j;">
      <item value="120, 30, 45, 25, 65, 45, 30, 25, 65, 75, 25, 0"/>
      <item value="1100: [ma_kh].Label, [ma_kh]"/>
      <item value="11000000000: [ten_kh].Label, [ten_kh]"/>
      <item value="11000000000: [ten_kh2].Label, [ten_kh2]"/>
      <item value="11000000000: [dia_chi].Label, [dia_chi]"/>
      <item value="1100: [ma_so_thue].Footer, [ma_so_thue]"/>

      <item value="10100--------: [doi_tac].Label, [doi_tac]"/>
      <item value="1010010000000: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1010010000000: [tk_dc].Label, [tk_dc], [ten_tk_dc%l]"/>
      <item value="1000000000000: [doi_tac].Description"/>
      <item value="1111001100000: [kh_yn], [kh_yn].Label, [cc_yn], [cc_yn].Label, [nv_yn], [nv_yn].Label"/>
      <item value="1000000000000: [doi_tac].Description"/>
      <item value="1010010000000: [nh_kh1].Label, [nh_kh1], [ten_nh_kh1%l]"/>
      <item value="1010010000000: [nh_kh2].Label, [nh_kh2], [ten_nh_kh2%l]"/>
      <item value="1010010000000: [nh_kh3].Label, [nh_kh3], [ten_nh_kh3%l]"/>
      <item value="1000000000000: [doi_tac].Description"/>
      <item value="10100-1000100: [dien_thoai].Label, [dien_thoai], [fax].Label, [fax]"/>
      <item value="1010000010000: [e_mail].Description, [e_mail], [home_page]"/>

      <item value="11001000000: [ma_tt].Label, [ma_tt], [ten_tt%l]"/>

      <item value="11001000000: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="11001000000: [nh_kh9].Label, [nh_kh9], [ten_nh_kh9%l]"/>
      <item value="1100-------: [t_tien_cn].Label, [t_tien_cn]"/>
      <item value="1100-------: [ngay_gh].Label, [ngay_gh]"/>
      <item value="1100-------: [tk_nh].Label, [tk_nh]"/>
      <item value="11000000000: [ngan_hang].Label, [ngan_hang]"/>
      <item value="11000000000: [tinh_thanh].Label, [tinh_thanh]"/>

      &UnitViews;

      <item value="-1100000000: [khong_kt_mst], [khong_kt_mst].Label"/>
      <item value="11000000000: [ghi_chu].Label, [ghi_chu]"/>
      <item value="11100000000: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="30, 90, 30, 45, 25, 30, 30, 40, 40, 25, 65, 75, 25, 0">
          <header v="Thông tin chính" e="General"/>
        </category>
        <category index="2" columns="120, 30, 45, 25, 65, 45, 30, 25, 65, 75, 25, 0" anchor="&j;">
          <header v="Thanh toán" e="Payment"/>
        </category>

        &UnitCategory;

        <category index="9" columns="120, 30, 45, 25, 65, 45, 30, 25, 65, 75, 25, 0" anchor="&j;">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>

    <view id="Form">
      <item value="120, 30, 45, 25, 65, 45, 30, 25, 65, 75, 25, 0, 0"/>
      <item value="1100---------: [ma_kh].Label, [ma_kh]"/>
      <item value="11000000000--: [ten_kh].Label, [ten_kh]"/>
      <item value="11000000000--: [ten_kh2].Label, [ten_kh2]"/>
      <item value="11000000000--: [dia_chi].Label, [dia_chi]"/>
      <item value="1100---------: [ma_so_thue].Footer, [ma_so_thue]"/>
      <item value="1100--100101-: [doi_tac].Label, [doi_tac], [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="1100--1001011: [tk].Label, [tk], [ma_tt].Label, [ma_tt], [ten_tk%l], [ten_tt%l]"/>
      <item value="11001--------: [tk_dc].Label, [tk_dc], [ten_tk_dc%l]"/>
      <item value="1100--10010--: [t_tien_cn].Label, [t_tien_cn],[ngay_gh].Label, [ngay_gh]"/>
      <item value="1000000000000: [ghi_chu].Description"/>
      <item value="-101-101-111-: [kh_yn].Label, [kh_yn], [cc_yn].Label, [cc_yn], [nv_yn].Label, [nv_yn], [ten_nh_kh2%l]"/>
      <item value="1100-100-1011: [nh_kh1].Description, [nh_kh1], [nh_kh2], [nh_kh3], [ten_nh_kh3%l], [ten_nh_kh1%l]"/>
      <item value="11001000000--: [nh_kh9].Label, [nh_kh9], [ten_nh_kh9%l]"/>
      <item value="1100--10010--: [dien_thoai].Label, [dien_thoai], [fax].Label, [fax]"/>
      <item value="11000010000--: [e_mail].Description, [e_mail], [home_page]"/>
      <item value="11001010000--: [tk_nh].Label, [tk_nh], [ngan_hang].Label, [ngan_hang]"/>
      <item value="----1010000--: [tinh_thanh].Label, [tinh_thanh]"/>
      <item value="-1100000000: [khong_kt_mst], [khong_kt_mst].Label"/>
      <item value="11000000000--: [ghi_chu].Label, [ghi_chu]"/>
      <item value="11100000000--: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8UdDCl+MNonjHpmo49GxHA5RkgEMEGPXMhF1hkRuyPsDaQkN2/qG3gzbmn+ySvZjsMl9h0Dlc434sG+4gFLzkjJhDz+7BnKRKyw8t+/a5FMBBPSxHsm10BysGdKF4mYThSOi4le7AvmPgsh1kfKraGT7ffuxsy9jsQTihcifVdoACMmI6pl8/ieYRDecdf784t4ghnMB0IG9/vHIhxYVij</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &APICompanyInformationCommandLoadingDeclare;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1eCqsvH9DfrR1RwvHcYQGD6HJmWijMfMWYOjZBr7VrqRw==</Encrypted>]]>&APICompanyInformationCommandLoadingSelect;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ1z/ThtRrQvtD50PZb3Ml73IJbgoKvHjAm8DFcU0JDe+</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBYezWCrEMH1fHatEHfnpcdxZ+LLOEzlyLgePEVa6nU5mBmayX40Fvk6nrMnFhicuKNv0RXhfsIuKpgH+4s1hL8=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        &CheckTaxCodeDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2IFUTeYgCI+m73yMqsqvhVfK/NCPDhMSW1bAIXdU+QckZVgeFDw1lvwzbW4aQLPjJ1w1SA0zON4H7UbFhithH4T/hOfsAP2E/gGN4bRWkn8xmX08O/J/XTeUV4YnOC7jIUU+rT9uopmpMCmTzbZnJT3aPnqL+kplpxkcROMwW1d5rVh2oh5YlkQpuO2ezIprXZligpLZSeidA4HMwWWfV73iNxECIPVmk5Yuk5NVAh0g==</Encrypted>]]>&Customer.Nested.Message.v;<![CDATA[<Encrypted>&q0x/DRPtnEN53dA6mwugdtYH2td0w1rcUcjHmzPi+HukWw5M/YpcYHf9rta929Jc/dn4eykszq4Mr/y4qbanZ73EPyftvDW+1aqrjUQ0XLyPCgUEr7kcq9D/bTTlGM4f</Encrypted>]]>&Customer.Nested.Message.e;<![CDATA[<Encrypted>&Gf3AUkJFg+tajSC6Sx7Gz6nmWt1Ha4WW/5tuOA5WB8AA/T8l3rbtgCtunFekX+1f8hmBA8rQLd0Zf+s22+/+2RP/zy//FTIJD0Z/RfJWnnpTn+f2Pp3WTgWxvhbV40EHSovPYUzaMugeuYbilmXhoUuEnTgE7BaFy5kMf77v4Ep/rLNt58+ow8P3CTPpViEt+eyntY8Q7xDJ1VrBmy5euCq/wTse4sAN/cCiYDL/HF54oG9YwQYq5YxHghDC+D7KEH84enDO0vSRn4sDwvqgtMNRIQEy0vlvERFqREJf0hTZiMBwDkoEF78hVgF9+0RZax80PDCoBtD4LLDzMcOMJfWJLl8Apxz+sU1wjOlQYeXXYTsi4cMp7bBlJkHsh99lps9lzUHT1bqvH+wHwGlQnPixrYshrITpwsbTRuWQd+Bw+B0zGu94/47fLvex2cYMONU6c5zLqzftKehC+bQqWVdvCNG7MxetWiZInAi8ZEeNXenZEq98v++S2XXrPCdT1lK6Msb0BTgqSZ/TemKWktY9Cq6unMIlhLmIHTbH3Ja49usJ2s6bJZzjuBAQWCo0n7xsHTQbruwgEEDgOfWWUk6lP5BsJZx00KoVFjgZV8lI8MnAhLDSJrix2ZM/Qv72aVvXR+fnaEOmYeu36zS9UL/Xx1x6JtMCQh1wQUBgOvvH0iErSoMbRJbITZxiKEwtMjzTJ85/5PuRzyskme8WejTrEOL0es5iUywX2yN/rI0=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwU7vMRJi5phIo/q55KJkMZKQ==</Encrypted>]]>&Customer.Nested.Key.a;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZMHckGCQw6x8e76tZNpJUNTHn4DbxmZnFzzdP7W9rbqLHoVOiakldEefxNrv5lDHyLj09/+XqnJ5sUsvikB4J4ibfgdZ2Ttd4/U60v/NbPf/MJSLngc+/5OFHDzkzmR4w==</Encrypted>]]>&CheckTaxCodeBeginTag;&CheckTaxCodeEndTag;&CommandCheckTaxCodeBeforeSave;&UnitBeforeInsert;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGYB74MK6vr2F1KE/dz/+QvzDcL2uJJO9Ogl6CL18nBwMxIzCp6ONAm5MXgT9hAm5TDp9gKkHvve57mgmSqrHVI=</Encrypted>]]>
      </text>
    </command>

    <command event ="Inserted">
      <text>
        &UnitPostInsert;
        &CommandListCheckTaxCodeWarning;
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLE5FEPGeFj/LjROM4Qjel6g/PPbIbTdb0CLvHscjvjIkik6Y1swqovAjYXfrXMezdUEbLkgbfusV0f+M1WArB78f++VcaXK4QnVZJlzchEBrZ5dIeN04z0gfOrgf5vmMIeG9EJuypEB9mLkY/l8g93UuPuvxMrpubsg3vGEdb9CjqeFCPYmNZlBw5+wyH+Qm8</Encrypted>]]>&Customer.Nested.Key.a;<![CDATA[<Encrypted>&O0YyoFEd0hYz2N2q7aidVI+7+SeubxazDULdwhCcgpqBqtnKubid5t+bKB2sgDXhlc5L6ruae4YddeXE3mhXpFicLUuqMFEXjRVO4y3bkafpDaIIJUIAa53qm+GOnD7Hy/sIWXai55qhLdb0AZcHxGQa5taM/gW6DrCkYP2wGxZsuiYX0RI0wmuOv0nvg9khJ/6/od0AEunw+gSrBH/k9cfbREFD3e7CqEJCCJkO5unM1V5cR+7dG7Nt8KOVWdZQSzCaTahM9TvsfoJMV7+n82tbdStvNQgG/xjfh5pPKbs=</Encrypted>]]>&CheckTaxCodeBeginTag;<![CDATA[<Encrypted>&O0YyoFEd0hYz2N2q7aidVI+7+SeubxazDULdwhCcgprSHqnaeuxvROXowNmqdhsHkkRTEVd33iQK8NvgVMMEPg==</Encrypted>]]>&CheckTaxCodeEndTag;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &CommandCheckTaxCodeBeforeSave;
        &EICustomerCheckUpdateConflict;
        &UnitBeforeUpdate;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV/tPvYJLkIBTKpxWkk5I0x8NEaoNs6EJ/bktTJRM0ovV</Encrypted>]]>
        &UnitPostUpdate;
        &CommandListCheckTaxCodeWarning;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvmlX/1G4VEF8z4pOWdpqPPKEZpLXua7Laz/vu9gWWLySVgtgIPPBM/N87GKpq/tLvdOp6wFkqIPsUnaYzKz+XOyJJwJ83fuLo2n/r+m4If+KZkQfSp6F5knUlCCHGKUfNwNy1XjMtEZJuR53c2+1tPBwfVEIJXPoDiVpcDVumMsCcgpEau96C0m0WA45iJefd0=</Encrypted>]]>&EICustomerWhenDeleting;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RqnHGtsXbkcv9vo6cS4p2shVg6JVjkjLmkdLAlHgNd5XeEoD1aaN9XkwwN3lPP95Ul1GuWba6jrPuhGJ6u2lOglpai7fSpmgb7PCu+gb1wFk1J0fNQY1cbd+dJ38rS9ww==</Encrypted>]]>
        &UnitPostDelete;
      </text>
    </command>

    <command event="Checking">
      <text>
        &CheckValidEmailCommandChecking;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIuyvuLHCrttnCRQaBGvUSZqAe574uk6Og1CQVsOdJgi8U/bV1Y2Iax+I7Csl/NlBMzekxaL9e/KbuLpW/sj/+k9CIhoiUEtLmJmzIcGAffGDQf0z3fc3NjywbM6JvNIAU0MSp7/xDkRctLfr/pbxdktxkjbot/v6xRN1BNFEdaVRAZYNfT/T9joBPUmQXPn25/DNCF303Ow+M7QkMfaI96/d56eEFoFLoSveRa74qM52T4EtpjtxNMQhtOEzGkLWGyzwhUC6WjL2odVUajsUJptEUitlGgj7OSmpJy8c+jhEAEKDITzfXnyHkrv6nCb8Jx/TZsy/uwaKuNtSjmSo/tNjZ7QMXe9neZeCRhHSogiYazKRtYD33QIF3D3Uqvi/81RlQKyQvnnAN3noHyfajTtvMtjx5MIln8phczvvCTuuIimCV/qtaHj3nvCkEPzfQ==</Encrypted>]]>
        &UnitCheck;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VbYGAhwaJV2zV4US7c/nl2wbwINgnqImu7G8BIHjtMDn5Us6ud/qZIySEH2H+Z0iWYgm0m7e4V7/hZ75ymt2Xauvp85FgTCh6uG4kB6QvUo/T2X3QvQUxtbTv36ImSAJqWRm3s5vCbB117T7R4gpQAek0O8fmG4OBW956vLEv5PrHJa5DnF8CkkZ4gyBrT6IP/E00KFAmcLq8iCaMoTivQ=</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyRBwv0kXXDpGcZoWjtETxGHRMlQV4m5ERZHJFiAyh7LFABm6uxe7evs10N3JRAYyVfemzWeZE9ywYu+nJkft1HKA++awbDakep4PZDlpz1dXhilXP148KJ+5STqw38tb/sq0n9zJns67ELIZ9MAOIv+RwIjT+hINnBJ/RyxThZWe8CtdwHyms/BHFZ3W+oSZ5j4KXu19mIYbRMLlh3zgvXN0tC28/J+X2j97FQh16/YkHt6bvZn+eKTeZ9AgIXhPww==</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFySG6TtBGaksaEw8ylGxrgDQujQMhqWDeagUSVefJ8DxLKEEbwiOxlyPkVWpO5m0kF8w/S3QH83ONLJHpx9v/YPH312mLLo+Vr8Xifp+ikKRiIylPb5SfhGUJOKS1infS5gf/b4vINigqYYoB6oTfoqbq/syDY+0ikt+fz01F/fdKdTNCcg7Y/stAuew/Se5PTwdDsYomhziBTyPKl0rSu/TcvQ7cDD7S4H6sj3NdeDRogbirwlooMRJATRfPbkVDRXDKWSeCdxu89IJC7rx4bjs=</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&EfM02y/fKZgN8uN7SwYdIe2Efsi/Qr4wP56Ax8j3O02d2h2nqc0xYwQcNCUwuqu0MUusATJ65H1RKLCerBgAx2oBQsHyWYrGn1BTBBN4xIiKoGFXa1WU39pxM03LLO/j</Encrypted>]]>&UnitTab;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/78+8ufMIlmTYFARQJ+bbe+9ic7qMsT80o2uZpJguk2JVp</Encrypted>]]>
      &APICompanyInformationFunction;
      &ScriptCheckTaxCode;
      &ScriptSuggestion;
      &CheckValidEmailFunction;
    </text>
  </script>

  <response>
    &XMLSuggestion;
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1jG6VWeGAcv3M25z+vBq/YUELg3A+LaU/g+75YddH2MioYzVSZN7XIVuLwZdRmGe43KKROWWuTQdEAkAhQTXjONP71kKI9Pdmf/NmL5suGS0Rod7Nj1cdsAki5F7RbXOskQ3hJlHTERTjAiK3UXElAkfOhwoBZKQU16Y3qXo5wMsVvHUCG27l/o2QwiNpFtWASOEkRMAM98cdHNRzJ5CB4=</Encrypted>]]>
    </text>
  </css>
</dir>