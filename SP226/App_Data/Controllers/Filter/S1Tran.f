<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "S1Tran">
  <!ENTITY TableDetail "ds1">

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;
]>

<dir table="ms1$000000" code="stt_rec" order="ngay_ct" cache="true" id="SF1" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Chứng từ từ ngày" e="Voucher Date from"></header>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Chứng từ đến ngày" e="Voucher Date to"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Số chứng từ từ/đến" e="Voucher No. from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_gd" filterSource="master" operation="10">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BeQqEwYHzOzSzZfI/zdFklaqYX6CAwpNUoPSc3sDve6</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L6P8l+k599y6C74kmO8+0bmAAIMtS+e7NTtFC0HIfpU+</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" width="0" clientDefault="Default" allowContain="true" defaultValue="02" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ma_px" filterSource="master" operation="20">
      <header v="Phân xưởng" e="Shop"></header>
      <items style="AutoComplete" controller="SFCShop" reference="ten_px%l" key="1 = 1" check="1 = 1"/>
    </field>
    <field name="ten_px%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_lsx" filterSource="master" operation="30">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
      <items style="AutoComplete" controller="SFCWorkOrder" reference="ten_lsx%l" key="((('{$%c[ma_gd]}' &lt;&gt; '') and (loai_ct in (select case when loai_ct = '02' then 1 else 2 end from dmmagd where ma_ct = @@id and ma_gd = '{$%c[ma_gd]}')))or ('{$%c[ma_gd]}' = '')) and status &lt;&gt; 0&VoucherLogStatusKeyLookup;" check="((('{$%c[ma_gd]}' &lt;&gt; '') and (loai_ct in (select case when loai_ct = '02' then 1 else 2 end from dmmagd where ma_ct = @@id and ma_gd = '{$%c[ma_gd]}')))or ('{$%c[ma_gd]}' = '')) and status &lt;&gt; 0&VoucherLogStatusKeyLookup;" information="ma_lsx$vcs2.ten_lsx%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&efX/jr3v03Fk0SvHuaYvC/PXhfNtV8iKTlgH+Jwug3jre1u9Hh6JhHPrVwzAzPGw</Encrypted>]]></clientScript>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_cd" filterSource="master" operation="40">
      <header v="Công đoạn" e="Operation"></header>
      <items style="AutoComplete" controller="SFCWorkOrderOperationList" reference="ten_cd%l" key="ma_lsx = '{$%c[ma_lsx]}'" check="ma_lsx = '{$%c[ma_lsx]}'"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&uIBOCjtPeDf0M/ArCvxqB1mDiEvSj0xrbuFRzSmUmbpo5FpNF7qWC5msB7+XxsK0</Encrypted>]]></clientScript>
    </field>
    <field name="ten_cd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nc" filterSource="master" operation="50">
      <header v="Người vận hành" e="Operator"></header>
      <items style="AutoComplete" controller="SFCEmployeeList" reference="ten_nc%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_ca" filterSource="master" operation="60">
      <header v="Mã ca" e="Working Shift"></header>
      <items style="AutoComplete" controller="SFCWorkingShift" reference="ten_ca%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_ca%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_vt" filterSource="detail" operation="10" categoryIndex="1">
      <header v="Bán thành phẩm" e="WIP"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1' and loai_vt in ('41', '51')" check="loai_vt in ('41', '51')" information="&TableDetail;"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1" information="&TableDetail;" >
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs" categoryIndex="-1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="user_id0" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="40">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="1101--: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="1101: [so_ct1].Label, [so_ct1], [so_ct2]"/>
      <item value="1101--: [ma_gd].Label, [ma_gd], [ten_gd%l]"/>
      <item value="11010-: [ma_px].Label, [ma_px], [ten_px%l]"/>
      <item value="11010-: [ma_lsx].Label, [ma_lsx], [ten_lsx%l]"/>
      <item value="11010-: [ma_cd].Label, [ma_cd], [ten_cd%l]"/>
      <item value="11010-: [ma_nc].Label, [ma_nc], [ten_nc%l]"/>
      <item value="11010-: [ma_ca].Label, [ma_ca], [ten_ca%l]"/>

      <item value="1101: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>

      <item value="11010-: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11100: [user_id0].Label, [user_id0], [user_id0].Description"/>

      <categories>
        <category index="1" columns="120, 30, 70, 330">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Initialize">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGC4wXbIV48PhkvsTtGPkVlij7kpDjHKz8xqvhz2dA3q</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdiiptXRl/4sFRB4FwiUr4SJIBwMt8qkFvmKKO3Afmn1RuIuTYletZhhPSbNELoTB0A==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPS6o0FO4oa0V8ggf7RVJkjpvu5lLetaENfYXcCme6Jq</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdkWF4iAo1/cjEhK5pkbvWkOjkCq7M5Ymx5M937u2XsF5xn7BISHsKgX9NvMWYmkDSA==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdkWF4iAo1/cjEhK5pkbvWkOjkCq7M5Ymx5M937u2XsF5xn7BISHsKgX9NvMWYmkDSA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxduSdD26Q3YZW9YbjXoFX3YaqrVnn1mdEPssk80SL4YK/1W9qLemUaetoH7/jSHWdWC1G+mCggsZ6EfTpz6fj+vCY/evFqzOkY1pvZwv+sdEr/ZeofKWE5JZQOEgsLQcVw52rb8GugtVj9KXPAr53sl+qZ9exN+/L4pWpWS6dGu1fxuTpnyIilkwlNTXxt5I3MkApBc8Q/CbzeKrFYGD93Gw=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdjJ6ORpkOCfCYWsximqnZ96Z9Y/v9LutdwNdyBLdERuWqjZQ5mZLqEU/eXvKalYmwVayvOybykQXW3nI+JrVkkU=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjjLniAaBb5AjhriaAlZn04DQ4NyWs54a2vA0PkTeID08gfZA/5LFHzgbvS0MZFZc6UW9XS6M7MUx1igJOBsbRHQ/c7KCme8e7BEq9PiRBnyFQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdgRBUOITu478N0ZnR8wg56M6eKo42PJdr+fMbqWFuKG7MeYY/zDKsELfSTxybQl56XqYl2byMeD0NAWh6Vcxws4=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRv/MctzvTJT9MrMoXn9GkHpV0uTSGnEUaJ3qYUwou6iCQoCwOPLwRnekY3/4KpAIlQ=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0LxeMYUKABqzq6ZqGmjDLha6FYlr9IZParXFrITZJkHv9FsIzeIznZ8Ei8/isyC8FF0A4PYu9Mxdvbokz1spieuCZpjUVqsYRXUOE+TqlKG1uyTHfNP+qGZNqzHYSrsZfzUzmkMHVezd8g7P8ECGRGx1eVuqxloYoUdQLgzvcl1hycxzp6GS/5i5ICs/wav82xA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&efX/jr3v03Fk0SvHuaYvC7Ac//y/tizfQfKp4sKW9j5ah4wQHuFb6wZqpFch51XbKfrsh0MhX4uHnABQI0y6+vrUyLlFXmt+Gc0k2rMWaURPHVxarEYEGDE6XUHQA8Oz6YD02A0sbQsn/WIFsxvEA5niP8on+Y7hRHtfP/EE2xg=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&uIBOCjtPeDf0M/ArCvxqBwHdnnCvnP43J1OCHx/Z0ztwXmDtAjJ1u6mlAZOik7GiUENoGeE2V/eFrS3rgpUq7Vzac13GZOaGGnr2cgzpU/diNS1c51OXGvBVpBb/PkSd</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYhpU71ALmfk5ffMVXbbEaC95FDNPuPVyyo0paJ5AWSXOQ/onvbV5bNXYdtHuIDX7H8jFKJNFaPszc306jhi5p99FbePBiWRo3HxCIce9sD8RweAhIODiKzj7GU/j82qwk3i2QSMpWHFRSc1KA4KbStwG8D5Q/mKLod28B5meTxgoCu5rBlOauaCJ7Kp8pJLYyM9AJ/6/Aj2s6QlevLwhUQ8FrN4MJUldavHqcAzIg2qOxgwFFlG0X9v2tbYA0uay8A=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgX4f7mnJguIr9FgFphda03qbfeqxRql87vmgnZzCghXR3SgX5JXpiV1ClrpXl79+FpTTqciQviz1I0Gy3ESxGRg==</Encrypted>]]>
      </text>
    </action>
  </response>

</dir>