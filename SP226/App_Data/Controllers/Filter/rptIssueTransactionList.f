<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY Controller "rptIssueTransactionList">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY ReportDataTypeFieldUOM SYSTEM "..\Include\XML\ReportDataTypeFieldUOM.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY Identity "&Controller;">
  <!ENTITY FilterExpression "f._filter$Expression = '&quot;' + f._filter$Pattern + '&quot;.indexOf([ma_ct]) &gt;= 0;';">
  <!ENTITY XMLGetParameter SYSTEM "..\Include\XML\GetTransactionParameter.xml">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
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
    <field name="so_ct1" align="right" dataFormatString="@upperCaseFormat" maxLength ="-100">
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
    <field name="ten_vt%l" external="true" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" external="true" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="kho_hang_dc" categoryIndex="1">
      <header v="Kho hàng điều chuyển" e="Site Transfer"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho_hang_dc%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho_hang_dc%l" external="true" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" external="true" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="tk_vt" categoryIndex="1">
      <header v="Tài khoản vật tư" e="Item Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tkvt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tkvt%l" external="true" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_loai_vt" categoryIndex="1">
      <header v="Loại vật tư" e="Item Type"/>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" external="true" readOnly="true" categoryIndex="1">
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
      <header v="Mã nhập xuất" e="Reason"/>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1"/>
    </field>
    <field name="ten_nx%l" external="true" readOnly="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="ma_vv" categoryIndex="9">
      <header v="Mã vụ việc" e="Job"/>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" external="true" readOnly="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="ma_hd" categoryIndex="9">
      <header v="Mã hợp đồng" e="Contract"/>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" external="true" readOnly="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="ma_bp" categoryIndex="9">
      <header v="Mã bộ phận" e="Department"/>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" external="true" readOnly="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="lenh_sx" categoryIndex="9">
      <header v="Số lệnh sản xuất" e="Manufacturing Order"/>
      <items style="AutoComplete" controller="MO" reference="ten_lenh_sx%l" check="1 = 1"/>
    </field>
    <field name="ten_lenh_sx%l" external="true" readOnly="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="ma_sp" categoryIndex="9">
      <header v="Mã sản phẩm" e="Product"/>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_sp%l" external="true" readOnly="true" categoryIndex="9">
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

    <field name="transactionGrid" external="true" clientDefault="0" defaultValue="0" rows="198" categoryIndex="5">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="TransactionFilter" row="1"/>
    </field>
    <field name="transactionList" readOnly="true" categoryIndex="5">
      <header v="" e=""></header>
    </field>

    &ReportDataTypeFieldUOM;

    <field name="ma_gd" categoryIndex="9">
      <header	v="Ds mã giao dịch" e="Transaction Code List"/>
    </field>

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
    <field name="maxLength_mo" readOnly="true" hidden="true" maxLength="-109">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="258" anchor="5">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11011-: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [kho_hang_dc].Label, [kho_hang_dc], [ten_kho_hang_dc%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [tk_vt].Label, [tk_vt], [ten_tkvt%l]"/>
      <item value="110100: [ma_loai_vt].Label, [ma_loai_vt], [ten_loai_vt%l]"/>
      <item value="11011-: [ma_nh].Label, [ma_nh], [ma_nh2], [ma_nh3]"/>
      <item value="110001: [ma_dvcs].Label, [ma_dvcs], [maxLength_mo]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11: [transactionGrid], [transactionList]"/>

      <item value="110100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="110100: [lenh_sx].Label, [lenh_sx], [ten_lenh_sx%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="11000-: [ma_gd].Label, [ma_gd]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130" anchor="6">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="5" columns="569, 0" anchor="1">
          <header v="Giao dịch" e="Transaction"/>
        </category>
        <category index="9" columns="120, 30, 70, 100, 100, 130" anchor="6">
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
    &XMLGetParameter;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4XC7q3/4/UmmtZWkeKS7hP7hp9dtVKP2i41C9h19f+E6v3uHYLtMy+ijUomMg6okHM1i+08CZTUFTJVSyFroAaP9b2xqxPkHLa5V7d1kCVQ0+KGy/MCD3VnXUEdrAqjwRQuNnRRGnnqXcGYpVQm+6g=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR74g1O3m6RoZRPRYjifX/Aj8PFYLrshnbZ3JwkbE+7wwKoRhqi+IAcuxyl4OcA1ZD+QeelPGBcyGxCtxFD7uPXvJyAXLLa+9RkIaRGvFrja4eJ5eIculMhDow8UgEZ6oTD8M/TAf4fIPP0RZzvamiRNA7ZCdtVvn4y7FOxW+VhPBo7YxefPjyUsy7sZ3xvTgveK1CJZhr9yVbSvd7SXFg3C1LpqU9CUkKkWT4kOVhLBq9kbMFXTeBcGLNHBpsxCwkpDVIPIDaRt4+lKof1ilAafuAGidp1DTG4DL/n//COTbzI7mH38oxLM2hL9dJCBYbS9ZyPOdpay4kXtd1exxDvFAOCMEw3LpMNUHeTqPuhqxl</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kaM07Xa6/jgsfBLWGL2sfcnf/qpxGsTLB620BgwplLOpA==</Encrypted>]]>&ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwDqPeI9Z9djiLcSAOYmTfpVtyufMM78TxUaqOcHDmpEjLp6VThWNjOOutPmWWpf72+IYV9Pd6jdnKqKfbr+mCk/UNPjJsIXNDQrg7zctB6nbYy6pMS4ZRHdzBV3KFU586Vba054AvnGvB8ovVjy4HWBDsVrDarj8UrdiWUWixhK2wyhiS52gX24rj700eOT/nXpObSEP7ifp0vF2ceUrYOVCs8pdj6k6wXRZhDmZTWnsg/AKab1cXSkpKN4HvmBdGw+HspqQJ/zH75fFLkykUR4</Encrypted>]]>&FilterExpression;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVo3DbFsvcoq3D47ubR9Ztg1uI+bSyloZvb2OphmC+RidPARQcvh2OflEYz/2vOQTCO/XJ/C9CU06W2m2+cArXP/m7Q8/FNga+WIK7ll4O1Rr1WmMntMqdxjQL2OpBFOhV6kpneTBiCqatBHRRz+qOzkbz6sgdughlkSe7ZNxrsaqNJW6m0Q0+sP0/a5AjnD9KzotmR3MHj5jPXetgNu6Spt9wgG/crpLGIRwy/w1dmuLBcDn1mLs52LxB9zmI42Gn5+8xRD34Lagy3L3BriIKiyUB7Egi6MsEDUAXu9w+csEAiD5of6d9LajMcIPUu5QMFRH9ibg8EH00CAF7THi4eUS2pfWwzpWo8T99gaxexIAw4JVFKqVzwn9sxx//EakLJJXIAB1/KL73383IKAEnGunPhDebMB2KVkMlWXJcG2Tp19gNftTq/mFwKLLra9PtNfITMSjLZLUQ49rufxFkWajbOyPFvnmu2yceyVCxjwKEl57PiULfoqJO8yuxcmIRV7TnHjqzXEFDrjxrM39IDyDCbgOTu3gxC0kpkZDrPdR0gNBKrK9VVtfieC+Kpd8H2N8SB3FXcV8eZoBbZ5HguDljVhBzOdmpaV7bVlmA8+Wg==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>