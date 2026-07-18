<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY DynamicFieldFilterPara ", '#$query'">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="date" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Được tt đến ngày" e="Date to"></header>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày tính hạn tt" e="Due Date"/>
    </field>
    <field name="so_ky" type="Decimal" dataFormatString="##0" maxLength="3" align="right" allowNulls="false" clientDefault="30">
      <header v="Số ngày/kỳ" e="Days of Period"></header>
      <items style="Numeric"></items>
    </field>

    <field name="tk" categoryIndex="1">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (cc_yn = 1 or nv_yn = 1)" check="cc_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="nh_kh1" categoryIndex="1">
      <header v="Nhóm khách 1" e="Customer Group 1"/>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_kh1%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="nh_kh2" categoryIndex="1">
      <header v="Nhóm khách 2" e=" Customer Group 2"/>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_kh2%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="nh_kh3" categoryIndex="1">
      <header v="Nhóm khách 3" e="Customer Group 3"/>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_kh3%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="so_du" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="1">
      <header v="Số dư hóa đơn" e="Invoice Balance"></header>
      <footer v="1 - Tất cả, 0 - Lớn hơn 0" e="1 - All, 0 - Greater than 0"></footer>
      <items style="Mask"/>
    </field>
    <field name="in_hd" dataFormatString="0, 1" clientDefault="1" align="right" categoryIndex="1">
      <header v="Loại" e="Type"></header>
      <footer v="1 - In các hóa đơn đã tất toán, 0 - Không in" e="1 - Print Fully Paid Invoice, 0 - Not Print"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="nhom" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="1">
      <header v="Nhóm theo hợp đồng" e="Group by Contract"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="257">
      <item value="120, 25, 75, 100, 100, 130"/>
      <item value="110: [date].Label, [date]"/>
      <item value="110: [date_to].Label, [date_to]"/>
      <item value="110: [so_ky].Label, [so_ky]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [nh_kh1].Label, [nh_kh1], [ten_nh_kh1%l]"/>
      <item value="110100: [nh_kh2].Label, [nh_kh2], [ten_nh_kh2%l]"/>
      <item value="110100: [nh_kh3].Label, [nh_kh3], [ten_nh_kh3%l]"/>
      <item value="11100: [so_du].Label, [so_du], [so_du].Description"/>
      <item value="11100: [in_hd].Label, [in_hd], [in_hd].Description"/>
      <item value="11100: [nhom].Label, [nhom], [nhom].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>

      <categories>
        <category index="1" columns="120, 25, 75, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKciAlXm38KMAUC31+KxsDDUP7oNPnGNGbEex1FzpQBUaUDOy13Ee1V5hg2wZrEnDfV34YYUwvF/XkJzYwd1etdHbox0bj3FZAVaXnRfZKll/eImhOVE7D1+lk0I9i4Xja8VFkXr88YY0gkDdn0kzBWHAtUbzyLkGboe0IriMqnHRrH0URkzO1cpCBpo6ltouPJJ/WtPqmlmVE0lsn7cloE=</Encrypted>]]>&DynamicFieldFilterPara;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU6WhfIVMfTRZxpWLorukapSKW5YSrVqFsljdfPBgRiI87Rc5h2bRMSsdteZEpXplTrfCS0V7wZXI2CutVS2Ry5FxuJdjEpjwkRL4GAMsZxIrSlFHaIAHt10uJRfdNXCZeCSaXG13ILulH+AMrL4to+UeuwlzgJDrClhuXvPMEgxrw7tX5cNdJRaN4JTN64EO/x5nzOhub50LjpyTp1I53sTRsFh0i5X4xfIU+an5lCnodJeSjieY3RxOXdhj+4lDVhS8eFPR1Lm/7qcSuksRiB9zyil6rH0NG4HC6KZdBdDMvDdHeVBrwI1FznG4dDYkBczvcU2ALAmSaQ6A3WwGnLjWojt1KOgdvgdgBA2xvw+iOC5z+FNrRA3RPbECwFpn+mBwzMOtLA4hiTbQ3H2HvzHI8buUClq5SAbna4XM9XopFWAdjE8tahOI19CeleJpBDUGv8EFsMHEauFx3c6eJT5ROmFEX4S74WEDqfU87uR/N338ihgbrlj4i+hwWtW+9qqVBHf0lzsbxi0WR0xIItC3tBQRcT+i8U/1WKzaR1+PyfR+OcvTUHgbNLeF+EBOb8P2wAIhqqGwvZH2fnTPEFxVzzA727tKgoq328YfpJwjmJtgcPpXkxZ/HpGKdRRXlwwgjt/VdfwsFDzUO1wLzsjGHQ6S4KpimzH2C24akToPdH0meiVesDCgDbhmBci+j8I6+w9y1HSj+iliByOgFa4Xk786MLp1pGfS7MTAGsPtvifkrpPMRe+RpX0iQAdhQDdYnH41KnVg7ehfH3B9n51j/evqY2sK9wpmuCn8NXGloa34j78+PlPmSTGd5bYErz0QpFPCmGjwkEgVI+v6HacMdc38KOEWRXSpPTMkWfHzy0+ZXbz0QmzCkqrV7qX7n</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>