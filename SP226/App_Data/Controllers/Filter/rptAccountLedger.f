<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
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
    <field name="group" dataFormatString="1, 0" clientDefault="0" align="right">
      <header v="Nhóm theo tk đối ứng" e="Group by Ref. Acct."></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
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
      <item value="1110: [group].Label, [group], [group].Description"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9eOZfOEWQcPADKnaQdRF5LsRwUBLzz59NtKqNIL+oj3Hk1WMA9iNmKn60BfWkePmrHSRWlB96mIPS0T/CatB8RZNM2Oyyfq6jkw7Uocz4n1K5alNPdgXHzFWSik/TfVfRcjGlkxAYi+M9Nj9BSttGq5zTwcB2Aiqh9mtYcgqsOqs2dSRY9bE0gfbzIw++iqE0Grw2vR7wcHOvKig+LZxcap1YW+sHdzCXHKY8RaPNYiMQyJ/PAG1dXzwWoHi4sezAi9cV6EwU+kTKJ7TNCn4BRrdz3PjxWjzp1SRqlUi+qmAGZRfOjP3/Yv12BqL9BSQWzTb5uQkukc97h8fx8GQWnoyN5AX+0GA4e9z3fCyquJ+HyOe2aVPwq6PfLX/tpVg853kM572N40Mgma2jPwHbrA+AgSeNHQ4l1+7hFx1cPNvo/9OPLkv0F51msISLnDlw==</Encrypted>]]>
        &ReferenceParameters;
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUTYRF+LVQMVEbWzusHRxg3V0ym0LKpFMGr2xuRuhjdBlsMwx0gC982rJ+uPLAarbNnixmV2lmEYWkFw+d5OHxhFJvBUzycfytg8fh7Y+7CGETTxsV0YGN3WePJ/SO3dD3Azi3VCHGm9YnFo+3ctsITMcGI3Vcrk4tNTjavO4IlKnoFErT3LDSjuiePUR2/HLhk0Qkvy/CCp71L+PHrejqJU+hEI5u/Dd8k05mTXK79MMByX1OeOJm1WnL+luuAbWwZw03X6LK7DcY7MokdccZTBcF+f+7rzJ2dP/lhTPRop0dg/m/S+28xNfUTP9SQVkWK/u4YDdZyeIp9Sqcgjs5haYWvB4okyfO3TCZS4che2rocxdO0a9yYcJ969UTmNdaj5kv2ycGpJknRD4iy8BFRZ2HZ0AU4/d3KqaUbiEzFAFNEwtHi+FlAr1nqaJGnsa1PYqZ7OndGJxCOMf88cb1i3gOdEtyZk5UljMK5JfOry5fcJnHo5fAXOs94j+F6ngw/Vws7x+Mo4mbCF9CmnAJFP/ZuCfqhMm93xxmnb0pVUMlnTIo8hJDL5KPXy1sevJVX2tA5ZcJ++UjJB/upFb13vVzgwfUBnydWIHJ1J58XQC4HUrUrnnnRKFY77ZtH/uXdyfpPKiFL3kl63aukA5XiT/hmfxQYADlrkUm3uEIWjkbytrsrny7MIJW5zSs+zg+9h+3vaOVWpQik+i649SVu38nxgvOnRvEUOkk7Q2Cbqr3fF1TUkWt7R9nEiQWiHHV9btvVd6GCWiYbdcoSFIAEA==</Encrypted>]]>
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