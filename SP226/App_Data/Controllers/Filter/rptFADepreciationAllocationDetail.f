<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="fromPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="toPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Đến kỳ" e="To Period"></header>
      <footer v="Đến kỳ/năm" e="To Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="tu_nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Đến năm" e="To Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="tk_kh" allowNulls="false">
      <header v="Tk khấu hao" e="Depr. Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_kh%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_kh%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_cp" allowNulls="false">
      <header v="Tk chi phí" e="Expense Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cp%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cp%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

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
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111----: [tu_ky].Description, [tu_ky], [tu_nam]"/>
      <item value="111----: [den_ky].Description, [den_ky], [den_nam]"/>
      <item value="1100100: [tk_kh].Label, [tk_kh], [ten_tk_kh%l]"/>
      <item value="1100100: [tk_cp].Label, [tk_cp], [ten_tk_cp%l]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxKCpZZ9EuYJLg5oaE57kakm1szWJAgC2icq/BOfpWMYaBKm+0Rt2ZSO4x/BU7D4pktCHe5Z8DKOuds1kSrvnWzhaFZEMn4SbumKb1tciAiyVYF0rWJbRXSDkhcbcA/0K5AK6IQTeY9JP4rezmBd8P1O/QGZGHv3GJM3gdGrrwB9q0Ezo8oDYCm8yS4MYr6GiadvNxf289c2xplvXf29E/6tlqL3bN1gLBP0QrFH4gxntqXuGdd4yQ62gckRmWCDgnyDn8KR6Ju9jBAaPMyZlEVuLxyXNfTKXi+mLNQqsLrRP1EshFbs+zY+JRFtHXdnhsHo+qgvd5ruppNLG6iESUi+b5qiH9OGz0Ipg/7boBsE0MSFTF9FFW4himL2XCnsiw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdDqS2nZpjMFZD+ajcJqY6S0MraksmenqXt2vjKyhYADTAN8k603T01iM8FyPlNPl1WMI6kgjgjRD/FW1Q3ikp75xNj+dM2BvnCl8yfRwgpA/lNgyAIMtR7Cw0unqCUtTVAs9+/ofvyQPrkI9cFx0gIJumxeQs1N2WVwMcuQjdsw6aC0L4blttVGTO1yuSsQTRVHHRtGVGguVKSU8HnwojqX2b+AlYY/w2JP/98XuaJJnD9JjgP9+aVr6Q/+fhrll/b5tr+xhFxvMYv5i8+hIn9oIfC2/gATFfDfqNXQVuqxwZQeDBMCti5wzPrltSYd2iej2LGvv7fs2UjUmnpTap4y/Er/BpGa7EjMGqMFBE52AMD7MdrPuq3ZF+1vzl7gWeHP9YVJGfMnzYKYxwjmu9FXPkeMOfwnkymklQ/15PkMwiN/dm0Y+5KOLdE4EFEPPmSO3pQLOTNeB5GDBxuDionhfu1kGQoooy6ikTduzzihR8NidlN5dozVKD6ceSzHRoCg9uCwtnLSP/eQpacoHMrB0EfdYzKgbVm8tk/gH0NDIgcJT6ti6HilNJM1HLNRU3pNOavoyHtbN0tDTPyt1aOKVvMBr91a+JJFekAtOtOtwfZd8byqIF84apWilZVs8qmnK7fI6BtZhJxBsGjg6ntyq8mvfrLq0L/hxRhtGt5jz8YFuFntPgh+BAQuA72pEI/SnraZPgMWPe0Wce3BMPnVlT/I0jS8Ktf94oyPCOD5FgTlytvRouirLCMGwbBUNNXpFxLYUqLpF8mt6GDUtr+clZoJlzICWvcr3yiO4VCYnfOmGxaxpy5XdGgBgOdGoKA==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>