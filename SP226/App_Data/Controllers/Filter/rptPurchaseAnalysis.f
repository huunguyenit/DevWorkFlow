<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptPurchaseAnalysis">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY Identity "&Controller;">
  <!ENTITY FilterExpression "f._filter$Expression = '&quot;' + f._filter$Pattern + '&quot;.indexOf([ma_ct]) &gt;= 0;';f.setItemValue('ds_ma_ct', f._filter$Pattern);">
  <!ENTITY XMLGetParameter SYSTEM "..\Include\XML\GetTransactionParameter.xml">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ" e="Voucher Date from"></header>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến" e="Voucher Date to"></header>
    </field>
    <field name="ngay_dkt" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày đầu kỳ trước" e="Prev. Period Start Date"></header>
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
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    &ReportDataTypeField;

    <field name="nh_theo" clientDefault="" categoryIndex="2">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
        <item value="">
          <text v="Không phân nhóm" e="No Group"/>
        </item>
        <item value="0">
          <text v="Loại vật tư" e="Item Type"/>
        </item>
        <item value="1">
          <text v="Nhóm vật tư" e="Item Group"/>
        </item>
      </items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99I+KMgPNz07pZCHEPUE4q3LC4ORZ26bVTqIX9ZeyvpFUwIaGGVRGNDIw6ffwxRDdZw==</Encrypted>]]>&OnSelectionOutline;</clientScript>
    </field>
    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <header v="Thứ tự sắp xếp nhóm" e="Group Order Type"/>
      <items style="Mask"/>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
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
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="110: [ngay_dkt].Label, [ngay_dkt]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>

      <item value="110100: [ma_ncc].Label, [ma_ncc], [ten_ncc%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="110000: [nh_theo].Label, [nh_theo]"/>
      <item value="1111: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>
      <item value="110000-1: [ma_gd].Label, [ma_gd], [ds_ma_ct]"/>

      <item value="11100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="11100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="11100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 125, 100, 130, 0">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9TnGDPNRfG3RLSraAWcCrRTyWEKmbe+uVbKME2K6arOL8Fh1CmJbdrcK63fVKKM8FYVZEY43r7d78F4qxEkHFjIwJjJsDS27GpaNhC9VmScQcoX0APBoK1jS8yhmXbkrjWayJ4la06XqNXh6TJWLfKB5QrTd5Cl6piPCHjR+zCT0DKUXvkKQw1yS1xnfOyCdxov3/MhTX2Ko3uJdHKsSZ+bFsdangeHT7zK/0QjMFIvKfRxscy4Ya7DQBFsr1VJ1vihyJYIdQ05IFgzJK6uk2/YQp0Aiq1+02drOgilgLDQYftW26bJNgYhUe6m04PO1kL+g7pxOEGJdZGBl3qD01hgLQjrJDc/bdfamGcu1SacV/UGyqC71WXuTd6Kq8Dw8W+CCqLMMtZJdNKbONDWj5Ya/ejc5NgE1IRyaEOfLjXcknQ1wscDwSfjYmNJuc/7gm9VnTYTw6YzXujSvTQId7UQFp2RRc0ZN8P7zzMXwm+k5ZZ+DOrzksxvma6lw0YZYA5M=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kaM07Xa6/jgsfBLWGL2sfcnf/qpxGsTLB620BgwplLOpA==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Xyxehy98Ar3BuOJYxUjeFGRWGXgxamXJniE1ERxzUqVd32VzncuuU8f+uVHXxAyvUs4LnzF+zUpzGTgPCp/ljtI3MwmS8xplBjolEj2uS0s5nzvXvfyxmqDqS/8XeqNv+2YCsziA6GJrnuadaYRfRaCXOer7tiGC2kwdmZMSnbRcqISs2K9ycNN9nPeTxSW1oN3p1idhVBekfLd21Jk7xWIHgYuLWA3h4DzOoA//G/AmIJXshRcxun1aAYB1BXgosidlpkfbB62YCZwp07QO6UeMXnMhUxJIFbUttHAJzAVxFMRkjMOL5uh3PG6TQ+iY2EFt/e6JvSgCh7fLwv2GmLruYZE4XYQk5VvJT1fVD9o</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6UBkjyLCJvaQKhV1r6qPPTglkHqnaRjYR8qCTAKvDrzeS2HA8/ZNt2AxtdMgmLBHBPQ0o7/VV7dnRYHScjqViXg6b+HRvUVkLcF7LqbzDLnR84f2HXFhtPyOOsI+AJyr2eIBemYg3DM6k53Q7XkpN7JboEZ3eFbedEOiOb05kliCzGAwEqHDSWdOFsvw7Xzx+/z8sNyg+68gd3zUAvLJbT4S9ud/oQVLm3sYHnln8CzHV4GYIXpjL05UbnlTpdfTiW6vIlKrriz0LnF8WbyWlHw==</Encrypted>]]>&FilterExpression;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVo3DbFsvcoq3D47ubR9Ztg1uI+bSyloZvb2OphmC+RidPARQcvh2OflEYz/2vOQTCO/XJ/C9CU06W2m2+cArXP/m7Q8/FNga+WIK7ll4O1Rr1WmMntMqdxjQL2OpBFOhV7TNXjFhp3LJTICT32Zw8JXrKDtjXIGLcrIplCD7iR9qJysFuClhjw189/CkpK8enXNUC1esLTOoLD+v4BffEMBvYkwN3UEiix/4axmQmjFErQNddudtMlKCFb1FzoJDn5TUv7jrKgmldcksePPK9oc5mAD7ABSCBV0tAvmPvxkUGUPNVZhJGXRUUn/NIFYghzYjSV9gO3gFp8zYUDXENg21zbrNVW925dIEWdQMYDQtYnd4Ike6iBxLk78fOAn7/woVvn3jXguxLaJhvBaRZhgX1EjRdOs2xYu2ww3NTYnbLyr3hQaweEaSiHs/v+eOU62yP3cJtFBNnp4cpYa84UgMBOcgbNlGsI3iiVA9v1GTJRyOqWxIlVxojjTFcIcf5LJabOUgEeekGW2w/dIsyLm7terUKRrOlNNoTmartnma4DVzMPTTiyklbv+bgn1OvY3E/nc+zDlpuwU8Bual2H5qqyU6HXrIugCpxc84YCn0oMQf3W8Z+DRaRp/QBZ6P4wNbhv/pBIvWXQf6wRu2XSxGi5W4OJTCr6P4F7LDkGMOzK3rZD8l10Zg/Qh9+4AnqMqw7O2RMXWQAz23O01m/VpQwAL1lc8rwyYJOX7wsqbZOb8r6fgwTE8jLJYcWn4lK4xVh+2vlblqiyx6DKX11QTTLwpm5W3901rRWNbL4vO+sxnHfAzeGNf2R5XpBoMjkgSEevz+Hg+Tbnm5xPVCB4Hz9c4BKbmmdrQgS4VzJbbSisCjc1fNxMnNl/ztjZ3d1TyhwzbGlqOXM4ZMdS4/5ax1g9pLiPyWIF1k2drkFKiEA==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>