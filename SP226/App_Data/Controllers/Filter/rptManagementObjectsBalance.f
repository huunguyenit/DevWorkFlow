<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY Controller "rptManagementObjectsBalance">
  <!ENTITY % ManagementObjectReport "INCLUDE">
  <!ENTITY % ManagementObject SYSTEM "..\Include\ManagementObject.ent">
  %ManagementObject;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    &ManagementObjectTypeField;

    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày" e="Date"></header>
    </field>

    <field name="tk" aliasName="defaultARAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="loai_ky" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Đầu kỳ/cuối kỳ" e="Opening/Closing"/>
      <footer v="1 - Đầu kỳ, 2 - Cuối kỳ" e="1 - Opening, 2 - Closing"></footer>
      <items style="Mask"/>
    </field>

    &ManagementObjectFields;

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
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
  </fields>

  <views>
    <view id="Dir" height="209">
      <item value="120, 30, 70, 100, 100, 130"/>
      &ManagementObjectTypeView;

      <item value="110---: [ngay].Label, [ngay]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="111000: [loai_ky].Label, [loai_ky], [loai_ky].Description"/>

      &ManagementObjectViews;

      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterShowingManagementObject;
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        &ManagementObjectQuerySubTitle;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3ypD6wIWsxei97UUI0egwICDoXVdjNnZW6O5WtuqwUnzBTZWbVQtaaaGqIFDfCVJdH4PHp/2BoLXe26PXrbxXzN8hcAJbPWU73BAc7Sl5P1KjG9wk945kwX94RIhr9FcKSlYKUb9aDepaDxkSlFeC+qWUA828d/GyWts73VVjfJ</Encrypted>]]>&ManagementObjectQuerySelect;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVjQhj4yVaR8+4RX6F1zXcKu1F+3Qi4IOh0xVbWWkArUJ4xnhuD9RQdt16pNsS8hwdzknDWsTOPV32M0tGU7EybNIRfWu4/pqaD0GOCrgBnI6N1/hMFNPQwlJJ+AEcouc3tL8VriaahJKqzRTlk6pDjsEh5NLoa8/HkBoLzCoKG</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6UBkjyLCJvaQKhV1r6qPPTglkHqnaRjYR8qCTAKvDrzcgRxuQh6keovaXhyE65GTPgkOM0eWwUraig0e8BYgyj5RYfblb5nUJmVG+uZbLsu2bKXRhw2s7A6J+AENzMkPmdgLl70XWkwKx8C9wgVFbTJ88IYzvumOfgolffh6Q+hlFkxiwAlQ2jw5PnvapPAdcW7OEAzJYBcKYMplWQmjHihAtsU4fRLmUtQQwsu1a1hE=</Encrypted>]]>&ManagementObjectScriptActive;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVo3DbFsvcoq3D47ubR9Ztg1uI+bSyloZvb2OphmC+RidPARQcvh2OflEYz/2vOQTCO/XJ/C9CU06W2m2+cArXP/YoPhVCoCKrtj9i14NmtRQGVHRlwxocgqRK4Oh/3QK9XkyfDufwfh4mx6lPM91KG9Ikk5Yrw/5XGZr8DEXklZN0liggomt+dVWAa9pTpahIeEiVV6UkgWjBORGxP+XUuiTDMoqH88jxkc4RBkzqdSShLwfjIXNIyGvFYA/JPzcx8ducVvRX0IeoDyRvess2jy3jg3Ys88oea77Ju8SUmZxcONOlUQpcXbiyaUMd0JVvvpQ6bFnRdg4qiIPkHzZMWUP3AVdvHYACZJpzaxkbj6+JCWQpMt5FyCnIHRw8HLma4NHEFTd30h5rGoCwZeznaqQV0TBmoRzlhMvbfhrwbTwdJnNhqyCuZ3vT4nSXNb4Q23DfpI//uE3O7wA+kBUt43QDARhX50F2kaz6OdXAR4D4Z+zO6O+IydKC5sSVG8Ok+c8uirbB1Ubwbul/sCVWbFIidxihlxSlLWEurv0eiSBpRctwHvVFI81HIRoxxyWSbtCalHvhfFAoc8TVR5c9OBFn4XF9ByNtRYppdIOODu1Rq4Pkds+g4rb4b3EfDbGSJd7kR+nR8oUhu2/NpgZZu9gzeFeBcwyebegFEMpuizOBsoKcW/qu9yRz4Ma4iFH2BpHCBTGYvXibBGOQb/POso</Encrypted>]]>
      &ManagementObjectScript;
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifiyQBkdvDG95EJTEdIt66OvFJinP2Kyzj3jT0QRsptEMoOdMYZ4n2xjB4ZTbHxrFOJ7E2YHZzAwWwiv1Vm+oEY8qZjOCLprjK7PmVPNZjFGXrsNfvsS1Gf3Uq3BQdc8VU=</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;

</dir>