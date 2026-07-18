<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY f "ma_ct in ('PXA', 'PXB')">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="xu_ly" dataFormatString="1, 9" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Phát hành, 9 - Hủy" e="1 - Release, 9 - Cancelled"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnsekwx4AluOjJHT0LNloYza9dg2fwLK+EWXeZqF6l5Zuw==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Chứng từ từ ngày" e="Date From"></header>
      <footer v="Ngày chứng từ từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Chứng từ đến ngày" e="Date to"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Số chứng từ từ/đến" e="Voucher No. from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_ct" allowNulls="false" aliasName="defaultEIInventory">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="&f; and status = '1'" check="&f;"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnsBqnbxs12Rsk5LQnxxRxa75BozFE7hfWr53vS3h2WYBQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Mã khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Kho xuất" e="Source Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho_xuat%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kho_xuat%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_khon">
      <header v="Kho nhập" e="Destination Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_khon%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_khon%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99HstUmzEAR0h+t9VqIl7oVuJdWObVZpjWXql/BHSikagQvKCdUJTPS+JouToBVUK7A==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_nk" onDemand="true" external="true" filterSource="Optional">
      <header v="Mã quyển" e="Voucher Book"></header>
      <items style="AutoComplete" controller="EIVoucherBook" reference="ten_nk%l" key="loai_sd = '2' and (ma_dvcs = '{$%c[ma_dvcs]}' or ma_dvcs = '') and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') &gt; 0) and status = '1'" check="loai_sd = '2' and (ma_dvcs = '{$%c[ma_dvcs]}' or ma_dvcs = '') and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') &gt; 0)"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99HstUmzEAR0h+t9VqIl7oVt6bn0DcPAGkjh2IdmoNGWW9EEJFoiTvPjsb83GK+x5TY926my4FNp5DJCrI7t/GnM=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="user_id0" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="true">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="adjust_mode" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="true">
      <header v="Chế độ điều chỉnh" e="Adjustment Mode"></header>
      <footer v="1 - Sử dụng, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="debug_mode" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="true">
      <header v="Chế độ kiểm tra lỗi" e="Debug Mode"></header>
      <footer v="1 - Sử dụng, 0 - Không" e="1 - Debug, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
    <field name="mau_so" readOnly="true" external="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ky_hieu" readOnly="true" external="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="39">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="11100-: [xu_ly].Label, [xu_ly], [xu_ly].Description"/>
      <item value="1101-1: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2], [mau_so]"/>
      <item value="1101-1: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="11010-: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="11010-: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11010-: [ma_kho].Label, [ma_kho], [ten_kho_xuat%l]"/>
      <item value="11010-: [ma_khon].Label, [ma_khon], [ten_khon%l]"/>
      <item value="11010-: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11010-: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="110101: [ma_nk].Label, [ma_nk], [ten_nk%l], [ky_hieu]"/>
      <item value="11100-: [user_id0].Label, [user_id0], [user_id0].Description"/>
      <item value="11100-: [adjust_mode].Label, [adjust_mode], [adjust_mode].Description"/>
      <item value="11100-: [debug_mode].Label, [debug_mode], [debug_mode].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1snEZ3LakEidUn95J9J7awSf0X5ikG8lmtoLX6voG7ak8yYof89h9r9AlAij3I0SCE0kIuK6zkwg1++3j6AOLA1jr4Wb839lRp8J+2XLPNPO89YdGqjBYRkY2rBnbgjRuQYfAOU009fouhQXdvdF+o4IKZH6VEzlnbivcgg2iKRAxcMUSn/okz80FGOfKCmKdsP1zL6EVuWsrlR/myFy840yNGhcMleFKspCIHo16RhytJvzP3mqv7cFWV7aqbkT3cxbrk64CQFE0yIZg3tJnp+hAE3zTKJ91kWjEWpMuB6jPfN+z6yhVrMhwqzQbScl7zV8iSqcdufUtzvXrrPp4k=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+mVdKuhWVt8i3/5T5rw2U470ywtaOWGidsCFixvMjcu3IOGoGSQG/SE2Bgz5IojgXxDSl5+oZofVSg7A7AXzFtMw7eyHNFiKfTSLZw49p/4EoHSn3whWYW1/MmWUisWv/Gnk8wS/7G8yPMpzNUrSKZ6v57M2li29KjTKoD24P30enfbHLGHqNzyy5N+i314VZfsoYIAkyzR6R0wAe0RyZK2OhFloihTSZaohfUtlZuGiPSY9iZcj1Zco4ZfS4xHTjmVhX8iLmKpGV+n1s5ZHq9lK2yknnwmAz8GSG9CUDPNeZd62sxYrYce6EPxDrIpz+eqdjXOBrduKbIsjQoCsrkWrM0quezJVe7V1/mDSIQswO0f8hVJbGREYHrQYJRv4zNnPL+JmmAshoa2J0nZlv+SccXe7dOy08f2WK0akMP09gzgzGFpxmew8gy4/BqI9k5Ax+4UclpSmXgzS6TY/eHMxhdFO0k/aR7I6FiDt4q/2gcVouTzBYfvkhnmlwYhnlyVR8RlhoigGVksJUWLuOGHQDJqBGVxXGqqkgHiEe5YTjmnPRRG1nKk8NezCcG5lIqIaE1o+3wJpPPy9RsQbQu7osLUGhtrd1Oy1cp70bmDbwXQQ559SKDxiT0I9R8NQA==</Encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SzOn56MwIRhh7ThuU3hwxzaUfLwiewSU30IvRppbg69A3Wujc+8SMiYGYEYqDq2vpPsEMmS48as7LkEP+FBOlE/UxYZe1PyFw67YDSkxL8B+AE+Qp7tC74xybD8D6XZ9Ke21FR+LMLYl+Fxr29Z8hTrJCt7OESmGuXwu2Glu5r59Q51AU/6QFXUL0M9AAuevw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&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</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="EIVoucherBook">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouidBXyHwaajoD22wAA7/IoPiPRNacw2ZhvkyK0LTofPaHOntpf4SkouomO81fbBp4gMgcoIHIBBCc0h4UzZO5Ntt5tj6WGcvBMPqy8dh/lOb0K6vUIpUISsJJHykUnkXO9uf9gsMzKTYc70CVcyGC1I7</Encrypted>]]>
      </text>
    </action>

    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyI8ZCcQblE8Np3nK/w5LUGuwA4vdYDEyJ/POluhKA03h0yFUzmUF7Z9V7sW1Ztk8lSm0qwGoDxxme408QrYurVo5Z/AFvWldaR8LYK4IUb6ihN4vC+My0hgmmLXLER9a31gVZL0qwaWlOx5A4K7trs=</Encrypted>]]>
      </text>
    </action>

    <action id="GetSupplier">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu25GseD0HKa5RQcj9/ravzxFd/ZI1L8oj6JXhn7yBpWT78WXsVSCw9AxLx+PB+ptPcB0hGoBuYsHv2CiaV1O/OoJzWJYujCR60YeZs9ANjSIRsShFE7phwVePx0m5g8/dhDT85HdCSOAi75koqXUTzt5RmdlOpdJIaXQF1Fqbj8CmJF1hXHgHWZncWPB4M9lZA==</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>