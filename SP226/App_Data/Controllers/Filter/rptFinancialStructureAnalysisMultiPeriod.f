<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">

  <!ENTITY defaultTable "gltcpt11">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="loai_ky" dataFormatString="1, 2, 3, 4" clientDefault="Default" defaultValue="2" align="right">
      <header v="Kiểu báo cáo" e="Report Type"></header>
      <footer v="1 - Tháng, 2 - Quý, 3 - Nửa năm, 4 - Năm" e="1 - Month, 2 - Quarter, 3 - Half a year, 4 - Year"></footer>
      <items style="Mask"></items>
    </field>
    <field name="period" type="Decimal" dataFormatString="#0" clientDefault="2" allowNulls="false">
      <header v="Số kỳ báo cáo" e="No. of Periods"></header>
      <items style="Numeric"></items>
    </field>
    <field name="periodFrom" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="yearFrom" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="(@@admin = 1) or (ma_dvcs in (select rtrim(a.ma_dvcs) as ma_dvcs from dmdvcs a join sysunitrights b on a.ma_dvcs = b.ma_dvcs where a.status = '1' and b.user_id = (select top 1 id from vsysuserinfo where name in(select name from vsysuserinfo where id = @@userID)) and (r_access = 1)))" check="(@@admin = 1) or (ma_dvcs in (select rtrim(a.ma_dvcs) as ma_dvcs from dmdvcs a join sysunitrights b on a.ma_dvcs = b.ma_dvcs where a.status = '1' and b.user_id = (select top 1 id from vsysuserinfo where name in(select name from vsysuserinfo where id = @@userID)) and (r_access = 1)))"/>
    </field>

    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList" >
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="1110000: [loai_ky].Label, [loai_ky], [loai_ky].Description"/>
      <item value="11-----: [period].Label, [period]"/>
      <item value="111----: [periodFrom].Description, [periodFrom], [yearFrom]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsDCzDTbAYjxedDUkYV9a1omgMm+cPs69mQwYzgY3h4nm01Vlkt0i7ZN4aRatfJtsDQn3rKtCc97AlUK5bm5uQIgrIJPOaPIZ+z63f3sdcWm2XBiS2OMPrmO/HZtrlxXovNPoGupmuZmPE51NlEpMpKsAbRLGCfcTjqr4MZSMbO/kqt8PVSDByzHG9aXC1/xKzE=</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77vgMbfRI3e6BDGxfc5Ox9TJa7T4TsH/1P2o9YkLHpmcOiY5iE76Ty6x+rKi28LDzqfAa+89aJO608ZQZIYnZH6JPOLIJr75Ii71z7sZSd27uVwqIfcqTxdkJh5W27c+5VnxWD50aqtVX/Pv6MPJlptVGM6/IgfzAFrAjvmJA20WC6pmDEeh/j0i40IlAoUbCNlIIT72aMgv6Le8ewn+wysVcILc0V2oaIihBo+i+D9e</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAA2yLSlHLMIpNRbXv95PEzLcpXyvZZ1194114mb0OWgf1j/Jyhh9NigoTVZKxMZ+5ncopM7fC4xJFrg0Bsm6bpVUgwJ3m1/0MYWl9CdXYGWn+3+63FQ95Rek5lPdaVLMxasRsoWI0wSJyYbO5j1T7HnBvg/neqFJCwHo4ssZ6bPnrrM1R29Wroa9OtZgAFLVV8Fi59YtuRdZ31pmgxtzudT/m1DYSU+vKrElrHvlYI36ZtTXCR9RfNh24tGH/DcoQZNW7LFOJK1BXoRTcgNb+mfQCY3ox0cHigVYiWnmPRHLU2j7xuD05k3qoU0vZNgBuN0EV1lCSUqulQPygUrw2fxSgyTUtO0hJ3ByeMy3RyO</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKyrIQTMT7Slu0ZC6B9TlF6yqMpJXaDvgMrIYdpITtoD555EYuzLZrQfj/N+SX3D5bLrzBnBmf98JtiHIidl/XKOvKHBY+qylrI6ZeThADzVdwKroxAkSpIuKNSPhwi6cmRfdlGVHR6acGeRHhoKQND+vp+gTuuuGOnwQPLmoi8S1GdiRZ0PJ38dpPu4M7byDJIMeiH51lltF7I6oJSTfPUHepHv/eyWY7/SdBZPCZ/FZDHQDN+WNDMZXH4bFDzL/zvLYU5xpI0JpF+VXgeJkVGsWaiRyjx7SYEGIXOeMhkAbGioELSMmoHvR5OSM+a9vyflfHkzoUuFfTgVtO9TPzk++0IlOaAJxfhKt4i4x0jQukmYDHuewkZ74w5rakLUk+p/eGDxVfWJZBd2Ss116Eoo730I4JA08KW+cQQ7irTekIAej2rv+rZeHLtkXkHmuJDB7wdwx2PVfKzWltVOYyQs5xoxzEhYf+fhoVfbbcA6UT3JS6PmOH1ASWYQH3TWsuztWO0NcjaOBjZQHh6S9XZcVwNS94J8QJB4DXfDK2jo59z7w7IJY1id3Gs9emPUtHkfORPmI0d2GVvD9YKf1vXSn72W56X9hNy502V6Cq/6a/iYZNfU8BfTdbsdyF5h0spnqlHub+0ybEkxTHdl4cpBLifJBAMHnggDaRxqii+UQ4UtTde+SD9y79K1tYjGQarrD6lxouCxr08dqzshBaaI/qCYHuvnoFun+QCQxlyrGO1aqLB//H9RN0uf7RRMddONeYIvHxyQ+cESkjuIyMSDgjJ+oiq3xPVdm1bhaAVU+HndVe3RyMtY26SCHvWv+9SP5PMVfJKByzjbjZEdN3s1PCNJph4QprB+yI7FSudRVczzCb9mqwwzEak0cPT3yPvhQaJAaFCc6YiA0O9p+D0T</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>