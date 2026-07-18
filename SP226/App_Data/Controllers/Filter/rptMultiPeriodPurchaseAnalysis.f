<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptMultiPeriodPurchaseAnalysis">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">

  <!ENTITY Identity "&Controller;">
  <!ENTITY FilterExpression "f._filter$Expression = '&quot;' + f._filter$Pattern + '&quot;.indexOf([ma_ct]) &gt;= 0;';f.setItemValue('ds_ma_ct', f._filter$Pattern);">
  <!ENTITY XMLGetParameter SYSTEM "..\Include\XML\GetTransactionParameter.xml">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">

  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="kieu_bc" dataFormatString="1, 2, 3, 4, 5, 6" clientDefault="2" align="right">
      <header v="Kiểu báo cáo" e="Report Type"></header>
      <footer v="1 - Ngày, 2 - Tuần, 3 - Tháng, 4 - Quý, 5 - Nửa năm, 6 - Năm" e="1 - Day, 2 - Week, 3 - Month, 4 - Quarter, 5 - Half a Year, 6 - Year"></footer>
      <items style="Mask"/>
    </field>
    <field name="ky_bc" allowNulls="false" type="Decimal" dataFormatString="##0" clientDefault="4">
      <header v="Số kỳ báo cáo" e="No. of Periods"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99OWlG+9xr3VcUrViR1OAj5lsLkdYqbUpXqdyiH6U8l4fI2CfySUCoyLTK4URtjQdyA==</Encrypted>]]></clientScript>
    </field>
    <field name="sKy_bc" allowNulls="false" external="true" hidden="true" readOnly="true" clientDefault="4">
      <header v="" e=""></header>
    </field>
    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày bắt đầu" e="Begin Date"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ từ số" e="Voucher No. from"></header>
      <footer v="Chứng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ma_ncc" categoryIndex="1">
      <header v="Nhà cung cấp" e="Supplier"/>
      <items style="AutoComplete" controller="Customer" reference="ten_ncc%l" key="status = '1' and (cc_yn = 1 or nv_yn = 1)" check="(cc_yn = 1 or nv_yn = 1)"/>
    </field>
    <field name="ten_ncc%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mặt hàng" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="tk_vt" categoryIndex="1">
      <header v="Tài khoản vật tư" e="Item Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="nh_vt1" categoryIndex="1">
      <header v="Nhóm hàng hóa - vt" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_vt2" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_vt3" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="20" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu in chỉ có số lượng" e="Quantity Form"/>
        </item>
        <item value="20">
          <text v="Mẫu in số lượng và giá trị" e="Quantity and Values Form"/>
        </item>
        <item value="30">
          <text v="Mẫu in số lượng và giá trị ngoại tệ" e="Quantity and FC Values Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    &ReportDataTypeField;

    <field name="ma_gd" clientDefault="" categoryIndex="2">
      <header	v="Ds mã giao dịch" e="Transaction Code List"/>
    </field>
    <field name="ds_ma_ct" hidden="true" readOnly="true" categoryIndex="2">
      <header v="" e=""/>
    </field>

    <field name="ma_nx" categoryIndex="3">
      <header v="Mã nhập xuất" e="Reason"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l"/>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" categoryIndex="3">
      <header v="Mã vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" categoryIndex="3">
      <header v="Mã bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" categoryIndex="3">
      <header v="Mã hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="210">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="111000: [kieu_bc].Label, [kieu_bc], [kieu_bc].Description"/>
      <item value="111: [ky_bc].Label, [ky_bc], [sKy_bc]"/>
      <item value="110: [ngay_bd].Label, [ngay_bd]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>

      <item value="11100: [ma_ncc].Label, [ma_ncc], [ten_ncc%l]"/>
      <item value="11100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="11100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="1111: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="1100: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100: [mau_bc].Label, [mau_bc]"/>
      <item value="1100: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11001: [ma_gd].Label, [ma_gd], [ds_ma_ct]"/>

      <item value="11100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="11100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="11100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

      <categories>
        <category index="1" columns="120, 100, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 100, 100, 100, 130">
          <header v="Lựa chọn" e="Option"/>
        </category>
        <category index="3" columns="120, 100, 100, 100, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>&GetReportFormLimitRight;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM0GUti1kCp50u/Joaj4mLrRFBFrkg61EVyh0XGpA19zx05m0tH1OgdPSKya+jhQB92mZjn9Ot4aMXMuRM9wUx/xclTHT0ytQP5YzsDNDeJ2</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;
    &XMLGetParameter;
    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcP7h2GfJqnNKET6itpAfLTdNxqpmrkHCGwTVMY4fj8gEsyRYVF0hqov+hgKGlW7Ja1VJV5SsxDbR6eEyVmOrwhROXC+LgvcchW5q/TI09XoM10z+wMDymJT2hNZmBiMZ7K0ImKjRtyaryppMKJ+7mrj2dMBK0Txc6QW1PazUYdvQOinSDfpqmfbbXA7OViLa+KqqkodTa0Aipym4nvJocqLmd4CGlNNeaSnrSzC9vbkaVqLc1+kXzX0DqQAaMVH91tBcil5RCJJb2em85c1zQrQEgxE1E2Lszfj7Mi/JcjILzFFzoNf+98jqMdUACnx5KKUzwjkqN114cbC/urwwTunXAdM9UXYv7OdVZVlYekLDaBS/Vo6dS642HlQ0pP4lF5Si8hh3UblHddCYxgylmXSaSYqR9KpII3EGMd75xQmdYuV7Xcudp+rLFMoyRjouMUKjS5T7QS/mVRppxm4Q2efj8At/TfV5aZBxLVSZfOebOAnrf5wCGuSdA3atzWIThA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kaM07Xa6/jgsfBLWGL2sfcnf/qpxGsTLB620BgwplLOpA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6UBkjyLCJvaQKhV1r6qPPTglkHqnaRjYR8qCTAKvDrzeS2HA8/ZNt2AxtdMgmLBHBPQ0o7/VV7dnRYHScjqViXg6b+HRvUVkLcF7LqbzDLnR84f2HXFhtPyOOsI+AJyr2JymKk1gnT4v9+i4qK9wdz+AhEyqvpkGkNXHZVlktOsDEDFOxOCPmqzdaB/bR43MOgGAMqqdK1njC76CmZCRQfQ==</Encrypted>]]>&FilterExpression;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4YlK6jtJzRszEb/gQqCZcwD8ptVDOo+yDTxfQIDDKSf8PvY9KKcva643xG6lrVrWSectYwYbQ+GfsNiDUSdfC98X06cUvBKOh/Xigq2DDGnBClAqec6jNsej8vizJDO0vZ9wjxAA1rf+mTe1jthWHBH5raTk5v49CjrBzAsKCYGzyE8JJoYi1kTHOb8eFWc+xVGvq2RsjzRT5DGsRZvCFzBHN0QM+bur9tJs8i7Sqxp334VTwY7v+LPv1wH+ITBvgEDBKvT9gAwOX7snFIYel3avzdizcyt5LVkEWk6w/nCSTJjSe8BiWW4wq9QCdrJ0/JZxGmsnc26GrJXQf6/yLJmZ+1J7zPyj5n2F4nBW8z9gKT6PtqyLiy47/uX/pq8QONeMojECUp+6/UkI4j5p1+ByLBcwQbq7ZADvkI+ErPjGX5mNU0hh9myxoyJV6Pivrh055anNk99dfY0j7Nb8SqkZBvsDllCwHx2BII229Odh6/SC0nPJIlQawWYQrIlYVWaQxREJeuuecxmp7ZLzNF5g9lxpzHiL93Nciq2Ftvv/mMsyjR/THD8bSkyksUhXlrngsItvdLRA/lhz98JK0W1ne755AiJsyeRNdXe0IyqTKrCMXC7F4MYRIsPA3AFbz9vJ1rAZAvUdAsuNMsexYGY9R2yDi8keeQpeaBrfIwrUi6Isj0Z0rLjEdqL1MhVfAH+6KryAxqIhFYE76TxH8VwPz+0Jydu09hpwBN/+GAMOXxRXlpVI3pHoGxF5n7OHf9IA625NlCj1xJJVhaQGgsR7jSP4dlSJIlStinZcVNjRe1tTLbYx+rLSFU4KKTcx+o3qraMP/KkzjOKxpw7BPfxaVLiJBimpzVfNK89NNYJ99OlT40BEkeW1l71JfmFn2FJD8Nl88Y0ZEi4IOnlMx2YxwLbQsflDtooL/h4/7W4F/myIJnWpfZ17RJmd+EzHnZQSxbi7Gr3QmeoOaEjXyXWORj3qR2aTB8H2rNs2J1jnBSRbzecD5jbKmw2sS3M4ZjzWjl9F31OXif/v+pGhbyEe1I2Yxr+XYS0iQzC8x/lJ7KQuTZH795sCZAWUnv2NC+A7mT0hBicYNoJioL9jKGiGhm5Yymt1oHNPAPau8HY2/ixbgbiTRxjWeARYBoRjZQ==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>