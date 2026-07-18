<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY r "'HD1', 'HDA', 'PXC', 'PXD', 'HD2'">
  <!ENTITY j "'HD2', 'HD4', 'HD5', 'HD6'">
  <!ENTITY f "(('{$&#37;c[xu_ly]}' = '1' and ma_ct in (&r;)) or ('{$&#37;c[xu_ly]}' = '2' and ma_ct in (&j;)) or ('{$&#37;c[xu_ly]}' in ('3', '9') and ma_ct in (&r;, &j;, 'HD7')))">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="xu_ly" dataFormatString="1, 2, 3, 9" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Phát hành, 2 - Điều chỉnh, 3 - Thay thế, 9 - Hủy" e="1 - Release, 2 - Adjustment, 3 - Replacement, 9 - Cancelled"></footer>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Fmt/jHN7YIEePS9MGc9iUneNpzrhzg+Gr9kf3SmIGoWsMeDUuTT0DJI+/GyQYRGNQ==</Encrypted>]]></clientScript>
      <items style="Mask"/>
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
    <field name="ma_ct" allowNulls="false" aliasName="defaultEIVoucher">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="&f; and status = '1'" check="&f;"/>
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
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
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
      <items style="AutoComplete" controller="EIVoucherBook" reference="ten_nk%l" key="loai_sd = '1' and (ma_dvcs = '{$%c[ma_dvcs]}' or ma_dvcs = '') and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') &gt; 0) and status = '1'" check="loai_sd = '1' and (ma_dvcs = '{$%c[ma_dvcs]}' or ma_dvcs = '') and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') &gt; 0)"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+mVdKuhWVt8i3/5T5rw2U470ywtaOWGidsCFixvMjcu3IOGoGSQG/SE2Bgz5IojgXxDSl5+oZofVSg7A7AXzFtMw7eyHNFiKfTSLZw49p/4EoHSn3whWYW1/MmWUisWv/Gnk8wS/7G8yPMpzNUrSKZ6v57M2li29KjTKoD24P30enfbHLGHqNzyy5N+i314VZfsoYIAkyzR6R0wAe0RyZK2OhFloihTSZaohfUtlZuGiPSY9iZcj1Zco4ZfS4xHTjmVhX8iLmKpGV+n1s5ZHq9lK2yknnwmAz8GSG9CUDPNeZd62sxYrYce6EPxDrIpz+eqdjXOBrduKbIsjQoCsrkWrM0quezJVe7V1/mDSIQswO0f8hVJbGREYHrQYJRv4zNnPL+JmmAshoa2J0nZlv+SccXe7dOy08f2WK0akMP09gzgzGFpxmew8gy4/BqI9k5Ax+4UclpSmXgzS6TY/eHMxhdFO0k/aR7I6FiDt4q/2gcVouTzBYfvkhnmlwYhnlyVR8RlhoigGVksJUWLuOGHQDJqBGVxXGqqkgHiEe5Y2Cj3tzAEaqzhmt9A6v2dA8QO5Nhs/cf4R0glmwook48=</Encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T+uwBExd0gPb+HUFpvD1rTqHT9c/vC6xgCRzdjT87nx6N4vBkaKQdJNiywpf275o2t0LeETKLmIhic6IxpL1dXLCp+yqqrx5Yp6LucYV6W+aZLbRDWTnJOZfy3uxargbQ/nXjUi9dE8KK4G7BuU0/Nrs8SB6lxGDwg6QK1aIQIJ</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu25GseD0HKa5RQcj9/ravzxFd/ZI1L8oj6JXhn7yBpWT78WXsVSCw9AxLx+PB+ptPQtIf8sYPnugpq2IO2u1Y4bJ9KkKp7B3dDL5NMisGqQieqcQzLyWu3SiEIAR9eqkrSuZPZCkFCUV+5opSvVazJDZUS/cihZ1VZEYvJtq2vopsHCnjPHrVplv/wtzYwARtA==</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>