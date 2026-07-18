<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptReceiveSummary">
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
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ ngày" e="Voucher Date from"/>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến ngày" e="Voucher Date to"/>
    </field>
    <field name="so_ct1" align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="Chứng từ từ/đến số" e="Voucher No. from/to"/>
      <items style="Mask"/>
    </field>
    <field name="so_ct2" align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="" e=""/>
      <items style="Mask"/>
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
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="tk_vt" categoryIndex="1">
      <header v="Tài khoản vật tư" e="Inventory Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="ma_loai_vt" categoryIndex="1">
      <header v="Loại vật tư" e="Item Type"/>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true" categoryIndex="1">
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
    <field name="mau_bc" categoryIndex="1" clientDefault="20">
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

    <field name="transactionGrid" external="true" clientDefault="0" defaultValue="0" rows="174" categoryIndex="5">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="TransactionFilter" row="1"/>
    </field>
    <field name="transactionList" readOnly="true" categoryIndex="5">
      <header v="" e=""></header>
    </field>

    &ReportDataTypeField;

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

    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <header v="Thứ tự sx nhóm" e="Group Order Type"/>
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

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
    <field name="ds_ma_ct" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="234" anchor="5">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11011-: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>

      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>

      <item value="110100: [ma_loai_vt].Label, [ma_loai_vt], [ten_loai_vt%l]"/>
      <item value="11011-: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="110100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11: [transactionGrid], [transactionList]"/>

      <item value="1100000--: [nh_theo].Label, [nh_theo]"/>
      <item value="1100000-1: [tinh_ps].Label, [tinh_ps], [ds_ma_ct]"/>
      <item value="1100000--: [ma_gd].Label, [ma_gd]"/>
      <item value="1111-----: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130" anchor="6">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 5, 20, 200, 130">
          <header v="Lựa chọn" e="Option"/>
        </category>
        <category index="5" columns="569, 0" anchor="1">
          <header v="Giao dịch" e="Transaction"/>
        </category>
        <category index="9" columns="120, 30, 70, 100, 100, 130, 0" anchor="4">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9TnGDPNRfG3RLSraAWcCrRTyWEKmbe+uVbKME2K6arOL8Fh1CmJbdrcK63fVKKM8FYVZEY43r7d78F4qxEkHFjIwJjJsDS27GpaNhC9VmScQcoX0APBoK1jS8yhmXbkrjWayJ4la06XqNXh6TJWLfKB5K1E4SZ6WEoSB3oz1g0GKCuocfmKBJuavTgxhMELS4V6DKCG53C/h1hsQ9YE92oozfAoh7j1rNl5tIDVJlLq3Hy5u4qgyHyusycO47ww89covjQO3n1IyGeqjQyBPpoXsPyh7aJF6pCBUOrCRpg6zWlu2JdXuEii5feqCxuz6PKLAVhUgbKzwWXRGLtPuWOqeoTh2Sc/jgxzFaxc5Qk55nxgCMwjEuKdJW8ouNDUMlJ7+97vz/7+vWYe1AFyR1kKyc7d2mkFFoI0TDrjeFOQhSp9ug1KxUv7igLs7ao4mOh+ggrpCLqq6sem8mCLmiK+hIUZXrQqIi/W9YUTZLk4rtXUhnMr/HV9yZExo7w6M8jCJ7fbj4v7yMcoEt/nsSJDgUDIgTfMFZQKwIm2NkzvKAw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kaM07Xa6/jgsfBLWGL2sfcnf/qpxGsTLB620BgwplLOpA==</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwBQrzSB8VoYD4s/CynqrZ9M6EFOSPOEFLZ1fUsCcwgE2DlnQq+PmYYpMico/hTpUF8G1QNs+xm84rdRlEHD+j5IB8P4KWfpySyQNka6GVSpRf48VIJKtJj/bIkpxayZ/PGCDk9IsB6bt5WdlJ3tmSMk9bwDtLbp1ilGD2iD4DwSlcHkhHBliQtYMZ3URzoHvj5Eio6m/XXTvkjhPwjHlwZSpFmIoJTZrmk/Qd/SykhMEpYnNkQfgUgTDIs+xXe7++lkv/+v6pA3L4w/iozt8q/ckKHrt7xTiuBXyjSL2eH9ag==</Encrypted>]]>&FilterExpression;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVo3DbFsvcoq3D47ubR9Ztg1uI+bSyloZvb2OphmC+RidPARQcvh2OflEYz/2vOQTCO/XJ/C9CU06W2m2+cArXP/m7Q8/FNga+WIK7ll4O1Rr1WmMntMqdxjQL2OpBFOhV6kpneTBiCqatBHRRz+qOzkbz6sgdughlkSe7ZNxrsaqNJW6m0Q0+sP0/a5AjnD9KzotmR3MHj5jPXetgNu6Spt9wgG/crpLGIRwy/w1dmuLBcDn1mLs52LxB9zmI42Gn5+8xRD34Lagy3L3BriIKiyUB7Egi6MsEDUAXu9w+csEAiD5of6d9LajMcIPUu5QMFRH9ibg8EH00CAF7THi4eUS2pfWwzpWo8T99gaxexIAw4JVFKqVzwn9sxx//EakLJJXIAB1/KL73383IKAEnGunPhDebMB2KVkMlWXJcG2Tp19gNftTq/mFwKLLra9PtNfITMSjLZLUQ49rufxFkWalLUhIE/qmDgOS4r0KBSIqYNagqvP4Otl7uzdxDUK9QX20opI20K8d2EleB9ZB2qEYvqz8KrK4vzlm2/3H39KZ6eCOQTil8Y9NjRnzmL8HNCxaELjGGnUK5I4SXJK0ZPFhebXzMeJPNF1CtWky/xA2/vZSkcv9qqUmgYoQRRYeNBQQlVB8j0I60ajfA1vUbhkEOunp7xLDOexh6/BDGI+HOLbM6/KcYRKKZ9fLNf91fOZOvgxAbpCXqJb3QSfZtrqhttZPXSj/lo0fHGMLoe24y/B3Ama3osCLPsA+f4YuQPvgmfJjedQg4C8yYznl5JiN7AYzj7y6e3LyK65LwJpyhtDkyEzEDSkfc4xXdQKReRi++QubEAjbhsuqf6ouWHn9nwE+KXkF2F1mCz+Tmh7ncRNkoyQ0yWvU678Ul/evHE=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>