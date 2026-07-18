<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="date_open" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
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
    &ReportMarginField;
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="110: [date_open].Label, [date_open]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      &ReportMarginView;
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3ypD6wIWsxei97UUI0egwICDoXVdjNnZW6O5WtuqwUnP+hhLvSRatBqDm1XdKLJUE577ualOfzH43CpOY4We+qTYoT4FPPSTWo6Rx1evJvalzbPgJCjJovLX2OGxnRZpgG17vULDT/33/p4zE8IieIlnbgPvbHZe+apSzwAUMIU7fzZk26foYZprdzs+vIa5Yr2vgyJhrkCURFCy39hoFbgwUFgbMdDo8G/klJq9JZGryVODY8J4eT2KWOAbqvJZpBnCFlObGH7OZ+lSBFnIw8P871MfU/Do5t5e4zl3vuxAtkIjOxepBtAE7Y94aNxOYBhKZ6B0VhGNdbV54hplEYcK9YNfi4Y8B2FFbLthHbfIMvl0/C/kX7Tq7wrpVWsiRyPd2AsaTspILdUvnPN/eJWIAUJqgkT8ChfJEaTkSnmzzslceHB5IlR+DRLjCM4iQ==</Encrypted>]]>
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1KzovGjX8PqAdTr/BMqZOmhD21/kcC4L+SaJqqrhB5BWWvZL9ud38/F4FoVNsFtwoIezr32qRPjDQRKQrSED5B5LRArmmpR2w3sq5UuPB9oMZn4kTwzcWoWDmLp60zot6BbCoCVukRcFkG86T55Q31edI6m7vWa3Vy3Nlfd6/RoMU9x15U4uwkXUwZSBmhFjqUjRkDRsL7na7bH8LGJ8oko4IZ7ICWIyfkxhKSeMPDuU9PT5TZJJ1KEJQJ61nZsE0WP7ZCc6SryjbSgH8aHy8qzimyu67UGPVWaHz4t3krWHGyuawuLoNA63I4ucXPdRLrgCpG2Srh6AmsOuyZ5uVKVagIJojdcESuUQYOx5Tk6WMOniH/VKbea1kylEtJvo8yWfvm1kG0cSWNE0bE4bvlAFCV51uvaDA7WUzXnMkYvX8JLiBv3zj3HuYX+MuApXQ/xWFLM4haaKcXgB47hTfu7YFZpRUlrro+XsgGMW3eOX7l38QPC6N8rltXYyWrrwtuKKqSLFKUqu8Abl4TCkBSq8gTtUg9QkuBP8rs64DlylIjtdDMP9M5FyIgHgxQWh9/WqLHuzqYs5at3bpFGipw4H5ulwxSaJpm4E/t0eW3SWtYA8+yeJ1u/qVXXZvz7aP/tUo4k6EYL3ckqAzqUPZVD1vCZzyzm46XhFCocbgvmtQyNH1Lhssx06EYi3tCbw8NPQlPkXGcAcc7FTOSL/W7XdycMjFv4hp+4d2EeDP5FuiI</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifiyQBkdvDG95EJTEdIt66OvFJinP2Kyzj3jT0QRsptEMoOdMYZ4n2xjB4ZTbHxrFOJ7E2YHZzAwWwiv1Vm+oEYmFMRfmjwsOch1YJG7ACq9tpqQFgz5u6/kAWqF93OoaE=</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>