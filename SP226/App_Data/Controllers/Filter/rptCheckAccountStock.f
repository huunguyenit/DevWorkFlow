<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>

    <field name="tk_vt" allowNulls="false">
      <header v="Tài khoản vật tư" e="Item Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_tk_vt%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 5, 70, 100, 100, 130, 0"/>
      <item value="1100: [ngay1].Label, [ngay1]"/>
      <item value="1100: [ngay2].Label, [ngay2]"/>
      <item value="1100100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KmUl/jMrq6z1D71Awtp7C9xozQZHLYEW5Xj4/tAzKgKkwSsRDOkFTKz0Lkd0Y2jw2D1tY236hXf3KFXdEeoGRzfp886HrCrNJl3YlLPCd7Ea41xR1VEgWMcCpcTHFOlyqA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+Y6TIVGyvLgi9D0eJpQVfYE5U6EiS7MNd4dNFhPWKzfC/3jBdlD+DbyevRvD5aXsrb16QSAICvaIOfsXYP7TelOeZ0b3rI/jlBMudu4ITUaL4NUtwyofSyahtXiY+PFGSjx7zJzAHxXFkPzgItuOB7ZlnmrD5To6/thw/GWqETVzAoj23zWyACy1vzCYSqijW+jTOGVhR2l82v8sVp1CUpRT3uiZLbHtKnF5pnTpUmvIlJriN/l4DfMhxYwzeFx8axru4e250ZuMIwng+OUdgu/6DOGJwuFIWoM0BOo6ynwyCxYzV0Qe9eXDrUHNkOvitRNLEKl7U4vnxW4ueOpPpPflt4/1Qaz8gYwLosQirbMaDN/n+fftA7QXq/kdcZByBqbeb9qJHaRlNQnRs6Djzfjq3z6jz9+J2mUyf2ODhsofirmI2l1+hjqgi5t8k70YQ/2UD/sccasYOyl35wrY5k</encrypted>]]>
    </text>
  </script>
</dir>