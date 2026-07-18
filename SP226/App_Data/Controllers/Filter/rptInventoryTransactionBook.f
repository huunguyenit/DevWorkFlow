<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptInventoryTransactionBook">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
  <!ENTITY ReportMarginCategoryIndex "1">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>

    <field name="tk_vt" allowNulls="false">
      <header v="Tài khoản vật tư" e="Inventory Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="ma_kho">
      <header v="Mã kho" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mã vật tư" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="nh_vt1" categoryIndex="1">
      <header v="Nhóm vật tư" e="Item Group"/>
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
    <field name="loai_vt" categoryIndex="1">
      <header v="Loại vật tư" e="Item Type"/>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
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
    &ReportMarginFieldExtend;

    <field name="nh_theo" categoryIndex="2">
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

    <field name="tinh_ps" clientDefault="1" categoryIndex="2">
      <header v="Tính ps điều chuyển" e="Include Transfers"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không tính phát sinh điều chuyển kho" e="No Include Transfers"/>
        </item>
        <item value="1">
          <text v="Tính phát sinh điều chuyển kho" e="Include Transfers"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="in_theo" clientDefault="3" categoryIndex="2">
      <header v="In các vật tư" e="Items Printed"/>
      <items style="DropDownList">
        <item value="1">
          <text v="Chỉ in vật tư còn tồn kho" e="Print only Items Stock"/>
        </item>
        <item value="2">
          <text v="Chỉ in các vật tư không còn tồn kho" e="Print only Items Without Stock"/>
        </item>
        <item value="3">
          <text v="In tất cả" e="Print All"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="in_sl" clientDefault="1" categoryIndex="2">
      <header v="Cột số lượng" e="Quantity Fields"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không in tổng số lượng" e="No Print Total Quantity"/>
        </item>
        <item value="1">
          <text v="In tổng số lượng" e="Print Total Quantity"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <header v="Thứ tự sắp xếp nhóm" e="Item Group Order Type"/>
      <items style="Mask"/>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="189">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11011-: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="110100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>

      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11000-: [nh_theo].Label, [nh_theo]"/>
      <item value="11000-: [tinh_ps].Label, [tinh_ps]"/>
      <item value="11000-: [in_theo].Label, [in_theo]"/>
      <item value="11000-: [in_sl].Label, [in_sl]"/>
      <item value="1111--: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>
      &ReportMarginView;

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 20, 20, 20, 240, 130">
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

    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9Tl8PnSiBbnOF52OcsD0xQ+3KcV+at/Lgg5fW4PxsyZcAqpI6KOqgfKcO5OQvE6T4tMYgjnNAAbN/7GZoEZibEMrYSJg+Fu6ZznpmA+DE5aN5zeRvA69sOWXWOVP+qvfzLHlgsbh5NpB1cIXa7OpZfcKMJ8l/DPMDy+ssRe3KGHFzR4VHT8jSM1HiPm9tO2Dl7gvgP6whtyZJNp/D5InDE4RlwcWtX8AVjwsvAO5KL16K7dLkblDkUGTChnc8IGvyKodole4eS4/ddyzoXx1NxdP2h5uKRY/JttO9bhGXL4kJ5yPFaNbHyoZVyJ8faDmaFMa0IjHJUsoBfbGiCGsAFPWwLaCPsxYE8e0ZihNH3CkccHh3JBj5g8We7StnY34mTyQZyZxp8+sgAsfZs1UrLn0Ych78pFO81LUUiZxEnT+vrL4uyswlQkiMEZeZ2hlJT1zTjmi32aXsS6JQHAirLhl3VoJnad0UK7eSUegLjvQsNMi+Mz7NUWZuLobs2HYJowBYfcFbA/btPTmlMo+4iJ2d6ofnV6Oxhy4Xf30My+gbV17GFobttzOkjP4TA4c0Qg+PONfq25FgiDJei0DHF1R7SECYZws1ilv+/jboO3JnLJzE+CTwmlr7v8KwhwELS1aYqCc/va6vriQCAP/timCMrl6gfK571urxu1jR8PTuvdqqRoeJejBRr0B16JE1mogS6un3D5VhucHkokqNZQ3ZHMYHJYdBMje8PDTyOE30vSn8225qNGyPnPGqSxVjj413w0V5yHvqt7jk90Yg9V+</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kaM07Xa6/jgsfBLWGL2sfcnf/qpxGsTLB620BgwplLOpA==</Encrypted>]]>
        &ReportMarginProcessing;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EX+nmf7EB/LI6C1+yjwx9mI0KiftxZsqI+iHAn1M3wrYF8p6x/72sBFtmGRYp8emKE0M0ZKo3OHxOHY+RF0o2ncOESE/n+g9on0teAUepb8WwsKcchfurjDkh/hlDN5bKP9PtNR2F6Yp7mMAqL6bCbX47wO5ALFYI0/ArN8lwIBmapnhIUO4OBod/OTOuLBdEPj0sE+LOD/xyf4WFf0TrAT2/6oNEN9kVFEJhm6lchdsH3tiifi+0yii521V7iqslBYQqCEBQXZmelxpIuClw2gjvHGZjzMaP5lsnW+AxOFBZFIztqkFVer+7jOvK7g7WDdxX/GyjGdxumDjX3ObjuI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwBMl6g7KoHbaRqEkDW6tFiXcUZMHwMddtJxnqUKJ+fyOrVcIJVbKskg6xEFOsMRVHkmCa2aQ5wCj6VamXahD4/Ymwv3U1Bicr8xcHy81RXj01Q3GE9ekPVIcdMiNrnkN0X2DC1mimovwnRCPRrsdLAdY5TtbzVehSFQ5RRGQpJEsTOQSva/kXw3HjePQ+BlyETu8lyY2lK1qLtIwm4YAz1ZeqD9vWVKPdrhu+a3XOXw5XBqhJsvk70q/urp5ysBn+fl0Hb/WI2TwIOGVPN1/ReC3WDQWYjmnoC/PX75xlJ/txa+OXlFl8Xj1C1ew7i4ejLfnerwX1l9FisAGzk1bNYVa0PNabOdk71x541YlKEm+gRQtltM2VS+npF6ZozLrGGBS+DGZhbVyyo7LFdEuiUBrFvJF6CG0Ik1uK25CoyIy8sRGHE3eks/4xq9RP4btobELAFzMSwSL2lub+anw57dUHKX/RvR5aU7zqJS6y816/nBSLsDpyNr8vu/ntWQMQpLtRQn01ZsZfwKKy8Ado+vH0mwQ1IOIdSU7lt0T0gQl6BzXTwcjl5X0/fS9YIZMjfi32HtyJjRM5pBRN22mtL9L/bTj/g7tMQimYUlrMWZiO3qsEIleNmBzYb0+InpY0CaXKzBlEM5H7jqL/XVGNwXSU1pSNpIo3ovMaS4yGQeEOMuQhET+wo3DwddBmQRVwAi6AKtx9aX7SLLzf1kzbIPcMIKIn9fE/l5/nneZs9QI8niEMNgAkVpA69lpHYYLbsQsxvCoTVg7llA1TnUFs1xiqY2+ZuqHk4Z3GggbCdbmj/B7XWdDmtLAs/6XyETgH0=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>