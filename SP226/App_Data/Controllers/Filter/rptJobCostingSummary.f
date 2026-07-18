<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="vu_viec_me" categoryIndex="1">
      <header v="Vụ việc mẹ" e="Parent Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv_me%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_vv_me%l" external="true" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="vu_viec" categoryIndex="1">
      <header v="Vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_vv%l" external="true" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="nhom_vv1" categoryIndex="1">
      <header v="Nhóm vụ việc 1" e="Job Group 1"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" external="true" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv2" categoryIndex="1">
      <header v="Nhóm vụ việc 2" e="Job Group 2"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" external="true" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv3" categoryIndex="1">
      <header v="Nhóm vụ việc 3" e="Job Group 3"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" external="true" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" categoryIndex="1">
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

    <field name="cach_tinh" dataFormatString="1, 2" clientDefault="1" align="right" categoryIndex="2">
      <header v="Cách tính" e="Calculating Method"></header>
      <footer v="1 - Theo đối ứng, 2 - Theo giảm trừ" e="1 - Reference, 2 - Deduction"/>
      <items style="Mask"></items>
    </field>
    <field name="nhom_theo" dataFormatString="1, 0" clientDefault="0" align="right" categoryIndex="2">
      <header v="Nhóm theo" e="Group by"></header>
      <footer v="1 - Vụ việc mẹ, 0 - Không" e="1 - Parent Job, 0 - None"/>
      <items style="Mask"></items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="186">
      <item value="120, 25, 75, 100, 100, 130"/>
      <item value="1101: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>

      <item value="110100: [vu_viec_me].Label, [vu_viec_me], [ten_vv_me%l]"/>
      <item value="110100: [vu_viec].Label, [vu_viec], [ten_vv%l]"/>
      <item value="110100: [nhom_vv1].Label, [nhom_vv1], [ten_nh_1%l]"/>
      <item value="110100: [nhom_vv2].Label, [nhom_vv2], [ten_nh_2%l]"/>
      <item value="110100: [nhom_vv3].Label, [nhom_vv3], [ten_nh_3%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>

      <item value="111000: [cach_tinh].Label, [cach_tinh], [cach_tinh].Description"/>
      <item value="111000: [nhom_theo].Label, [nhom_theo], [nhom_theo].Description"/>

      <categories>
        <category index="1" columns="120, 25, 75, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 75, 100, 100, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>

    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI5Jt6Ho5OA2AaNQZuURpAKRRJnPl+gUphPbMI1djNOqlqkyz6fTkvRGQ3d+CDZacCRxhslDP2twd1d746j7xrupNNUp2V/ve3C2QH6IFqZsak2ViekERA7vwy+UicTqs0mq9FkXJHtxdP32ZF8PGqFVOlkg1gxNBVz4EJjps0F+pQlvKMC4vbfPRMBp3WAEttcnTmpkulURi1ZHuoSUHX3TJ84boFwr/rBdYizZOSIhEcnPgBKVuZhTwaCvyTzMWg==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1KzovGjX8PqAdTr/BMqZOmhD21/kcC4L+SaJqqrhB5BWWvZL9ud38/F4FoVNsFtwoIezr32qRPjDQRKQrSED5B5LSiTQgHGg04u4Jc8em0NfZtMVz+aoicqI+mS+yhdbF/ycNtxqfy/xiwq+kfb9leVw1y5TID4+3YiFXZ4AHI6Saw/Fmb8zqSBMCbkOWib1cvbBuJwCkZKy9TmNXFXgUIdvS5U26EElZBls7e22TO7BgWC+GUjjk9mDXWzBXFTHcTQzkorvl0a8FAYQ0IpzLChzNlHMZD51Ea07jNrhkn28BSlzmjpnsNo8EXWVjiY0fmSOa1Dl6OoUHRkZmFkhqY8GEBDmGrNwZgoHpiOd7cPEFY/LQu/SknmgATnaFnaes2UOOGc1Bfn0vqaIVQFcwJKXIo6xa7oiZJUNMUzoMnXVWMKlN6FcSStazY2IIkhPakUIKYQFY2WnWqfZ+cB9E0guLpQhN06YzZHO9+zW0HvVHPOSyH3CK/BmgveszbZ5AFjLBaNEr9cGDLvsjO1H9fhhVK7rCT1a6Sj3zsNdWg2Frjp3Y2E8ZlX16LayXsZ8YqAcHYZWJhDLqcOuLbKdgQ8W2fFpTYxB3VBAkmO+wzTz4c/ccerFrTQ5Tds5h4yOFuRDSk8ARdM8ju0Mhqe176EIHoikjly9RmAXpPsvcWIDdO</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyI8ZCcQblE8Np3nK/w5LUGuwA4vdYDEyJ/POluhKA03DmPqXNjUqwkZlhjMjKISvgka+7/jFRM60kM+YBqKed7u6xTyBTlYIN3Axhezac9hDelWXEBwW9IE2/lDrgu1VqGfCBpt49YYOMkvpwbkYwk=</Encrypted>]]>
      </text>
    </action>
  </response>
  &OutlineCss;
</dir>