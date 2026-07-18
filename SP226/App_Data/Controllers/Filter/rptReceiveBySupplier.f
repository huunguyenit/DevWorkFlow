<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptReceiveBySupplier">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetReportFormStockRight SYSTEM "..\Include\Command\GetReportFormStockRight.txt">
  <!ENTITY SetReportFormStockRight SYSTEM "..\Include\Javascript\SetReportFormStockRight.txt">

  <!ENTITY Identity "&Controller;">
  <!ENTITY FilterExpression "f._filter$Expression = '&quot;' + f._filter$Pattern + '&quot;.indexOf([ma_ct]) &gt;= 0;';f.setItemValue('ds_ma_ct', f._filter$Pattern);">
  <!ENTITY GetTransactionParameter SYSTEM "..\Include\Command\GetTransactionParameter.txt">

  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY DynamicFieldFilterQueryLoading SYSTEM "..\Include\Command\DynamicFieldFilterQueryLoading.txt">
  <!ENTITY DynamicFieldFilterQueryString SYSTEM "..\Include\Javascript\DynamicFieldFilterQueryString.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ" e="Voucher Date from"/>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến" e="Voucher Date to"/>
    </field>
    <field name="so_ct1"  align="right" dataFormatString="@upperCaseFormat">
      <header v="Chứng từ từ/đến số" e="Voucher No. from/to"/>
      <items style="Mask"/>
    </field>
    <field name="so_ct2" align="right" dataFormatString="@upperCaseFormat">
      <header v="" e=""/>
      <items style="Mask"/>
    </field>

    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="nh_kh" categoryIndex="1">
      <header v="Nhóm khách hàng" e="Customer Group"/>
      <items style="AutoComplete" controller="CustomerGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_kh2" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="CustomerGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_kh3" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="CustomerGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Vật tư" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_tkvt" categoryIndex="1">
      <header v="Tài khoản vật tư" e="Inventory Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tkvt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tkvt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_loai_vt" categoryIndex="1">
      <header v="Loại vật tư" e="Item Type"/>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_nh" categoryIndex="1">
      <header v="Nhóm vật tư" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ma_nh2" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ma_nh3" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>

    <field name="ma_nx" categoryIndex="9">
      <header v="Dạng nhập xuất" e="Reason"/>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1"/>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="ma_vv" categoryIndex="9">
      <header v="Mã vụ việc" e="Job"/>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="ma_bp" categoryIndex="9">
      <header v="Mã bộ phận" e="Department"/>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="ma_hd" categoryIndex="9">
      <header v="Mã hợp đồng" e="Contract"/>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"/>
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

    <field name="transactionGrid" external="true" clientDefault="0" defaultValue="0" rows="198" categoryIndex="5">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="TransactionFilter" row="1"/>
    </field>
    <field name="transactionList" readOnly="true" categoryIndex="5">
      <header v="" e=""></header>
    </field>

    &ReportDataTypeField;

    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <header v="Thứ tự sx nhóm" e="Item Group Order Type"/>
      <items style="Mask"/>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="ma_gd" categoryIndex="2">
      <header	v="Ds mã giao dịch" e="Transaction Code List"/>
    </field>
    <field name="tinh_ps" categoryIndex="2">
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

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
    <field name="ds_ma_ct" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="258" anchor="5">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11011-: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength] "/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011-: [nh_kh].Label, [nh_kh], [nh_kh2], [nh_kh3]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_tkvt].Label, [ma_tkvt], [ten_tkvt%l]"/>
      <item value="110100: [ma_loai_vt].Label, [ma_loai_vt], [ten_loai_vt%l]"/>
      <item value="11011-: [ma_nh].Label, [ma_nh], [ma_nh2], [ma_nh3]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11: [transactionGrid], [transactionList]"/>

      <item value="1111---: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>
      <item value="11000--: [tinh_ps].Label, [tinh_ps]"/>
      <item value="11000-1: [ma_gd].Label, [ma_gd], [ds_ma_ct]"/>

      <item value="110100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130" anchor="6">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 225, 130, 0">
          <header v="Lựa chọn" e="Option"/>
        </category>
        <category index="5" columns="569, 0" anchor="1">
          <header v="Giao dịch" e="Transaction"/>
        </category>
        <category index="9" columns="120, 30, 70, 100, 100, 130" anchor="4">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>
        &GetTransactionParameter;
        &GetReportFormStockRight;
        &DynamicFieldFilterQueryLoading;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6CaZtOn54XiEP5ngZJ6In/+zKYTwJapdfMvxkL8+xQqxSxwgH7Mt12iNUngeUSFx2r0uNuyE4FKe5hEHR+/inJNy65PIplvK3fOGU0sqtoHoRhJNzL6NZvKVYdZXsiKjPca1gIySDfa7D0wMnm+7eQxWKVTwOHRM+zlRY2wKn6cWG8u+ysRePz/GkOmDd23T48OQasVSqYk+dHyTIY+9eEEz8thb5Ea3St+J6Ugj1Zzm7hOwwEg5hQj66jHyCysdVYr4GmkCwUBEEMcVIBfFwC+GYagxtMSw9H3MtCpQgZmI0vuSH7+zfj/rs4mk+jyZNiVIYyf/zpHsOkJ1cRUu/MezBShdLPPtkExglmgdmtYtfToVmkvY3JEqDjxPDtRnDlIQ6VYVAf2Lnu5UfSi+g7CnroxhFXA2oXfSLFy+sQI8VX1JxP3f54t9xIAr7RnK6kwjvbhQIwHKvEPnnAHBuzr9fdqraBuxW6Q8vtSQGO/7cKZsU6iHk8IMMRmwSlUYrNHsb+ns5tQLCFh3/05C2dDQ5P0kVEIYItTYjUWAvSXXo3Dce7EOhUpbKKuzPkaE+i5vTCz5fVp0yQV8GUZCsM=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kaM07Xa6/jgsfBLWGL2sfcnf/qpxGsTLB620BgwplLOpA==</Encrypted>]]>
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
      &SetReportFormStockRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwCgzZz6DJfcZauhJ/alyHAGn1hhADD/pVjGHoerNw021dWLdEoB9vsw0mhzpco+kcVANc5fcufUxHU8OrKYV1MxfahS9RntORFKGSIkhyNH6ZRf3kX8J/DpYovz8ZplXpoEhVP8nE43xpoEopIbDzXo+RNOkdN+EqE55BNpJJU7XDNcldDI8gCYYNC0Nt8Qe0ixLN7ZeCJYE6yCCUjTfXS39KDsaoYITVx1ezDRiL7PeigRYXlo+0AE7Ze2qPfvT8OpBJXYt+wgURsHg39E+wpt</Encrypted>]]>&FilterExpression;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVo3DbFsvcoq3D47ubR9Ztg1uI+bSyloZvb2OphmC+RidPARQcvh2OflEYz/2vOQTCO/XJ/C9CU06W2m2+cArXP/m7Q8/FNga+WIK7ll4O1Rr1WmMntMqdxjQL2OpBFOhV6UTbm7MpDfgvjaTDA7DJY2F21wtYIorNRZadVMmP5Eo8ePNkfDLK7pWspSiOdk44cunxrZnQ9cMW3Zwcx+etAfAWOdOS/tZ94l0u7SK/wV1MGYtSpFWQ+0jcjH9NnLZIFz82AFBVJ9xo13Rqo801E/ljStNyhLfQun7DLcFyU3yfh/qwLueHzX8Wfnbw0m569CeHv3uztPGY7RKtwYNbLNH0z+w5WWEzayGqe+ovMmIqnVJtJ8QTFAReu+L+VaIwfpQTtAnz07hjgSj8vrB54y69oBraEFVUrGM4Xjy8lSWn/mthN7d6/AK3q9dOSrOPalOEqV9EUl6u25xCkz29puZFhkaqVlcVYOwNy1wEMywnKDrXOkXrO9RNU1+PO/anMptnlQc+WLL3aEKCqICXO8sItuNd7IoibwZa/QsYBAheEbhWeKAvmZ1MMkeZz5x6lI7UgssTHPMLwULqW/0fn/LkozIeKbKeMMa9tH7rkIBI4r76xLJl4QFL56nngCmvgIHnMlytPvBj8ky+8PKCUz+ADTZLPV6KeoSMap8Gp+YlGOnYBTB5mCmVXJBkAKMeYWQOSjkehrCAmuHPlp0TJGmZaRhYHhXd16SQLqb4uC0Z4EItY5OQwN6JKEDrPotr7jVaXM2Ihr3vlkT2WXhblNOZVJ1qodKANBAVpr0D4mar6wi+wtFCZYRSrm3XJiLS86wu2QpXzU9Olb3dYtAWb+HNmKrhht+Srd7zeCfFdluQ==</Encrypted>]]>&DynamicFieldFilterQueryString;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XWsgR0uuziLPN8s1fg8wl/3h7yXKVhrcHPzvm5GGyGIiMkLJ+VJlUl5IMeEc3SwUSm4D+OYWCsLap4JSnfy9bk=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>